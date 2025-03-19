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
         i_initActor : in std_logic; -- flag pour set la position et les id des tuiles
         i_tuileId1 : in std_logic_vector (5 downto 0); -- pour set le tuileId
         i_tuileId2 : in std_logic_vector (5 downto 0); -- pour set le tuileId
         i_globalX : in std_logic_vector (9 downto 0); -- postion x global
         i_globalY : in std_logic_vector (9 downto 0); -- postion y global
         i_moveOffsetX : in std_logic_vector (5 downto 0); -- delta du deplacement X
         i_moveOffsetY : in std_logic_vector (5 downto 0); -- delta du deplacement Y
         i_moveEnable : in std_logic; -- permet de bouger actor
         o_tuileX : out std_logic_vector (2 downto 0); -- postion x du pixel dans la tuile
         o_tuileY : out std_logic_vector (2 downto 0); -- position y du pixel dans la tuile
         o_tuileId : out std_logic_vector (5 downto 0) -- tuile de l'acteur
  );
end actor;

architecture Behavioral of actor is

    signal tuileId1 : std_logic_vector  (5 downto 0) := (others => '0');
    signal tuileId2 : std_logic_vector  (5 downto 0) := (others => '0');
    signal currentPosX : std_logic_vector (9 downto 0) := (others => '0');
    signal currentPosY : std_logic_vector (9 downto 0) := (others => '0');
    signal nextPosX : std_logic_vector (9 downto 0) := (others => '0');
    signal nextPosY : std_logic_vector (9 downto 0) := (others => '0');

begin
process(clk)
begin
    if rising_edge(clk) then
        -- set les tuiles et position initiales de actor
        if i_initActor = '1' then
            -- set tuile actor
            tuileId1 <= i_tuileId1;
            tuileId2 <= i_tuileId2;
            -- set position actor
            nextPosX <= i_globalX;
            nextPosY <= i_globalY;
        end if;
        
        -- move actor
        if i_moveEnable = '1' then
            -- position + offset si offset positif
            if i_moveOffsetX(5) = '0' then
                nextPosX <= std_logic_vector(unsigned(currentPosX) + unsigned (i_moveOffsetX));
                nextPosY <= std_logic_vector(unsigned(currentPosY) + unsigned (i_moveOffsetY));
            -- position - offset si offset negatif
            elsif i_moveOffsetX(5) = '1' then
                nextPosX <= std_logic_vector(unsigned(currentPosX) - unsigned (i_moveOffsetX));
                nextPosY <= std_logic_vector(unsigned(currentPosY) - unsigned (i_moveOffsetY));
            end if;
        else
            nextPosX <= currentPosX;
            nextPosY <= currentPosY;
        end if;
        
        -- update postion actor
        currentPosX <= nextPosX;
        currentPosY <= nextPosY;
        
        -- verifie si la position du pixel correspond à la tuile de l'acteur
        if unsigned(i_globalX) >= unsigned(currentPosX) and unsigned(i_globalX) < unsigned(currentPosX) + 16 then
            if unsigned(i_globalY) >= unsigned(currentPosY) and unsigned(i_globalY) < unsigned(currentPosY) + 8 then
                if unsigned(i_globalX) < unsigned(currentPosX) + 8 then
                    -- recupere la position dans la premiere tuile
                    o_tuileX <= std_logic_vector(unsigned(i_globalX) - unsigned(currentPosX));
                    o_tuileY <= std_logic_vector(unsigned(i_globalY) - unsigned(currentPosY));
                    
                    o_tuileId <= tuileId1;
                else
                    -- recupere la position dans la deuxieme tuile
                    o_tuileX <= std_logic_vector(unsigned(i_globalX) - unsigned(currentPosX) - 8);
                    o_tuileY <= std_logic_vector(unsigned(i_globalY) - unsigned(currentPosY));
                    o_tuileId <= tuileId2;
                end if;
            end if;
        else -- si la postion du pixel n'est pas dans la tuile de l'acteur
            o_tuileX <= (others => '0');
            o_tuileY <= (others => '0');
            o_tuileId <= (others => '0');
        end if;
    end if;
end process;
end Behavioral;
