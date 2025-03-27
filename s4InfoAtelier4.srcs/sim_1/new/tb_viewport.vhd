----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2025 02:06:14 PM
-- Design Name: 
-- Module Name: tb_viewport - Behavioral
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

entity tb_viewport is
--  Port ( );
end tb_viewport;

architecture Behavioral of tb_viewport is

component viewport is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           enable: in STD_LOGIC;
           pp_x : in STD_LOGIC_VECTOR (8 downto 0);
           pp_y : in STD_LOGIC_VECTOR (8 downto 0);
           offset_x : in STD_LOGIC_VECTOR (5 downto 0);
           offset_y : in STD_LOGIC_VECTOR (5 downto 0);
           global_x : out STD_LOGIC_VECTOR (8 downto 0);
           global_y : out STD_LOGIC_VECTOR (8 downto 0));
end component;

signal clk : STD_LOGIC;
signal reset: STD_LOGIC;
signal enable : STD_LOGIC;
signal pp_x : STD_LOGIC_VECTOR (8 downto 0);
signal pp_y : STD_LOGIC_VECTOR (8 downto 0);
signal offset_x : STD_LOGIC_VECTOR (5 downto 0);
signal offset_y : STD_LOGIC_VECTOR (5 downto 0);
signal global_x : STD_LOGIC_VECTOR (8 downto 0);
signal global_y : STD_LOGIC_VECTOR (8 downto 0);

begin

uut: viewport
Port map ( 
clk => clk,      
 reset => reset, 
 enable => enable,  
 pp_x => pp_x,   
 pp_y => pp_y,     
 offset_x => offset_x ,
 offset_y => offset_y ,
 global_x => global_x ,
 global_y => global_y );

clk_process :process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

vp: process
    begin
--    reset <= '1'; pp_x <= "0000000000"; pp_y <= "0000000000"; offset_x <= "001011"; offset_y <= "000001";
--        wait for 20 ns;  
        
    reset <= '0'; enable <= '1'; pp_x <= "000000001"; pp_y <= "000000000"; offset_x <= "000001"; offset_y <= "000001";
        wait for 20 ns;
        
    reset <= '0'; enable <= '1'; pp_x <= "111111111"; pp_y <= "111111111"; offset_x <= "000001"; offset_y <= "000001";
        wait for 20 ns;
    
    reset <= '0'; enable <= '1'; pp_x <= "000000001"; pp_y <= "000000000"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns;    
    
    reset <= '0'; enable <= '1'; pp_x <= "000000001"; pp_y <= "000000000"; offset_x <= "000001"; offset_y <= "000001";
        wait for 20 ns;
    
    reset <= '0'; enable <= '1'; pp_x <= "000000001"; pp_y <= "000000000"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns; 
        
    reset <= '1'; enable <= '1'; pp_x <= "000000000"; pp_y <= "000000000"; offset_x <= "001011"; offset_y <= "000001";
        wait for 20 ns;   
        
    reset <= '0'; enable <= '1'; pp_x <= "000000101"; pp_y <= "000000010"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns;  
        
    reset <= '0'; enable <= '1'; pp_x <= "000000101"; pp_y <= "000000010"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns; 
        
    reset <= '0'; enable <= '0'; pp_x <= "000000101"; pp_y <= "000000010"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns;  
      
    reset <= '0'; enable <= '1'; pp_x <= "000000101"; pp_y <= "000000010"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns;  
        
    reset <= '1'; enable <= '1'; pp_x <= "000000101"; pp_y <= "000000010"; offset_x <= "000011"; offset_y <= "000001";
        wait for 20 ns;
        
        wait;
    end process;
end Behavioral;
