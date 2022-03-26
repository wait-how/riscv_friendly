

# CONFIGURATION SECTION


# set the name of the toolchain to use (using a 64-bit toolchain is recommended even when building 32-bit executables)
TOOLCHAIN := riscv64-linux-gnu

# set the architecture to test
ARCH := rv32im

# set the abi to use (use ilp32 for 32-bit processors and lp64 for 64-bit processors)
ABI := ilp32

# default linker script to use
LINK_ABI := elf32lriscv

# section addresses for the "bare" target
# NOTE: the contents of the .bss and .data sections are not included in the .hex output,
# but these locations matter for load and store tests!

# uninitialized data starts here
BSS_ADDR := 0x0

# initialized data starts here
DATA_ADDR := 0x100

# code starts here
# NOTE: this value is used in the .elf output but ignored in the .hex output
# this location matters for jump tests
TEXT_ADDR := 0x200

# directories to search for assembly code or macros
SRC_DIRS := src src/test src/bench src/debug

# END CONFIGURATION SECTION


OBJ_DIR := obj

SRC := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.s))
OBJ := $(patsubst %,$(OBJ_DIR)/%.o,$(basename $(SRC)))

.PHONY: dump_hw dump_sw bare spike pre clean

bare: pre $(OBJ)
	@$(TOOLCHAIN)-ld -m$(LINK_ABI) -static -Ttext $(TEXT_ADDR) -Tbss $(BSS_ADDR) -Tdata $(DATA_ADDR) $(OBJ) -o $@.elf
	@$(TOOLCHAIN)-objcopy $@.elf $@.hex --only-section=.text --output-target=binary
	@echo "bare-metal build completed"

# run the binary using the following command:
# $ spike -m1 --isa=rv32im ./spike.elf
spike: pre $(OBJ)
	@$(TOOLCHAIN)-ld -m$(LINK_ABI) -static -T link_spike.ld $(OBJ) -o $@.elf
	@echo "spike build completed"

# Need to clear out all object files because changing macros in one file may change
# the contents of others (there's probably a better way to do this).
# Also replicate the directory structure of the src folder in obj.
pre:
	@rm -rf $(OBJ_DIR)
	@mkdir -p $(patsubst %,$(OBJ_DIR)/%,$(SRC_DIRS)) > /dev/null

$(OBJ_DIR)/%.o: %.s
	@$(TOOLCHAIN)-as -mabi=$(ABI) -march=$(ARCH) $(patsubst %,-I%,$(SRC_DIRS)) -o $@ $<


# disassemble the test suite .elf using actual register names (x1, x2, etc) and actual instructions
dump_hw:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		-Mno-aliases,numeric \
		--visualize-jumps=extended-color \
		$(file) | tail -n +8

# disassemble the test suite .elf using high-level register names (a0, a1, etc), pseudoinstructions,
# and colored arrows to indicate jump directions
dump_sw:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		--visualize-jumps=extended-color \
		$(file) | tail -n +8

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf *.elf *.hex
