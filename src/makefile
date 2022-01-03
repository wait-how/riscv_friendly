

# CONFIGURATION SECTION


# set the name of the toolchain to use
TOOLCHAIN := riscv64-elf

# set the architecture to test
ARCH := rv32i

# set the abi to use (use ilp32 for 32-bit processors and lp64 for 64-bit processors)
ABI := ilp32

# default linker script to use
LINK_ABI := elf32lriscv

# uninitialized data starts here
BSS_ADDR := 0x0

# initialized data starts here
DATA_ADDR := 0x100

# code starts here (note that this value is used in the .elf output but ignored in the .hex output)
TEXT_ADDR := 0x200


# END CONFIGURATION SECTION


TEST_SRC := $(wildcard *.s)
TEST_OBJ := $(notdir $(patsubst %.s,%.o,$(TEST_SRC)))

.PHONY: dump_hw dump_sw single bare spike pre

bare: pre $(TEST_OBJ)
	@$(TOOLCHAIN)-ld -m$(LINK_ABI) -static -Ttext $(TEXT_ADDR) -Tbss $(BSS_ADDR) -Tdata $(DATA_ADDR) $(TEST_OBJ) -o $@.elf
	@$(TOOLCHAIN)-objcopy $@.elf $@.hex --only-section=.text --output-target=binary
	@echo "bare-metal build completed"

spike: pre $(TEST_OBJ)
	@$(TOOLCHAIN)-ld -m$(LINK_ABI) -static -T link.ld $(TEST_OBJ) -o $@.elf
	@echo "spike build completed"

# need to clear out all object files because changing macros in one file may change
# the contents of others (there's probably a better way to do this)
pre:
	@rm -f *.o

%.o: %.s
	@$(TOOLCHAIN)-as -mabi=$(ABI) -march=$(ARCH) -o $@ $<

# disassemble the test suite .elf using high-level register names (a0, a1, etc), pseudoinstructions,
# and colored arrows to indicate jump directions
dump_hw:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		-Mno-aliases,numeric \
		--visualize-jumps=extended-color \
		$(file) | tail +8

# disassemble the test suite .elf using actual register names (x1, x2, etc) and actual instructions
dump_sw:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		--visualize-jumps=extended-color \
		$(file) | tail +8

clean:
	@rm -f *.o
	@rm -f *.elf *.hex
