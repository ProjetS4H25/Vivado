---------------------------------------------------------------------------------------------
-- Test-Bench background_buffer_tb.vhd
--  
---------------------------------------------------------------------------------------------
-- Projet de session S4 - GI
-- Version         : 1.0
-- Date            : 10 mars 2025
-- Auteur(s)       : Jordan Charette
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--
-- Outils          : vivado 2020.2
---------------------------------------------------------------------------------------------
-- Description:
-- Developpement d'un test bench pour le background_buffer
---------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity background_buffer_tb is
--  Port ( );
end background_buffer_tb;

architecture Behavioral of background_buffer_tb is


component background_buffer
    PORT (
           i_globalX : in STD_LOGIC_VECTOR (9 downto 0);
           i_globalY : in STD_LOGIC_VECTOR (9 downto 0);
           
           -- Valeur input pour changer un tuile id dans le background 
           i_ch_X : in STD_LOGIC_VECTOR (9 downto 0);
           i_ch_Y : in STD_LOGIC_VECTOR (9 downto 0);
           i_ch_tuile_id : in STD_LOGIC_VECTOR (5 downto 0);
           i_we_bck : in STD_LOGIC;
           clk : in STD_LOGIC;
           
           -- Output vers le tuile buffer
           o_tuileId : out STD_LOGIC_VECTOR (5 downto 0);
           o_tuileX : out STD_LOGIC_VECTOR (2 downto 0);
           o_tuileY : out STD_LOGIC_VECTOR (2 downto 0)
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
   
   signal   s_ch_X : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
   signal   s_ch_Y : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
   signal   s_we_ch : std_logic := '0';
   signal   s_tuileId_ch : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
   
   -- signal test pour vérification
   signal expected_status_code    : std_logic_vector (1 downto 0);

   constant c_clk_p_Period      : time :=  20 ns;  -- 50 MHz  -- frequence de l'horloge utilisee pour module_commande dans la problématique
   constant c_delai_commandes   : time :=  10 us;  -- delai entre commandes du bouton
   CONSTANT PERIOD    : time := 10 ns;
   
begin

   ----------------------------------------------------------------------------
   -- unites objets du test  
   ----------------------------------------------------------------------------
     
 UUT: Background_Buffer
 Port map
    (       
      i_globalX => s_glbX,
      i_globalY => s_glbY,
       
      i_ch_X => s_ch_X,
      i_ch_Y => s_ch_Y,
      i_ch_tuile_id => s_tuileId_ch,
      i_we_bck =>  s_we_ch,
      clk =>  d_clk_p,
       
       -- Output vers le tuile buffer
      o_tuileId => o_tuileId,
      o_tuileX => o_tuileX,
      o_tuileY => o_tuileY
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
   
      -- Ajouter une valeur à la première tuile
      wait for PERIOD; s_ch_X <="0000000000"; s_ch_Y <="0000000000"; s_tuileId_ch <="000011"; s_we_ch <='1';
      wait for PERIOD; wait for PERIOD; s_we_ch <='0';
      
      -- Ajouter une valeur à la dernière tuile
      wait for PERIOD; s_ch_X <="1111111111"; s_ch_Y <="1111111111"; s_tuileId_ch <="010011"; s_we_ch <='1';
      wait for PERIOD; wait for PERIOD; s_we_ch <='0';
      
      -- Première tuile juste la première ligne
      wait for PERIOD; s_glbX <="0000000000"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000001"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000010"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000011"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000100"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000101"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000110"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000111"; s_glbY <="0000000000";
      
      -- Diagonale dans la première tuile
      wait for PERIOD; s_glbX <="0000000000"; s_glbY <="0000000000";
      wait for PERIOD; s_glbX <="0000000001"; s_glbY <="0000000001";
      wait for PERIOD; s_glbX <="0000000010"; s_glbY <="0000000010";
      wait for PERIOD; s_glbX <="0000000011"; s_glbY <="0000000011";
      wait for PERIOD; s_glbX <="0000000100"; s_glbY <="0000000100";
      wait for PERIOD; s_glbX <="0000000101"; s_glbY <="0000000101";
      wait for PERIOD; s_glbX <="0000000110"; s_glbY <="0000000110";
      wait for PERIOD; s_glbX <="0000000111"; s_glbY <="0000000111";
      
      -- Dernière tuile, dernière ligne
      wait for PERIOD; s_glbX <="1111111111"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111110"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111101"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111100"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111011"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111010"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111001"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111000"; s_glbY <="1111111111";
      
      -- Juste 1 tuile avant
      wait for PERIOD; s_glbX <="1111110111"; s_glbY <="1111111111";
      
      -- Diagonale dans la dernière tuile
      wait for PERIOD; s_glbX <="1111111111"; s_glbY <="1111111111";
      wait for PERIOD; s_glbX <="1111111110"; s_glbY <="1111111110";
      wait for PERIOD; s_glbX <="1111111101"; s_glbY <="1111111101";
      wait for PERIOD; s_glbX <="1111111100"; s_glbY <="1111111100";
      wait for PERIOD; s_glbX <="1111111011"; s_glbY <="1111111011";
      wait for PERIOD; s_glbX <="1111111010"; s_glbY <="1111111010";
      wait for PERIOD; s_glbX <="1111111001"; s_glbY <="1111111001";
      wait for PERIOD; s_glbX <="1111111000"; s_glbY <="1111111000";
      
      -- Modifier la tuile que l'on essaie de lire pour voir si le buffer est OK
      wait for PERIOD; s_ch_X <="1000000000"; s_ch_Y <="1000000000"; s_tuileId_ch <="000001"; s_we_ch <='1';
      wait for PERIOD; wait for PERIOD; s_we_ch <='0';
      
      -- Tuile du milieu, première ligne
      wait for PERIOD; s_glbX <="1000000000"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000001"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000010"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000011"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000100"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000101"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000110"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000111"; s_glbY <="1000000000";
      
      -- Juste 1 tuile après
      wait for PERIOD; s_glbX <="1000001000"; s_glbY <="1000000000";
      
      -- Diagonale dans la tuile du milieu
      wait for PERIOD; s_glbX <="1000000000"; s_glbY <="1000000000";
      wait for PERIOD; s_glbX <="1000000001"; s_glbY <="1000000001";
      wait for PERIOD; s_glbX <="1000000010"; s_glbY <="1000000010";
      wait for PERIOD; s_glbX <="1000000011"; s_glbY <="1000000011";
      wait for PERIOD; s_glbX <="1000000100"; s_glbY <="1000000100";
      wait for PERIOD; s_glbX <="1000000101"; s_glbY <="1000000101";
      wait for PERIOD; s_glbX <="1000000110"; s_glbY <="1000000110";
      wait for PERIOD; s_glbX <="1000000111"; s_glbY <="1000000111";
      
      -- Lire la valeur de la dernière tuile pour voir si la modification est OK
      wait for PERIOD; s_glbX <="1111111111"; s_glbY <="1111111111";
      
      -- Lire la première tuile pour voir si le changement de tuile à fonctionné
      wait for PERIOD; s_glbX <="0000000000"; s_glbY <="0000000000";
      
      WAIT; -- will wait forever
   END PROCESS;
end Behavioral;