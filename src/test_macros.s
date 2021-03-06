# printing macros

.macro Print_name name
.if Use_putchar
.irpc c, \name
    Putchar_imm "'\c'" # need to put double quotes here to allow macro expansion within quotes
.endr

Putchar_imm '\n'
.endif
.endm

# NOTE: currently unused because organizing the stack layout properly is annoying
.macro Print_hex reg
	unimp
print_hex_\@:
	Putchar_imm '0'
	Putchar_imm 'x'

	addi sp, sp, -16
	sw a0, 12(sp)
	sw a1, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)

	mv a3, \reg
	li a0, 8 # counter of digits to print
	li a2, 9 # anything above '9' needs a different offset

0:
	# get uppermost nibble
	mv a1, a3
	slli a3, a3, 4
	srli a1, a1, 28

	bgt a1, a2, 2f # check if number or letter
1:
	# number
	addi a1, a1, '0'
	j 3f
2:
	# letter
	addi a1, a1, -10
	addi a1, a1, 'A'
3:
	# print and adjust counter
	Putchar_reg a1
	addi a0, a0, -1
	bgtz a0, 0b

	lw a3, 0(sp)
	lw a2, 4(sp)
	lw a1, 8(sp)
	lw a0, 12(sp)
	addi sp, sp, 16
.endm

# generic code macros

.macro Suite_Setup suite
    Print_name \suite
.endm

# gives a useful symbol name to a test case (helpful when looking at assembly)
.macro Test_Setup suite, test
\suite\()_\test:
    li t0, \@

    # clear registers from previous test
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 0
    li a4, 0
.endm

# Test_Val runs a section of code and compares the value in a1 to exp_val.
# The test number is stored in t0 and is included for debugging purposes.

# single line example:
# Test_Val 1, 5, "addi a1, zero, 5"
# multi line example:
# Test_Val 1, 5, "nop; nop; nop; addi a1, zero, 5"
.macro Test_Val suite, test, exp_val, code
    Test_Setup \suite, \test

    \code
    li a0, \exp_val
    Assert_eq a0, a1
.endm

# Test_Seq runs a section of code and checks if the values in a0 and a1 are equal.
# The test number is stored in t0 and is included for debugging purposes.

# single line example:
# Test_Seq 1, "addi a1, zero, 5"
# multi line example:
# Test_Seq 1, "addi a1, zero, 5; addi a0, zero, 5"
.macro Test_Seq suite, test, code
    Test_Setup \suite, \test

    \code
    Assert_eq a0, a1
.endm

# arithmetic instruction macros

.equiv REG, 0
.equiv IMM, 1

.macro Test_Rd_Rs1_Rs2 suite, test, imm, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a4, \exp_val
    li a1, \lval
.if \imm
    \instr a3, a1, \rval
.else
    li a2, \rval
    \instr a3, a1, a2
.endif

    Assert_eq a3, a4
.endm

.macro Test_Rs1_Rs1_Rs2 suite, test, imm, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a3, \exp_val
    li a1, \lval
.if \imm
    \instr a1, a1, \rval
.else
    li a2, \rval
    \instr a1, a1, a2
.endif

    Assert_eq a1, a3
.endm

.macro Test_Rs2_Rs1_Rs2 suite, test, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a3, \exp_val
    li a1, \lval
    li a2, \rval
    \instr a2, a1, a2

    Assert_eq a2, a3
.endm

.macro Test_Rs1_Rs1_Rs1 suite, test, instr, exp_val, lval
    Test_Setup \suite, \test

    li a1, \lval
    li a2, \exp_val
    \instr a1, a1, a1

    Assert_eq a1, a2
.endm

.macro Test_Rd_Bypass suite, test, nop_count, imm, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a4, \exp_val
    li a1, \lval
.if \imm
    \instr a3, a1, \rval
.else
    li a2, \rval
    \instr a3, a1, a2
.endif
.rept \nop_count
    # repeat for nop_count iterations
    nop
.endr
    addi t1, a3, 0

    Assert_eq t1, a4
.endm

# rs1 bypass and rs2 bypass macros are almost the same except for loading operands in the opposite order

.macro Test_Rs1_Bypass suite, test, rs1_nop_count, rs2_nop_count, imm, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a4, \exp_val
    li a1, \lval
.rept \rs1_nop_count
    nop
.endr

.if \imm
    \instr a3, a1, \rval
.else
    li a2, \rval
.rept \rs2_nop_count
    nop
.endr
    \instr a3, a1, a2
.endif

    Assert_eq a3, a4
.endm

.macro Test_Rs2_Bypass suite, test, rs1_nop_count, rs2_nop_count, instr, exp_val, lval, rval
    Test_Setup \suite, \test

    li a4, \exp_val
    li a2, \rval
.rept \rs2_nop_count
    nop
.endr

    li a1, \lval
.rept \rs1_nop_count
    nop
.endr
    \instr a3, a1, a2

    Assert_eq a3, a4
.endm

.macro Test_Rd_Rs1_Zero suite, test, instr, exp_val, lval
    Test_Setup \suite, \test

    li a3, \exp_val
    li a1, \lval
    \instr a2, a1, zero

    Assert_eq a2, a3
.endm

.macro Test_Rd_Zero_Rs2 suite, test, instr, exp_val, rval
    Test_Setup \suite, \test

    li a3, \exp_val
    li a1, \rval
    \instr a2, zero, a1

    Assert_eq a2, a3
.endm

.macro Test_Rd_Zero_Imm suite, test, instr, exp_val, lval
    Test_Setup \suite, \test

    li a3, \exp_val
    \instr a2, zero, \lval

    Assert_eq a2, a3
.endm

.macro Test_Rd_Zero_Zero suite, test, instr, exp_val
    Test_Setup \suite, \test

    li a2, \exp_val
    \instr a1, zero, zero

    Assert_eq a1, a2
.endm

.macro Test_Zero_Rs1_Rs2 suite, test, imm, instr, lval, rval
    Test_Setup \suite, \test

    li a3, 0
    li a1, \lval
.if \imm
    \instr zero, a1, \rval
.else
    li a2, \rval
    \instr zero, a1, a2
.endif

    # can catch cases where zero register can be written with nonzero values
    Assert_eq a3, zero
.endm

# load/store macros

.macro Test_Seq_St suite, test, instr, st_val, offset, base_addr
    Test_Setup \suite, \test

    la a1, \base_addr
    li a2, \st_val

    \instr a2, \offset\()(a1)
.endm

.macro Test_Ld suite, test, instr, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    la a1, \base_addr

    \instr a2, \offset\()(a1)

    Assert_eq a2, a3
.endm

.macro Test_St_Ld suite, test, ld_instr, st_instr, start_val, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    la a1, \base_addr
    li a2, \start_val

    \st_instr a2, \offset\()(a1)
    \ld_instr a2, \offset\()(a1)

    Assert_eq a2, a3
.endm

.macro Test_Ld_Rd_Bypass suite, test, nop_count, instr, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    la a1, \base_addr
    \instr a2, \offset\()(a1)
.rept \nop_count
    # repeat for nop_count iterations
    nop
.endr
    addi t1, a2, 0

    Assert_eq t1, a3
.endm

.macro Test_Ld_Rs_Bypass suite, test, nop_count, instr, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    la a1, \base_addr
.rept \nop_count
    # repeat for nop_count iterations
    nop
.endr
    \instr a2, \offset\()(a1)

    Assert_eq a2, a3
.endm

.macro Test_St_Val_Addr_Bypass suite, test, src1_nops, src2_nops, ld_instr, st_instr, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    li a2, \exp_val
.rept \src1_nops
    # repeat for src1_nops iterations
    nop
.endr
    la a1, \base_addr
.rept \src2_nops
    nop
.endr
    \st_instr a2, \offset\()(a1)
    \ld_instr a2, \offset\()(a1)

    Assert_eq a2, a3
.endm

.macro Test_St_Addr_Val_Bypass suite, test, src1_nops, src2_nops, ld_instr, st_instr, exp_val, offset, base_addr
    Test_Setup \suite, \test

    li a3, \exp_val
    la a1, \base_addr
.rept \src1_nops
    # repeat for src1_nops iterations
    nop
.endr
    li a2, \exp_val
.rept \src2_nops
    nop
.endr
    \st_instr a2, \offset\()(a1)
    \ld_instr a2, \offset\()(a1)

    Assert_eq a2, a3
.endm

# branch macros

.macro Test_Branch_Taken suite, test, instr, lval, rval
    Test_Setup \suite, \test

    li a1, \lval
    li a2, \rval
    \instr a1, a2, 2f
    addi a3, zero, 1
1:  \instr a1, a2, 3f
    addi a3, zero, 1
2:  \instr a1, a2, 1b
    addi a3, zero, 1
3:  Assert_eq a3, zero
.endm

.macro Test_Branch_Not_Taken suite, test, instr, lval, rval
    Test_Setup \suite, \test

    li a3, 0
1:  Assert_eq zero, a3
    li a3, 1
    li a4, 2

    li a1, \lval
    li a2, \rval
    \instr a1, a2, 1b
    \instr a1, a2, 2f
    nop
    li a3, 2
2:  Assert_eq a3, a4
.endm

.macro Test_Branch_Not_Taken_Rs1_Bypass suite, test, src1_nops, src2_nops, instr, lval, rval
    Test_Setup \suite, \test

    li a3, 1
    li a1, \lval
.rept \src1_nops
    # repeat for src1_nops iterations
    nop
.endr
    li a2, \rval
.rept \src2_nops
    nop
.endr
    \instr a1, a2, 1f
    li a3, 0
1:  Assert_eq zero, a3
.endm

.macro Test_Branch_Not_Taken_Rs2_Bypass suite, test, src1_nops, src2_nops, instr, lval, rval
    Test_Setup \suite, \test

    li a3, 1
    li a2, \rval
.rept \src1_nops
    # repeat for src1_nops iterations
    nop
.endr
    li a1, \lval
.rept \src2_nops
    nop
.endr
    \instr a1, a2, 1f
    li a3, 0
1:  Assert_eq zero, a3
.endm

# jump macros

.macro Test_Jalr_Rs_Bypass suite, test, nops
    Test_Setup \suite, \test

    la a1, 2f
    li a0, 0
.rept \nops
    nop
.endr
1:  jalr ra, a1, 0
    addi a0, a0, 1
    addi a0, a0, 1

2:  la a2, 1b
    addi a2, a2, 4
    Assert_eq ra, a2
    Assert_eq a0, zero
.endm

# Zicsr macros

.macro Test_Rd_Csr_Rs suite, test, imm, instr, csr, exp_val, write_val
    Test_Setup \suite, \test

    # instr must be executed twice to fetch value written in first call

    li a2, \exp_val
.if \imm
    \instr a1, \csr, \write_val
    \instr a1, \csr, \write_val
.else
    li a0, \write_val
    \instr a1, \csr, a0
    \instr a1, \csr, a0
.endif


    Assert_eq a1, a2
.endm

.macro Test_Zero_Csr_Rs suite, test, imm, instr, csr, write_val
    Test_Setup \suite, \test

.if \imm
    \instr zero, \csr, \write_val
    \instr zero, \csr, \write_val
.else
    li a0, \write_val
    \instr zero, \csr, a0
    \instr zero, \csr, a0
.endif
.endm

.macro Test_Rd_Csr_Zero suite, test, instr, csr, exp_val
    Test_Setup \suite, \test

    li a1, \exp_val
    \instr a0, \csr, zero # must be executed twice to fetch value written in first call
    \instr a0, \csr, zero

    Assert_eq a0, a1
.endm

.macro Test_Zero_Csr_Zero suite, test, instr, csr
    Test_Setup \suite, \test

    \instr zero, \csr, zero
.endm
