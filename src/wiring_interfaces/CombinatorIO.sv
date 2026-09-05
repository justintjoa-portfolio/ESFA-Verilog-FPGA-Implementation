interface CombinatorIO;

    logic [7:0] value;
    logic [7:0] metadata;
    logic       valid;

    modport in (
        input value,
        input metadata,
        input valid
    );

    modport out (
        output value,
        output metadata,
        output valid
    );

    

endinterface