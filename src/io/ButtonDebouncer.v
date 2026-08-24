/*---------------------------------------------------------------------------*
 *                   (C) Copyright 2021 by Renovo Motors
 *
 *                           - All Rights Reserved -
 *
 *                  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE
 *
 * This copyright notice does not evidence any actual or intended publication
 *---------------------------------------------------------------------------*/
/** @file
 *
 * Mechanical button debouncer.
 *
 * Note, that the slow clock should have a period of at least 20ms, better
 * around 40 ~ 50ms to work as a robust debouncer for common mechanical push
 * buttons.
 *
 * The synch clock is a fast clock, used to synchronize the raw button signal
 * to the clock domain. Therefore it must be in the same clock domain as the
 * slow clock but needs to be a higher frequency. It is usually a clock that
 * the slow clock is derived from.
 *
 * The output signal is a single pulse of one slow clock cycle duration for
 * a press (rising edge). The button release does not produce a signal.
 *
 * // Button debouncer: https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html
 *
 * @author  Elmar Grom
 * @date    11/2/2021
 */ /*-----------------------------------------------------------------------*/

`timescale 1ns/1ps

module ButtonDebouncer (input   button,       // the button input line
                        input   synchClock,   // synchronization clock
                        input   slowclock,    // a slow clock to drive the debounce mechanism

                        output  press);       // a single, one clock cycle wide pulse for each button press

  // ---------------------------------------------------------------------------
  // Registers
  // ---------------------------------------------------------------------------
  reg     button1;          // intermediate latched button signal
  reg     buttonSynch;      // synchronized button signal for internal use

  // ---------------------------------------------------------------------------
  // Signals
  // ---------------------------------------------------------------------------
  wire    button;
  wire    synchclock;
  wire    slowClock;

  wire    q1;
  wire    q2;


  // ---------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // ---------------------------------------------------------------------------
  assign  press = q1 & ~q2;

  // ---------------------------------------------------------------------------
  // Sequential logic
  // ---------------------------------------------------------------------------

  // --------------------------------------------------------
  // double buffer for button synchronization
  // --------------------------------------------------------
  always @ (posedge synchClock)
  begin
    button1     <= button;
    buttonSynch <= button1;
  end

  // ---------------------------------------------------------------------------
  // Sub-module instances
  // ---------------------------------------------------------------------------
  bdb_DFF d1 (.clock  (slowclock),
              .d      (buttonSynch),
              .q      (q1));

  bdb_DFF d2 (.clock  (slowclock),
              .d      (q1),
              .q      (q2));

endmodule

// -----------------------------------------------------------------------------
// D-FF
// -----------------------------------------------------------------------------
module bdb_DFF (input   clock,
                input   d,

                output  q);

  reg q = 0;

  always @ (posedge clock)
  begin
    q <= d;
  end
endmodule
// -----------------------------------------------------------------------------
