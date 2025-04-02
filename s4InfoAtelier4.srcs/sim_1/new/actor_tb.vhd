library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_actor is
  -- Test bench has no ports
end tb_actor;

architecture sim of tb_actor is

    component actor is
      Port ( 
         clk           : in  std_logic;
         reset         : in  std_logic;
         i_initTuile   : in  std_logic;
         i_initPos     : in  std_logic;
         i_tuileId1    : in  std_logic_vector (5 downto 0);
         i_tuileId2    : in  std_logic_vector (5 downto 0);
         i_globalX     : in  std_logic_vector (8 downto 0);
         i_globalY     : in  std_logic_vector (8 downto 0);
         i_moveOffsetX : in  std_logic_vector (5 downto 0);
         i_moveOffsetY : in  std_logic_vector (5 downto 0);
         i_moveEnable  : in  std_logic;
         o_tuileX      : out std_logic_vector (2 downto 0);
         o_tuileY      : out std_logic_vector (2 downto 0);
         o_tuileId     : out std_logic_vector (5 downto 0)
      );
    end component;

    signal clk           : std_logic := '0';
    signal reset         : std_logic := '0';
    signal i_initTuile   : std_logic := '0';
    signal i_initPos     : std_logic := '0';
    signal i_tuileId1    : std_logic_vector (5 downto 0) := (others => '0');
    signal i_tuileId2    : std_logic_vector (5 downto 0) := (others => '0');
    signal i_globalX     : std_logic_vector (8 downto 0) := (others => '0');
    signal i_globalY     : std_logic_vector (8 downto 0) := (others => '0');
    signal i_moveOffsetX : std_logic_vector (5 downto 0) := (others => '0');
    signal i_moveOffsetY : std_logic_vector (5 downto 0) := (others => '0');
    signal i_moveEnable  : std_logic := '0';
    signal o_tuileX      : std_logic_vector (2 downto 0);
    signal o_tuileY      : std_logic_vector (2 downto 0);
    signal o_tuileId     : std_logic_vector (5 downto 0);

begin

    -- Instantiate the UUT
    UUT: actor
        port map (
            clk           => clk,
            reset         => reset,
            i_initTuile   => i_initTuile,
            i_initPos     => i_initPos,
            i_tuileId1    => i_tuileId1,
            i_tuileId2    => i_tuileId2,
            i_globalX     => i_globalX,
            i_globalY     => i_globalY,
            i_moveOffsetX => i_moveOffsetX,
            i_moveOffsetY => i_moveOffsetY,
            i_moveEnable  => i_moveEnable,
            o_tuileX      => o_tuileX,
            o_tuileY      => o_tuileY,
            o_tuileId     => o_tuileId
        );
        
    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
    -- Stimulus process (using sign-magnitude offsets)
    stim_proc: process
      variable x_val: integer;
      variable y_val: integer;
    begin
        -- Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Initialize tile IDs
        i_initTuile <= '1';
        i_tuileId1 <= "001010";  -- 10
        i_tuileId2 <= "010101";  -- 21
        wait for 20 ns;
        i_initTuile <= '0';
        wait for 20 ns;

        -- Set actor position to (40,20)
        i_initPos <= '1';
        i_globalX <= "000101000"; -- 40
        i_globalY <= "000010100"; -- 20
        wait for 20 ns;
        i_initPos <= '0';
        wait for 20 ns;

        -- positive move
        i_moveEnable  <= '1';
        i_moveOffsetX <= "000011";  -- 3
        i_moveOffsetY <= "000010";  -- 2
        wait for 20 ns;
        i_moveEnable  <= '0';
        wait for 20 ns;

        -- negative move:
        i_moveEnable  <= '1';
        i_moveOffsetX <= "100011";  -- -3
        i_moveOffsetY <= "100010";  -- -2
        wait for 20 ns;
        i_moveEnable  <= '0';
        wait for 20 ns;
        
--        -- negative move:
--        i_moveEnable  <= '1';
--        i_moveOffsetX <= "100011";  -- -3
--        i_moveOffsetY <= "100010";  -- -2
--        wait for 20 ns;
--        i_moveEnable  <= '0';
--        wait for 20 ns;

        -- region attendu de l'acteur
        -- currentPosX_reg(40) a currentPosX_reg+15, currentPosY_reg(20) a currentPosY_reg+7.
        for y_val in 20 to 27 loop
            for x_val in 40 to 55 loop
                i_globalX <= std_logic_vector(to_unsigned(x_val, 9));
                i_globalY <= std_logic_vector(to_unsigned(y_val, 9));
                wait for 10 ns;
            end loop;
        end loop;
        
        wait for 20 ns;
        
        -- Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        
        wait;
    end process stim_proc;

end sim;
