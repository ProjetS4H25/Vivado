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
        i_moveEnable: in std_logic;         -- flag pour bouger avec un delta
        i_initPosition:   in std_logic;     -- flag pour set la position/tuile id
        i_initTuile:      in std_logic;     -- flag pour set la position/tuile id
        i_tuileId:  in std_logic_vector(11 downto 0);   -- Id des deux tuiles de l'acteur au actor_id (première tuile concaténée à la deuxième)
        i_globalX:    in std_logic_vector(8 downto 0);  -- Position globale du viewport en X
        i_globalY:    in std_logic_vector(8 downto 0);  -- Position globale du viewport en Y
        i_offsetX:    in std_logic_vector(5 downto 0);  -- Offset X à appliquer à l'acteur (activé par i_moveEnable)
        i_offsetY:    in std_logic_vector(5 downto 0);  -- Offset Y à appliquer à l'acteur (activé par i_moveEnable)
        i_positionX:  in std_logic_vector(8 downto 0);  -- Position X à appliquer à l'acteur (activé par i_initPosition)
        i_positionY:  in std_logic_vector(8 downto 0);  -- Position Y à appliquer à l'acteur (activé par i_initPosition)
        i_actor_id:   in std_logic_vector(3 downto 0);  -- L'ID de l'acteur concerné
        o_tuile_id:   out std_logic_vector(5 downto 0); -- ID de la tuile de l'acteur qui est actuellement à la position du viewport globalX et globalY
        o_tuile_X:    out std_logic_vector(2 downto 0); -- Position X du pixel actuel dans l'acteur
        o_tuile_Y:    out std_logic_vector(2 downto 0)  -- Position Y du pixel actuel dans l'acteur
   
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
             i_globalX : in std_logic_vector (8 downto 0); -- postion x global
             i_globalY : in std_logic_vector (8 downto 0); -- postion y global
             i_moveOffsetX : in std_logic_vector (5 downto 0); -- delta du deplacement X
             i_moveOffsetY : in std_logic_vector (5 downto 0); -- delta du deplacement Y
             i_moveEnable : in std_logic; -- permet de bouger actor
             o_tuileX : out std_logic_vector (2 downto 0); -- postion x du pixel dans la tuile
             o_tuileY : out std_logic_vector (2 downto 0); -- position y du pixel dans la tuile
             o_tuileId : out std_logic_vector (5 downto 0) -- tuile de l'acteur
      );
  end component;
    
    -- Flags de mouvement pour chaque acteur
    signal s_moveEn1: std_logic;
    signal s_moveEn2: std_logic;
    signal s_moveEn3: std_logic;
    signal s_moveEn4: std_logic;
    signal s_moveEn5: std_logic;
    signal s_moveEn6: std_logic;
    signal s_moveEn7: std_logic;
    signal s_moveEn8: std_logic;
    
    -- Flags d'initialisation de tuile pour chaque acteur
    signal s_initTuile1: std_logic;
    signal s_initTuile2: std_logic;    
    signal s_initTuile3: std_logic;    
    signal s_initTuile4: std_logic;    
    signal s_initTuile5: std_logic;    
    signal s_initTuile6: std_logic;    
    signal s_initTuile7: std_logic;    
    signal s_initTuile8: std_logic;
        
    -- Flags d'initialisation de position pour chaque acteur
    signal s_initPos1: std_logic;
    signal s_initPos2: std_logic;
    signal s_initPos3: std_logic;
    signal s_initPos4: std_logic;
    signal s_initPos5: std_logic;
    signal s_initPos6: std_logic;
    signal s_initPos7: std_logic;
    signal s_initPos8: std_logic;
    
    -- Signal de sortie de la position X et Y dans la tuile pour chaque acteur
    signal s_tuileX1:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX2:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX3:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX4:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX5:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX6:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX7:   std_logic_vector(2 downto 0):= (others => '0');
    signal s_tuileX8:   std_logic_vector(2 downto 0):= (others => '0');
    
    signal s_tuileY1:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY2:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY3:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY4:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY5:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY6:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY7:   std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuileY8:   std_logic_vector(2 downto 0) := (others => '0');
    
    -- Signal de sortie de l'ID de la tuile pour chaque acteur
    signal s_tuileId1:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId2:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId3:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId4:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId5:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId6:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId7:  std_logic_vector(5 downto 0) := (others => '0');
    signal s_tuileId8:  std_logic_vector(5 downto 0) := (others => '0');
    
    -- Signaux intermédiaires de la position globale (viewport)
    signal s_global_x:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y:      std_logic_vector(8 downto 0) := (others => '0');
    
    -- Signaux d'entrée de la position globale pour chaque acteur
    signal s_global_x1:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x2:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x3:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x4:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x5:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x6:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x7:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_x8:      std_logic_vector(8 downto 0) := (others => '0');
    
    signal s_global_y1:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y2:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y3:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y4:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y5:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y6:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y7:      std_logic_vector(8 downto 0) := (others => '0');
    signal s_global_y8:      std_logic_vector(8 downto 0) := (others => '0');
    
    
    signal s_initTuile:     std_logic_vector(11 downto 0):= (others => '0'); -- Signal d'entrée d'initialisation de tuile
    
    signal s_tuileId:       std_logic_vector(5 downto 0) := (others => '0'); -- Signal de sortie d'ID de la tuile
    signal s_tuile_X:       std_logic_vector(2 downto 0) := (others => '0'); -- Signal de sortie de la position X dans la tuile
    signal s_tuile_y:       std_logic_vector(2 downto 0) := (others => '0'); -- Signal de sortie de la position Y dans la tuile
    signal s_offset_x:      std_logic_vector(5 downto 0) := (others => '0'); -- Signal intermédiaire de l'offset X reçu en entrée
    signal s_offset_y:      std_logic_vector(5 downto 0) := (others => '0'); -- Signal intermédiaire de l'offset Y reçu en entrée
    
    

begin

    -- Instancier les 8 acteurs
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
    
    actor2: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile2,
        i_initPos       => s_initPos2,
        i_moveEnable    => s_moveEn2,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x2,
        i_globalY       => s_global_y2,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX2,
        o_tuileY        => s_tuileY2,
        o_tuileId       => s_tuileId2
        
    );
    
        actor3: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile3,
        i_initPos       => s_initPos3,
        i_moveEnable    => s_moveEn3,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x3,
        i_globalY       => s_global_y3,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX3,
        o_tuileY        => s_tuileY3,
        o_tuileId       => s_tuileId3
        
    );
    
        actor4: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile4,
        i_initPos       => s_initPos4,
        i_moveEnable    => s_moveEn4,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x4,
        i_globalY       => s_global_y4,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX4,
        o_tuileY        => s_tuileY4,
        o_tuileId       => s_tuileId4
        
    );
    
        actor5: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile5,
        i_initPos       => s_initPos5,
        i_moveEnable    => s_moveEn5,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x5,
        i_globalY       => s_global_y5,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX5,
        o_tuileY        => s_tuileY5,
        o_tuileId       => s_tuileId5
        
    );
    
        actor6: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile6,
        i_initPos       => s_initPos6,
        i_moveEnable    => s_moveEn6,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x6,
        i_globalY       => s_global_y6,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX6,
        o_tuileY        => s_tuileY6,
        o_tuileId       => s_tuileId6
        
    );
    
        actor7: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile7,
        i_initPos       => s_initPos7,
        i_moveEnable    => s_moveEn7,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x7,
        i_globalY       => s_global_y7,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX7,
        o_tuileY        => s_tuileY7,
        o_tuileId       => s_tuileId7
        
    );
    
        actor8: component actor
    Port map(
        reset           => reset,
        clk             => clk,
        i_initTuile     => s_initTuile8,
        i_initPos       => s_initPos8,
        i_moveEnable    => s_moveEn8,
        i_tuileId1      => i_tuileId(11 downto 6),
        i_tuileId2      => i_tuileId(5 downto 0),
        i_globalX       => s_global_x8,
        i_globalY       => s_global_y8,
        i_moveOffsetX   => s_offset_x,
        i_moveOffsetY   => s_offset_y,
        o_tuileX        => s_tuileX8,
        o_tuileY        => s_tuileY8,
        o_tuileId       => s_tuileId8
        
    );
    
  
  -- Valeur du flag de mouvement de chaque acteur selon le actor_id reçu par le manager
  s_moveEn1 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0000") else '0';
  s_moveEn2 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0001") else '0';
  s_moveEn3 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0010") else '0';
  s_moveEn4 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0011") else '0';
  s_moveEn5 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0100") else '0';
  s_moveEn6 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0101") else '0';
  s_moveEn7 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0110") else '0';
  s_moveEn8 <= '1' when (i_moveEnable = '1' AND i_actor_id = "0111") else '0';
  
  -- Valeur du flag d'initialisation de la position de chaque acteur selon le actor_id reçu par le manager
  s_initPos1    <= '1' when (i_initPosition = '1' AND i_actor_id = "0000") else '0';           
  s_initPos2    <= '1' when (i_initPosition = '1' AND i_actor_id = "0001") else '0';
  s_initPos3    <= '1' when (i_initPosition = '1' AND i_actor_id = "0010") else '0';
  s_initPos4    <= '1' when (i_initPosition = '1' AND i_actor_id = "0011") else '0';
  s_initPos5    <= '1' when (i_initPosition = '1' AND i_actor_id = "0100") else '0';
  s_initPos6    <= '1' when (i_initPosition = '1' AND i_actor_id = "0101") else '0';
  s_initPos7    <= '1' when (i_initPosition = '1' AND i_actor_id = "0110") else '0';
  s_initPos8    <= '1' when (i_initPosition = '1' AND i_actor_id = "0111") else '0';
  
  -- Quand le flag d'initialisation de position est à 1, la position globale est 
  -- utilisée comme nouvelle position de l'acteur.
  s_global_x1 <= i_positionX when (s_initPos1 = '1') else i_globalX;
  s_global_x2 <= i_positionX when (s_initPos2 = '1') else i_globalX;
  s_global_x3 <= i_positionX when (s_initPos3 = '1') else i_globalX;
  s_global_x4 <= i_positionX when (s_initPos4 = '1') else i_globalX;
  s_global_x5 <= i_positionX when (s_initPos5 = '1') else i_globalX;
  s_global_x6 <= i_positionX when (s_initPos6 = '1') else i_globalX;
  s_global_x7 <= i_positionX when (s_initPos7 = '1') else i_globalX;
  s_global_x8 <= i_positionX when (s_initPos8 = '1') else i_globalX;
  
  s_global_y1 <= i_positionY when (s_initPos1 = '1') else i_globalY;
  s_global_y2 <= i_positionY when (s_initPos2 = '1') else i_globalY;
  s_global_y3 <= i_positionY when (s_initPos3 = '1') else i_globalY;
  s_global_y4 <= i_positionY when (s_initPos4 = '1') else i_globalY;
  s_global_y5 <= i_positionY when (s_initPos5 = '1') else i_globalY;
  s_global_y6 <= i_positionY when (s_initPos6 = '1') else i_globalY;
  s_global_y7 <= i_positionY when (s_initPos7 = '1') else i_globalY;
  s_global_y8 <= i_positionY when (s_initPos8 = '1') else i_globalY;

  -- Quand le flag d'initialisation d'une tuile reçu est à 1, le flag de l'acteur au actor_id reçu est mis à 1.
  s_initTuile1    <= '1' when (i_initTuile = '1' AND i_actor_id = "0000") else '0';
  s_initTuile2    <= '1' when (i_initTuile = '1' AND i_actor_id = "0001") else '0';
  s_initTuile3    <= '1' when (i_initTuile = '1' AND i_actor_id = "0010") else '0';
  s_initTuile4    <= '1' when (i_initTuile = '1' AND i_actor_id = "0011") else '0';
  s_initTuile5    <= '1' when (i_initTuile = '1' AND i_actor_id = "0100") else '0';
  s_initTuile6    <= '1' when (i_initTuile = '1' AND i_actor_id = "0101") else '0';
  s_initTuile7    <= '1' when (i_initTuile = '1' AND i_actor_id = "0110") else '0';
  s_initTuile8    <= '1' when (i_initTuile = '1' AND i_actor_id = "0111") else '0';
  
  -- Si le signal de tuileID n'est pas 0 pour un certain acteur, ses valeurs de retour sont
  -- utilisée comme valeurs de retour du manager.
  s_tuile_x <= s_tuileX1 when (s_tuileId1 /= "000000") else 
                s_tuileX2 when (s_tuileId2 /= "000000") else 
                s_tuileX3 when (s_tuileId3 /= "000000") else
                s_tuileX4 when (s_tuileId4 /= "000000") else
                s_tuileX5 when (s_tuileId5 /= "000000") else
                s_tuileX6 when (s_tuileId6 /= "000000") else
                s_tuileX7 when (s_tuileId7 /= "000000") else
                s_tuileX8 when (s_tuileId8 /= "000000") else "000";
                
  s_tuile_y <= s_tuileY1 when (s_tuileId1 /= "000000") else 
                s_tuileY2 when (s_tuileId2 /= "000000") else 
                s_tuileY3 when (s_tuileId3 /= "000000") else 
                s_tuileY4 when (s_tuileId4 /= "000000") else
                s_tuileY5 when (s_tuileId5 /= "000000") else
                s_tuileY6 when (s_tuileId6 /= "000000") else
                s_tuileY7 when (s_tuileId7 /= "000000") else
                s_tuileY8 when (s_tuileId8 /= "000000") else"000";
                
  -- Le tuileID de retour est le premier tuileID non-null reçu d'un acteur.              
  s_tuileId <= s_tuileId1 when (s_tuileId1 /= "000000") else
                s_tuileId2 when (s_tuileId2 /= "000000") else
                s_tuileId3 when (s_tuileId3 /= "000000") else
                s_tuileId4 when (s_tuileId4 /= "000000") else
                s_tuileId5 when (s_tuileId5 /= "000000") else
                s_tuileId6 when (s_tuileId6 /= "000000") else
                s_tuileId7 when (s_tuileId7 /= "000000") else
                s_tuileId8 when (s_tuileId8 /= "000000") else "000000";
  
  -- Signaux intermédiaires.
  s_offset_x <= i_offsetX;
  s_offset_y <= i_offsetY;
  o_tuile_id <= s_tuileId;
  o_tuile_x <= s_tuile_x;
  o_tuile_y <= s_tuile_y;
end Behavioral;
