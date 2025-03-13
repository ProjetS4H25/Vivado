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

entity Tuile_Buffer is
  Port ( 
  -- du système
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
end Tuile_Buffer;

architecture Behavioral of Tuile_Buffer is

-- Tableau de tuile
-- chaque element de la matrice fait 5 bits
type t_tuile is array (0 to 7, 0 to 7) of std_logic_vector(4 downto 0); --  matrice 8×8 d’une tuile
type t_memory is array (0 to 63) of t_tuile; -- memorise la valeurs des tuiles

-- initier la valeur du tableaux
signal mem : t_memory := (others => (others => (others => (others => '0'))));

begin
-- ecriture si We_tuile = 1
--  on remplit la mémoire des tuiles avec le controleurs, 
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

-- Prend la valeur dans la mémoire de tuile et la retourne 
Code_Couleur <= mem(to_integer(unsigned(tuile_id)))(
                    to_integer(unsigned(tuile_Y)),
                    to_integer(unsigned(tuile_X))
                  );


end Behavioral;