# riscv_friendly

riscv_friendly is an instruction level test suite for RISC-V processors that aren't finished yet.  The test suite borrows from the official [riscv-tests](https://github.com/riscv-software-src/riscv-tests) test suite, but only uses a small subset of the base RV32I instruction set to run the same tests.  This allows core instructions to be validated before the entire ISA is fully implemented.
  
NOTE: riscv_friendly is designed as a convienent starting point for verification, not a complete verification suite.  However the test suite works quite well for testing simple RISC-V implementations and emulators.

## Features
 - Extensive tests for all RV32I instructions
   - Fixes bugs present in the base riscv-tests test suite
 - Uses only a small subset of the base RV32I instruction set for all tests (see the Required Pseudoinstructions section for details)
 - Contains bypass tests for traditional 5-stage pipelines
 - Easy to use and port
   - Doesn't depend on gcc, the riscv-toolchain package, or SiFive tools
      - Depends on binutils, which can usually be installed in a single command
   - All system-specific macros are located in standalone files
   - Every test has its own label in order to easily map pc addresses to test cases
   - Unused tests aren't included in the test suite binary

## Dependencies
A RISC-V port of binutils is required to build the test suite.  Note that the 32-bit and 64-bit versions of binutils both work, so either one can be used.  The 64-bit version can be used to build the test suite for 32-bit targets, but not vice versa.
  
### Debian-based (Ubuntu, etc.)
Install binutils using the following command:
```
$ sudo apt-get update && sudo apt-get install binutils-riscv64-unknown-elf
```
  
### Arch-based (Manjaro, etc.)
Install binutils using the following command:
```
$ sudo pacman -Syu riscv64-elf-binutils
```
  
### Homebrew (MacOS, x86 or ARM)
Install binutils using the following commands.  Note that this may take a while to install.
```
$ brew tap riscv/riscv
$ brew install riscv-tools
```

## Building
Note that if you are using the 32-bit version of the RISC-V tools, the makefile may need to be edited.
  
Run `make` in the `src` directory to build the test suite for the `bare` target, which is a target suitable for running the test suite on bare metal hardware.  The makefile will probably need to be edited in order to map the test suite to your specific platform (and address range), but this can often be done without the use of linker scripts.  Running `make spike` will build the test suite for execution on the spike RISC-V emulator, but this also requires commenting out some lines in `start.s`.

## Using
If the `bare` build is successful, two files will be created: `bare.elf` and `bare.hex`.  `testsuite.elf` should be used if you need to disassemble or process the executable.  `bare.hex` is the raw binary itself, and can be loaded into emulators or simulators directly.  Building for will only generate the file `spike.elf`.

Below is the example output from an emulator written in Rust.
```
$ cargo run bare.hex
starting execution
sanity
lui
auipc
...
jal
jalr
terminating execution
```

## Debugging
Run `make file=<elf file> dump_hw` to dump the assembly output of the test suite.  This is the recommended way of debugging, as the source code is fairly macro heavy.
  
The test suite binary will be disassembled using actual instructions, real names for registers, and colored arrows to indicate where jumps lead.  Running `make file=<elf file> dump_sw` will disassemble the test suite binary using pseudoinstructions and ABI register names.

## Porting
### Required (Pseudo)instructions
These instructions are assumed to function properly in order to run the test suite correctly.
 - `li`
    - Formed using `lui` and `addi`, used for loading full immediates into registers
 - `la`
    - Formed using `auipc` and `addi`, used for loading full addresses into registers
 - `mv`
    - Equivalent to `add dst, src, x0`, used to move values between registers

### Recommended (Pseudo)instructions
These instructions are not required to run the test suite, but are helpful if the processor or emulator is still being developed.
 - `ecall` or `ebreak`
    - The `ecall` and `ebreak` instructions hand control to the execution environment, with parameters being passed in registers.  This instruction is fairly easy to implement for basic processor or emulators and is used to implement the assertion macro `Assert_eq` for the `bare` target.

### Port Notes
 - At least 64 bytes of uninitialized memory should be in the .bss section.  The .data section is not used.
 - If `_start` is not the first label seen it will not be the first to execute in the .hex file.  Avoid this by placing all port-specific code and data in the `Imp_details` macro in the `bare_port_macros.s` file so it gets included last.

## TODOs
 - test misaligned accesses to memory if EEI allows it
 - check unaligned mem tests, two variants used in the test suite

## Future Goals
 - C tests
 - Rust tests
 - benchmarks (with numbers for spike and qemu)
 