# minv

Minv is an instruction level test suite for RISC-V processors that aren't finished yet.  The test suite borrows from the official [riscv-tests](https://github.com/riscv-software-src/riscv-tests) test suite, but only uses a small subset of the base RV32I instruction set to run these tests.  As an example, this allows for testing arithmetic instructions even if jump and branch instructions aren't done yet.
  
Minv isn't designed to be a complete verification suite, as these already exist.  Minv is designed for hobbyists wanting to quickly test their RISC-V emulators or HDL cores as well as those who want to quickly verify subsets of the RISC-V ISA.

## Features
 - Extensive test suite for all RV32I instructions
   - Fixes bugs present in the base `riscv-tests` test suite
 - Uses only a small subset of the base RV32I instruction set for all tests (see the Required Pseudoinstructions section for details)
 - Contains bypass tests for traditional 5-stage pipelines
 - Easy to use and port
   - `riscv-gcc` is not required to build the test suite (just `riscv-binutils`)
   - All processor-specific macros are located in `port_macros.s`
   - Every test has its own label in order to easily map pc addresses to test cases
   - Unused tests aren't included in the test suite binary

## Building
Run `make` to build the test suite.
  
`riscv-binutils` is required to build the test suite, but the 32-bit and 64-bit versions both work.  The 64-bit version can be used to build the test suite for 32-bit targets, but not vice versa.

## Debugging
Run `make dump` to dump the assembly output of the test suite.  This is the recommended way of debugging, as the source code makes use of macros and is a bit harder to read.
  
The test suite binary will be disassembled using pseudoinstructions, ABI names for registers, and colored arrows to indicate where jumps lead.  Running `make dump_simple` will disassemble the test suite binary using actual instructions, real register names, and no colored arrows.

## Required (Pseudo)instructions
 - `li`
    - formed using `lui` and `addi`
    - for loading immediates into registers
 - `la`
    - formed using `auipc` and `addi`
    - for loading addresses into registers
 - `add`
    - for moving values between registers
 - `ecall`
    - used to compare registers for equality

## Porting
TODO once test suite is done and error messages are implemented

# TODOs

 - sltiu tests (riscv-tests only has one!)
 - error messages using port macros
 - make sure no tests depend on zero-initialized registers
 - strip out unnecessary zero-initialization?
 - test misaligned accesses to memory if EEI allows it
 - check unaligned mem tests, two variants used?
 - more use of Assert_ne in obvious failure cases
 