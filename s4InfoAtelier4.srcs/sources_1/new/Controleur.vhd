----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 01:42:31 PM
-- Design Name: 
-- Module Name: Controleur - Behavioral
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

entity Controleur is
Port ( 
    -- Input
    i_opcode: in std_logic_vector(5 downto 0);
    
    -- Output
    -- o_dataValid doit être toujours à 1 pour avoir un rendu HDMI
    o_dataValid : out std_logic;
    
    -- Les outputs reliés aux actions du PPU
    -- Parties du background
    o_we_viewport : out std_logic;
    o_we_backBuffer : out std_logic;
    o_we_backTuileBuff : out std_logic;
    
    -- Parties de l'acteur
    o_we_acteurTuileBuff : out std_logic;
    o_we_chPosActeur : out std_logic;
    o_we_acteurTuile : out std_logic;
    
    -- Color Converter
    o_we_colorConverter : out std_logic;
    
    o_we_reset : out std_logic;
    clk : in std_logic
);
end Controleur;

architecture Behavioral of Controleur is

begin

o_we_viewport <= '1' when i_opcode = "000001" else '0';
o_we_backBuffer <= '1' when i_opcode = "000100" else '0';
o_we_backTuileBuff <= '1' when i_opcode = "001000" else '0';
o_we_acteurTuileBuff <= '1' when i_opcode = "100000" else '0';
o_we_chPosActeur <= '1' when i_opcode = "000010" else '0';
o_we_acteurTuile <= '1' when i_opcode = "100001" else '0';

o_we_colorConverter <= '1' when i_opcode = "010000" else '0';

o_we_reset <= '1' when i_opcode = "111111" else '0';

-- o_dataValid doit être toujours à 1 pour avoir un rendu HDMI
o_dataValid <= '1';

end Behavioral;
