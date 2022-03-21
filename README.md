# riscv_friendly

riscv_friendly is an instruction level test suite for RISC-V processors that aren't finished yet. The test suite borrows from the official [riscv-tests](https://github.com/riscv-software-src/riscv-tests) test suite, but only uses a small subset of the base RV32I instruction set to run the same tests. This allows core instructions to be validated before the entire ISA is fully implemented.
  
NOTE: riscv_friendly should not be your only test suite if you're doing something important. However it works quite well for testing simple RISC-V implementations and emulators.

## Features
 - Extensive tests for all RV32I instructions as well as some extensions
    - Fixes bugs present in the base riscv-tests test suite
 - Uses only a small subset of the base RV32I instruction set for all tests (see the Required Pseudoinstructions section for details)
    - Contains bypass tests for traditional 5-stage pipelines
 - Easy to use and port
    - Doesn't depend on gcc, the riscv-toolchain package, or SiFive tools
    - Depends on binutils, which can usually be installed in a single command
    - All system-specific macros are located in standalone files
    - Every test has its own label in order to easily map pc addresses to test cases
    - Unused tests aren't included in the test suite binary

## ISA/Extension Support
 - rv32i
 - rv32e (note that riscv-ld does not support rv32e at the time of writing)
 - M
 - Zicsr
 - Zifencei

## Dependencies
A RISC-V port of binutils is required to build the test suite. Note that the 32-bit and 64-bit versions of binutils both work, so either one can be used. The 64-bit version can be used to build the test suite for 32-bit targets, but not vice versa.
 
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
Install binutils using the following commands. Note that this may take a while to install.
```
$ brew tap riscv/riscv
$ brew install riscv-tools
```

## Port Checklist
This is a very quick list of the steps required to port the test suite to a new platform. See the [Porting](#porting) section for details.
1. Open `makefile` and check that all definitions in the configuration section are correct
2. Open `src/config.s` and comment out extension test suites that should not be run. Individual tests can be commented out in `src/start.s`.
3. Implement the macros in `src/bare_port_macros.s` and include it in `src/config.s` or use the `src/spike_port_macros.s` file if testing on [Spike](https://github.com/riscv-software-src/riscv-isa-sim).
4. Build and test!

## Building
### Bare Metal
Run `make` to build the test suite for the `bare` target, which is suitable for running the test suite on bare metal hardware.
  
By default, the .data and .bss segments are located before the .text segment in order to easily permit execution on machines with seperate instruction and data memories. If the .hex file is loaded into memory and executed directly, execution must start at the address assigned to the `TEXT_ADDR` makefile variable.
  
If the `bare` build is successful, two files will be created: `bare.elf` and `bare.hex`. `bare.elf` should be used if you need to disassemble or process the executable (see the Debugging section for more details). `bare.hex` is the raw binary and can be loaded into emulators or simulators directly.
  
Below is the output from an emulator written in Rust.
```
$ cargo run bare.hex
(emulator) starting execution
sanity
lui
auipc
...
jal
jalr
(emulator) terminating execution
```

### Spike
To build the test suite for the [spike RISC-V emulator](https://github.com/riscv-software-src/riscv-isa-sim), the correct assertion macros must be included. This can be done by uncommenting the relevant `.include` in `config.s`, like so:
```
# comment this line
#.include "bare_port_macros.s"

# uncomment this line
.include "spike_port_macros.s"
```
  
Afterwards, run `make spike` in the `src` directory. This will generate a file named `spike.elf` that can be executed on the emulator like so:
```
# launch the spike emulator with 1MiB of memory using the RV32I instruction set with the multiply extension
$ spike -m1 --isa=rv32im ./spike.elf
```

## Debugging
Run `make file=<elf file> dump_hw` to dump the assembly output of the test suite. This is the recommended way of debugging, as the source code is fairly macro heavy.
  
The test suite binary will be disassembled using actual instructions, real names for registers, and colored arrows to indicate where jumps lead. Running `make file=<elf file> dump_sw` will disassemble the test suite binary using pseudoinstructions and ABI register names.

## Porting
### Required (Pseudo)instructions
These instructions are assumed to function properly in order to run the test suite correctly.
 - `li`
    - Formed using `lui` and `addi`, used for loading full immediates into registers
 - `la`
    - Formed using `auipc` and `addi`, used for loading full addresses into registers
 - `mv`
    - Equivalent to `add dst, src, x0`, used to move values between registers
 - Extension tests should only be performed after the base RV32I test suite passes and may depend on any RV32I instruction:
    - Zicsr:
       - `csrrw` to write values to CSRs
       - `sub` to extract instruction, cycle, and timer counts
    - Zifencei:
       - `sw` to write to instruction memory

### Recommended (Pseudo)instructions
These instructions are not required to run the test suite, but are helpful if the processor or emulator is still being developed.
 - `ecall` or `ebreak`
 - The `ecall` and `ebreak` instructions hand control to the execution environment, with parameters being passed in registers. This instruction is fairly easy to implement for basic processor or emulators and is used to implement the assertion macro `Assert_eq` for the `bare` target.

### Implementation Details
 - At least 64 bytes of uninitialized memory should be in the .bss section. The .data section is not used.
 - If `_start` is not the first label seen in `start.s` it will not be the first to execute in the .hex file. Avoid this by placing all port-specific code and data in the `Imp_details` macro in the `bare_port_macros.s` file so it gets included last.
 - The `fence` instruction tests are more or less stubs and shound be expanded.
  
 - The Zicsr extension tests require access to the following registers:
 - A register that can be read and written without affecting program execution, such as one of the following:
    - `mscratch` (trap scratch register, address 0x340)
    - `fflags` (floating point exception register, address 0x001)
 - `cycle` (cycle count register, address 0xC00)
 - `time` (time register, address 0xC01)
 - `instret` (retired instruction count register, address 0xC02)

## TODOs
 - expand zifencei tests
 - test misaligned accesses to memory if EEI allows it
 - check unaligned mem tests, two variants used in the test suite

## Future Goals
 - C-like tests
 - Rust tests
 - benchmarks (with numbers for spike and qemu)
 
