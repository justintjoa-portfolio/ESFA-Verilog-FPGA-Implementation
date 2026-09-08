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
 * Transmitter component of the UART module.
 *
 * The transmitter is simply a shift register that is parallel loaded from the
 * data byte presented for transmission. It shifts out one bit with each
 * clock cycle. The tx line is fed from the lowest bit in the register. The
 * register is 9 bits long to accommodate the data byte as well as the start
 * bit. It is loaded at the start of the cycle with the data and the start bit
 * values, then shifted right 10 times. The stop bit (final data line level) is
 * achieved by feeding 1 into the MSb each cycle. Thus at the end of the cycle
 * the output supplies 1 automatically and would remain there if shifting
 * wouldn't stop.
 *
 * Note that `txRequest` must remain high for at least one full clock cycle.
 *
 * @author  Elmar Grom
 * @date    11/6/2021
 */ /*-----------------------------------------------------------------------*/

module UARTTransmitter (input   wire        clock,      // the transmit clock prepared by the baud rate generator (1 clock per bit)
                        input   wire        reset,      // module reset
                        input   wire [7:0]  data,       // the data to be transmitted
                        input   wire        txRequest,  // 1 triggers a transmission

                        output  wire        tx,         // the transmit line
                        output  wire        started,    // goes to 1 when the process has started and back to 0 once the data has been loaded into the shift register
                        output  wire        txActive);  // 1 while a transmission is in progress

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------
  reg [8:0]       register;                             // the shift register used for transmission
  reg [4:0]       bitCounter;                           // counts the number of shifted bits
  reg             start;                                // tx cycle start
  reg             shifting;                             // signals shift activity

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign          tx        = register [0];
  assign          txActive  = shifting;
  assign          started   = start;

  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------
  always @ (posedge clock)
  begin
    if (reset == 1'b0)                              // -> reset
    begin
      register        <= 9'h1FF;                    // fill with all 1s
      bitCounter      <= 4'h0;
      shifting        <= 1'b0;
      start           <= 1'b0;
    end

    else                                            // operation
    begin
      if (bitCounter == 4'h0)                       // -> idle
      begin
        if (start == 1'b0)
        begin
          if (txRequest == 1'b1)
          begin
            start       <= 1'b1;
            shifting    <= 1'b1;

            register    <= {data, 1'b0};            // load the shift register with the data and the start bit
            bitCounter  <= 4'h1;
          end
        end
      end

      else if (bitCounter < 4'hA)                   // -> shifting
      begin
        register      <= {1'b1, register [8:1]};    // shift and feed at the top with the stop value
        bitCounter    <= bitCounter + 4'h1;
        start         <= 1'b0;                      // managed to start -> clear the flag
      end

      else                                          // -> done
      begin
        if (txRequest == 1'b0)                      // hold until the request has gone, otherwise we
        begin                                       // would immediately start transmitting again
          bitCounter  <= 4'h0;
          shifting    <= 1'b0;
        end
      end
    end
  end

endmodule
// ----------------------------------------------------------------------------
