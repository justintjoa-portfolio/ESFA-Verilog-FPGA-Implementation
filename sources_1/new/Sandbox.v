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
  wire        _12MHz;
  wire        _25Hz;

  wire        masterReset;
  wire        txTrigger;

  wire [47:0] rxData;
  wire [47:0] txData;
  wire        dataReceived;
  wire        transmitting;
  wire        clearDR;
  wire        txRequest;

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign  _12MHz  = masterClock;
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
                     .resetButton (resetButton),
                     .reset       (masterReset));

  // --------------------------------------------------------
  // The Clock divider takes in the master clock produced by a
  // 12MHz crystal oscillator on the board. This is connected
  // to ball F14 of the FPGA. From this it generates various
  // clocks required by the design, by division from the master
  // clock.
  // --------------------------------------------------------
  ClockDivider #(.RATIO     (480000))

    divider1 (.sourceClock  (_12MHz),
              .reset        (1'b1),
              .slowClock    (_25Hz));

  // --------------------------------------------------------
  // Data interface
  // --------------------------------------------------------
  WideUARTIO # (.CLOCK_SCALE (26),                     // -> 115200
                .WIDTH       (7))

    dataInterface (.masterClock   (masterClock),
                   .reset         (masterReset),
                   .rx            (rx),
                   .tx            (tx),

                   .outputData    (txData),

                   .inputData     (rxData),

                   .clearDR       (clearDR),
                   .transmit      (txRequest),

                   .dataReceived  (dataReceived),
                   .transmitting  (transmitting));

  // --------------------------------------------------------
  // The process to be managed
  // --------------------------------------------------------
  SandboxProcess

    process (.masterClock   (masterClock),
             .slowClock     (_25Hz),
             .reset         (masterReset),
             .dataReceived  (dataReceived),
             .inputData     (rxData),

             .clearDR       (clearDR),
             .transmitData  (txRequest),
             .outputData    (txData),
             .rxIndicator   (led2));
             
endmodule
// ----------------------------------------------------------------------------
