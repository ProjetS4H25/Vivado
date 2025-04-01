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
        reset:      in std_logic;
        clk:        in std_logic;
        i_moveEnable: in std_logic; -- flag pour bouger avec un delta
        i_initPosition:   in std_logic; -- flag pour set la position/tuile id
        i_initTuile:      in std_logic; -- flag pour set la position/tuile id
        i_tuileId:  in std_logic_vector(11 downto 0); -- les deux tuiles dans un signal
        i_globalX:    in std_logic_vector(9 downto 0);
        i_globalY:    in std_logic_vector(9 downto 0);
        i_offsetX:    in std_logic_vector(5 downto 0);
        i_offsetY:    in std_logic_vector(5 downto 0);
        i_positionX:  in std_logic_vector(9 downto 0);
        i_positionY:  in std_logic_vector(9 downto 0);
        i_actor_id:   in std_logic_vector(3 downto 0);
        o_tuile_id:   out std_logic_vector(5 downto 0);
        o_tuile_X:    out std_logic_vector(2 downto 0);
        o_tuile_Y:    out std_logic_vector(2 downto 0)
   
    );
end actor_manager;
    
architecture Behavioral of actor_manager is
    component actor is
      Port ( 
             reset     : in std_logic;
             clk       : in std_logic;
             i_initTuile : in std_logic; -- flag pour set les tuileID
             i_initPos : in std_logic; -- flag pour set la position
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
  end component;
    
    signal s_moveEn1: std_logic;
    signal s_moveEn2: std_logic;
    signal s_initTuile1: std_logic;
    signal s_initTuile2: std_logic;    
    signal s_initPos1: std_logic;
    signal s_initPos2: std_logic;
    
    signal s_tuileX1:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX2:   std_logic_vector(2 downto 0):= (others => '0');
    
    signal s_tuileY1:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY2:   std_logic_vector(2 downto 0) := (others => '0');
    
    signal s_tuileId1:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId2:  std_logic_vector(5 downto 0) := (others => '0');
    
    signal s_global_x:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_y:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_x1:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_x2:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_y1:      std_logic_vector(9 downto 0) := (others => '0');
    signal s_global_y2:      std_logic_vector(9 downto 0) := (others => '0');
    
    signal s_initTuile:     std_logic_vector(11 downto 0):= (others => '0');
    signal s_tuileId:       std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuile_X:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuile_y:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_offset_x:      std_logic_vector(5 downto 0) := (others => '0');
    signal s_offset_y:      std_logic_vector(5 downto 0) := (others => '0');
    
    

begin

    actor1: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile1,
        i_initPos       => s_initPos1,
        i_moveEnable    => s_moveEn1,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x1,
        i_globalY       => s_global_y1,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX1,
        o_tuileY        => s_tuileY1,
        o_tuileId       => s_tuileId1
        
    );
    
    
  s_moveEn1 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0000") else '0';
  s_moveEn2 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0001") else '0';
  
  s_initPos1    <= '1' when (i_initPosition = '1' AND i_actor_id = "0000") else '0';           
  s_initPos2    <= '1' when (i_initPosition = '1' AND i_actor_id = "0001") else '0';
  
  s_global_x1 <= i_positionX when (s_initPos1 = '1') else i_globalX;
  s_global_y1 <= i_positionY when (s_initPos1 = '1') else i_globalY;

  s_initTuile1    <= '1' when (i_initTuile = '1' AND i_actor_id = "0000") else '0';
  s_initTuile2    <= '1' when (i_initTuile = '1' AND i_actor_id = "0001") else '0';
  
  s_tuile_x <= s_tuileX1 when (s_tuileId1 /= "000000") else 
                s_tuileX2 when (s_tuileId2 /= "000000") else "000";
                
  s_tuile_y <= s_tuileY1 when (s_tuileId1 /= "000000") else 
                s_tuileY2 when (s_tuileId2 /= "000000") else "000";
                
                
  s_tuileId <= s_tuileId1 when (s_tuileId1 /= "000000") else
                s_tuileId2 when (s_tuileId2 /= "000000") else "000000";
    
  o_tuile_id <= s_tuileId;
  o_tuile_x <= s_tuile_x;
  o_tuile_y <= s_tuile_y;
end Behavioral;
