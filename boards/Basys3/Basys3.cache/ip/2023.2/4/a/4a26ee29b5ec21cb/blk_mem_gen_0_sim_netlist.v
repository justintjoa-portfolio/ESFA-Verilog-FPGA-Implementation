// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 20:16:39 2026
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
