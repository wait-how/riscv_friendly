# required macros

# checks if registers l and r are equal and terminates execution if they aren't
.macro Assert_eq lreg, rreg
    li s0, 0 # 0 == assert Ecall
    mv t1, \lreg
    mv t2, \rreg
    ecall
.endm

.macro Assert_ne lreg, rreg
    # TODO
    unimp
.endm

# halts execution, called once when test suite has finished successfully
.macro Stop
    ebreak
.endm

# put misc implementation details here
.macro Imp_details
.endm

# optional macros

# print the character in argument c
.macro Putchar_imm c
    li s0, 1 # 1 == print Ecall
    li t1, \c
    ecall
.endm
