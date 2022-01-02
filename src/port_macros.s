.equiv Ecall_assert_eq, 0
.equiv Ecall_print, 2

# required macros

# checks if registers l and r are equal and terminates execution if they aren't
.macro Assert_eq lreg, rreg
    li s0, Ecall_assert_eq
    mv s1, \lreg
    mv s2, \rreg
    ecall
.endm

# halts execution, called once when test suite has finished successfully
.macro Stop
    ebreak
.endm

# optional macros

# print the string pointed to by reg
# .macro Print str
#     li s0, Ecall_print
#     la s1, str_\@
#     ecall
# .data
# str_\@:
#     .asciz "\str"
# .endm
