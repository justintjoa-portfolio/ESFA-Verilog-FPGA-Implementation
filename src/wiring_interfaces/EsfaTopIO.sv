interface EsfaTopIO;

    logic doRun;
    logic [0:0] isRunning;
    logic [0:0] wasSuccessful;
    logic [7:0] instructionOfError;
    logic [0:0] didRun;

    modport io (
        input doRun,
        output isRunning,
        output wasSuccessful,
        output instructionOfError,
        output didRun
    );


endinterface; 