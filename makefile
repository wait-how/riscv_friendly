# NOTE: anything in the "exclude" directory will not get assembled,
# so tests that will not assemble due to architecture limitations can be excluded
TEST_SRC := $(wildcard *.S)
TEST_OBJ := $(notdir $(patsubst %.S,%.o,$(TEST_SRC)))
TOOLCHAIN := riscv64-elf
BINARY := testsuite

# set the architecture to test
ARCH := rv32i

# set the abi to use
ABI := ilp32

# ABI to specify for the linker
LINK_ABI := elf32lriscv

# enable all warnings, don't link with the standard library, and don't assume a hosted implementation
CFLAGS := -Wall -Wextra -std=c17 -nostdlib -ffreestanding -march=$(ARCH) -mabi=$(ABI)

# code starts here (will get stripped out when converted to hex file?)
TEXT_ADDR := 0x8000

# uninitialized data starts here
BSS_ADDR := 0x1000

# initialized data starts here
DATA_ADDR := 0x0

# emulate the "elf32lriscv" linker by default and do not link against shared libraries
LFLAGS := -m$(LINK_ABI) -static -Ttext $(TEXT_ADDR) -Tbss $(BSS_ADDR) -Tdata $(DATA_ADDR)

.PHONY: dump dump_simple single

# builds the entire test suite
# compilation and linking passes are split up to give better error messages
testsuite: $(TEST_OBJ)
	@$(TOOLCHAIN)-ld $(LFLAGS) $(TEST_OBJ) -o $(BINARY).elf
	@$(TOOLCHAIN)-objcopy $(BINARY).elf $(BINARY).hex --output-target=binary
	@echo "build completed successfully"

# weird macro hack for individual test files
%.o: %.S riscv_test.h test_macros.h
	@$(TOOLCHAIN)-gcc -c -mabi=$(ABI) -march=$(ARCH) -o $@ \
		-DTEST_FUNC_NAME=$(notdir $(basename $<)) \
		-DTEST_FUNC_TXT='"$(notdir $(basename $<))"' \
		-DTEST_FUNC_RET=$(notdir $(basename $<))_ret $<

# disassemble the test suite .elf using high-level register names (a0, a1, etc), pseudoinstructions,
# and colored arrows to indicate jump directions
dump:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		--visualize-jumps=extended-color \
		$(BINARY).elf | tail +8

# disassemble the test suite .elf using actual register names (x1, x2, etc) and actual instructions
dump_simple:
	@$(TOOLCHAIN)-objdump -d \
		--line-numbers \
		-Mno-aliases,numeric \
		$(BINARY).elf | tail +8

clean:
	@rm *.o
