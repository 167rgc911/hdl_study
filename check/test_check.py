# test_check.py (simple)

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test1(dut):
    """Try accessing the design."""

    dut.r.value = 0
    dut.y.value = 0
    dut.g.value = 0
    await Timer(1, units="ns")

    dut._log.info("ok %s", dut.ok.value)

    dut.r.value = 0
    dut.y.value = 0
    dut.g.value = 1
    await Timer(1, units="ns")

    dut._log.info("ok %s", dut.ok.value)

    dut.r.value = 0
    dut.y.value = 1
    dut.g.value = 0
    await Timer(1, units="ns")

    dut._log.info("ok %s", dut.ok.value)

    dut.r.value = 0
    dut.y.value = 1
    dut.g.value = 1
    await Timer(1, units="ns")

    dut._log.info("ok %s", dut.ok.value)

    dut.r.value = 1
    dut.y.value = 0
    dut.g.value = 0
    await Timer(1, units="ns")

    dut._log.info("ok %s", dut.ok.value)
