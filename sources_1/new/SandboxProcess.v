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
 * Dummy implementation of a process that lives inside the sandbox as a
 * demonstration exercise. This is to be replaced with the process that should
 * actually be operated inside the sandbox.
 *
 * @author  Elmar Grom
 * @date    11/27/2021
 */ /*-----------------------------------------------------------------------*/


module SandboxProcess (input  wire        masterClock,    // operating clock for this process
                       input  wire        slowClock,      // cock to operate user observable indicators (LEDs)
                       input  wire        reset,          // module reset

                       input  wire        dataReceived,   // 1 indicates that data has arrived for the process.
                       input  wire [7:0]  control,        // the received control byte.
                       input  wire [31:0] inputData,      // the received data word.

                       output wire        clearDR,        // clears the data received flag, thus inherently signals readiness to receive more data.
                       output wire        transmitData,   // signals that the output data is ready to be sent. Inherently requests sending that data.
                       output wire [7:0]  status,         // the status byte to report to the host.
                       output wire [31:0] outputData,     // the output data to send to the host.

                       output wire        rxIndicator);   // indicates reception of data/start of process

  // --------------------------------------------------------------------------
  // Registers
  // --------------------------------------------------------------------------
  reg [2:0]   state;
  reg [2:0]   indicatorState;
  reg [7:0]   statusReg  = 8'b0;
  reg [31:0]  outputReg = 32'b0;
  reg         transmitRequest;
  reg         processDone;
  reg         indicatorReg;

    
  wire[0:0] wasSuccessful;
  reg[0:0] doRun;
  wire[0:0] isRunning;
  wire[31:0] currentAddr;

  // --------------------------------------------------------------------------
  // Signals
  // --------------------------------------------------------------------------

  // --------------------------------------------------------------------------
  // Combinatorial logic / Wiring
  // --------------------------------------------------------------------------
  assign  status        = statusReg;
  assign  outputData    = outputReg;
  assign  transmitData  = transmitRequest;
  assign  clearDR       = processDone;
  assign  rxIndicator   = indicatorReg;

  // --------------------------------------------------------------------------
  // Sequential logic
  // --------------------------------------------------------------------------

  // --------------------------------------------------------
  // User indicator
  // --------------------------------------------------------
  always @ (posedge masterClock)
  begin
    if (reset == 1'b0)
    begin
      indicatorState  <= 3'h0;
      indicatorReg    <= 1'b0;
    end

    else
    begin
      case (indicatorState)
        3'h0 :
          begin
            if (state == 3'h1)
            begin
              indicatorState  <= 3'h1;
            end
          end

        3'h1 :
          begin
            if (slowClock == 1'b1)
            begin
              indicatorState  <= 3'h2;
            end
          end

        3'h2 :
          begin
            if (slowClock == 1'b0)
            begin
              indicatorReg    <= 1'b1;
              indicatorState  <= 3'h3;
            end
          end

        3'h3 :
          begin
            if (slowClock == 1'b1)
            begin
              indicatorState  <= 3'h4;
            end
          end

        3'h4 :
          begin
            if (slowClock == 1'b0)
            begin
              indicatorReg    <= 1'b0;
              indicatorState  <= 3'h0;
            end
          end

        default :
          begin
            indicatorState    <= 3'h0;
            indicatorReg      <= 1'b0;
          end
      endcase
    end
  end

  // --------------------------------------------------------
  // The process
  // --------------------------------------------------------
  
  always @ (posedge masterClock)
  begin
    if (reset == 1'b0)
    begin
      state                     <= 3'h0;
      statusReg                 <= 8'h0;
      outputReg                 <= 32'h0;
      transmitRequest           <= 1'b0;
      processDone               <= 1'b0;
      
      doRun <= 1'b0;
    end

    else
    begin
      case (state)
        3'h0 :
          begin
            if (dataReceived == 1'b1)                       // we have new data
            begin
              // flag data is stored in control byte
              if (control[0:0]) begin //control bit 0 is to start trial
                  outputReg <= 0;
                  statusReg[0:0] <= !isRunning; 
                  statusReg[1:1] <= top.didRun;
                  doRun <= 1'b1;
              end else begin
                  statusReg[0:0] <= top.didRun;
                  statusReg[1:1] <= wasSuccessful;
                  outputReg <= currentAddr;
              end
              state             <= 3'h1;
            end
          end

        3'h1 :
          begin
            transmitRequest     <= 1'b1;                    // request to transmit the result
            state               <= 3'h2;
          end

        3'h2 :
          begin
            state               <= 3'h3;
          end

        3'h3 :
          begin
            processDone         <= 1'b1;                    // process complete
            state               <= 3'h4;
          end

        3'h4 :
          begin
            if (dataReceived == 1'b0)
            begin
              transmitRequest   <= 1'b0;                    // request to transmit the result
              processDone       <= 1'b0;                    // process complete

              state             <= 3'h0;
            end
          end

        default :
          begin
            state               <= 3'h0;
          end
      endcase
    end
  end
  

  // --------------------------------------------------------------------------
  // Sub-modules
  // --------------------------------------------------------------------------
    
    
    
    
    ESFATop top(
        .clk(masterClock),
        .reset(reset), 
        .doRun(doRun),
        .isRunning(isRunning),
        .wasSuccessful(wasSuccessful),
        .currentAddr(currentAddr)
      );
   
  

endmodule
// ----------------------------------------------------------------------------