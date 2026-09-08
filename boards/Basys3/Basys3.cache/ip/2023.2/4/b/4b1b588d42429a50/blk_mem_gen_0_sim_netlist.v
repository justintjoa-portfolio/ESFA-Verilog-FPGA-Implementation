// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 19:51:02 2026
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
