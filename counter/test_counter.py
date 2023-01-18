# test_counter.py (extended)

import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


async def generate_clock(dut):
    """Generate clock pulses."""

    for cycle in range(100):
        dut.clock.value = 0
        await Timer(1, units="ns")
        dut.clock.value = 1
        await Timer(1, units="ns")


@cocotb.test()
async def my_second_test(dut):
    """Try accessing the design."""

    # reset
    dut.reset._log.info("reset")
    dut.reset.value = 1

    await cocotb.start(generate_clock(dut))  # run the clock "in the background"

    await Timer(4, units="ns")  # wait a bit
    await RisingEdge(dut.clock)  # wait for rising edge

    dut.reset._log.info("out of reset")
    dut.reset.value = 0
    # out of reset

    dut._log.info("data %s", dut.data.value)

    await RisingEdge(dut.clock)  # wait for rising edge
    dut._log.info("data %s", dut.data.value)

    # await Timer(3, units="ns")  # wait a bit
    # await RisingEdge(dut.clock)  # wait for rising edge
    await ClockCycles(dut.clock, 1)  # wait a bit
    dut._log.info("data %s", dut.data.value)

    await ClockCycles(dut.clock, 1)  # wait a bit
    dut._log.info("data %s", dut.data.value)

