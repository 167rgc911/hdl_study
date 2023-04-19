library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity TestBench is
end entity TestBench;

architecture behaviour of TestBench is
	signal BITS	: integer := 8;
	signal LEN	: integer := 19;

        signal CLK      : std_logic := '0';
        signal RST      : std_logic;
        signal IN1      : std_logic_vector(BITS-1 downto 0);
        signal IN1_STB  : std_logic;
        signal IN1_ACK  : std_logic;
        signal OUT1     : std_logic_vector(BITS-1 downto 0);
        signal OUT1_STB : std_logic;
        signal OUT1_ACK : std_logic;
begin

	RST <= '1', '0' after 100 ns;
	CLK <= not CLK after 50 ns;

	f1 : entity work.FIFO
			generic map(
				BITS => BITS,
				DEPTH => 8)
			port map(
				CLK,
				RST,
				IN1,
				IN1_STB,
				IN1_ACK,
				OUT1,
				OUT1_STB,
				OUT1_ACK);

	writer: process(CLK, RST)
		variable cnt : integer := 0;
	begin
		if RST = '1' then
		elsif CLK = '1' then
			if cnt < LEN-1 then
				if IN1_ACK = '1' then
					cnt := cnt + 1;
				end if;
				IN1 <= std_logic_vector(to_unsigned(cnt, BITS));
				IN1_STB <= '1';
			else
				if IN1_ACK = '0' then
					IN1_STB <= '0';
				end if;
			end if;
		else
			if IN1_ACK = '1' then
				IN1_STB <= '0';
			end if;
		end if;
	end process;

	reader: process(CLK, RST)
	begin
		if RST = '1' then
		else
			OUT1_ACK <= OUT1_STB;
		end if;
	end process;

end;
