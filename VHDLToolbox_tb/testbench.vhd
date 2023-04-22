library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;

entity testbench is
end entity testbench;

architecture behaviour of testbench is

  constant bits : integer := 8;
  constant len  : integer := 19;

  constant clk_t : time := 100 ns;

  signal clk      : std_logic;
  signal rst      : std_logic;
  signal in1      : std_logic_vector(bits - 1 downto 0);
  signal in1_stb  : std_logic;
  signal in1_ack  : std_logic;
  signal out1     : std_logic_vector(bits - 1 downto 0);
  signal out1_stb : std_logic;
  signal out1_ack : std_logic;

begin

  rst <= '1', '0' after 100 ns;

  clk0 : process is
  begin

    clk <= '0';
    wait for clk_t / 2;
    clk <= '1';
    wait for clk_t / 2;

  end process clk0;

  counter0 : entity work.counter
    generic map (
      bits  => bits,
      start => 0,
      stop  => 7,
      step  => 1
    )
    port map (
      clk      => clk,
      rst      => rst,
      out1     => in1,
      out1_stb => in1_stb,
      out1_ack => in1_ack
    );

  fifo0 : entity work.fifo
    generic map (
      bits  => bits,
      depth => 8
    )
    port map (
      clk      => clk,
      rst      => rst,
      in1      => in1,
      in1_stb  => in1_stb,
      in1_ack  => in1_ack,
      out1     => out1,
      out1_stb => out1_stb,
      out1_ack => out1_ack
    );

  con0 : entity work.console_output
    generic map (
      bits => bits
    )
    port map (
      clk     => clk,
      rst     => rst,
      in1     => out1,
      in1_stb => out1_stb,
      in1_ack => out1_ack
    );

end architecture behaviour;
