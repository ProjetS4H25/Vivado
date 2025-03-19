----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 02:38:56 PM
-- Design Name: 
-- Module Name: actor - Behavioral
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

entity actor is
  Port ( 
         clk       : in std_logic;
         i_tuileId : in std_logic_vector (5 downto 0); -- pour set le tuileId
         i_posX    : in std_logic_vector (9 downto 0); -- pour set la position global de l'acteur
         i_posY    : in std_logic_vector (9 downto 0); -- pour set la position global de l'acteur
         i_globalX : in std_logic_vector (9 downto 0); -- postion x global
         i_globalY : in std_logic_vector (9 downto 0); -- postion y global
         o_tuileX : out std_logic_vector (2 downto 0); -- postion x du pixel dans la tuile
         o_tuileY : out std_logic_vector (2 downto 0); -- position y du pixel dans la tuile
         o_tuileId : out std_logic_vector (5 downto 0) -- tuile de l'acteur
  );
end actor;

architecture Behavioral of actor is

    signal tuileId1 : std_logic_vector  (5 downto 0) := (others => '0');
    signal tuileId2 : std_logic_vector  (5 downto 0) := (others => '0');
    signal posX : std_logic_vector (9 downto 0) := (others => '0');
    signal posY : std_logic_vector (9 downto 0) := (others => '0');

begin
process(clk)
begin
    if rising_edge(clk) then
        -- verifie si la position du pixel correspond à la tuile de l'acteur
        if unsigned(i_globalX) >= unsigned(posX) and unsigned(i_globalX) < unsigned(posX) + 16 then
            if unsigned(i_globalY) >= unsigned(posY) and unsigned(i_globalY) < unsigned(posY) + 8 then
                if unsigned(i_globalX) < unsigned(posX) + 8 then
                    -- recupere la position dans la premiere tuile
                    o_tuileX <= std_logic_vector(unsigned(i_globalX) - unsigned(posX));
                    o_tuileY <= std_logic_vector(unsigned(i_globalY) - unsigned(posY));
                    
                    o_tuileId <= tuileId1;
                else
                    -- recupere la position dans la deuxieme tuile
                    o_tuileX <= std_logic_vector(unsigned(i_globalX) - unsigned(posX) + 8);
                    o_tuileY <= std_logic_vector(unsigned(i_globalY) - unsigned(posY));
                    o_tuileId <= tuileId2;
                end if;
            end if;
        end if;
    end if;
end process;
end Behavioral;
