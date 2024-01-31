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
 * Clock divider.
 *
 * @author  Elmar Grom
 * @date    11/1/2021
 */ /*-----------------------------------------------------------------------*/

module ClockDivider #(parameter RATIO = 100)                // the clock division ratio

                     (input  wire sourceClock,              // the feed clock
                      input  wire reset,                    // hold at 0 to stop and reset the counter

                      output wire slowClock);               // the output clock

  // --------------------------------------------------------------------------
  // Constants
  // --------------------------------------------------------------------------
  parameter BITS = $clog2 (RATIO);                          // the number of bits required to store the division ratio

  // --------------------------------------------------------------------------
  // signals
  // --------------------------------------------------------------------------
  reg [BITS-1:0]          countRegister;
  reg                     out;
  reg                     countFlag;

  wire [BITS-1:0]         increment;

  // --------------------------------------------------------------------------
  // Combinatorial logic
  // --------------------------------------------------------------------------
  assign increment  = countRegister + {{BITS-1 {1'b0}}, 1'b1};
  wire slowClock_raw;
  assign slowClock_raw  = out;
  wire enable;
  assign enable = 1'b1;

  // --------------------------------------------------------
  // counter
  // --------------------------------------------------------
  always @ (posedge sourceClock)
  begin

    // --------------------------------------------------------
    // normal processing
    // --------------------------------------------------------
    if (reset)
    begin
      if (countRegister < RATIO)
      begin                                           // count
        countRegister <= increment;

        if (countRegister >= (RATIO / 2))
        begin
          out         <= 1'b0;
        end

        else
        begin
          out         <= 1'b1;                        // start
        end
      end

      else                                            // period reset
      begin
        countRegister <= {{BITS-1 {1'b0}}, 1'b1};
        out           <= 1'b1;
      end
    end

    // --------------------------------------------------------
    // reset
    // --------------------------------------------------------
    else
    begin
      countRegister   <= {BITS {1'b0}};
      out             <= 1'b0;
    end
  end
  
  BUFGCE BUFGCE_inst (
    .I(slowClock_raw),
    .CE(enable),
    .O(slowClock)
  );

endmodule



