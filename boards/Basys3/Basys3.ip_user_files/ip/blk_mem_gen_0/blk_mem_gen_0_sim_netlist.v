// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 20:16:40 2026
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
