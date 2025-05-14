library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_counter is
--  Port ( );
end tb_counter;

architecture Behavioral of tb_counter is
    signal enable_s : std_logic := '0';
    signal rst_s : std_logic := '0';
    signal clk_s : std_logic := '0';
    signal tick_s : std_logic := '0';

    component counter is
        generic (N: integer := 0);
        Port ( 
            enable : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            tick : out std_logic
        );
    end component;

    begin
        inst_counter : counter generic map (8) port map (
            enable => enable_s,
            rst => rst_s,
            clk => clk_s,
            tick => tick_s        
        );
        
        proc_clk_s : process
            begin
                clk_s <= not clk_s;
                wait for 10 ns;
        end process;
        
        proc_signals : process
            begin
                enable_s <= '1';
                rst_s <= '0';
                wait for 100 ns;
                enable_s <= '1';
                rst_s <= '1';
                wait for 10 ns;
                enable_s <= '0';
                rst_s <= '0';
                wait for 20 ns;
                enable_s <= '1';
                rst_s <= '0';
                wait for 100 ns;
                wait;
        end process;




end Behavioral;
