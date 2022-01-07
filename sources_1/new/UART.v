/*---------------------------------------------------------------------------*
 *                     (C) Copyright 2021 by Elmar Grom
 *
 *                           - All Rights Reserved -
 *
 *                  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE
 *
 * This copyright notice does not evidence any actual or intended publication
 *---------------------------------------------------------------------------*/
/** @file
 *
 * Implementation of a UART peripheral with baud rate generator, transmitter
 * and receiver.
 *
 * External connections
 * ====================
 *
 * This module requires two external connections, one for each of the data
 * lines. Note that the receive line (rx) must be connected to the transmit
 * line of the UART connected at the opposite end, while the transmit line
 * (tx) must be connected to the receive line of the opposite end. The data
 * lines are said to be 'crossed'.
 *
 * Configuration
 * =============
 *
 * This implementation cannot be configured. It only supports the following
 * format:
 *
 * - 8 data bits
 * - 1 start bit
 * - 1 stop bit
 * - no parity
 *
 * Baud rate scale factor
 * ======================
 *
 * The baud rate is set by providing the proper integer scale factor from the
 * master clock provided to the desired baud rate. For this, the `CLOCK_SCALE`
 * parameter must be set to the correct ratio for scaling the `masterClock`
 * down to four times the desired baud rate. I.e.
 *
 *   CLOCK_SCALE = masterClock / (4 * baud rate)
 *
 * The clock rate resulting from this scaling allows for sufficiently fine
 * grained synchronization of the receiver at the start of a transmission to
 * define good sample points for the individual bits.
 *
 * @author  Elmar Grom
 * @date    10/31/2021
 */ /*-----------------------------------------------------------------------*/

`include  "ClockDivider.v"
`include  "UARTTransmitter.v"
`include  "UARTReceiver.v"

module UART # (parameter CLOCK_SCALE = 10)        // Scale factor to use for baud rate generation from
                                                  // the master clock. This should be > 10.

              // --------------------------------------------------------
              // Module level signals
              // --------------------------------------------------------
              (input  wire        masterClock,    // The master clock. This is used for internal operations and for baud rate generation
               input  wire        reset,          // Module reset (0 is reset, 1 is run). Reset at startup!

              // --------------------------------------------------------
              // Transmitter signals
              // --------------------------------------------------------
               input  wire [7:0]  txData,         // The data to be transmitted
               input  wire        txRequest,      // 1 triggers a transmission, must return to 0 before next transmission, hold high for a minimum of one cycle of masterClock
               output wire        txActive,       // 1 while a transmission is in progress
               output wire        tx,             // The transmit line, connect to a ball on the FPGA

              // --------------------------------------------------------
              // Receiver signals
              // --------------------------------------------------------
               input  wire        clearDR,        // 1 clears `dataReady`
               input  wire        rx,             // The receive line, connect to a ball on the FPGA
               output wire [7:0]  rxData,         // The received data
               output wire        dataReceived,   // 1 indicates that data has been received
               output wire        dataOverrun);   // 1 indicates a data byte has been received while the previous had not been acknowledged

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------
  reg [1:0]       moduleResetReg;
  reg [1:0]       rxSynch;
  reg             txRequestReg;
  reg             clearDRReg;

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------
  wire            txClock;
  wire            rxClock;
  wire            moduleReset;
  wire            startTX;
  wire            txStarted;

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign moduleReset  = moduleResetReg [0] | moduleResetReg [1];
  assign startTX      = txRequestReg;


  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // Reset
  // --------------------------------------------------------
  // Note: the TX clock is the slowest clock, thus should hold
  // the signal low long enough for all modules to reset
  // --------------------------------------------------------
  always @ (posedge txClock)
  begin
    moduleResetReg [0] <= reset;
    moduleResetReg [1] <= moduleResetReg [0];
  end

  // --------------------------------------------------------
  // Latching and clearing transmit requests
  // --------------------------------------------------------
  // txRequest is latched in txRequestReg with the rising edge
  // of masterClock. Thus it needs to stay high only for one
  // cycle of masterClock, rather than one cycle of the much
  // slower txClock. txRequestReg is only cleared, when the
  // transmitter signals, that the request has taken hold.
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (moduleReset == 1'b0)
    begin
      txRequestReg    <= 1'b0;
    end

    else
    begin
      if (txRequest == 1'b1)
      begin
        txRequestReg  <= 1'b1;
      end

      else if (txStarted == 1'b0)
      begin
        txRequestReg  <= 1'b0;
      end
    end
  end

  // --------------------------------------------------------
  // Latching and clearing clearDR
  // --------------------------------------------------------
  // clearDR is latched in clearDRReg with the rising edge of
  // masterClock. Thus it needs to stay high only for one cycle
  // of masterClock, rather than one cycle of the much slower
  // rxClock. clearDRReg is only cleared, when the receiver
  // signals, that the request has taken hold.
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (moduleReset == 1'b0)
    begin
      clearDRReg      <= 1'b0;
    end

    else
    begin
      if (clearDR == 1'b1)
      begin
        clearDRReg    <= 1'b1;
      end

      else if (dataReceived == 1'b0)
      begin
        clearDRReg    <= 1'b0;
      end
    end
  end

  // --------------------------------------------------------
  // Synchronizing the receive line
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    rxSynch [0] <= rx;
    rxSynch [1] <= rxSynch [0];
  end

  // --------------------------------------------------------------------------
  // Sub-modules
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // baud rate generation
  // --------------------------------------------------------
  ClockDivider #(.RATIO       (CLOCK_SCALE))

    rxDivider   (.sourceClock (masterClock),
                 .reset       (1'b1),
                 .slowClock   (rxClock));

  ClockDivider #(.RATIO       (4))

    txDivider   (.sourceClock (rxClock),
                 .reset       (1'b1),
                 .slowClock   (txClock));

  // --------------------------------------------------------
  // transmitter module
  // --------------------------------------------------------
  UARTTransmitter transmitter (.clock     (txClock),
                               .reset     (moduleReset),
                               .data      (txData),
                               .txRequest (startTX),
                               .tx        (tx),
                               .started   (txStarted),
                               .txActive  (txActive));

  // --------------------------------------------------------
  // receiver module
  // --------------------------------------------------------
  UARTReceiver receiver (.clock         (rxClock),
                         .reset         (moduleReset),
                         .rx            (rxSynch [1]),
                         .data          (rxData),
                         .dataReceived  (dataReceived),
                         .dataOverrun   (dataOverrun),
                         .clearDR       (clearDRReg));

endmodule
// ----------------------------------------------------------------------------
