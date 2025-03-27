----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2025 03:02:42 PM
-- Design Name: 
-- Module Name: Tuile_Buffer_Acteur - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tuile_Buffer_Acteur is
Port ( 
  -- du syst√®me
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
end Tuile_Buffer_Acteur;

architecture Behavioral of Tuile_Buffer_Acteur is

-- Tableau de tuile
-- chaque element de la matrice fait 5 bits
type t_tuile is array (0 to 7, 0 to 7) of std_logic_vector(4 downto 0); --  matrice 8√ó8 d‚Äôune tuile
type t_memory is array (0 to 63) of t_tuile; -- memorise la valeurs des tuiles

-- initier la valeur du tableaux
signal mem : t_memory := (
    -- Tuile 0 (on laisse par dÈfaut, par exemple, ‡ "00000" ou autre)
    0 => (others => (others => "00000")),  
    
    -- Acteur 1 partie 1 (auto mauve) partie arriere
    1 => (
     -- Ligne 0 : 
        0 => ("11111", "11111", "00000", "00000", "00000", "11111", "11111", "11111"),
        -- Ligne 1 : 
        1 => ("11111", "00100", "01001", "01001", "01100", "01100", "01100", "01100"),
        -- Ligne 2 : 
        2 => ("01100", "01100", "01001", "01001", "01001", "00111", "00111", "00111"),
        -- Ligne 3 : 
        3 => ("01101", "01101", "01101", "01001", "01001", "01101", "01101", "01101"),
        -- Ligne 4 : 
        4 => ("01101", "01101", "01101", "01001", "01001", "01101", "01101", "01101"),
        -- Ligne 5 :
        5 => ("01100", "01100", "01001", "01001", "01001", "00111", "00111", "00111"),
        -- Ligne 6 :
        6 => ("11111", "00100", "01001", "01001", "01100", "01100", "01100", "01100"),
        -- Ligne 7 : 
        7 => ("11111", "11111", "00000", "00000", "00000", "11111", "11111", "11111")
    ),
    
     -- Acteur 1 partie 2 (auto mauve) le devant
    2 => (
      -- Ligne 0 
        0 => ("11111", "11111", "11111", "00000", "00000", "00000", "11111", "11111"),
        -- Ligne 1 
        1 => ("01010", "01010", "01010", "01010", "01100", "01100", "01100", "00110"),
        -- Ligne 2 
        2 => ("01100", "01010", "01010", "01010", "01100", "01100", "01100", "01100"),
        -- Ligne 3 
        3 => ("01101", "01101", "01010", "01010", "01101", "01101", "01101", "01101"),
        -- Ligne 4 
        4 => ("01101", "01101", "01010", "01010", "01101", "01101", "01101", "01101"),
        -- Ligne 5 
        5 => ("01100", "01010", "01010", "01010", "01100", "01100", "01100", "01100"),
        -- Ligne 6 :
        6 => ("01010", "01010", "01010", "01010", "01100", "01100", "01100", "00110"),
        -- Ligne 7 :
        7 => ("11111", "11111", "11111", "00000", "00000", "00000", "11111", "11111")
    ),
    
        -- Acteur 2 partie 1 (tuile 1) auto verte arriËre
    3 => (
      -- Ligne 0 : 
      0 => ("11111", "11111", "00000", "00000", "00000", "11111", "11111", "11111"),
      -- Ligne 1 : 
      1 => ("11111", "00100", "01001", "01001", "01000", "01000", "01000", "01000"),
      -- Ligne 2 : 
      2 => ("01000", "01000", "01001", "01001", "01001", "00111", "00111", "00111"),
      -- Ligne 3 : 
      3 => ("00111", "00111", "00111", "01001", "01001", "00111", "00111", "00111"),
      -- Ligne 4 : 
      4 => ("00111", "00111", "00111", "01001", "01001", "00111", "00111", "00111"),
      -- Ligne 5 :
      5 => ("01000", "01000", "01001", "01001", "01001", "00111", "00111", "00111"),
      -- Ligne 6 :
      6 => ("11111", "00100", "01001", "01001", "01000", "01000", "01000", "01000"),
      -- Ligne 7 : 
      7 => ("11111", "11111", "00000", "00000", "00000", "11111", "11111", "11111")
    ),
    
    -- Acteur 2 partie 2 (tuile 2) auto verte avant
    4 => (
      -- Ligne 0 
      0 => ("11111", "11111", "11111", "00000", "00000", "00000", "11111", "11111"),
      -- Ligne 1 
      1 => ("01010", "01010", "01010", "01010", "01000", "01000", "01000", "00110"),
      -- Ligne 2 
      2 => ("01000", "01010", "01010", "01010", "01000", "01000", "01000", "01000"),
      -- Ligne 3 
      3 => ("00111", "00111", "01010", "01010", "00111", "00111", "00111", "00111"),
      -- Ligne 4 
      4 => ("00111", "00111", "01010", "01010", "00111", "00111", "00111", "00111"),
      -- Ligne 5 
      5 => ("01000", "01010", "01010", "01010", "01000", "01000", "01000", "01000"),
      -- Ligne 6 
      6 => ("01010", "01010", "01010", "01010", "01000", "01000", "01000", "00110"),
      -- Ligne 7 
      7 => ("11111", "11111", "11111", "00000", "00000", "00000", "11111", "11111")
    ),
    

    
    -- Les autres tuiles (2 ‡ 63) reste zÈro 
    others => (others => (others => "00000"))
  );

begin
-- ecriture si We_tuile = 1
--  on remplit la m√©moire des tuiles avec le controleurs, 
process(Clk)
  begin
    if rising_edge(Clk) then
      if We_tuile = '1' then
        mem(to_integer(unsigned(Ch_tuileId)))(
            to_integer(unsigned(Ch_Y)),
            to_integer(unsigned(Ch_X))
        ) <= Ch_CC;
      end if;
    end if;
  end process;

-- Prend la valeur dans la m√©moire de tuile et la retourne 
Code_Couleur <= mem(to_integer(unsigned(tuile_id)))(
                    to_integer(unsigned(tuile_Y)),
                    to_integer(unsigned(tuile_X))
                  );


end Behavioral;

