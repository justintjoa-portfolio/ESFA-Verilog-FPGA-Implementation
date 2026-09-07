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
 * Implements a testing sandbox for FPGA designs. It uses `WideUARTIO` to expose
 * a Device Under Test to data received from a host computer and triggers some
 * action in the DUT. The DUT can then expose resulting data and trigger a
 * transmission of that data back to the host computer. This allows exercising
 * a real hardware implementation and observing its responses in contrast to a
 * simulation.
 *
 * This implementation is originally intended to run on an Arty S7 board from
 * Digilent. This board sports a Spartan-7 FPGA and has an FTDI based USB/UART
 * bridge installed and connected to the FPGA.
 *
 * @author  Elmar Grom
 * @date    11/26/2021
 */ /*-----------------------------------------------------------------------*/

module Sandbox (input  wire  masterClock,
                input  wire  resetButton,
                input  wire  btn3,
                input  wire  rx,

                output wire  tx,

                output wire  led2,
                output wire  led3,
                output wire  led4,
                output wire  led5);

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------
  wire        _25Hz;

  wire        masterReset;
  wire        txTrigger;

  wire [7:0]  control;
  wire [31:0] rxData;
  wire [7:0]  status;
  wire [31:0] txData;
  wire        dataReceived;
  wire        transmitting;
  wire        clearDR;
  wire        txRequest;
  wire        button_pulse;

  ButtonDebouncer debouncer(resetButton, systemClock, _25Hz, button_pulse);

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign  led5    = !masterReset;

  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------

  // --------------------------------------------------------------------------
  // Sub-modules
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // Generate master reset
  // --------------------------------------------------------
  Resetter resetter (.clock       (_25Hz),
                     .resetButton (button_pulse),
                     .reset       (masterReset));


  wire systemClock;
  wire clockLocked;

  system_clock system_clock_inst (
    .clk_out1(systemClock),
    .reset(1'b0),
    .locked(clockLocked),
    .clk_in1(masterClock)
  );
  
  
  // --------------------------------------------------------
  // The clock divider takes in the 100 MHz master clock
  // provided by the Basys 3 board. The clock is connected
  // to FPGA package pin W5.
  //
  // The divider generates a ~25 Hz slow clock used for
  // human-timescale logic such as button debouncing/reset.
  //
  // 100 MHz / 4,000,000 = 25 Hz
  // --------------------------------------------------------
  ClockDivider #(
      .RATIO(2_000_000)
  )
  divider1 (
      .sourceClock(systemClock),
      .reset      (1'b1),
      .slowClock  (_25Hz)
  );

  // --------------------------------------------------------
  // Data interface
  // --------------------------------------------------------
  WideUARTIO # (.CLOCK_SCALE (109),                     // -> 115200
                .WIDTH       (4))

    dataInterface (.masterClock   (systemClock),
                   .reset         (masterReset),
                   .rx            (rx),
                   .tx            (tx),

                   .status        (status),
                   .outputData    (txData),

                   .control       (control),
                   .inputData     (rxData),

                   .clearDR       (clearDR),
                   .transmit      (txRequest),

                   .dataReceived  (dataReceived),
                   .transmitting  (transmitting));

  // --------------------------------------------------------
  // The process to be managed
  // --------------------------------------------------------
  SandboxProcess

    process (.masterClock   (systemClock),
             .slowClock     (_25Hz),
             .reset_n         (masterReset),
             .dataReceived  (dataReceived),
             .control       (control),
             .inputData     (rxData),

             .clearDR       (clearDR),
             .transmitData  (txRequest),
             .status        (status),
             .outputData    (txData),
             .rxIndicator   (led2));

endmodule
// ----------------------------------------------------------------------------
