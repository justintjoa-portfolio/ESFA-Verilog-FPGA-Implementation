// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 12:46:43 2026
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
