// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 19:56:05 2026
// Host        : Justin running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/justi/Documents/ESFA-Verilog-FPGA-Implementation/boards/Basys3/Basys3.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    rsta,
    addra,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;
  output rsta_busy;

  wire [7:0]addra;
  wire clka;
  wire [63:0]douta;
  wire rsta;
  wire rsta_busy;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "800000004" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.370399 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32528)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
