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

entity controleur_tb is
--  Port ( );
end controleur_tb;

architecture Behavioral of controleur_tb is


component Controleur
    PORT (
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
end component;


-- l'horloge devrait être 50 MHz
   signal   d_clk_p       :  std_logic := '0';   -- (sol) horloge principale 50 MHz (utile pour cette simulation a éviter si possible)

   
   signal s_op : std_logic_vector(5 downto 0);
   signal o_dataValid : std_logic;
   signal o_we_viewport : std_logic;
   signal o_we_backBuffer : std_logic;
   signal o_we_backTuileBuff : std_logic;
   signal o_we_acteurTuileBuff : std_logic;
   signal o_we_chPosActeur : std_logic;
   signal o_we_acteurTuile : std_logic;

   signal o_we_colorConverter : std_logic;

   signal o_we_reset : std_logic;


   constant c_clk_p_Period      : time :=  20 ns;  -- 50 MHz  -- frequence de l'horloge utilisee pour module_commande dans la problématique
   constant c_delai_commandes   : time :=  10 us;  -- delai entre commandes du bouton
   CONSTANT PERIOD    : time := 10 ns;
   
begin

   ----------------------------------------------------------------------------
   -- unites objets du test  
   ----------------------------------------------------------------------------
     
 UUT: Controleur
 Port map
    (       
      i_opcode => s_op,
      
      o_dataValid => o_dataValid,
      o_we_viewport => o_we_viewport,
      o_we_backBuffer => o_we_backBuffer,
      o_we_backTuileBuff => o_we_backTuileBuff,
      o_we_acteurTuileBuff => o_we_acteurTuileBuff,
      o_we_chPosActeur => o_we_chPosActeur,
      o_we_acteurTuile => o_we_acteurTuile,
      o_we_colorConverter => o_we_colorConverter,
      o_we_reset => o_we_reset,
      clk => d_clk_p
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
      wait for PERIOD; s_op <="000001";

      wait for PERIOD; s_op <="000010";

      wait for PERIOD; s_op <="000100";

      wait for PERIOD; s_op <="001000";

      wait for PERIOD; s_op <="010000";

      wait for PERIOD; s_op <="100000";

      wait for PERIOD; s_op <="100001";

      wait for PERIOD; s_op <="111111";

      
      WAIT; -- will wait forever
   END PROCESS;
end Behavioral;