// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 12:29:41 2026
// Host        : Justin running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32544)
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
