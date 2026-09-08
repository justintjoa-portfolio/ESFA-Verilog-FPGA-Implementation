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
 * Provides a reset signal for the design. It is intended for the ARTY S7 board
 * from Digilent, where there are no reset features apart from the reset button.
 * However, this module should be useful on other targets as well. Note that the
 * reset button on this board generates a low going signal when pressed, which
 * is pretty standard.
 *
 * The reset signal output initially stays low for three consecutive clock
 * cycles and then goes high. This should be enough for most modules to get a
 * proper reset, especially since most will be clocked at considerably higher
 * rates. Apart from that, there will be a rest signal for three clock cycles
 * each time the reset button is pressed.
 *
 * @author  Elmar Grom
 * @date    11/16/2021
 */ /*-----------------------------------------------------------------------*/

module Resetter (input  wire    clock,            // a low frequency clock, preferably on the order of 20Hz ~ 100Hz
                 input  wire    resetButton,      // the reset button

                 output wire    reset);           // the reset signal. 0 during reset

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------
  reg [1:0]     buttonSynch   = 2'h0;
  reg           startReset    = 1'b0;
  reg [2:0]     resetLatch    = 3'h0;

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------
  wire          q1;
  wire          q2;

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign  reset = resetLatch [0] & resetLatch [1] & resetLatch [2];

  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // button synchronizer
  // --------------------------------------------------------
  always @ (posedge clock)
  begin
    buttonSynch [0] <= !resetButton;
    buttonSynch [1] <= buttonSynch [0];
  end

  // --------------------------------------------------------
  // Startup reset condition
  // --------------------------------------------------------
  always @ (posedge clock)
  begin
    startReset      <= 1'b1;
  end

  // --------------------------------------------------------
  // Stretcher
  // --------------------------------------------------------
  always @ (posedge clock)
  begin
    resetLatch [0]  <= ~(q1 & ~q2) & startReset;
    resetLatch [1]  <= resetLatch [0];
    resetLatch [2]  <= resetLatch [1];
  end

  // --------------------------------------------------------------------------
  // Sub-modules
  // --------------------------------------------------------------------------
  res_DFF d1 (.clock  (clock),
              .data   (buttonSynch [1]),
              .out    (q1));

  res_DFF d2 (.clock  (clock),
              .data   (q1),
              .out    (q2));

endmodule

// -----------------------------------------------------------------------------
// D-FF
// -----------------------------------------------------------------------------
module res_DFF (input   clock,
                input   data,

                output  out);

  reg out = 1'b0;

  always @ (posedge clock)
  begin
    out <= data;
  end
endmodule
// ----------------------------------------------------------------------------