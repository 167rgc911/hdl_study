-- https://riptutorial.com/vhdl
-- File counter.vhd
-- The entity is the interface part. It has a name and a set of input / output
-- ports. Ports have a name, a direction and a type. The bit type has only two
-- values: '0' and '1'. It is one of the standard types.
entity counter is
  port(
    clock: in  bit;    -- We are using the rising edge of CLOCK
    reset: in  bit;    -- Synchronous and active HIGH
    data:  out natural -- The current value of the counter
  );
end entity counter;

-- The architecture describes the internals. It is always associated
-- to an entity.
architecture sync of counter is
  -- The internal signals we use to count. Natural is another standard
  -- type. VHDL is not case sensitive.
  signal current_value: natural;
  signal NEXT_VALUE:    natural;
begin
  -- A process is a concurrent statement. It is an infinite loop.
  process
  begin
    -- The wait statement is a synchronization instruction. We wait
    -- until clock changes and its new value is '1' (a rising edge).
    wait until clock = '1';
    -- Our reset is synchronous: we consider it only at rising edges
    -- of our clock.
    if reset = '1' then
      -- <= is the signal assignment operator.
      current_value <= 0;
    else
      current_value <= next_value;
    end if;
  end process;

  -- Another process. The sensitivity list is another way to express
  -- synchronization constraints. It (approximately) means: wait until
  -- one of the signals in the list changes and then execute the process
  -- body. Sensitivity list and wait statements cannot be used together
  -- in the same process.
  process(current_value)
  begin
    next_value <= current_value + 1;
  end process;

  -- A concurrent signal assignment, which is just a shorthand for the
  -- (trivial) equivalent process.
  data <= current_value;
end architecture sync;
