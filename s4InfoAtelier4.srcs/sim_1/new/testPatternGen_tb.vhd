----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 08:05:03 PM
-- Design Name: 
-- Module Name: testPatternGen_tb - Behavioral
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

entity testPatternGen_tb is
--  Port ( );
end testPatternGen_tb;

architecture Behavioral of testPatternGen_tb is

component testPatternGen2 is
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
end component;
signal clk :  std_logic;
signal rstn : std_logic;
signal i_x :  std_logic_vector(11 downto 0);
signal i_y :  std_logic_vector(11 downto 0);
signal o_dataValid : std_logic;
signal o_dataPixel : std_logic_vector(23 downto 0);
signal i_colorDataA :std_logic_vector(31 downto 0);
signal i_colorDataB :std_logic_vector(31 downto 0);


begin

tPG: testPatternGen2
Port map( 
    clk           => clk         ,
    rstn          => rstn        ,
    i_x           => i_x         ,
    i_y           => i_y         ,
    o_dataValid   => o_dataValid ,
    o_dataPixel   => o_dataPixel ,
    i_colorDataA  => i_colorDataA,
    i_colorDataB  => i_colorDataB
);

clk_process :process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
 TPG2_0: process
    begin
    rstn          <= '0';
    i_x           <= "000000000000";
    i_y          <= "000000000000";
    i_colorDataA  <= "00000000000000000000000000000000";
    i_colorDataB  <= "00000000000000000000000000000000";
    
    wait;
    end process;   
end Behavioral;
