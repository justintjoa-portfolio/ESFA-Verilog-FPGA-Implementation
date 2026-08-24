interface ESFADesignIO;

    logic [7:0] queried_handle;
    logic [7:0] new_index;
    logic [7:0] new_value;
    logic [7:0] selector;
    logic [0:0] resultBool;
    logic [7:0] resultValue;

    modport io (
        input queried_handle,
        input new_index,
        input new_value,
        input selector,
        output resultBool,
        output resultValue
    );



endinterface 