-- File counter_sim.vhd
-- Entities of simulation environments are frequently black boxes without
-- ports.
entity counter_sim is
end entity counter_sim;

architecture sim of counter_sim is

  -- One signal per port of the DUT. Signals can have the same name as
  -- the corresponding port but they do not need to.
  signal clk:  bit;
  signal rst:  bit;
  signal data: natural;

begin

  -- Instantiation of the DUT
  u0: entity work.counter(sync)
  port map(
    clock => clk,
    reset => rst,
    data  => data
  );

  -- A clock generating process with a 2ns clock period. The process
  -- being an infinite loop, the clock will never stop toggling.
  process
  begin
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
  end process;

  -- The process that handles the reset: active from beginning of
  -- simulation until the 5th rising edge of the clock.
  process
  begin
    rst  <= '1';
    for i in 1 to 5 loop
      wait until rising_edge(clk);
    end loop;
    rst  <= '0';
    wait; -- Eternal wait. Stops the process forever.
  end process;

end architecture sim;
