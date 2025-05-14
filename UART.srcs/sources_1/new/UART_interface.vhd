library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_interface is
    Port ( 
        enable : in std_logic;
        clk : in std_logic;
        TXD : out std_logic
    );
end UART_interface;

architecture Behavioral of UART_interface is
    signal rst_s : std_logic := '0';
    signal data_s : std_logic_vector(7 downto 0) := "11000001";
    
    signal l_s_s : std_logic;
    signal lsb_s : std_logic;
    signal enable_register_s : std_logic;
    signal enable_counter_8_s : std_logic;
    signal enable_counter_baud_s : std_logic;
    signal tick_counter_baud_s : std_logic;
    signal tick_counter_8_s : std_logic;
    
    component shift_register is
        Port (
            data : in std_logic_vector(7 downto 0);
            l_s : in std_logic;
            enable : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            lsb : out std_logic
        );
    end component;
    
    component counter is
        generic (N: integer := 0);
        Port ( 
            enable : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            tick : out std_logic
        );
    end component;
    
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
        inst_shift_register : shift_register port map (
            data => data_s,
            l_s => l_s_s,
            enable => enable_register_s,
            rst => rst_s,
            clk => clk,
            lsb => lsb_s
        );
        
        inst_counter_8 : counter generic map (8) port map (
            enable => enable_counter_8_s,
            rst => rst_s,
            clk => clk,
            tick => tick_counter_8_s
        );
        
        inst_counter_baud : counter generic map (10417) port map (
            enable => enable_counter_baud_s,
            rst => rst_s,
            clk => clk,
            tick => tick_counter_baud_s
        );
        
        inst_UART_controller : UART_controller port map (
            tick_counter_baud => tick_counter_baud_s,
            tick_counter_8 => tick_counter_8_s,
            enable => enable,
            lsb => lsb_s,
            rst => rst_s,
            clk => clk,
            TXD => TXD,
            l_s => l_s_s,
            enable_counter_baud => enable_counter_baud_s,
            enable_counter_8 => enable_counter_8_s,
            enable_register => enable_register_s
        );

end Behavioral;
