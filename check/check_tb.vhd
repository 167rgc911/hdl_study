----------------------------------------------------------------------------------
-- Filename : my_and_tb.vhdl
-- Author : Antonio Alejandro Andara Lara
-- Date : 25-Oct-10-2022
-- Design Name: and gate test bench
-- Module Name: VHDL_essentials
-- Project Name: VHDL_essentials
-- Description : In this file we show a basic testbench for a logic gate
-- the same approach can be used to test the other gates
-- Additional Comments:
-- Copyright : University of Alberta, 2022
-- License : CC0 1.0 Universal
----------------------------------------------------------------------------------

-- modified RgC
-- tb for check
-- truth table of page 4
-- https://ocw.mit.edu/courses/6-111-introductory-digital-systems-laboratory-fall-2002/resources/l2/

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY check_tb IS
END ENTITY;

ARCHITECTURE Behavioral OF check_tb IS
    SIGNAL r, y, g : STD_LOGIC;
    SIGNAL t1, t2, t3 : STD_LOGIC;
BEGIN

    -- Using direct entity instantiation
    DUT : ENTITY work.check(logical) PORT MAP(r => r, y => y, g => g, t1 => t1, t2 => t2, t3 => t3);

    stimulus : -- this process cycles through all the possible values of the inputs, we can verify our design by looking at the output waveform
    PROCESS
    BEGIN
        r <= '0';
        y <= '0';
        g <= '0';
        WAIT FOR 4 ns;
        r <= '0';
        y <= '0';
        g <= '1';
        WAIT FOR 4 ns;
        r <= '0';
        y <= '1';
        g <= '0';
        WAIT FOR 4 ns;
        r <= '0';
        y <= '1';
        g <= '1';
        WAIT FOR 4 ns;
        r <= '1';
        y <= '0';
        g <= '0';
        WAIT FOR 4 ns;
        WAIT;
    END PROCESS;
END Behavioral;

