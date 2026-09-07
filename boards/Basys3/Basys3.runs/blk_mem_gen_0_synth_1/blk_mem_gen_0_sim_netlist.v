// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 12:46:44 2026
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
