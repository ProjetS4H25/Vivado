library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity actor is
  Port ( 
         clk           : in std_logic;
         reset         : in std_logic;
         i_initTuile   : in std_logic; -- flag to set tile IDs
         i_initPos     : in std_logic; -- flag to set the position
         i_tuileId1    : in std_logic_vector (5 downto 0); -- tile id 1
         i_tuileId2    : in std_logic_vector (5 downto 0); -- tile id 2
         i_globalX     : in std_logic_vector (8 downto 0); -- global x position
         i_globalY     : in std_logic_vector (8 downto 0); -- global y position
         i_moveOffsetX : in std_logic_vector (5 downto 0); -- x offset (sign-magnitude)
         i_moveOffsetY : in std_logic_vector (5 downto 0); -- y offset (sign-magnitude)
         i_moveEnable  : in std_logic; -- enable movement
         o_tuileX      : out std_logic_vector (2 downto 0); -- pixel x position within the tile
         o_tuileY      : out std_logic_vector (2 downto 0); -- pixel y position within the tile
         o_tuileId     : out std_logic_vector (5 downto 0)  -- tile id for the actor
  );
end actor;

architecture Behavioral of actor is

    -- registre d'etats
    signal tuileId1_reg : std_logic_vector (5 downto 0) := (others => '0');
    signal tuileId2_reg : std_logic_vector (5 downto 0) := (others => '0');
    signal currentPosX_reg : std_logic_vector (8 downto 0) := (others => '0');
    signal currentPosY_reg : std_logic_vector (8 downto 0) := (others => '0');
    
    -- signaux intermediaire
    signal s_newPosX  : std_logic_vector (8 downto 0);
    signal s_newPosY  : std_logic_vector (8 downto 0);
    signal s_diffX    : std_logic_vector (8 downto 0);
    signal s_diffY    : std_logic_vector (8 downto 0);

begin
    process(clk)
    begin
        if reset = '1' then
            tuileId1_reg  <= (others => '0');
            tuileId2_reg  <= (others => '0');
            currentPosX_reg   <= (others => '0');
            currentPosY_reg   <= (others => '0');
        elsif rising_edge(clk) then
            if i_initTuile = '1' then
                tuileId1_reg <= i_tuileId1;
                tuileId2_reg <= i_tuileId2;
            end if;
            currentPosX_reg <= s_newPosX;
            currentPosY_reg <= s_newPosY;
        end if;
    end process;
    
    -- etats
    process(i_initTuile, i_initPos, i_moveEnable, currentPosX_reg, currentPosY_reg, i_globalX, i_moveOffsetX, i_globalY, i_moveOffsetY)
    begin
        if i_initTuile = '1' then -- position ne change pas
            s_newPosX <= currentPosX_reg;
            s_newPosY <= currentPosY_reg;
        elsif i_initPos = '1' then -- set position
            s_newPosX <= i_globalX;
            s_newPosY <= i_globalY;
        elsif i_moveEnable = '1' then -- add le offset a la position actuel
            if i_moveOffsetX(5) = '0' then
                s_newPosX <= std_logic_vector(unsigned(currentPosX_reg) + resize(unsigned(i_moveOffsetX(4 downto 0)), 9));
            else
                s_newPosX <= std_logic_vector(unsigned(currentPosX_reg) - resize(unsigned(i_moveOffsetX(4 downto 0)), 9));
            end if;
            if i_moveOffsetY(5) = '0' then
                s_newPosY <= std_logic_vector(unsigned(currentPosY_reg) + resize(unsigned(i_moveOffsetY(4 downto 0)), 9));
            else
                s_newPosY <= std_logic_vector(unsigned(currentPosY_reg) - resize(unsigned(i_moveOffsetY(4 downto 0)), 9));
            end if;
        else -- position ne change pas
            s_newPosX <= currentPosX_reg;
            s_newPosY <= currentPosY_reg;
        end if;
    end process;
    
    -- output
    process(i_globalX, i_globalY, s_newPosX, s_newPosY, s_diffX, s_diffY, tuileId1_reg, tuileId2_reg)
    begin
    s_diffX <= std_logic_vector(unsigned(i_globalX) - unsigned(currentPosX_reg));
    s_diffY <= std_logic_vector(unsigned(i_globalY) - unsigned(currentPosY_reg));
        -- verifie si le pixel au coordonee i_globalX et i_globalY est dans les tuiles de l'acteur sinon output 0
        if (unsigned(i_globalY) >= unsigned(s_newPosY)) and (unsigned(i_globalY) < unsigned(s_newPosY) + 8) then
            if (unsigned(i_globalX) >= unsigned(s_newPosX)) and (unsigned(i_globalX) < unsigned(s_newPosX) + 8) then
                o_tuileX <= s_diffX(2 downto 0);
                o_tuileY <= s_diffY(2 downto 0);
                o_tuileId <= tuileId1_reg;
            elsif (unsigned(i_globalX) >= unsigned(s_newPosX) + 8) and (unsigned(i_globalX) < unsigned(s_newPosX) + 16) then
                o_tuileX <= s_diffX(2 downto 0);
                o_tuileY <= s_diffY(2 downto 0);
                o_tuileId <= tuileId2_reg;
            else
                o_tuileX <= (others => '0');
                o_tuileY <= (others => '0');
                o_tuileId <= (others => '0');
            end if;
        else
            o_tuileX <= (others => '0');
            o_tuileY <= (others => '0');
            o_tuileId <= (others => '0');
        end if;
    end process;

end Behavioral;
