-- Massachusetts (Obsolete) Stoplight Example
-- https://ocw.mit.edu/courses/6-111-introductory-digital-systems-laboratory-fall-2002/resources/l1/
library ieee;
use ieee.std_logic_1164.all;
entity check is port(
r, y, g: in std_logic;
ok: out std_logic;
signal t1, t2, t3: inout std_logic);
end check;
architecture logical of check is
begin
my_label: process(r, y, g, t1, t2, t3) begin
t1 <= r and (not g);
t2 <= y and (not g);
t3 <= (not r) and (not y) and g;
ok <= t1 or t2 or t3;
end process;
end logical;
