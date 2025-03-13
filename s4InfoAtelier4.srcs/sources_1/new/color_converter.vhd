----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Marianne Blais
-- 
-- Create Date: 02/24/2025 04:15:54 PM
-- Design Name: 
-- Module Name: color_Converter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_Converter is
    Port ( cc : in STD_LOGIC_VECTOR (4 downto 0);
           ch_color : in STD_LOGIC_VECTOR (23 downto 0);
           we_color : in STD_LOGIC;
           clk : in STD_LOGIC;
           ch_cc : in STD_LOGIC_VECTOR (4 downto 0);  --À revérifier
           couleur : out STD_LOGIC_VECTOR (23 downto 0)); -- Aucun reset pour l'instant
end color_Converter;

architecture Behavioral of color_Converter is

--SIGNAUX

type tab is array(31 downto 0) of std_logic_vector(23 downto 0);
signal tab_couleur : tab := (
    0  => x"000000", -- Noir
    1  => x"434343", -- Gris foncé
    2  => x"7C7C7C", -- Gris
    3  => x"B2B2B2", -- Gris pâle
    4  => x"FF0000", -- Rouge 
    5  => x"FF0097", -- Orange
    6  => x"FF00FF", -- Jaune 
    7  => x"0000FF", -- Vert fluo
    8  => x"2626CC", -- Vert
    9  => x"00FF00", -- Bleu
    10  => x"00FFFF", -- Bleu fluo
    11  => x"0F8F00", -- Bleu foncé
    12  => x"AAFF00", -- Mauve
    13  => x"FFFF00", -- Rose
    14  => x"FA8056", -- Rose fluo
    15  => x"FFFFFF", -- Blanc
    others => x"000000" -- Initialisation par défaut (Noir));
    );
signal next_color: std_logic_vector(23 downto 0);

begin

 process(clk)
 begin
    if(rising_edge(clk)) then
        couleur <= next_color;
    end if;
 end process;

 select_color: process(cc, we_color)
 begin
    if we_color = '1' then
        tab_couleur(to_integer(unsigned(ch_cc))) <= ch_color;
        if ch_cc = cc then
            next_color <= ch_color;
        else
            next_color <= tab_couleur(to_integer(unsigned(cc)));
        end if;    
    else
        next_color <= tab_couleur(to_integer(unsigned(cc)));
    end if;
    end process;
end Behavioral;
