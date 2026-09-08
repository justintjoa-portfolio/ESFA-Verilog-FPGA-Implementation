// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 20:11:27 2026
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
