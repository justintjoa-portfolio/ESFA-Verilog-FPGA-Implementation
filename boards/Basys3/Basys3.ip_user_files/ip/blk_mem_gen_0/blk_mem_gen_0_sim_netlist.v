// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 12:29:42 2026
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
