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
end Tuile_Buffer;

architecture Behavioral of Tuile_Buffer is

-- Tableau de tuile
-- chaque element de la matrice fait 5 bits
type t_tuile is array (0 to 7, 0 to 7) of std_logic_vector(4 downto 0); --  matrice 8√ó8 d‚Äôune tuile
type t_memory is array (0 to 63) of t_tuile; -- memorise la valeurs des tuiles

-- initier la valeur du tableaux
signal mem : t_memory := (
    -- Tuile 0 (on laisse par dÈfaut, par exemple, ‡ "00000" ou autre)
    0 => (others => (others => "00000")),  
    
    -- Tuile 1 : Route, seulement gris du index 1, #434343
    1 => (
      -- Ligne 0
      0 => (others => "00001"),  -- "00010" = 2 en binaire sur 5 bits
      -- Ligne 1
      1 => (others => "00001"),
      -- Ligne 2
      2 => (others => "00001"),
      -- Ligne 3 (jaune)
      3 => (others => "00101"),  -- "00110" = 6 en binaire sur 5 bits
      -- Ligne 4 (jaune)
      4 => (others => "00001"),
      -- Ligne 5
      5 => (others => "00001"),
      -- Ligne 6
      6 => (others => "00001"),
      -- Ligne 7
      7 => (others => "00001")
    ),
    
    -- Tuile 2 :trotoir
    2 => (
      -- Ligne 0
      0 => (others => "00101"),  -- gris pale
      -- Ligne 1
      1 => (others => "00101"),  -- gris pale
      -- Ligne 2
      2 => (others => "00101"),  -- gris pale
      -- Ligne 3 
      3 => (others => "00101"),  -- gris pale
     -- Ligne 4 
      4 => (others => "00101"),  -- gris pale
      -- Ligne 5
      5 => (others => "00101"),  -- gris pale
      -- Ligne 6
      6 => (others => "00101"),  -- gris pale
      -- Ligne 7
      7 => (others => "00101")  -- gris pale
    ),
    
     -- Tuile 4 : Route avec ligne blanche index 5
    3 => (
      -- Ligne 0
      0 => (others => "00001"),  
      -- Ligne 1
      1 => (others => "00001"),  
      -- Ligne 2
      2 => (others => "11111"),  -- blanc
      -- Ligne 3 
      3 => (others => "11111"),  -- blanc
      -- Ligne 4 
      4 => (others => "11111"),  -- blanc
      -- Ligne 5
      5 => (others => "11111"),  -- blanc
      -- Ligne 6
      6 => (others => "00001"),  
      -- Ligne 7
      7 => (others => "00001")   
    ),
    
    -- Tuile 5 : Gazon avec deux vert diffÈrent
    4 => (
        -- Ligne 0 : un pixel foncÈ (colonne 0), le reste p‚le
        0 => ("01000", "00111", "00111", "00111", "00111", "00111", "00111", "00111"),
        -- Ligne 1 : tout p‚le
        1 => (others => "00111"),
        -- Ligne 2 : un pixel foncÈ (colonne 2), le reste p‚le
        2 => ("00111", "00111", "01000", "00111", "00111", "00111", "00111", "00111"),
        -- Ligne 3 : tout p‚le
        3 => (others => "00111"),
        -- Ligne 4 : un pixel foncÈ (colonne 4), le reste p‚le
        4 => ("00111", "00111", "00111", "00111", "01000", "00111", "00111", "00111"),
        -- Ligne 5 : tout p‚le
        5 => (others => "00111"),
        -- Ligne 6 : un pixel foncÈ (colonne 6), le reste p‚le
        6 => ("00111", "00111", "00111", "00111", "00111", "00111", "01000", "00111"),
        -- Ligne 7 : un pixel foncÈ (colonne 1), le reste p‚le
        7 => ("00111", "01000", "00111", "00111", "00111", "00111", "00111", "00111")
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