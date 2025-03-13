----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Marianne Blais
-- 
-- Create Date: 03/09/2025 02:44:56 PM
-- Design Name: 
-- Module Name: tb_cc - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_color_converter is
--  Port ( );
end tb_color_converter;

architecture Behavioral of tb_color_converter is

component color_Converter is
    Port ( cc : in STD_LOGIC_VECTOR (4 downto 0);
           ch_color : in STD_LOGIC_VECTOR (23 downto 0);
           we_color : in STD_LOGIC;
           clk : in STD_LOGIC;
           ch_cc : in STD_LOGIC_VECTOR (4 downto 0);  --À revérifier
           couleur : out STD_LOGIC_VECTOR (23 downto 0)); -- Aucun reset pour l'instant
end component;

signal s_cc: std_logic_vector(4 downto 0);
signal s_ch_color : STD_LOGIC_VECTOR (23 downto 0);
signal s_we_color : STD_LOGIC;
signal s_clk : STD_LOGIC;
signal s_ch_cc : STD_LOGIC_VECTOR (4 downto 0);  --À revérifier
signal s_couleur : STD_LOGIC_VECTOR (23 downto 0);

begin

uut: color_Converter
        Port map ( cc => s_cc,
                   ch_color => s_ch_color,
                   we_color => s_we_color,
                   clk => s_clk,
                   ch_cc => s_ch_cc,
                   couleur => s_couleur);

    clk_process :process
    begin
        s_clk <= '0';
        wait for 10 ns;
        s_clk <= '1';
        wait for 10 ns;
    end process;
    
    color_process: process
    begin
    
    s_cc <= "00001"; s_ch_color <= x"000000"; s_we_color <= '0'; s_ch_cc <= "00000";
        wait for 20 ns;
        
    s_cc <= "00011"; s_ch_color <= x"000000"; s_we_color <= '0'; s_ch_cc <= "00000";
        wait for 20 ns;
     
    s_cc <= "10011"; s_ch_color <= x"000000"; s_we_color <= '0'; s_ch_cc <= "00000";
        wait for 20 ns;
        
    s_cc <= "00111"; s_ch_color <= x"00FF00"; s_we_color <= '1'; s_ch_cc <= "10000";
        wait for 20 ns;
        
    s_cc <= "10000"; s_ch_color <= x"00FF00"; s_we_color <= '0'; s_ch_cc <= "10000";
        wait for 20 ns;
        
    s_cc <= "10001"; s_ch_color <= x"11FF00"; s_we_color <= '1'; s_ch_cc <= "10001";
        wait for 20 ns;
        
    s_cc <= "00001"; s_ch_color <= x"11FFAA"; s_we_color <= '1'; s_ch_cc <= "00001";
        wait for 20 ns;
       
    s_cc <= "00001"; s_ch_color <= x"11FF00"; s_we_color <= '0'; s_ch_cc <= "00001";
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;
