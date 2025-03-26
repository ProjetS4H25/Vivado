library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_actor_manager is
--  Port ( );
end tb_actor_manager;

architecture Behavioral of tb_actor_manager is


component actor_manager
    PORT (
        clk:        in std_logic;
        i_moveEnable: in std_logic; -- flag pour bouger avec un delta
        i_initPosition:   in std_logic; -- flag pour set la position/tuile id
        i_initTuile:      in std_logic; -- flag pour set la position/tuile id
        i_tuileId:  in std_logic_vector(11 downto 0); -- les deux tuiles dans un signal
        i_globalX:    in std_logic_vector(9 downto 0);
        i_globalY:    in std_logic_vector(9 downto 0);
        i_offsetX:    in std_logic_vector(5 downto 0);
        i_offsetY:    in std_logic_vector(5 downto 0);
        i_positionX:  in std_logic_vector(5 downto 0);
        i_positionY:  in std_logic_vector(5 downto 0);
        i_actor_id:   in std_logic_vector(3 downto 0);
        o_tuile_id:   out std_logic_vector(5 downto 0);
        o_tuile_X:    out std_logic_vector(2 downto 0);
        o_tuile_Y:    out std_logic_vector(2 downto 0)
          );
end component;


-- l'horloge devrait être 50 MHz
   signal   d_clk_p       :  std_logic := '0';   -- (sol) horloge principale 50 MHz (utile pour cette simulation a éviter si possible)
   signal   d_reset       :  std_logic := '0';
   signal   s_glbX : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
   signal   s_glbY : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
   signal   o_tuileId : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
   signal   o_tuileX : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
   signal   o_tuileY : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');

   -- signal test pour vérification
   signal expected_status_code    : std_logic_vector (1 downto 0);

   constant c_clk_p_Period      : time :=  20 ns;  -- 50 MHz  -- frequence de l'horloge utilisee pour module_commande dans la problématique
   constant c_delai_commandes   : time :=  10 us;  -- delai entre commandes du bouton
   CONSTANT PERIOD    : time := 10 ns;
   
    signal s_moveEnable:    std_logic;
    signal s_initPosition:  std_logic;
    signal s_initTuile:     std_logic;
    signal s_tuileId:       std_logic_vector(11 downto 0) := (others => '0');
    signal s_tuile_X:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuile_y:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_offset_x:      std_logic_vector(5 downto 0) := (others => '0');
    signal s_offset_y:      std_logic_vector(5 downto 0) := (others => '0');
    signal s_positionX:     std_logic_vector(5 downto 0) := (others => '0');
    signal s_positionY:     std_logic_vector(5 downto 0) := (others => '0');
    signal s_actor_id:      std_logic_vector(3 downto 0) := (others => '0');
   
begin

   ----------------------------------------------------------------------------
   -- unites objets du test  
   ----------------------------------------------------------------------------
     
 UUT: actor_manager
 Port map
    (       
      clk               => d_clk_p,
      i_globalX         => s_glbX,
      i_globalY         => s_glbY,
      i_moveEnable      => s_moveEnable,
      i_initPosition    => s_initPosition,
      i_initTuile       => s_initTuile,
      i_tuileId         => s_tuileId,
      i_offsetX         => s_offset_x,
      i_offsetY         => s_offset_y,
      i_positionX       => s_positionX,
      i_positionY       => s_positionY,
      i_actor_id        => s_actor_id,
      o_tuile_id        => o_tuileId,
      o_tuile_X         => o_tuileX,
      o_tuile_Y         => o_tuileY
  );

   ----------------------------------------------------------------------------
   -- generation horloge  
   ----------------------------------------------------------------------------
   
  sim_clk_p:  process
   begin
      d_clk_p <= '1';  -- init
      loop
         wait for c_clk_p_Period / 2;
         d_clk_p <= not d_clk_p; -- invert clock value
      end loop;
   end process;  

tb : PROCESS
   BEGIN      
      wait for PERIOD; s_glbX <="0000000000"; s_glbY <="0000000000";
      wait for PERIOD; wait for PERIOD; 
      
      wait for PERIOD; s_glbX <="0000010000"; s_glbX <="0000010000"; s_positionX <= "0000010000"; s_positionY <= "0000010000"; s_initPosition <= '1';
      wait for PERIOD; wait for PERIOD; 
      
      WAIT; -- will wait forever
 end process;
 
end Behavioral;