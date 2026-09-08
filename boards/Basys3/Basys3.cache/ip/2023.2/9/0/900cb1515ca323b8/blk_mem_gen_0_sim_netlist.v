// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep  7 10:42:30 2026
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 34640)
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
