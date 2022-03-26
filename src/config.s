# Implementation details

# uncomment this line to use an example implementation of the proper macros for a software emulator
#.include "bare_port_macros.s"

# uncomment this line to use an implementation of the proper macros for the spike emulator
.include "spike_port_macros.s"

# Test suite options

# set to 1 to enable printing, set to 0 to disable printing
.equiv Use_putchar, 1

# set to 1 to run the tests in ecall.s - by default this is a stub
.equiv Test_ecall, 0

# set to 1 to run the tests in ebreak.s - by default this is a stub
.equiv Test_ebreak, 0

# Test suites
# set to 1 to run tests for all instructions in the test suite and 0 to exclude tests from the final binary

# base RV32I instruction set tests
.equiv Test_rv32i, 1

# tests for writing instruction memory
.equiv Test_zifencei, 0

# tests for multiplication and division
.equiv Test_m, 1

# tests for control and status registers
.equiv Test_zicsr, 1
