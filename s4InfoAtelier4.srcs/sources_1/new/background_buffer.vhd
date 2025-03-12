----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 03:45:16 PM
-- Design Name: 
-- Module Name: background_buffer - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity background_buffer is
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
end background_buffer;

architecture Behavioral of background_buffer is

signal s_div8_X : std_logic_vector (9 downto 0);
signal s_div8_Y : std_logic_vector (9 downto 0);
signal s_index : std_logic_vector (13 downto 0);
signal s_line_fact : std_logic_vector (13 downto 0);

signal s_div8_chX : std_logic_vector (9 downto 0);
signal s_div8_chY : std_logic_vector (9 downto 0);
signal s_index_ch : std_logic_vector (13 downto 0);
signal s_line_fact_ch : std_logic_vector (13 downto 0);

signal next_tuile  : std_logic_vector (5 downto 0) := (others => '0');
signal next_index : std_logic_vector (13 downto 0) := (others => '0');

type tuileId is array (natural range <>) of std_logic_vector (5 downto 0);
signal back_buffer : tuileId(0 to 16383) := (others => (others => '0'));

begin

-- Trouver l'index à faire afficher
s_div8_X <= std_logic_vector(unsigned(i_globalX) srl 3);
s_div8_Y <= std_logic_vector(unsigned(i_globalY) srl 3);
s_line_fact <= std_logic_vector(resize(unsigned(s_div8_Y) * 127, 14));
s_index <= std_logic_vector(unsigned(s_div8_X) + unsigned(s_div8_Y) + unsigned(s_line_fact));

-- Trouver l'index à modifier
s_div8_chX <= std_logic_vector(unsigned(i_ch_X) srl 3);
s_div8_chY <= std_logic_vector(unsigned(i_ch_Y) srl 3);
s_line_fact_ch <= std_logic_vector(resize(unsigned(s_div8_chY) * 127, 14));
s_index_ch <= std_logic_vector(unsigned(s_div8_chX) + unsigned(s_div8_chY) + unsigned(s_line_fact_ch));

-- Aller changer la valeur d'une tuile id dans le background.
-- Il est simplement possible de le faire lorsque le clk est rising et que le contrôleur met i_we_bck à 1
change_value : process(clk)
begin
    -- Valider si on a le droit d'aller changer la valeur d'une tuile
    if rising_edge(clk) then
        if i_we_bck = '1' then
            if Not(s_index_ch = s_index) then
                back_buffer(to_integer(unsigned(s_index_ch))) <= i_ch_tuile_id;
            else
                next_tuile <= i_ch_tuile_id;
                next_index <= s_index_ch;
            end if;
        elsif Not(next_tuile = "000000") AND Not(s_index_ch = next_index) then
            back_buffer(to_integer(unsigned(next_index))) <= next_tuile;
            next_tuile <= (others => '0');
            next_index <= (others => '0');
        end if;
    end if;
end process change_value;

-- Diviser la valeur de i_globalX et de i_globalY et concerver uniquement la valeur entière.
-- Cette valeur permet de retrouver l'id de la tuile et l'écrire dans o_tuileId
get_tuile_id: process(s_index)
begin
    o_tuileId <= back_buffer( to_integer(unsigned(s_index)));
end process;

-- Faire un modulo 8 aux valeurs globalX et globalY pour toruver la valeur X et Y à l'intérieur même de la tuile.
-- Écrire les valeurs dans o_tuileX et o_tuileY
get_pixel_posi: process(i_globalX, i_globalY)
begin    
    o_tuileX <= i_globalX(2 downto 0);
    o_tuileY <= i_globalY(2 downto 0);
end process;

end Behavioral;