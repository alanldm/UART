library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_controller is
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
end UART_controller;

architecture Behavioral of UART_controller is
    type FSM is (load, sync, send, stop, idle);
    signal current_state : FSM := idle;
    signal next_state : FSM;

    begin
        process(clk)
            begin
                if (rising_edge(clk)) then
                    if (rst = '1') then
                        current_state <= idle;
                    else
                        current_state <= next_state;
                    end if;
                end if;
        end process;
        
        process(current_state, enable, tick_counter_baud, tick_counter_8)
            begin
                case current_state is                        
                    when load =>
                        if (enable = '1') then
                            next_state <= sync;
                        else
                            next_state <= load;
                        end if;
                    when sync =>
                        if (tick_counter_baud = '1') then
                            next_state <= send;
                        else
                            next_state <= sync;
                        end if;
                    when send =>
                        if (tick_counter_baud = '1' and tick_counter_8 = '1') then
                            next_state <= stop;
                        else
                            next_state <= send;
                        end if;
                    when stop =>
                        if (tick_counter_baud = '1') then
                            next_state <= idle;
                        else
                            next_state <= stop;
                        end if;
                    when idle =>
                        if (enable = '1') then
                            next_state <= idle;
                        else
                            next_state <= load;
                        end if;
                     when others =>
                        next_state <= idle;
                end case;
        end process;
        
        process(current_state)
            begin
                case current_state is
                    when load =>
                        TXD <= '1';
                        l_s <= '1';
                        enable_register <= '1';
                        enable_counter_baud <= '0';
                        enable_counter_8 <= '0';
                        
                    when sync =>
                        TXD <= '0';
                        l_s <= '0';
                        enable_register <= '0';
                        enable_counter_baud <= '1';
                        enable_counter_8 <= '0';
                        
                    when send =>
                        TXD <= lsb;
                        l_s <= '0';
                        enable_register <= '1';
                        enable_counter_baud <= '1';
                        enable_counter_8 <= '1';
                        
                    when stop =>
                        TXD <= '1';
                        l_s <= '0';
                        enable_register <= '0';
                        enable_counter_baud <= '1';
                        enable_counter_8 <= '0';
       
                    when idle =>
                        TXD <= '1';
                        l_s <= '0';
                        enable_register <= '0';
                        enable_counter_baud <= '0';
                        enable_counter_8 <= '0';
                end case;
        end process;


end Behavioral;
