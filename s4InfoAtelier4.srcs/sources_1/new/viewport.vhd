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
           pp_x : in STD_LOGIC_VECTOR (9 downto 0);
           pp_y : in STD_LOGIC_VECTOR (9 downto 0);
           offset_x : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
           offset_y : in STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
           global_x : out STD_LOGIC_VECTOR (9 downto 0);
           global_y : out STD_LOGIC_VECTOR (9 downto 0));
end viewport;

architecture Behavioral of viewport is

signal pos_x : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal pos_y : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
type type_moore is (actif, inactif);
signal etat_courant, etat_suivant: type_moore;

signal o_x : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal o_y : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

begin

 process(clk, reset)
 begin 
    if reset = '1' then
        etat_courant <= actif;
    elsif rising_edge(clk) then
         etat_courant <= etat_suivant;
    end if;
 end process;
 
 process(clk)
 begin
    if rising_edge(clk) and enable = '1' and etat_courant = inactif then
        pos_x <= std_logic_vector(unsigned("0000" & offset_x) + unsigned(pos_x));
        pos_y <= std_logic_vector(unsigned("0000" & offset_y) + unsigned(pos_y));
    elsif reset ='1' then 
        pos_x  <= pp_x;
        pos_y <= pp_y;
    end if;
 end process;
 
 process (etat_courant, offset_x, offset_y)
 begin
   
    case etat_courant is 
        when actif =>
            etat_suivant <= inactif;
        when inactif =>
            etat_suivant <= inactif;
        when others =>
            etat_suivant <= actif;          
     end case;
 end process;
 
 global_x <= pos_x;
 global_y <= pos_y;
 
end Behavioral;
