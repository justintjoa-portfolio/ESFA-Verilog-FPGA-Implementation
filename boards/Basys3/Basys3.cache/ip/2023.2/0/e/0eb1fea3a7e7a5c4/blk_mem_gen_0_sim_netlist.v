// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 19:56:04 2026
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
