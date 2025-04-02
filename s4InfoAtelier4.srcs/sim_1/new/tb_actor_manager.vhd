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
        reset:      in std_logic;
        clk:        in std_logic;
        i_moveEnable: in std_logic; -- flag pour bouger avec un delta
        i_initPosition:   in std_logic; -- flag pour set la position/tuile id
        i_initTuile:      in std_logic; -- flag pour set la position/tuile id
        i_tuileId:    in std_logic_vector(11 downto 0); -- les deux tuiles dans un signal
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
   
    signal s_moveEnable:    std_logic := '0';
    signal s_initPosition:  std_logic := '0';
    signal s_initTuile:     std_logic := '0';
    signal s_tuileId:       std_logic_vector(11 downto 0):= (others => '0');
    signal s_tuile_X:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_tuile_y:       std_logic_vector(2 downto 0) := (others => '0');
    signal s_offset_x:      std_logic_vector(5 downto 0) := (others => '0');
    signal s_offset_y:      std_logic_vector(5 downto 0) := (others => '0');
    signal s_positionX:     std_logic_vector(9 downto 0) := (others => '0');
    signal s_positionY:     std_logic_vector(9 downto 0) := (others => '0');
    signal s_actor_id:      std_logic_vector(3 downto 0) := (others => '0');
   
begin

   ----------------------------------------------------------------------------
   -- unites objets du test  
   ----------------------------------------------------------------------------
     
 UUT: actor_manager
 Port map
    (     
      reset             => d_reset,  
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
        variable x : integer := 0;
        variable y : integer := 0;
   BEGIN      

        -- Set la position initiale du viewport
        s_glbX <="0000000000"; 
        s_glbY <="0000000000";
        wait for PERIOD; 
      
        -- initialiser l'acteur
        s_initTuile  <= '1';
        s_actor_id    <= "0000"; 
        s_tuileId     <= "101010010101"; -- deux tuiles dans ce signal
        wait for PERIOD; 
        s_initTuile  <= '0';
      
        -- déplacer le viewport en y de 0 à 8 en incrément de 1
        for y in 0 to 8 loop
            s_glbY <= std_logic_vector(to_unsigned(y, 10));
            wait for PERIOD;
        end loop;
        
        -- remettre le viewport à y=0
        s_glbY <= (others => '0');
        wait for PERIOD;
        
        -- déplacer le viewport en x de 0 à 16 en incrément de 1
        for x in 0 to 16 loop
            s_glbX <= std_logic_vector(to_unsigned(x, 10));
            wait for PERIOD;
        end loop;
        -- remettre le viewport à x=0
        s_glbX <= (others => '0');
        wait for PERIOD;
        
        -- set la position de l'acteur à (x, y)= (128, 256)
        s_initPosition <= '1';
        s_positionX <= std_logic_vector(to_unsigned(128, 10));
        s_positionY <= std_logic_vector(to_unsigned(256, 10));
        wait for period;
        s_initPosition <= '0';
        wait for period;
        
        -- reset la position de l'acteur à (0, 0)
        s_initPosition <= '1';
        s_positionX <= (others => '0');
        s_positionY <= (others => '0');
        wait for period;
        s_initPosition <= '0';
        wait for period;
        
        -- Mettre le viewport dans le coins de l'acteur (16, 8)
        s_glbY <= std_logic_vector(to_unsigned(8, 10));
        s_glbx <= std_logic_vector(to_unsigned(16, 10));
        wait for PERIOD;
        
        -- Déplacer l'acteur en diagonal 
        -- Le output de la position dans la tuile devrait baisser jusqu'à ce que 
        -- le premier pixel de la tuile soit à (16, 8)
        s_moveEnable <= '1';
        wait for period;
        for x in 0 to 15 loop
            s_offset_x <= "000001";
            s_offset_y <= "000001";
            wait for PERIOD;
        end loop;
        
        -- Déplacer l'acteur de x=16 à x=0 en incrément de 1
        for x in 0 to 15 loop
            s_offset_x <= "100001";
            s_offset_y <= "000000";
            wait for PERIOD;
        end loop;
        
        -- Déplacer l'acteur de y=8 à y=0 par incréments de 1
        for y in 0 to 8 loop
            s_offset_x <= "000000";
            s_offset_y <= "100001";
            wait for PERIOD;
        end loop;
        
        s_moveEnable <= '0';

        wait for PERIOD;
        wait for PERIOD;
        wait for PERIOD;
        wait for PERIOD;
        wait for PERIOD;
        
 end process;
 
end Behavioral;