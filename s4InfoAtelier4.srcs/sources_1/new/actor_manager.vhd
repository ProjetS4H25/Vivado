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
        clk:        in std_logic;
        reset:      in std_logic;
        moveEnable: in std_logic; -- flag pour bouger avec un delta
        initPositionEn:   in std_logic; -- flag pour set la position/tuile id
        initTuileEn:      in std_logic; -- flag pour set la position/tuile id
        initTuile:  in std_logic_vector(11 downto 0); -- les deux tuiles dans un signal
        globalX:    in std_logic_vector(9 downto 0);
        globalY:    in std_logic_vector(9 downto 0);
        offsetX:    in std_logic_vector(5 downto 0);
        offsetY:    in std_logic_vector(5 downto 0);
        positionX:  in std_logic_vector(5 downto 0);
        positionY:  in std_logic_vector(5 downto 0);
        actor_id:   in std_logic_vector(3 downto 0);
        tuile_id:   out std_logic_vector(5 downto 0);
        tuile_X:    out std_logic_vector(2 downto 0);
        tuile_Y:    out std_logic_vector(2 downto 0)
   
    );
end actor_manager;
    
architecture Behavioral of actor_manager is
--Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (idle, SetPositionX, SetPositionY, ChangePositionX, ChangePositionY, ChangeTuileId);
   signal state, next_state : state_type;
   --other outputs
    
    signal moveEn1: std_logic;
    signal moveEn2: std_logic;
    
    signal s_offset_x:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_offset_y:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_x:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_y:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_tuile_id:      std_logic_vector(9 downto 0) := (others => '0');

begin


    
    
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (reset = '1') then
            
         else if (initTuile = '1') then
         
         else if (initPosition = '1') then
            
         else if (moveEnable = '1') then
            case actor_id is
                when "0000" =>
                    s_a1_en <= '1';
                    -- set les output de a1
                    s_a2_en <= '0';
                    
                when "0001" =>
                    s_a1_en <= '0';
                    s_a2_en <= '1';
   
                when others =>
                    s_a1_en <= '0';
                    s_a2_en <= '0';
                    s_tuile_id <= (others => '0');
             end case;
         end if;
      end if;
   end process;

end Behavioral;
