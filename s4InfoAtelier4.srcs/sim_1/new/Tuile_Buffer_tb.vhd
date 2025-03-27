----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:22:58 AM
-- Design Name: 
-- Module Name: Tuile_Buffer_tb - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tuile_Buffer_tb is
--  Port ( );
end Tuile_Buffer_tb;

architecture Behavioral of Tuile_Buffer_tb is
component Tuile_Buffer is
  Port ( 
  Clk: in std_logic ;

  -- du controleur
  Ch_tuileId: in std_logic_vector (5 downto 0);
  Ch_X: in std_logic_vector (2 downto 0);
  Ch_Y: in std_logic_vector (2 downto 0);
  Ch_CC: in std_logic_vector (4 downto 0);
  We_tuile: in std_logic;

  -- Du background
  tuile_id: in std_logic_vector (5 downto 0);
  tuile_X: in std_logic_vector (2 downto 0);
  tuile_Y: in std_logic_vector (2 downto 0);

  -- Sortie
  Code_Couleur: out std_logic_vector(4 downto 0)
  );
end component;

------------------------------------------------------------------
  -- Signaux internes pour le banc de test
  ------------------------------------------------------------------
  signal Clk_tb           : std_logic := '0';
  
  -- Signaux pour l'écriture
  signal Ch_tuileId_tb    : std_logic_vector(5 downto 0) := (others => '0');
  signal Ch_X_tb          : std_logic_vector(2 downto 0) := (others => '0');
  signal Ch_Y_tb          : std_logic_vector(2 downto 0) := (others => '0');
  signal Ch_CC_tb         : std_logic_vector(4 downto 0) := (others => '0');
  signal We_tuile_tb      : std_logic := '0';

  -- Signaux pour la lecture
  signal tuile_id_tb      : std_logic_vector(5 downto 0) := (others => '0');
  signal tuile_X_tb       : std_logic_vector(2 downto 0) := (others => '0');
  signal tuile_Y_tb       : std_logic_vector(2 downto 0) := (others => '0');

  -- Sortie observée
  signal Code_Couleur_tb  : std_logic_vector(4 downto 0);

begin

 ------------------------------------------------------------------
  -- Instanciation du composant sous test (UUT)
  ------------------------------------------------------------------
  UUT : Tuile_Buffer
    port map(
      Clk         => Clk_tb,
      
      -- Ecriture
      Ch_tuileId  => Ch_tuileId_tb,
      Ch_X        => Ch_X_tb,
      Ch_Y        => Ch_Y_tb,
      Ch_CC       => Ch_CC_tb,
      We_tuile    => We_tuile_tb,

      -- Lecture
      tuile_id    => tuile_id_tb,
      tuile_X     => tuile_X_tb,
      tuile_Y     => tuile_Y_tb,

      -- Sortie
      Code_Couleur => Code_Couleur_tb
    );
    
    ------------------------------------------------------------------
  -- Génération de l'horloge (période = 20 ns)
  ------------------------------------------------------------------
  Clk_process : process
  begin
    Clk_tb <= '0';
    wait for 10 ns;
    Clk_tb <= '1';
    wait for 10 ns;
  end process Clk_process;

  ------------------------------------------------------------------
  -- Processus de test
  ------------------------------------------------------------------
  StimulusProcess : process
    variable colorVal : integer;
    -- On réserve 64 pixels, donc on peut se permettre un string un peu grand :
    variable ligneStr : string(1 to 256);
    variable pos      : integer := 1;
  begin
    -- Attendre un peu au démarrage
    wait for 50 ns;

    --------------------------------------------------------------
    -- (Optionnel) Exemple : On écrit la couleur 6 dans tuile_id=1 
    --                       à (X=3, Y=4), comme démonstration
    --------------------------------------------------------------
    Ch_tuileId_tb <= "000010";  -- =1
    Ch_X_tb       <= "011";     -- =3
    Ch_Y_tb       <= "100";     -- =4
    Ch_CC_tb      <= "00110";   -- =6
    We_tuile_tb   <= '1';
    wait for 20 ns;
    We_tuile_tb   <= '0';
    wait for 20 ns;

    --------------------------------------------------------------
    -- Lecture de la tuile 1 pixel par pixel, 
    -- affichage de chaque ligne dans un seul report
    --------------------------------------------------------------
    tuile_id_tb <= "000001"; -- On fixe l'ID de la tuile qu'on veut afficher

    for row in 0 to 7 loop
      -- On réinitialise la variable ligneStr pour cette ligne
      ligneStr := (others => ' ');  
      pos := 1;  -- position d'écriture dans ligneStr

      for col in 0 to 7 loop
        -- On sélectionne le pixel (X=col, Y=row)
        tuile_X_tb <= std_logic_vector(to_unsigned(col, 3));
        tuile_Y_tb <= std_logic_vector(to_unsigned(row, 3));

        -- Attente pour que la lecture se stabilise
        wait for 10 ns;
        
        -- Convertit le code couleur en entier
        colorVal := to_integer(unsigned(Code_Couleur_tb));
        
        -- On ajoute dans la ligne de texte, par exemple :
        -- " 6" ou " 2" etc.
        -- Pour simplifier, on va juste faire un "report" par pixel,
        -- ou assembler via integer'image.
        -- Ici, on met un espace + la valeur
        for i in integer'image(colorVal)'range loop
          ligneStr(pos) := integer'image(colorVal)(i);
          pos := pos + 1;
        end loop;

        -- On ajoute un espace de séparation
        ligneStr(pos) := ' ';
        pos := pos + 1;
      end loop;
      
      -- Afficher la ligne
      report "Ligne " & integer'image(row) & " => " & ligneStr(1 to pos-1);
      wait for 10 ns;
    end loop;

    report ">> Fin du test." severity note;
    wait;
  end process StimulusProcess;

end Behavioral;