TEST_SRC := $(wildcard *.s)
TEST_OBJ := $(notdir $(patsubst %.s,%.o,$(TEST_SRC)))
TOOLCHAIN := riscv64-elf
BINARY := testsuite

# set the architecture to test
ARCH := rv32i

# set the abi to use (use ilp32 for 32-bit processors and lp64 for 64-bit processors)
ABI := ilp32

# default linker script to use
LINK_ABI := elf32lriscv

# initialized data starts here
DATA_ADDR := 0x0

# uninitialized data starts here
BSS_ADDR := 0x40

# code starts here
TEXT_ADDR := 0x100

# linker flags
LFLAGS := -m$(LINK_ABI) -static -Ttext $(TEXT_ADDR) -Tbss $(BSS_ADDR) -Tdata $(DATA_ADDR)

.PHONY: dump dump_simple single $(BINARY) pre

# builds the entire test suite
# compilation and linking passes are split up to give better error messages
# NOTE: the .bss and .data sections are _not_ built into the .hex file (this can be done by removing the flag "--only-section=.text")
$(BINARY): pre $(TEST_OBJ)
	@$(TOOLCHAIN)-ld $(LFLAGS) $(TEST_OBJ) -o $(BINARY).elf
	@$(TOOLCHAIN)-objcopy --only-section=.text $(BINARY).elf $(BINARY).hex --output-target=binary
	@echo "build completed successfully"

# need to clear out all object files because changing macros in one file may change
# the contents of others - there's probably a better way to do this
pre:
	@rm -f *.o

%.o: %.s
	@$(TOOLCHAIN)-as -mabi=$(ABI) -march=$(ARCH) -o $@ $<

# disassemble the test suite .elf using high-level register names (a0, a1, etc), pseudoinstructions,
# and colored arrows to indicate jump directions
dump: $(BINARY)
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		--visualize-jumps=extended-color \
		$(BINARY).elf | tail +8

# disassemble the test suite .elf using actual register names (x1, x2, etc) and actual instructions
dump_simple: $(BINARY)
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		-Mno-aliases,numeric \
		$(BINARY).elf | tail +8

clean:
	@rm -f *.o
	@rm -f $(BINARY).elf $(BINARY).hex
