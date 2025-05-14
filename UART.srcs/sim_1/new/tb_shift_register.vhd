library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_shift_register is
--  Port ( );
end tb_shift_register;

architecture Behavioral of tb_shift_register is
    signal data_s : std_logic_vector(7 downto 0) := (others => '0');
    signal l_s_s : std_logic := '0';
    signal enable_s : std_logic := '0';
    signal rst_s : std_logic := '0';
    signal clk_s : std_logic := '0';
    signal lsb_s : std_logic := '0';
    
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

    begin
        inst_shift_register : shift_register port map (
            data => data_s,
            l_s => l_s_s,
            enable => enable_s,
            rst => rst_s,
            clk => clk_s,
            lsb => lsb_s 
        );
        
        proc_clk_s : process
            begin
                clk_s <= not clk_s;
                wait for 10 ns;
        end process;
        
        proc_signals : process
            begin
                data_s <= "10010011";
                l_s_s <= '1';
                enable_s <= '1';
                rst_s <= '0';
                
                wait for 25 ns;
                data_s <= "10010011";
                l_s_s <= '0';
                enable_s <= '1';
                rst_s <= '1';
                
                wait for 10 ns;
                data_s <= "10010011";
                l_s_s <= '1';
                enable_s <= '1';
                rst_s <= '0';
                
                wait for 10 ns;
                data_s <= "10010011";
                l_s_s <= '0';
                enable_s <= '1';
                rst_s <= '0';
                
                wait for 90 ns;
                
                wait;
        end process;
end Behavioral;
