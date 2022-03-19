# Required macros

# check if registers l and r are equal and terminate execution if they aren't.
.macro Assert_eq lreg, rreg
    li s0, 0 # 0 == assert Ecall
    mv t1, \lreg
    mv t2, \rreg
    ecall
.endm

.macro Assert_ne lreg, rreg
	# TODO: unused?
	unimp
.endm

# halt execution and is called once when test suite has finished successfully.
.macro Stop
stop:
    ebreak
.endm

# called before any other instruction - use for any initialization or setup tasks that need to be performed
.macro Imp_setup
.endm

# called after Stop - use for storing extra data used by Imp_setup
.macro Imp_details
.endm

# Optional macros

# print the character in argument c
.macro Putchar_imm c
    li s0, 1 # 1 == print Ecall
    li t1, \c
    ecall
.endm
