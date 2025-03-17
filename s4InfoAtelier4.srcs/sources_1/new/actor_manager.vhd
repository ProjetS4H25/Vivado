----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2025 03:49:24 PM
-- Design Name: 
-- Module Name: actor_manager - Behavioral
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

entity actor_manager is
    Port ( 
        globalX:    in std_logic_vector(9 downto 0);
        globalY:    in std_logic_vector(9 downto 0);
        actor_id:   in std_logic_vector(3 downto 0);
        ChPosX:     in std_logic_vector(1 downto 0);
        ChPosY:     in std_logic_vector(1 downto 0);
        ChTuileId:  in std_logic_vector(5 downto 0);
        WeTuile:    in std_logic;
        clk:        in std_logic;
        tuile_id:   out std_logic_vector(5 downto 0);
        tuile_X:    out std_logic_vector(2 downto 0);
        tuile_Y:    out std_logic_vector(2 downto 0)
    );
end actor_manager;
    
architecture Behavioral of actor_manager is
    signal s_pos_x:     std_logic_vector(9 downto 0) := (others => '0');
    signal s_pos_y:     std_logic_vector(9 downto 0) := (others => '0');
    signal s_ch_tuile:  std_logic_vector(5 downto 0) := (others => '0');
begin
    tuile_id <= s_ch_tuile;

update_values: process(clk, ChPosX, ChPosY, ChTuileId)
begin
    if rising_edge(clk) then
        -- Si le LSB de ChPosX est à 1, on veut modifier la position
        if ChPosX(1) = '1' then
            -- Le MSB de ChPosX indique si on veut se déplacer en positif 
            -- ou en négatif ('1' = positif, '0' = négatif)
            if ChPosX(0) = '1' then
                s_pos_x <= std_logic_vector(unsigned(s_pos_x) + 1);
            else
                s_pos_x <= std_logic_vector(unsigned(s_pos_x) - 1);
            end if;
        end if;
        
        -- Même chose que pour ChPosX mais pour la position en Y
        if ChPosY(1) = '1' then
           if ChPosX(0) = '1' then
                s_pos_x <= std_logic_vector(unsigned(s_pos_x) + 1);
            else
                s_pos_x <= std_logic_vector(unsigned(s_pos_x) - 1);
            end if;
        end if;
        
        -- Si WeTuile est à 1, on veut modifier l'id de la tuile.
        if WeTuile = '1' then
            -- s_ch_tuile prend la nouvelle valeur de ChTuileId
            s_ch_tuile <= ChTuileId;
        end if;
    end if;
end process;

end Behavioral;
