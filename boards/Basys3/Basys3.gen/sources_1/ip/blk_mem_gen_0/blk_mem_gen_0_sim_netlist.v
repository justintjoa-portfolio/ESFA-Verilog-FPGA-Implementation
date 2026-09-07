// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 10:42:31 2026
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;
  output rsta_busy;

  wire [31:0]addra;
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
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "800000004" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
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
  (* C_INITA_VAL = "800000001" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[10:3],1'b0,1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 34624)
`pragma protect data_block
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
nXGb94UZYpJ3u4QbniU7ejAGx2JOWKQKTA==
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
