library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_UART_controller is
--  Port ( );
end tb_UART_controller;

architecture Behavioral of tb_UART_controller is
    signal tick_counter_baud_s : std_logic := '0';
    signal tick_counter_8_s : std_logic := '0';
    signal enable_s : std_logic := '0';
    signal lsb_s : std_logic := '0';
    signal rst_s : std_logic := '0';
    signal clk_s : std_logic := '0';
    signal TXD_s : std_logic := '0';
    signal l_s_s : std_logic := '0';
    signal enable_counter_baud_s : std_logic := '0';
    signal enable_counter_8_s : std_logic := '0';
    signal enable_register_s : std_logic := '0';
    
    component UART_controller is
        Port ( 
            tick_counter_baud : in std_logic;
            tick_counter_8 : in std_logic;
            enable : in std_logic;
            lsb : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            TXD : out std_logic;
            l_s : out std_logic;
            enable_counter_baud : out std_logic;
            enable_counter_8 : out std_logic;
            enable_register : out std_logic        
        );
    end component;

    begin
    
        inst_UART_controller : UART_controller port map (
            tick_counter_baud => tick_counter_baud_s,
            tick_counter_8 => tick_counter_8_s,
            enable => enable_s,
            lsb => lsb_s,
            rst => rst_s,
            clk => clk_s,
            TXD => TXD_s,
            l_s => l_s_s,
            enable_counter_baud => enable_counter_baud_s,
            enable_counter_8 => enable_counter_8_s,
            enable_register => enable_register_s  
        );
        
        proc_clk_s : process
            begin
                clk_s <= not clk_s;
                wait for 10 ns;
        end process;
        
        proc_signals : process
            begin
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '1';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 15 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '1';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '1';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '1';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '1';
                tick_counter_8_s <= '1';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '1';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '0';
                wait for 10 ns;
                tick_counter_baud_s <= '0';
                tick_counter_8_s <= '0';
                enable_s <= '0';
                lsb_s <= '0';
                rst_s <= '1';
                wait for 10 ns;
                wait;
        end process;


end Behavioral;
