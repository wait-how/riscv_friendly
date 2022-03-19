# Implementation details

# uncomment this line to use an example implementation of the proper macros for a software emulator
.include "bare_port_macros.s"

# uncomment this line to use an implementation of the proper macros for the spike emulator
#.include "spike_port_macros.s"

# Test suite options

# set to 1 to enable printing, set to 0 to disable printing
.equiv Use_putchar, 1

# set to 1 to run the tests in ecall.s - by default this is a stub
.equiv Test_ecall, 0

# set to 1 to run the tests in ebreak.s - by default this is a stub
.equiv Test_ebreak, 0

# Test suites
# any test suites commented out will not be included in the binary

# basic sanity tests
.include "sanity_tests.s"

# tests for all rv32i instructions
.include "rv32i.s"

# tests for writing to instruction memory
.include "ext_zifencei.s"

# tests for all multiply and divide instructions
.include "ext_m.s"

# tests for control and status register instructions
.include "ext_zicsr.s"

