interface MemoryCellInput;

    logic [7:0] handle;
    logic [7:0] queried_handle;
    logic is_available_handle;
    logic [7:0] available_handle;
    logic [7:0] inserted_index;
    logic [7:0] inserted_value;
    logic is_given_code;
    logic [7:0] given_code;
    logic is_given_rank;
    logic [7:0] given_rank;
    logic [7:0] selector;

    modport in (
        input handle,
        input queried_handle,
        input is_available_handle,
        input available_handle,
        input inserted_index,
        input inserted_value,
        input is_given_code,
        input given_code,
        input is_given_rank,
        input given_rank,
        input selector
    );

endinterface