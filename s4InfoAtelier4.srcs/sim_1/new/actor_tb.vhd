----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 03:00:00 PM
-- Design Name: 
-- Module Name: tb_actor - Behavioral
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

entity tb_actor is
end tb_actor;

architecture Behavioral of tb_actor is

    -- Component declaration for the Unit Under Test (UUT)
    component actor is
      Port ( 
         clk       : in std_logic;
         i_globalX : in std_logic_vector (9 downto 0); -- position x global
         i_globalY : in std_logic_vector (9 downto 0); -- position y global
         i_tuileId : in std_logic_vector (5 downto 0); -- to set the tuileId
         o_tuileX  : out std_logic_vector (2 downto 0); -- position x of the pixel in the tile
         o_tuileY  : out std_logic_vector (2 downto 0); -- position y of the pixel in the tile
         o_tuileId : out std_logic_vector (5 downto 0)  -- tuile id of the actor
      );
    end component;

    -- Signal declarations for interfacing with the UUT
    signal clk       : std_logic := '0';
    signal i_globalX : std_logic_vector (9 downto 0) := (others => '0');
    signal i_globalY : std_logic_vector (9 downto 0) := (others => '0');
    signal i_tuileId : std_logic_vector (5 downto 0) := (others => '0');
    signal o_tuileX  : std_logic_vector (2 downto 0);
    signal o_tuileY  : std_logic_vector (2 downto 0);
    signal o_tuileId : std_logic_vector (5 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: actor
      port map (
         clk       => clk,
         i_globalX => i_globalX,
         i_globalY => i_globalY,
         i_tuileId => i_tuileId,
         o_tuileX  => o_tuileX,
         o_tuileY  => o_tuileY,
         o_tuileId => o_tuileId
      );

    -- Clock generation process: 10 ns period (5 ns high, 5 ns low)
    clk_process: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process to apply test vectors to the UUT
    stim_process: process
    begin
        -- Wait for initial reset (if any)
        wait for 10 ns;
        
        -- Test case 1: 
        -- Set global positions where lower 3 bits are "010" (2) and "100" (4)
        -- and assign tuileId "000011" (3-bit value in a 6-bit vector)
        i_globalX <= "0000001010";  -- lower 3 bits: "010"
        i_globalY <= "0000001100";  -- lower 3 bits: "100"
        i_tuileId <= "000011";
        wait for 10 ns;
        
        -- Test case 2:
        -- Change the positions to different values
        i_globalX <= "0000011111";  -- lower 3 bits: "111"
        i_globalY <= "0000010001";  -- lower 3 bits: "001"
        i_tuileId <= "000101";
        wait for 10 ns;
        
        -- Test case 3:
        -- Set positions with varying bits to observe the lower 3 bits extraction
        i_globalX <= "1010101010";  -- lower 3 bits: "010"
        i_globalY <= "0101010101";  -- lower 3 bits: "101"
        i_tuileId <= "001100";
        wait for 20 ns;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
