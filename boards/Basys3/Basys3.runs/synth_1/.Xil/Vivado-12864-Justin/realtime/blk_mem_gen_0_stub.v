// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *)
module blk_mem_gen_0(clka, rsta, addra, douta, rsta_busy);
  input clka /* synthesis syn_isclock = 1 */;
  input rsta;
  input [7:0]addra;
  output [63:0]douta;
  output rsta_busy;
endmodule
