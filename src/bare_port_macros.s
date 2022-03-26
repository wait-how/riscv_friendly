# All of the following macros are required to be defined, but only the Assert macros need to contain code.

# NOTE: All macros are allowed to clobber s0, t1, and t2.

# check if registers l and r are equal and terminate execution if they aren't
.macro Assert_eq lreg, rreg
    li s0, 0 # 0 == assert Ecall
    mv t1, \lreg
    mv t2, \rreg
    ecall
.endm

# check if registers l and r are _not_ equal and terminate execution if they are
.macro Assert_ne lreg, rreg
	li s0, 1 # 1 == assert_ne Ecall
	mv t1, \lreg
	mv t2, \rreg
	ecall
.endm

# halt execution - called once when test suite has finished successfully
.macro Stop
stop_\@:
    ebreak
.endm

# called before any other instruction - use for any initialization or setup tasks that need to be performed
.macro Imp_setup
.endm

# called after Stop - use for storing extra data used by the implementation
.macro Imp_details
.endm

# print the character in argument c
.macro Putchar_imm c
    li s0, 1 # 1 == print Ecall
    li t1, \c
    ecall
.endm

# print the character in register reg
.macro Putchar_reg reg
	li s0, 1
	mv t1, \reg
	ecall
.endm
