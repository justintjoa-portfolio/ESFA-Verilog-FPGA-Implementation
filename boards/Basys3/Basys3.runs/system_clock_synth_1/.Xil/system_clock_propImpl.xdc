set_property SRC_FILE_INFO {cfile:c:/Users/justi/Documents/ESFA-Verilog-FPGA-Implementation/boards/Basys3/Basys3.gen/sources_1/ip/system_clock/system_clock.xdc rfile:../../../Basys3.gen/sources_1/ip/system_clock/system_clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
