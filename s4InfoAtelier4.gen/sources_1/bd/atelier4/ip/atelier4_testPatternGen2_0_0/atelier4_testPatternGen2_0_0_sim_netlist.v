// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Mar 27 09:12:39 2025
// Host        : Ordi_de_Mari running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Travail/S4InfoAtelier4/s4InfoAtelier4.gen/sources_1/bd/atelier4/ip/atelier4_testPatternGen2_0_0/atelier4_testPatternGen2_0_0_sim_netlist.v
// Design      : atelier4_testPatternGen2_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "atelier4_testPatternGen2_0_0,testPatternGen2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "testPatternGen2,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module atelier4_testPatternGen2_0_0
   (clk,
    rstn,
    i_x,
    i_y,
    o_dataValid,
    o_dataPixel,
    i_colorDataA,
    i_colorDataB);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rstn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  input [11:0]i_x;
  input [11:0]i_y;
  output o_dataValid;
  output [23:0]o_dataPixel;
  input [31:0]i_colorDataA;
  input [31:0]i_colorDataB;

  wire \<const0> ;
  wire \<const1> ;
  wire [6:4]\bac_buf/C ;
  wire [13:0]\bac_buf/multOp ;
  wire clk;
  wire \couleur[23]_i_10_n_0 ;
  wire \couleur[23]_i_11_n_0 ;
  wire \couleur[23]_i_12_n_0 ;
  wire \couleur[23]_i_13_n_0 ;
  wire \couleur[23]_i_14_n_0 ;
  wire \couleur[23]_i_15_n_0 ;
  wire \couleur[23]_i_16_n_0 ;
  wire \couleur[23]_i_17_n_0 ;
  wire \couleur[23]_i_19_n_0 ;
  wire \couleur[23]_i_20_n_0 ;
  wire \couleur[23]_i_21_n_0 ;
  wire \couleur[23]_i_22_n_0 ;
  wire \couleur[23]_i_23_n_0 ;
  wire \couleur[23]_i_24_n_0 ;
  wire \couleur[23]_i_25_n_0 ;
  wire \couleur[23]_i_26_n_0 ;
  wire \couleur[23]_i_27_n_0 ;
  wire \couleur[23]_i_28_n_0 ;
  wire \couleur[23]_i_29_n_0 ;
  wire \couleur[23]_i_30_n_0 ;
  wire \couleur[23]_i_36_n_0 ;
  wire \couleur[23]_i_37_n_0 ;
  wire \couleur[23]_i_38_n_0 ;
  wire \couleur[23]_i_9_n_0 ;
  wire \couleur_reg[23]_i_18_n_0 ;
  wire \couleur_reg[23]_i_18_n_1 ;
  wire \couleur_reg[23]_i_18_n_2 ;
  wire \couleur_reg[23]_i_18_n_3 ;
  wire \couleur_reg[23]_i_2_n_0 ;
  wire \couleur_reg[23]_i_2_n_1 ;
  wire \couleur_reg[23]_i_2_n_2 ;
  wire \couleur_reg[23]_i_2_n_3 ;
  wire \couleur_reg[23]_i_2_n_4 ;
  wire \couleur_reg[23]_i_2_n_5 ;
  wire \couleur_reg[23]_i_2_n_6 ;
  wire \couleur_reg[23]_i_2_n_7 ;
  wire \couleur_reg[23]_i_31_n_1 ;
  wire \couleur_reg[23]_i_31_n_3 ;
  wire \couleur_reg[23]_i_31_n_6 ;
  wire \couleur_reg[23]_i_31_n_7 ;
  wire \couleur_reg[23]_i_32_n_1 ;
  wire \couleur_reg[23]_i_32_n_3 ;
  wire \couleur_reg[23]_i_32_n_6 ;
  wire \couleur_reg[23]_i_32_n_7 ;
  wire \couleur_reg[23]_i_33_n_0 ;
  wire \couleur_reg[23]_i_33_n_1 ;
  wire \couleur_reg[23]_i_33_n_2 ;
  wire \couleur_reg[23]_i_33_n_3 ;
  wire \couleur_reg[23]_i_33_n_4 ;
  wire \couleur_reg[23]_i_33_n_5 ;
  wire \couleur_reg[23]_i_33_n_6 ;
  wire \couleur_reg[23]_i_33_n_7 ;
  wire \couleur_reg[23]_i_34_n_0 ;
  wire \couleur_reg[23]_i_34_n_1 ;
  wire \couleur_reg[23]_i_34_n_2 ;
  wire \couleur_reg[23]_i_34_n_3 ;
  wire \couleur_reg[23]_i_34_n_4 ;
  wire \couleur_reg[23]_i_34_n_5 ;
  wire \couleur_reg[23]_i_34_n_6 ;
  wire \couleur_reg[23]_i_34_n_7 ;
  wire \couleur_reg[23]_i_35_n_0 ;
  wire \couleur_reg[23]_i_35_n_1 ;
  wire \couleur_reg[23]_i_35_n_2 ;
  wire \couleur_reg[23]_i_35_n_3 ;
  wire \couleur_reg[23]_i_39_n_0 ;
  wire \couleur_reg[23]_i_39_n_1 ;
  wire \couleur_reg[23]_i_39_n_2 ;
  wire \couleur_reg[23]_i_39_n_3 ;
  wire \couleur_reg[23]_i_39_n_4 ;
  wire \couleur_reg[23]_i_39_n_5 ;
  wire \couleur_reg[23]_i_39_n_6 ;
  wire \couleur_reg[23]_i_3_n_0 ;
  wire \couleur_reg[23]_i_3_n_1 ;
  wire \couleur_reg[23]_i_3_n_2 ;
  wire \couleur_reg[23]_i_3_n_3 ;
  wire \couleur_reg[23]_i_3_n_4 ;
  wire \couleur_reg[23]_i_3_n_5 ;
  wire \couleur_reg[23]_i_3_n_6 ;
  wire \couleur_reg[23]_i_3_n_7 ;
  wire \couleur_reg[23]_i_5_n_2 ;
  wire \couleur_reg[23]_i_5_n_3 ;
  wire \couleur_reg[23]_i_6_n_0 ;
  wire \couleur_reg[23]_i_6_n_1 ;
  wire \couleur_reg[23]_i_6_n_2 ;
  wire \couleur_reg[23]_i_6_n_3 ;
  wire \couleur_reg[23]_i_7_n_0 ;
  wire \couleur_reg[23]_i_7_n_1 ;
  wire \couleur_reg[23]_i_7_n_2 ;
  wire \couleur_reg[23]_i_7_n_3 ;
  wire \couleur_reg[23]_i_7_n_4 ;
  wire \couleur_reg[23]_i_7_n_5 ;
  wire \couleur_reg[23]_i_7_n_6 ;
  wire \couleur_reg[23]_i_7_n_7 ;
  wire \couleur_reg[23]_i_8_n_0 ;
  wire \couleur_reg[23]_i_8_n_2 ;
  wire \couleur_reg[23]_i_8_n_3 ;
  wire [23:6]\^o_dataPixel ;
  wire [0:0]\NLW_couleur_reg[23]_i_18_O_UNCONNECTED ;
  wire [3:1]\NLW_couleur_reg[23]_i_31_CO_UNCONNECTED ;
  wire [3:2]\NLW_couleur_reg[23]_i_31_O_UNCONNECTED ;
  wire [3:1]\NLW_couleur_reg[23]_i_32_CO_UNCONNECTED ;
  wire [3:2]\NLW_couleur_reg[23]_i_32_O_UNCONNECTED ;
  wire [0:0]\NLW_couleur_reg[23]_i_39_O_UNCONNECTED ;
  wire [3:2]\NLW_couleur_reg[23]_i_5_CO_UNCONNECTED ;
  wire [3:3]\NLW_couleur_reg[23]_i_5_O_UNCONNECTED ;
  wire [2:2]\NLW_couleur_reg[23]_i_8_CO_UNCONNECTED ;
  wire [3:3]\NLW_couleur_reg[23]_i_8_O_UNCONNECTED ;

  assign o_dataPixel[23] = \^o_dataPixel [23];
  assign o_dataPixel[22] = \<const1> ;
  assign o_dataPixel[21] = \<const1> ;
  assign o_dataPixel[20] = \<const1> ;
  assign o_dataPixel[19] = \<const1> ;
  assign o_dataPixel[18] = \<const1> ;
  assign o_dataPixel[17] = \^o_dataPixel [23];
  assign o_dataPixel[16] = \^o_dataPixel [23];
  assign o_dataPixel[15] = \<const0> ;
  assign o_dataPixel[14] = \^o_dataPixel [14];
  assign o_dataPixel[13] = \^o_dataPixel [14];
  assign o_dataPixel[12] = \^o_dataPixel [14];
  assign o_dataPixel[11] = \^o_dataPixel [14];
  assign o_dataPixel[10] = \^o_dataPixel [14];
  assign o_dataPixel[9] = \<const0> ;
  assign o_dataPixel[8] = \<const0> ;
  assign o_dataPixel[7] = \<const0> ;
  assign o_dataPixel[6] = \^o_dataPixel [6];
  assign o_dataPixel[5] = \^o_dataPixel [6];
  assign o_dataPixel[4] = \^o_dataPixel [6];
  assign o_dataPixel[3] = \^o_dataPixel [6];
  assign o_dataPixel[2] = \^o_dataPixel [6];
  assign o_dataPixel[1] = \<const0> ;
  assign o_dataPixel[0] = \<const0> ;
  assign o_dataValid = \<const1> ;
  GND GND
       (.G(\<const0> ));
  atelier4_testPatternGen2_0_0_testPatternGen2 U0
       (.O({\couleur_reg[23]_i_3_n_4 ,\couleur_reg[23]_i_3_n_5 ,\couleur_reg[23]_i_3_n_6 ,\couleur_reg[23]_i_3_n_7 }),
        .clk(clk),
        .\couleur_reg[6] ({\couleur_reg[23]_i_7_n_4 ,\couleur_reg[23]_i_7_n_5 ,\couleur_reg[23]_i_7_n_6 ,\couleur_reg[23]_i_7_n_7 }),
        .\couleur_reg[6]_0 ({\couleur_reg[23]_i_2_n_6 ,\couleur_reg[23]_i_2_n_7 }),
        .o_dataPixel({\^o_dataPixel [23],\^o_dataPixel [14],\^o_dataPixel [6]}));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_10 
       (.I0(\bac_buf/C [6]),
        .I1(\bac_buf/multOp [6]),
        .O(\couleur[23]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_11 
       (.I0(\bac_buf/C [5]),
        .I1(\bac_buf/multOp [5]),
        .O(\couleur[23]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_12 
       (.I0(\bac_buf/C [4]),
        .I1(\bac_buf/multOp [4]),
        .O(\couleur[23]_i_12_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \couleur[23]_i_13 
       (.I0(\couleur_reg[23]_i_31_n_7 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .O(\couleur[23]_i_13_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \couleur[23]_i_14 
       (.I0(\couleur_reg[23]_i_33_n_4 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .O(\couleur[23]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h1E)) 
    \couleur[23]_i_15 
       (.I0(\couleur_reg[23]_i_31_n_6 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .I2(\couleur_reg[23]_i_31_n_1 ),
        .O(\couleur[23]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \couleur[23]_i_16 
       (.I0(\couleur[23]_i_13_n_0 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .I2(\couleur_reg[23]_i_31_n_6 ),
        .O(\couleur[23]_i_16_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \couleur[23]_i_17 
       (.I0(\couleur_reg[23]_i_31_n_7 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .I2(\couleur[23]_i_14_n_0 ),
        .O(\couleur[23]_i_17_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \couleur[23]_i_19 
       (.I0(\couleur_reg[23]_i_32_n_6 ),
        .I1(\couleur_reg[23]_i_33_n_5 ),
        .O(\couleur[23]_i_19_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \couleur[23]_i_20 
       (.I0(\couleur_reg[23]_i_32_n_7 ),
        .I1(\couleur_reg[23]_i_33_n_6 ),
        .O(\couleur[23]_i_20_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \couleur[23]_i_21 
       (.I0(\couleur_reg[23]_i_34_n_4 ),
        .I1(\couleur_reg[23]_i_33_n_7 ),
        .O(\couleur[23]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_22 
       (.I0(\couleur_reg[23]_i_33_n_7 ),
        .I1(\couleur_reg[23]_i_34_n_4 ),
        .O(\couleur[23]_i_22_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \couleur[23]_i_23 
       (.I0(\couleur_reg[23]_i_33_n_4 ),
        .I1(\couleur_reg[23]_i_32_n_1 ),
        .I2(\couleur[23]_i_19_n_0 ),
        .O(\couleur[23]_i_23_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \couleur[23]_i_24 
       (.I0(\couleur_reg[23]_i_32_n_6 ),
        .I1(\couleur_reg[23]_i_33_n_5 ),
        .I2(\couleur[23]_i_20_n_0 ),
        .O(\couleur[23]_i_24_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \couleur[23]_i_25 
       (.I0(\couleur_reg[23]_i_32_n_7 ),
        .I1(\couleur_reg[23]_i_33_n_6 ),
        .I2(\couleur[23]_i_21_n_0 ),
        .O(\couleur[23]_i_25_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    \couleur[23]_i_26 
       (.I0(\couleur_reg[23]_i_34_n_4 ),
        .I1(\couleur_reg[23]_i_33_n_7 ),
        .I2(\couleur_reg[23]_i_39_n_4 ),
        .I3(\couleur_reg[23]_i_34_n_5 ),
        .O(\couleur[23]_i_26_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \couleur[23]_i_27 
       (.I0(\bac_buf/multOp [3]),
        .O(\couleur[23]_i_27_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \couleur[23]_i_28 
       (.I0(\bac_buf/multOp [2]),
        .O(\couleur[23]_i_28_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \couleur[23]_i_29 
       (.I0(\bac_buf/multOp [1]),
        .O(\couleur[23]_i_29_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \couleur[23]_i_30 
       (.I0(\bac_buf/multOp [0]),
        .O(\couleur[23]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_36 
       (.I0(\couleur_reg[23]_i_34_n_5 ),
        .I1(\couleur_reg[23]_i_39_n_4 ),
        .O(\couleur[23]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_37 
       (.I0(\couleur_reg[23]_i_34_n_6 ),
        .I1(\couleur_reg[23]_i_39_n_5 ),
        .O(\couleur[23]_i_37_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_38 
       (.I0(\couleur_reg[23]_i_34_n_7 ),
        .I1(\couleur_reg[23]_i_39_n_6 ),
        .O(\couleur[23]_i_38_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \couleur[23]_i_9 
       (.I0(\couleur_reg[23]_i_8_n_0 ),
        .I1(\bac_buf/multOp [7]),
        .O(\couleur[23]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_18 
       (.CI(1'b0),
        .CO({\couleur_reg[23]_i_18_n_0 ,\couleur_reg[23]_i_18_n_1 ,\couleur_reg[23]_i_18_n_2 ,\couleur_reg[23]_i_18_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\couleur_reg[23]_i_34_n_6 ,\couleur_reg[23]_i_34_n_7 ,\bac_buf/multOp [3]}),
        .O({\bac_buf/multOp [6:4],\NLW_couleur_reg[23]_i_18_O_UNCONNECTED [0]}),
        .S({\couleur[23]_i_36_n_0 ,\couleur[23]_i_37_n_0 ,\couleur[23]_i_38_n_0 ,\bac_buf/multOp [3]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_2 
       (.CI(\couleur_reg[23]_i_3_n_0 ),
        .CO({\couleur_reg[23]_i_2_n_0 ,\couleur_reg[23]_i_2_n_1 ,\couleur_reg[23]_i_2_n_2 ,\couleur_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\couleur_reg[23]_i_2_n_4 ,\couleur_reg[23]_i_2_n_5 ,\couleur_reg[23]_i_2_n_6 ,\couleur_reg[23]_i_2_n_7 }),
        .S(\bac_buf/multOp [11:8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_3 
       (.CI(\couleur_reg[23]_i_7_n_0 ),
        .CO({\couleur_reg[23]_i_3_n_0 ,\couleur_reg[23]_i_3_n_1 ,\couleur_reg[23]_i_3_n_2 ,\couleur_reg[23]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\couleur_reg[23]_i_8_n_0 ,\bac_buf/C }),
        .O({\couleur_reg[23]_i_3_n_4 ,\couleur_reg[23]_i_3_n_5 ,\couleur_reg[23]_i_3_n_6 ,\couleur_reg[23]_i_3_n_7 }),
        .S({\couleur[23]_i_9_n_0 ,\couleur[23]_i_10_n_0 ,\couleur[23]_i_11_n_0 ,\couleur[23]_i_12_n_0 }));
  CARRY4 \couleur_reg[23]_i_31 
       (.CI(\couleur_reg[23]_i_33_n_0 ),
        .CO({\NLW_couleur_reg[23]_i_31_CO_UNCONNECTED [3],\couleur_reg[23]_i_31_n_1 ,\NLW_couleur_reg[23]_i_31_CO_UNCONNECTED [1],\couleur_reg[23]_i_31_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_couleur_reg[23]_i_31_O_UNCONNECTED [3:2],\couleur_reg[23]_i_31_n_6 ,\couleur_reg[23]_i_31_n_7 }),
        .S({1'b0,1'b1,1'b1,1'b1}));
  CARRY4 \couleur_reg[23]_i_32 
       (.CI(\couleur_reg[23]_i_34_n_0 ),
        .CO({\NLW_couleur_reg[23]_i_32_CO_UNCONNECTED [3],\couleur_reg[23]_i_32_n_1 ,\NLW_couleur_reg[23]_i_32_CO_UNCONNECTED [1],\couleur_reg[23]_i_32_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_couleur_reg[23]_i_32_O_UNCONNECTED [3:2],\couleur_reg[23]_i_32_n_6 ,\couleur_reg[23]_i_32_n_7 }),
        .S({1'b0,1'b1,1'b1,1'b1}));
  CARRY4 \couleur_reg[23]_i_33 
       (.CI(\couleur_reg[23]_i_39_n_0 ),
        .CO({\couleur_reg[23]_i_33_n_0 ,\couleur_reg[23]_i_33_n_1 ,\couleur_reg[23]_i_33_n_2 ,\couleur_reg[23]_i_33_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\couleur_reg[23]_i_33_n_4 ,\couleur_reg[23]_i_33_n_5 ,\couleur_reg[23]_i_33_n_6 ,\couleur_reg[23]_i_33_n_7 }),
        .S({1'b1,1'b1,1'b1,1'b1}));
  CARRY4 \couleur_reg[23]_i_34 
       (.CI(\couleur_reg[23]_i_35_n_0 ),
        .CO({\couleur_reg[23]_i_34_n_0 ,\couleur_reg[23]_i_34_n_1 ,\couleur_reg[23]_i_34_n_2 ,\couleur_reg[23]_i_34_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\couleur_reg[23]_i_34_n_4 ,\couleur_reg[23]_i_34_n_5 ,\couleur_reg[23]_i_34_n_6 ,\couleur_reg[23]_i_34_n_7 }),
        .S({1'b1,1'b1,1'b1,1'b1}));
  CARRY4 \couleur_reg[23]_i_35 
       (.CI(1'b0),
        .CO({\couleur_reg[23]_i_35_n_0 ,\couleur_reg[23]_i_35_n_1 ,\couleur_reg[23]_i_35_n_2 ,\couleur_reg[23]_i_35_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O(\bac_buf/multOp [3:0]),
        .S({1'b1,1'b1,1'b1,1'b0}));
  CARRY4 \couleur_reg[23]_i_39 
       (.CI(1'b0),
        .CO({\couleur_reg[23]_i_39_n_0 ,\couleur_reg[23]_i_39_n_1 ,\couleur_reg[23]_i_39_n_2 ,\couleur_reg[23]_i_39_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\couleur_reg[23]_i_39_n_4 ,\couleur_reg[23]_i_39_n_5 ,\couleur_reg[23]_i_39_n_6 ,\NLW_couleur_reg[23]_i_39_O_UNCONNECTED [0]}),
        .S({1'b1,1'b1,1'b1,1'b0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_5 
       (.CI(\couleur_reg[23]_i_6_n_0 ),
        .CO({\NLW_couleur_reg[23]_i_5_CO_UNCONNECTED [3:2],\couleur_reg[23]_i_5_n_2 ,\couleur_reg[23]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\couleur[23]_i_13_n_0 ,\couleur[23]_i_14_n_0 }),
        .O({\NLW_couleur_reg[23]_i_5_O_UNCONNECTED [3],\bac_buf/multOp [13:11]}),
        .S({1'b0,\couleur[23]_i_15_n_0 ,\couleur[23]_i_16_n_0 ,\couleur[23]_i_17_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_6 
       (.CI(\couleur_reg[23]_i_18_n_0 ),
        .CO({\couleur_reg[23]_i_6_n_0 ,\couleur_reg[23]_i_6_n_1 ,\couleur_reg[23]_i_6_n_2 ,\couleur_reg[23]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({\couleur[23]_i_19_n_0 ,\couleur[23]_i_20_n_0 ,\couleur[23]_i_21_n_0 ,\couleur[23]_i_22_n_0 }),
        .O(\bac_buf/multOp [10:7]),
        .S({\couleur[23]_i_23_n_0 ,\couleur[23]_i_24_n_0 ,\couleur[23]_i_25_n_0 ,\couleur[23]_i_26_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \couleur_reg[23]_i_7 
       (.CI(1'b0),
        .CO({\couleur_reg[23]_i_7_n_0 ,\couleur_reg[23]_i_7_n_1 ,\couleur_reg[23]_i_7_n_2 ,\couleur_reg[23]_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\couleur_reg[23]_i_7_n_4 ,\couleur_reg[23]_i_7_n_5 ,\couleur_reg[23]_i_7_n_6 ,\couleur_reg[23]_i_7_n_7 }),
        .S({\couleur[23]_i_27_n_0 ,\couleur[23]_i_28_n_0 ,\couleur[23]_i_29_n_0 ,\couleur[23]_i_30_n_0 }));
  CARRY4 \couleur_reg[23]_i_8 
       (.CI(1'b0),
        .CO({\couleur_reg[23]_i_8_n_0 ,\NLW_couleur_reg[23]_i_8_CO_UNCONNECTED [2],\couleur_reg[23]_i_8_n_2 ,\couleur_reg[23]_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_couleur_reg[23]_i_8_O_UNCONNECTED [3],\bac_buf/C }),
        .S({1'b1,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "color_Converter" *) 
module atelier4_testPatternGen2_0_0_color_Converter
   (o_dataPixel,
    O,
    \couleur_reg[6]_0 ,
    \couleur_reg[6]_1 ,
    clk);
  output [2:0]o_dataPixel;
  input [3:0]O;
  input [3:0]\couleur_reg[6]_0 ;
  input [1:0]\couleur_reg[6]_1 ;
  input clk;

  wire [3:0]O;
  wire clk;
  wire \couleur[14]_i_1_n_0 ;
  wire \couleur[23]_i_1_n_0 ;
  wire \couleur[23]_i_4_n_0 ;
  wire \couleur[6]_i_1_n_0 ;
  wire [3:0]\couleur_reg[6]_0 ;
  wire [1:0]\couleur_reg[6]_1 ;
  wire [2:0]o_dataPixel;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \couleur[14]_i_1 
       (.I0(\couleur_reg[6]_1 [0]),
        .I1(O[2]),
        .I2(\couleur[23]_i_4_n_0 ),
        .I3(O[3]),
        .I4(\couleur_reg[6]_1 [1]),
        .O(\couleur[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \couleur[23]_i_1 
       (.I0(\couleur_reg[6]_1 [1]),
        .I1(O[3]),
        .I2(\couleur[23]_i_4_n_0 ),
        .I3(O[2]),
        .I4(\couleur_reg[6]_1 [0]),
        .O(\couleur[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \couleur[23]_i_4 
       (.I0(O[0]),
        .I1(\couleur_reg[6]_0 [2]),
        .I2(\couleur_reg[6]_0 [1]),
        .I3(\couleur_reg[6]_0 [0]),
        .I4(\couleur_reg[6]_0 [3]),
        .I5(O[1]),
        .O(\couleur[23]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \couleur[6]_i_1 
       (.I0(O[3]),
        .I1(\couleur[23]_i_4_n_0 ),
        .I2(O[2]),
        .I3(\couleur_reg[6]_1 [0]),
        .I4(\couleur_reg[6]_1 [1]),
        .O(\couleur[6]_i_1_n_0 ));
  FDRE \couleur_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\couleur[14]_i_1_n_0 ),
        .Q(o_dataPixel[1]),
        .R(1'b0));
  FDRE \couleur_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\couleur[23]_i_1_n_0 ),
        .Q(o_dataPixel[2]),
        .R(1'b0));
  FDRE \couleur_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\couleur[6]_i_1_n_0 ),
        .Q(o_dataPixel[0]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "testPatternGen2" *) 
module atelier4_testPatternGen2_0_0_testPatternGen2
   (o_dataPixel,
    O,
    \couleur_reg[6] ,
    \couleur_reg[6]_0 ,
    clk);
  output [2:0]o_dataPixel;
  input [3:0]O;
  input [3:0]\couleur_reg[6] ;
  input [1:0]\couleur_reg[6]_0 ;
  input clk;

  wire [3:0]O;
  wire clk;
  wire [3:0]\couleur_reg[6] ;
  wire [1:0]\couleur_reg[6]_0 ;
  wire [2:0]o_dataPixel;

  atelier4_testPatternGen2_0_0_color_Converter col_conv
       (.O(O),
        .clk(clk),
        .\couleur_reg[6]_0 (\couleur_reg[6] ),
        .\couleur_reg[6]_1 (\couleur_reg[6]_0 ),
        .o_dataPixel(o_dataPixel));
endmodule
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
