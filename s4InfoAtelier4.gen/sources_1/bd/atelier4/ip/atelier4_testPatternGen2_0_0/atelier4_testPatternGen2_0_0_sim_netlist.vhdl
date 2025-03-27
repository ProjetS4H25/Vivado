-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Thu Mar 27 09:12:39 2025
-- Host        : Ordi_de_Mari running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Travail/S4InfoAtelier4/s4InfoAtelier4.gen/sources_1/bd/atelier4/ip/atelier4_testPatternGen2_0_0/atelier4_testPatternGen2_0_0_sim_netlist.vhdl
-- Design      : atelier4_testPatternGen2_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity atelier4_testPatternGen2_0_0_color_Converter is
  port (
    o_dataPixel : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \couleur_reg[6]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \couleur_reg[6]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of atelier4_testPatternGen2_0_0_color_Converter : entity is "color_Converter";
end atelier4_testPatternGen2_0_0_color_Converter;

architecture STRUCTURE of atelier4_testPatternGen2_0_0_color_Converter is
  signal \couleur[14]_i_1_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_1_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_4_n_0\ : STD_LOGIC;
  signal \couleur[6]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \couleur[14]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \couleur[23]_i_1\ : label is "soft_lutpair0";
begin
\couleur[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \couleur_reg[6]_1\(0),
      I1 => O(2),
      I2 => \couleur[23]_i_4_n_0\,
      I3 => O(3),
      I4 => \couleur_reg[6]_1\(1),
      O => \couleur[14]_i_1_n_0\
    );
\couleur[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
        port map (
      I0 => \couleur_reg[6]_1\(1),
      I1 => O(3),
      I2 => \couleur[23]_i_4_n_0\,
      I3 => O(2),
      I4 => \couleur_reg[6]_1\(0),
      O => \couleur[23]_i_1_n_0\
    );
\couleur[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => O(0),
      I1 => \couleur_reg[6]_0\(2),
      I2 => \couleur_reg[6]_0\(1),
      I3 => \couleur_reg[6]_0\(0),
      I4 => \couleur_reg[6]_0\(3),
      I5 => O(1),
      O => \couleur[23]_i_4_n_0\
    );
\couleur[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => O(3),
      I1 => \couleur[23]_i_4_n_0\,
      I2 => O(2),
      I3 => \couleur_reg[6]_1\(0),
      I4 => \couleur_reg[6]_1\(1),
      O => \couleur[6]_i_1_n_0\
    );
\couleur_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \couleur[14]_i_1_n_0\,
      Q => o_dataPixel(1),
      R => '0'
    );
\couleur_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \couleur[23]_i_1_n_0\,
      Q => o_dataPixel(2),
      R => '0'
    );
\couleur_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \couleur[6]_i_1_n_0\,
      Q => o_dataPixel(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity atelier4_testPatternGen2_0_0_testPatternGen2 is
  port (
    o_dataPixel : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \couleur_reg[6]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \couleur_reg[6]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of atelier4_testPatternGen2_0_0_testPatternGen2 : entity is "testPatternGen2";
end atelier4_testPatternGen2_0_0_testPatternGen2;

architecture STRUCTURE of atelier4_testPatternGen2_0_0_testPatternGen2 is
begin
col_conv: entity work.atelier4_testPatternGen2_0_0_color_Converter
     port map (
      O(3 downto 0) => O(3 downto 0),
      clk => clk,
      \couleur_reg[6]_0\(3 downto 0) => \couleur_reg[6]\(3 downto 0),
      \couleur_reg[6]_1\(1 downto 0) => \couleur_reg[6]_0\(1 downto 0),
      o_dataPixel(2 downto 0) => o_dataPixel(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity atelier4_testPatternGen2_0_0 is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    i_x : in STD_LOGIC_VECTOR ( 11 downto 0 );
    i_y : in STD_LOGIC_VECTOR ( 11 downto 0 );
    o_dataValid : out STD_LOGIC;
    o_dataPixel : out STD_LOGIC_VECTOR ( 23 downto 0 );
    i_colorDataA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_colorDataB : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of atelier4_testPatternGen2_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of atelier4_testPatternGen2_0_0 : entity is "atelier4_testPatternGen2_0_0,testPatternGen2,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of atelier4_testPatternGen2_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of atelier4_testPatternGen2_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of atelier4_testPatternGen2_0_0 : entity is "testPatternGen2,Vivado 2020.2";
end atelier4_testPatternGen2_0_0;

architecture STRUCTURE of atelier4_testPatternGen2_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \bac_buf/C\ : STD_LOGIC_VECTOR ( 6 downto 4 );
  signal \bac_buf/multOp\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \couleur[23]_i_10_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_11_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_12_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_13_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_14_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_15_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_16_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_17_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_19_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_20_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_21_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_22_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_23_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_24_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_25_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_26_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_27_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_28_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_29_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_30_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_36_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_37_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_38_n_0\ : STD_LOGIC;
  signal \couleur[23]_i_9_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_18_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_18_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_18_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_18_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_2_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_31_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_31_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_31_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_31_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_32_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_32_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_32_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_32_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_33_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_34_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_35_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_35_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_35_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_35_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_39_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_3_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_5_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_5_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_6_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_6_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_6_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_6_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_1\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_3\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_4\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_5\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_6\ : STD_LOGIC;
  signal \couleur_reg[23]_i_7_n_7\ : STD_LOGIC;
  signal \couleur_reg[23]_i_8_n_0\ : STD_LOGIC;
  signal \couleur_reg[23]_i_8_n_2\ : STD_LOGIC;
  signal \couleur_reg[23]_i_8_n_3\ : STD_LOGIC;
  signal \^o_datapixel\ : STD_LOGIC_VECTOR ( 23 downto 6 );
  signal \NLW_couleur_reg[23]_i_18_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_couleur_reg[23]_i_31_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_couleur_reg[23]_i_31_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_couleur_reg[23]_i_32_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_couleur_reg[23]_i_32_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_couleur_reg[23]_i_39_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_couleur_reg[23]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_couleur_reg[23]_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_couleur_reg[23]_i_8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \NLW_couleur_reg[23]_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute HLUTNM : string;
  attribute HLUTNM of \couleur[23]_i_13\ : label is "lutpair4";
  attribute HLUTNM of \couleur[23]_i_14\ : label is "lutpair3";
  attribute HLUTNM of \couleur[23]_i_17\ : label is "lutpair4";
  attribute HLUTNM of \couleur[23]_i_19\ : label is "lutpair2";
  attribute HLUTNM of \couleur[23]_i_20\ : label is "lutpair1";
  attribute HLUTNM of \couleur[23]_i_21\ : label is "lutpair0";
  attribute HLUTNM of \couleur[23]_i_23\ : label is "lutpair3";
  attribute HLUTNM of \couleur[23]_i_24\ : label is "lutpair2";
  attribute HLUTNM of \couleur[23]_i_25\ : label is "lutpair1";
  attribute HLUTNM of \couleur[23]_i_26\ : label is "lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_18\ : label is 35;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \couleur_reg[23]_i_7\ : label is 35;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute x_interface_parameter of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  o_dataPixel(23) <= \^o_datapixel\(23);
  o_dataPixel(22) <= \<const1>\;
  o_dataPixel(21) <= \<const1>\;
  o_dataPixel(20) <= \<const1>\;
  o_dataPixel(19) <= \<const1>\;
  o_dataPixel(18) <= \<const1>\;
  o_dataPixel(17) <= \^o_datapixel\(23);
  o_dataPixel(16) <= \^o_datapixel\(23);
  o_dataPixel(15) <= \<const0>\;
  o_dataPixel(14) <= \^o_datapixel\(14);
  o_dataPixel(13) <= \^o_datapixel\(14);
  o_dataPixel(12) <= \^o_datapixel\(14);
  o_dataPixel(11) <= \^o_datapixel\(14);
  o_dataPixel(10) <= \^o_datapixel\(14);
  o_dataPixel(9) <= \<const0>\;
  o_dataPixel(8) <= \<const0>\;
  o_dataPixel(7) <= \<const0>\;
  o_dataPixel(6) <= \^o_datapixel\(6);
  o_dataPixel(5) <= \^o_datapixel\(6);
  o_dataPixel(4) <= \^o_datapixel\(6);
  o_dataPixel(3) <= \^o_datapixel\(6);
  o_dataPixel(2) <= \^o_datapixel\(6);
  o_dataPixel(1) <= \<const0>\;
  o_dataPixel(0) <= \<const0>\;
  o_dataValid <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.atelier4_testPatternGen2_0_0_testPatternGen2
     port map (
      O(3) => \couleur_reg[23]_i_3_n_4\,
      O(2) => \couleur_reg[23]_i_3_n_5\,
      O(1) => \couleur_reg[23]_i_3_n_6\,
      O(0) => \couleur_reg[23]_i_3_n_7\,
      clk => clk,
      \couleur_reg[6]\(3) => \couleur_reg[23]_i_7_n_4\,
      \couleur_reg[6]\(2) => \couleur_reg[23]_i_7_n_5\,
      \couleur_reg[6]\(1) => \couleur_reg[23]_i_7_n_6\,
      \couleur_reg[6]\(0) => \couleur_reg[23]_i_7_n_7\,
      \couleur_reg[6]_0\(1) => \couleur_reg[23]_i_2_n_6\,
      \couleur_reg[6]_0\(0) => \couleur_reg[23]_i_2_n_7\,
      o_dataPixel(2) => \^o_datapixel\(23),
      o_dataPixel(1) => \^o_datapixel\(14),
      o_dataPixel(0) => \^o_datapixel\(6)
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
\couleur[23]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bac_buf/C\(6),
      I1 => \bac_buf/multOp\(6),
      O => \couleur[23]_i_10_n_0\
    );
\couleur[23]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bac_buf/C\(5),
      I1 => \bac_buf/multOp\(5),
      O => \couleur[23]_i_11_n_0\
    );
\couleur[23]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bac_buf/C\(4),
      I1 => \bac_buf/multOp\(4),
      O => \couleur[23]_i_12_n_0\
    );
\couleur[23]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \couleur_reg[23]_i_31_n_7\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      O => \couleur[23]_i_13_n_0\
    );
\couleur[23]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \couleur_reg[23]_i_33_n_4\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      O => \couleur[23]_i_14_n_0\
    );
\couleur[23]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => \couleur_reg[23]_i_31_n_6\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      I2 => \couleur_reg[23]_i_31_n_1\,
      O => \couleur[23]_i_15_n_0\
    );
\couleur[23]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \couleur[23]_i_13_n_0\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      I2 => \couleur_reg[23]_i_31_n_6\,
      O => \couleur[23]_i_16_n_0\
    );
\couleur[23]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \couleur_reg[23]_i_31_n_7\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      I2 => \couleur[23]_i_14_n_0\,
      O => \couleur[23]_i_17_n_0\
    );
\couleur[23]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \couleur_reg[23]_i_32_n_6\,
      I1 => \couleur_reg[23]_i_33_n_5\,
      O => \couleur[23]_i_19_n_0\
    );
\couleur[23]_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \couleur_reg[23]_i_32_n_7\,
      I1 => \couleur_reg[23]_i_33_n_6\,
      O => \couleur[23]_i_20_n_0\
    );
\couleur[23]_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \couleur_reg[23]_i_34_n_4\,
      I1 => \couleur_reg[23]_i_33_n_7\,
      O => \couleur[23]_i_21_n_0\
    );
\couleur[23]_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \couleur_reg[23]_i_33_n_7\,
      I1 => \couleur_reg[23]_i_34_n_4\,
      O => \couleur[23]_i_22_n_0\
    );
\couleur[23]_i_23\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \couleur_reg[23]_i_33_n_4\,
      I1 => \couleur_reg[23]_i_32_n_1\,
      I2 => \couleur[23]_i_19_n_0\,
      O => \couleur[23]_i_23_n_0\
    );
\couleur[23]_i_24\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \couleur_reg[23]_i_32_n_6\,
      I1 => \couleur_reg[23]_i_33_n_5\,
      I2 => \couleur[23]_i_20_n_0\,
      O => \couleur[23]_i_24_n_0\
    );
\couleur[23]_i_25\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \couleur_reg[23]_i_32_n_7\,
      I1 => \couleur_reg[23]_i_33_n_6\,
      I2 => \couleur[23]_i_21_n_0\,
      O => \couleur[23]_i_25_n_0\
    );
\couleur[23]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \couleur_reg[23]_i_34_n_4\,
      I1 => \couleur_reg[23]_i_33_n_7\,
      I2 => \couleur_reg[23]_i_39_n_4\,
      I3 => \couleur_reg[23]_i_34_n_5\,
      O => \couleur[23]_i_26_n_0\
    );
\couleur[23]_i_27\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \bac_buf/multOp\(3),
      O => \couleur[23]_i_27_n_0\
    );
\couleur[23]_i_28\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \bac_buf/multOp\(2),
      O => \couleur[23]_i_28_n_0\
    );
\couleur[23]_i_29\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \bac_buf/multOp\(1),
      O => \couleur[23]_i_29_n_0\
    );
\couleur[23]_i_30\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \bac_buf/multOp\(0),
      O => \couleur[23]_i_30_n_0\
    );
\couleur[23]_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \couleur_reg[23]_i_34_n_5\,
      I1 => \couleur_reg[23]_i_39_n_4\,
      O => \couleur[23]_i_36_n_0\
    );
\couleur[23]_i_37\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \couleur_reg[23]_i_34_n_6\,
      I1 => \couleur_reg[23]_i_39_n_5\,
      O => \couleur[23]_i_37_n_0\
    );
\couleur[23]_i_38\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \couleur_reg[23]_i_34_n_7\,
      I1 => \couleur_reg[23]_i_39_n_6\,
      O => \couleur[23]_i_38_n_0\
    );
\couleur[23]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \couleur_reg[23]_i_8_n_0\,
      I1 => \bac_buf/multOp\(7),
      O => \couleur[23]_i_9_n_0\
    );
\couleur_reg[23]_i_18\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \couleur_reg[23]_i_18_n_0\,
      CO(2) => \couleur_reg[23]_i_18_n_1\,
      CO(1) => \couleur_reg[23]_i_18_n_2\,
      CO(0) => \couleur_reg[23]_i_18_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \couleur_reg[23]_i_34_n_6\,
      DI(1) => \couleur_reg[23]_i_34_n_7\,
      DI(0) => \bac_buf/multOp\(3),
      O(3 downto 1) => \bac_buf/multOp\(6 downto 4),
      O(0) => \NLW_couleur_reg[23]_i_18_O_UNCONNECTED\(0),
      S(3) => \couleur[23]_i_36_n_0\,
      S(2) => \couleur[23]_i_37_n_0\,
      S(1) => \couleur[23]_i_38_n_0\,
      S(0) => \bac_buf/multOp\(3)
    );
\couleur_reg[23]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_3_n_0\,
      CO(3) => \couleur_reg[23]_i_2_n_0\,
      CO(2) => \couleur_reg[23]_i_2_n_1\,
      CO(1) => \couleur_reg[23]_i_2_n_2\,
      CO(0) => \couleur_reg[23]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \couleur_reg[23]_i_2_n_4\,
      O(2) => \couleur_reg[23]_i_2_n_5\,
      O(1) => \couleur_reg[23]_i_2_n_6\,
      O(0) => \couleur_reg[23]_i_2_n_7\,
      S(3 downto 0) => \bac_buf/multOp\(11 downto 8)
    );
\couleur_reg[23]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_7_n_0\,
      CO(3) => \couleur_reg[23]_i_3_n_0\,
      CO(2) => \couleur_reg[23]_i_3_n_1\,
      CO(1) => \couleur_reg[23]_i_3_n_2\,
      CO(0) => \couleur_reg[23]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => \couleur_reg[23]_i_8_n_0\,
      DI(2 downto 0) => \bac_buf/C\(6 downto 4),
      O(3) => \couleur_reg[23]_i_3_n_4\,
      O(2) => \couleur_reg[23]_i_3_n_5\,
      O(1) => \couleur_reg[23]_i_3_n_6\,
      O(0) => \couleur_reg[23]_i_3_n_7\,
      S(3) => \couleur[23]_i_9_n_0\,
      S(2) => \couleur[23]_i_10_n_0\,
      S(1) => \couleur[23]_i_11_n_0\,
      S(0) => \couleur[23]_i_12_n_0\
    );
\couleur_reg[23]_i_31\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_33_n_0\,
      CO(3) => \NLW_couleur_reg[23]_i_31_CO_UNCONNECTED\(3),
      CO(2) => \couleur_reg[23]_i_31_n_1\,
      CO(1) => \NLW_couleur_reg[23]_i_31_CO_UNCONNECTED\(1),
      CO(0) => \couleur_reg[23]_i_31_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_couleur_reg[23]_i_31_O_UNCONNECTED\(3 downto 2),
      O(1) => \couleur_reg[23]_i_31_n_6\,
      O(0) => \couleur_reg[23]_i_31_n_7\,
      S(3 downto 0) => B"0111"
    );
\couleur_reg[23]_i_32\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_34_n_0\,
      CO(3) => \NLW_couleur_reg[23]_i_32_CO_UNCONNECTED\(3),
      CO(2) => \couleur_reg[23]_i_32_n_1\,
      CO(1) => \NLW_couleur_reg[23]_i_32_CO_UNCONNECTED\(1),
      CO(0) => \couleur_reg[23]_i_32_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_couleur_reg[23]_i_32_O_UNCONNECTED\(3 downto 2),
      O(1) => \couleur_reg[23]_i_32_n_6\,
      O(0) => \couleur_reg[23]_i_32_n_7\,
      S(3 downto 0) => B"0111"
    );
\couleur_reg[23]_i_33\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_39_n_0\,
      CO(3) => \couleur_reg[23]_i_33_n_0\,
      CO(2) => \couleur_reg[23]_i_33_n_1\,
      CO(1) => \couleur_reg[23]_i_33_n_2\,
      CO(0) => \couleur_reg[23]_i_33_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \couleur_reg[23]_i_33_n_4\,
      O(2) => \couleur_reg[23]_i_33_n_5\,
      O(1) => \couleur_reg[23]_i_33_n_6\,
      O(0) => \couleur_reg[23]_i_33_n_7\,
      S(3 downto 0) => B"1111"
    );
\couleur_reg[23]_i_34\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_35_n_0\,
      CO(3) => \couleur_reg[23]_i_34_n_0\,
      CO(2) => \couleur_reg[23]_i_34_n_1\,
      CO(1) => \couleur_reg[23]_i_34_n_2\,
      CO(0) => \couleur_reg[23]_i_34_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \couleur_reg[23]_i_34_n_4\,
      O(2) => \couleur_reg[23]_i_34_n_5\,
      O(1) => \couleur_reg[23]_i_34_n_6\,
      O(0) => \couleur_reg[23]_i_34_n_7\,
      S(3 downto 0) => B"1111"
    );
\couleur_reg[23]_i_35\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \couleur_reg[23]_i_35_n_0\,
      CO(2) => \couleur_reg[23]_i_35_n_1\,
      CO(1) => \couleur_reg[23]_i_35_n_2\,
      CO(0) => \couleur_reg[23]_i_35_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3 downto 0) => \bac_buf/multOp\(3 downto 0),
      S(3 downto 0) => B"1110"
    );
\couleur_reg[23]_i_39\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \couleur_reg[23]_i_39_n_0\,
      CO(2) => \couleur_reg[23]_i_39_n_1\,
      CO(1) => \couleur_reg[23]_i_39_n_2\,
      CO(0) => \couleur_reg[23]_i_39_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \couleur_reg[23]_i_39_n_4\,
      O(2) => \couleur_reg[23]_i_39_n_5\,
      O(1) => \couleur_reg[23]_i_39_n_6\,
      O(0) => \NLW_couleur_reg[23]_i_39_O_UNCONNECTED\(0),
      S(3 downto 0) => B"1110"
    );
\couleur_reg[23]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_6_n_0\,
      CO(3 downto 2) => \NLW_couleur_reg[23]_i_5_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \couleur_reg[23]_i_5_n_2\,
      CO(0) => \couleur_reg[23]_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \couleur[23]_i_13_n_0\,
      DI(0) => \couleur[23]_i_14_n_0\,
      O(3) => \NLW_couleur_reg[23]_i_5_O_UNCONNECTED\(3),
      O(2 downto 0) => \bac_buf/multOp\(13 downto 11),
      S(3) => '0',
      S(2) => \couleur[23]_i_15_n_0\,
      S(1) => \couleur[23]_i_16_n_0\,
      S(0) => \couleur[23]_i_17_n_0\
    );
\couleur_reg[23]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \couleur_reg[23]_i_18_n_0\,
      CO(3) => \couleur_reg[23]_i_6_n_0\,
      CO(2) => \couleur_reg[23]_i_6_n_1\,
      CO(1) => \couleur_reg[23]_i_6_n_2\,
      CO(0) => \couleur_reg[23]_i_6_n_3\,
      CYINIT => '0',
      DI(3) => \couleur[23]_i_19_n_0\,
      DI(2) => \couleur[23]_i_20_n_0\,
      DI(1) => \couleur[23]_i_21_n_0\,
      DI(0) => \couleur[23]_i_22_n_0\,
      O(3 downto 0) => \bac_buf/multOp\(10 downto 7),
      S(3) => \couleur[23]_i_23_n_0\,
      S(2) => \couleur[23]_i_24_n_0\,
      S(1) => \couleur[23]_i_25_n_0\,
      S(0) => \couleur[23]_i_26_n_0\
    );
\couleur_reg[23]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \couleur_reg[23]_i_7_n_0\,
      CO(2) => \couleur_reg[23]_i_7_n_1\,
      CO(1) => \couleur_reg[23]_i_7_n_2\,
      CO(0) => \couleur_reg[23]_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \couleur_reg[23]_i_7_n_4\,
      O(2) => \couleur_reg[23]_i_7_n_5\,
      O(1) => \couleur_reg[23]_i_7_n_6\,
      O(0) => \couleur_reg[23]_i_7_n_7\,
      S(3) => \couleur[23]_i_27_n_0\,
      S(2) => \couleur[23]_i_28_n_0\,
      S(1) => \couleur[23]_i_29_n_0\,
      S(0) => \couleur[23]_i_30_n_0\
    );
\couleur_reg[23]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \couleur_reg[23]_i_8_n_0\,
      CO(2) => \NLW_couleur_reg[23]_i_8_CO_UNCONNECTED\(2),
      CO(1) => \couleur_reg[23]_i_8_n_2\,
      CO(0) => \couleur_reg[23]_i_8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_couleur_reg[23]_i_8_O_UNCONNECTED\(3),
      O(2 downto 0) => \bac_buf/C\(6 downto 4),
      S(3 downto 0) => B"1000"
    );
end STRUCTURE;
