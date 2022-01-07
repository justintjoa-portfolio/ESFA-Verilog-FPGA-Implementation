/*---------------------------------------------------------------------------*
 *                   (C) Copyright 2021 by Elmar Grom
 *
 *                           - All Rights Reserved -
 *
 *                  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE
 *
 * This copyright notice does not evidence any actual or intended publication
 *---------------------------------------------------------------------------*/
/** @file
 *
 * This is a multi byte wide data I/O module wrapped around the UART interface.
 * The module is one control byte plus `WIDTH` bytes wide.
 *
 * The idea
 * ========
 *
 * The idea behind this module is, that a host computer (PC, Laptop, etc.)
 * wants to control/exercise the operation of some logic module implemented in
 * an FPGA. Here, that scenario is supported in a simple implementation that is
 * capable of exposing two n bit wide data ports to the module to be controlled,
 * called Device Under Test, or DUT. These data ports are serviced by a UART
 * implementation that is capable of exchanging data with the controlling (host)
 * computer. This implementation is originally intended to run on an Arty S7
 * board from Digilent. This board sports a Spartan-7 FPGA and has an FTDI
 * based USB/UART bridge installed and connected to the FPGA. This makes a
 * UART the natural choice for external data exchange of any kind. However,
 * other evaluation boards either provide the same or similar arrangement. In
 * the absence of such an interface this can be achieved by using a TTL level
 * (usually 3.3V) UART USB dongle and connecting it to an appropriate header
 * on the evaluation board. In other words, this design should proof very
 * portable.
 *
 * The number of bits n of the data ports by definition is a multiple of 8,
 * since this is the data unit transferable by UART. One of the two data ports
 * is an output and presents data to the DUT that was received from the host.
 * The other port is an input, taking data provided by the DUT to be sent to the
 * host. It is completely up to the DUT how to make use of either port.
 *
 * In addition to the data strictly designated data ports, this implementation
 * features one additional byte on either side designated as a control byte on
 * the reception side and status byte on the transmission side. These allow for
 * control of the design and to report status, beyond the pure data received or
 * transmitted. As a result, this module expects to receive one byte more than
 * the width of the data ports form the host for a full transmission. Similarly,
 * each transmission to the host contains one more byte than the width of the
 * ports.
 *
 * Data exchange
 * =============
 *
 * This module will report data received only after a full set of bytes has
 * been received. How many bytes make a full set depends on the `WIDTH` setting,
 * as explained above. Also, no additional data will be received, unless the
 * receipt has been acknowledged. Any data sent by the host between a full set
 * of bytes has been received and acknowledgment of receipt will be lost. For
 * most practical situations I would suggest an operation that consists of the
 * host sending a data packet, the logic module performing some operation with
 * the received data, then sending back a response. After the host has received
 * the response, it knows the target is ready for the next operation and so on.
 * This makes it easy for the host to know when it is ok to send more data,
 * since there are no handshake lines available.
 *
 * In each transmission, the control byte must be transmitted first by the host,
 * followed by the data bytes in descending order (i.e. MSB to LSB). Similarly,
 * data transmissions to the host start with the status byte, followed by the
 * data bytes in descending order. The host may send its data bytes as quickly
 * or slowly as it pleases, while all bytes are transmitted to the host in
 * immediate succession.
 *
 * Baud rate
 * =========
 *
 * The baud rate depends on the available master clock and the `CLOCK_SCALE`
 * specification. For details please see the documentation in UART.v. the value
 * of `CLOCK_SCALE` must exactly match the explanation given there.
 *
 * @author  Elmar Grom
 * @date    11/14/2021
 */ /*-----------------------------------------------------------------------*/


module WideUARTIO

  # (parameter WIDTH        = 4,      // The data width of this module in bytes
     parameter CLOCK_SCALE  = 10)     // Scale factor to use for baud rate generation from the master
                                      // clock. This should be at least 10. The resulting clock must
                                      // be 4 times the baud rate.

  // --------------------------------------------------------
  // Module level signals
  // --------------------------------------------------------
  (input  wire                        masterClock,    // The master clock. This is used for internal operations and for baud rate generation
   input  wire                        reset,          // Module reset (0 is reset, 1 is run). Reset at startup!
   input  wire                        rx,             // the UART receive line
   output wire                        tx,             // the UART transmit line

  // --------------------------------------------------------
  // data to the host
  // --------------------------------------------------------
   input  wire [((WIDTH * 8) - 1):0]  outputData,     // the data to send to the host

  // --------------------------------------------------------
  // data from the host
  // --------------------------------------------------------
   output wire [7:0]                  control,        // the control byte received from the host
   output wire [((WIDTH * 8) - 1):0]  inputData,      // the data received from the host

  // --------------------------------------------------------
  // control and acknowledgment
  // --------------------------------------------------------
   input  wire                        clearDR,        // clears the `dataReceived` flag (acknowledges receipt)
   input  wire                        transmit,       // 1 transmits the data on `status` and `outputData`

   output wire                        dataReceived,   // 1 indicates that data has been received from the host
   output wire                        transmitting);  // 1 indicates that a transmission is in progress


  // --------------------------------------------------------------------------
  // Constants
  // --------------------------------------------------------------------------
  parameter COUNTER_BITS = $clog2 (WIDTH + 1);        // the number of bits required to count the number of bytes to receive/transmit

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------
  reg [2:0]                       rxState;            // keeps the state of the receiver state machine
  reg [(COUNTER_BITS - 1):0]      rxCounter;          // keeps track of the number of bytes received
  reg [((WIDTH * 8) + 7):0]       rxRegister;         // all of the received data
  reg                             clearByteRX;        // used to drive `clearDR`
  reg                             rxComplete;         // used to signal packet reception complete

  reg [2:0]                       txState;            // keeps the state of the transmitter state machine
  reg [(COUNTER_BITS - 1):0]      txCounter;          // keeps track of the number of bytes transmitted
  reg [((WIDTH * 8) + 7):0]       txRegister;         // all of the data to be transmitted
  reg                             txRequest;          // used to control data transmission
  reg                             transmittingReg;    // used to indicate transmission activity

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------
  wire [7:0]                      rxData;
  wire [7:0]                      txData;
  wire                            byteRX;
  wire                            txActive;

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign control      = rxRegister [((WIDTH * 8) + 7):(WIDTH * 8)];
  assign inputData    = rxRegister [((WIDTH * 8) - 1):0];
  assign txData       = txRegister [((WIDTH * 8) + 7):(WIDTH * 8)];
  assign dataReceived = rxComplete;
  assign transmitting = transmittingReg;

  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // Data received and clear
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (reset == 1'b0)
    begin
      rxComplete    <= 1'b0;
    end

    else
    begin
      if (rxState == 3'h5)
      begin
        rxComplete  <= 1'b1;
      end

      else if (clearDR == 1'b1)
      begin
        rxComplete  <= 1'b0;
      end
    end
  end

  // --------------------------------------------------------
  // Receiver state machine
  // --------------------------------------------------------
  // Receives bytes from the UART into the rxRegister
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (reset == 1'b0)
    begin
      clearByteRX               <= 1'b0;
      rxCounter                 <= {COUNTER_BITS{1'b0}};
      rxState                   <= 3'h0;
    end

    else
    begin
      case (rxState)
        3'h0 :
          begin
            if (byteRX == 1'b1)
            begin
              rxRegister [7:0]  <= rxData;                                              // copy into the lowest 8 bits
              rxCounter         <= rxCounter + {{(COUNTER_BITS - 1){1'b0}}, 1'b1};      // count the byte
              rxState           <= 3'h1;
            end
          end

        3'h1 :
          begin
            clearByteRX         <= 1'b1;
            rxState             <= 3'h2;
          end

        3'h2 :
          begin
            if (rxCounter == (WIDTH + 1))                                               // full set of bytes received
            begin
              clearByteRX       <= 1'b0;
              rxState           <= 3'h5;
            end

            else
            begin
              clearByteRX       <= 1'b0;
              rxState           <= 3'h3;
            end
          end

        3'h3 :
          begin
            rxRegister          <= {rxRegister [((WIDTH * 8) - 1):0], 8'h0};            // shift left 8 bits
            rxState             <= 3'h4;
          end

        3'h4 :
          begin
            if (byteRX == 1'b0)                                                         // UART receiver has seen our clear DR flag
            begin
              rxState           <= 3'h0;
            end
          end

        3'h5 :
          begin
            if (byteRX == 1'b0)                                                         // UART receiver has seen our clear DR flag
            begin
              rxState           <= 3'h6;
            end
          end

        3'h6 :
          begin
            if (rxComplete == 1'b0)                                                     // client has cleared the received flag
            begin
              rxCounter         <= {COUNTER_BITS{1'b0}};                                // clear counter
              rxState           <= 3'h0;
            end
          end

        default :
          begin
            rxState             <= 3'h0;
          end
      endcase
    end
  end

  // --------------------------------------------------------
  // Transmitter state machine
  // --------------------------------------------------------
  // Transfers bytes from the txRegister to the UART
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (reset == 1'b0)
    begin
      txCounter                 <= {COUNTER_BITS{1'b0}};
      txRequest                 <= 1'b0;
      transmittingReg           <= 1'b0;
      txState                   <= 3'h0;
    end

    else
    begin
      case (txState)
        3'h0 :
          begin
            if (transmit == 1'b1)
            begin
              txRegister        <= {outputData};                                // copy the output data to the transmit register
              transmittingReg   <= 1'b1;
              txState           <= 3'h1;
            end
          end
        3'h1 :
          begin
            txRequest           <= 1'b1;                                                // initiate transmission of one byte
            txCounter           <= txCounter + {{(COUNTER_BITS - 1){1'b0}}, 1'b1};      // count the byte
            txState             <= 3'h2;
          end
        3'h2 :
          begin
            if (txActive == 1'b1)
            begin
              txRequest         <= 1'b0;
              txState           <= 3'h3;
            end
          end
        3'h3 :
          begin
            if (txCounter == (WIDTH + 1))
            begin
              txState           <= 3'h5;
            end

            else
            begin
              txState           <= 3'h4;
            end
          end
        3'h4 :
          begin
            if (txActive == 1'b0)
            begin
              txRegister        <= {txRegister [((WIDTH * 8) - 1):0], 8'h0};            // shift left 8 bits
              txRequest         <= 1'b0;
              txState           <= 3'h1;                                                // ready for next byte
            end
          end
        3'h5 :
          begin
            if ((txActive == 1'b0) && (transmit == 1'b0))
            begin
              txRequest         <= 1'b0;
              transmittingReg   <= 1'b0;
              txState           <= 3'h0;                                                // ready for next transmission
            end
          end
        default :
          begin
            txState             <= 3'h0;
          end
      endcase
    end
  end


  // --------------------------------------------------------------------------
  // Sub-modules
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // UART
  // --------------------------------------------------------
  UART #(.CLOCK_SCALE (CLOCK_SCALE))

    uart (.masterClock   (masterClock),
          .reset         (reset),

          // ---------------------------------------------
          // Transmitter
          // ---------------------------------------------
          .txData        (txData),
          .txRequest     (txRequest),
          .txActive      (txActive),
          .tx            (tx),

          // ---------------------------------------------
          // Receiver
          // ---------------------------------------------
          .clearDR       (clearByteRX),
          .rx            (rx),
          .rxData        (rxData),
          .dataReceived  (byteRX)
//        .dataOverrun   ()           not monitoring data overrun
          );

endmodule
// ----------------------------------------------------------------------------
