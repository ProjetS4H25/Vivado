----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2025 02:00:31 PM
-- Design Name: 
-- Module Name: viewport - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity viewport is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           enable: in STD_LOGIC;
           pp_x : in STD_LOGIC_VECTOR (8 downto 0);
           pp_y : in STD_LOGIC_VECTOR (8 downto 0);
           offset_x : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
           offset_y : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
           global_x : out STD_LOGIC_VECTOR (8 downto 0);
           global_y : out STD_LOGIC_VECTOR (8 downto 0));
end viewport;

architecture Behavioral of viewport is

signal pos_x : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal pos_y : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');

signal calcul_x : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal calcul_y : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal actual_pos_x : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal actual_pos_y : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
type type_moore is (actif, inactif);
signal etat_courant, etat_suivant: type_moore;

signal o_x : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal o_y : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');

begin

calcul_x <= std_logic_vector(resize(unsigned("0000" & offset_x) + unsigned('0' & pp_x), 10));
calcul_y <= std_logic_vector(resize(unsigned("0000" & offset_y) + unsigned('0' & pp_y), 10));

pos_x <= calcul_x(8 downto 0) when calcul_x(9) = '0' else (others => '1');
pos_y <= calcul_y(8 downto 0) when calcul_y <= "0101111111" else "101111111";

 process(clk, enable, reset)
 begin
    if reset = '1' then
        global_x  <= pp_x;
        global_y <= pp_y;
        actual_pos_x <= pp_x;
        actual_pos_y <= pp_y;
    else 
        if rising_edge(clk) and enable = '1' then
            global_x <= pos_x;
            global_y <= pos_y;
            actual_pos_x <= pos_x;
            actual_pos_y <= pos_y;
        else
            global_x <= actual_pos_x;
            global_y <= actual_pos_y;
        end if;
    end if;
 end process;
 
end Behavioral;
