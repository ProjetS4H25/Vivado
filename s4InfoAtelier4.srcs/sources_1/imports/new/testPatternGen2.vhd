----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: testPatternGenerator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testPatternGen2 is
Port ( 
    clk : in std_logic;
    rstn : in std_logic;
    i_x : in std_logic_vector(11 downto 0);
    i_y : in std_logic_vector(11 downto 0);
    o_dataValid : out std_logic;
    o_dataPixel : out std_logic_vector(23 downto 0);
    i_colorDataA : in std_logic_vector(31 downto 0);
    i_colorDataB : in std_logic_vector(31 downto 0)
);
end testPatternGen2;

architecture Behavioral of testPatternGen2 is
----------------------COMPONENTS-----------------------------------------
component color_Converter is
Port ( 
  cc : in STD_LOGIC_VECTOR (4 downto 0);
  ch_color : in STD_LOGIC_VECTOR (23 downto 0);
  we_color : in STD_LOGIC;
  clk : in STD_LOGIC;
  ch_cc : in STD_LOGIC_VECTOR (4 downto 0);  --À revérifier
  couleur : out STD_LOGIC_VECTOR (23 downto 0)); -- Aucun reset pour l'instant
end component;

component Tuile_Buffer is
  Port ( 
  -- du systeme
  Clk: in std_logic ;

  -- du controleur
  Ch_tuileId: in std_logic_vector (5 downto 0);
  Ch_X: in std_logic_vector (2 downto 0);
  Ch_Y: in std_logic_vector (2 downto 0);
  Ch_CC: in std_logic_vector (4 downto 0);
  We_tuile: in std_logic;

  -- Du background
  tuile_id: in std_logic_vector (5 downto 0);
  tuile_X: in std_logic_vector (2 downto 0);
  tuile_Y: in std_logic_vector (2 downto 0);

  -- Sortie
  Code_Couleur: out std_logic_vector(4 downto 0)
  );
end component;

component background_buffer is
    Port ( 
   -- Valeur que l'on reçois du ViewPort pour faire afficher le bon pixel
   i_globalX : in STD_LOGIC_VECTOR (9 downto 0);
   i_globalY : in STD_LOGIC_VECTOR (9 downto 0);
   
   -- Valeur input pour changer un tuile id dans le background 
   i_ch_X : in STD_LOGIC_VECTOR (9 downto 0);
   i_ch_Y : in STD_LOGIC_VECTOR (9 downto 0);
   i_ch_tuile_id : in STD_LOGIC_VECTOR (5 downto 0);
   i_we_bck : in STD_LOGIC;
   clk : in STD_LOGIC;
   
   -- Output vers le tuile buffer
   o_tuileId : out STD_LOGIC_VECTOR (5 downto 0);
   o_tuileX : out STD_LOGIC_VECTOR (2 downto 0);
   o_tuileY : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component viewport is
    Port ( 
    clk : in STD_LOGIC;
    reset: in STD_LOGIC;
    enable: in STD_LOGIC;
    pp_x : in STD_LOGIC_VECTOR (9 downto 0);
    pp_y : in STD_LOGIC_VECTOR (9 downto 0);
    offset_x : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
    offset_y : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
    global_x : out STD_LOGIC_VECTOR (9 downto 0);
    global_y : out STD_LOGIC_VECTOR (9 downto 0));
end component;
------------------------SIGNALS--------------------------------------------
signal s_cc: std_logic_vector(4 downto 0);
signal s_ch_color : STD_LOGIC_VECTOR (23 downto 0) := X"000000";      ---------***
signal s_we_color : STD_LOGIC := '0';                           ---------***
signal s_clk : STD_LOGIC;
signal s_ch_cc : STD_LOGIC_VECTOR (4 downto 0) := "00000";          ---------***
signal s_couleur : STD_LOGIC_VECTOR (23 downto 0);       

signal s_Ch_tuileId:std_logic_vector (5 downto 0) := "000000";       ---------***
signal s_Ch_X: std_logic_vector (2 downto 0) := "000";            ---------***
signal s_Ch_Y: std_logic_vector (2 downto 0) := "000";            ---------***
signal s_Ch_CC_tuile: std_logic_vector (4 downto 0) := "00000";     ---------***
signal s_We_tuile: std_logic := '0';                            ---------***
signal s_tuile_id: std_logic_vector (5 downto 0);
signal s_tuile_X: std_logic_vector (2 downto 0);
signal s_tuile_Y: std_logic_vector (2 downto 0);

signal s_i_globalX : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
signal s_i_globalY : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
signal s_i_ch_X : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";          ---------***
signal s_i_ch_Y : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";          ---------***
signal s_i_ch_tuile_id : STD_LOGIC_VECTOR (5 downto 0) := "000000";   ---------***
signal s_i_we_bck : STD_LOGIC := '0';                            ---------***                      

signal s_reset: STD_LOGIC;                                ---------***
signal s_enable: STD_LOGIC;                               ---------***
signal s_pp_x : STD_LOGIC_VECTOR(9 downto 0);             ----         
signal s_pp_y : STD_LOGIC_VECTOR(9 downto 0);             ----          
signal s_offset_x : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');  ----
signal s_offset_y : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');  ----

begin
------------------------INSTANCIATIN DES MODULES-------------------------------
col_conv: color_converter
Port map(
        cc => s_cc,
        ch_color => s_ch_color,
        we_color => s_we_color,
        clk => clk,
        ch_cc => s_ch_cc,
        couleur => s_couleur
);

tui_buf: tuile_buffer
Port map(
         Clk=> clk,
         Ch_tuileId => s_Ch_tuileId,
         Ch_X => s_Ch_X,
         Ch_Y => s_Ch_Y,
         Ch_CC => s_Ch_CC_tuile,
         We_tuile => s_We_tuile,
         tuile_id => s_tuile_id,
         tuile_x => s_tuile_x,
         tuile_Y => s_tuile_Y,
         Code_Couleur => s_cc
);

bac_buf: background_buffer
    Port map( 
         i_globalX => s_i_globalX,
         i_globalY => s_i_globalY,
         i_ch_X => s_i_ch_x,
         i_ch_Y => s_i_ch_y,
         i_ch_tuile_id => s_i_ch_tuile_id,
         i_we_bck => s_i_we_bck,
         clk => clk,
         o_tuileId => s_tuile_id,
         o_tuileX => s_tuile_x,
         o_tuileY => s_tuile_y
);

--view: viewport
--Port map( 
--         clk => clk,
--         reset => s_reset,
--         enable => s_enable,
--         pp_x => s_pp_x,
--         pp_y => s_pp_y,
--         offset_x => s_offset_x,
--         offset_y => s_offset_y,
--         global_x => s_i_globalx,
--         global_y => s_i_globaly
--);

--o_dataPixel <= s_couleur;


process(i_y)
begin
  o_dataPixel <= s_couleur;
end process;

o_dataValid <= '1';

--process(i_y)
--begin
--   if(i_y(3) = '1') then
--       o_dataPixel <= i_colorDataA(23 downto 0);
--   else
--       o_dataPixel <= i_colorDataB(23 downto 0);
--   end if;
--end process;

--o_dataValid <= '1';

end Behavioral;
