library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
    Port (
        data : in std_logic_vector(7 downto 0);
        l_s : in std_logic;
        enable : in std_logic;
        rst : in std_logic;
        clk : in std_logic;
        lsb : out std_logic
    );
end shift_register;

architecture Behavioral of shift_register is    
    signal shift_reg : std_logic_vector(7 downto 0) := (others => '0');
    
    begin 

    process(clk, rst)
        begin
            if (rst = '1') then
                shift_reg <= (others => '0');
            else
                if (rising_edge(clk)) then
                    if (enable = '1') then
                        if (l_s = '1') then
                            shift_reg <= data;
                        else
                            shift_reg <= '0' & shift_reg(7 downto 1);
                        end if;
                    end if;
                end if;
            end if;
    end process;
    
    lsb <= shift_reg(0);

end Behavioral;
