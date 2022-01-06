# required macros

# checks if registers l and r are equal and terminates execution if they aren't
.macro Assert_eq lreg, rreg
    mv t1, \lreg
    mv t2, \rreg
    bne t1, t2, 1f
    j 2f
1:  j fail
2:  
.endm

# checks if registers l and r are different and terminates execution if they aren't
.macro Assert_ne lreg, rreg
    mv t1, \lreg
    mv t2, \rreg
    beq t1, t2, 1f
    j 2f
1:  j fail
2:  
.endm

.macro Stop
    # NOTE: writing a 32-bit value to tohost with lsb set to 1 stops the sim, with the upper 31 bits used as the exit code
    li t0, 1
    la t1, tohost
    sw t0, 0(t1)
1:  j 1b
.endm

# put misc implementation details here
.macro Imp_details
.data

# create symbols to communicate with the host
.align 4
.global tohost
tohost:
    .dword 0

.align 4
.global fromhost
fromhost:
    .dword 0

.text
fail:
    li t0, 0b11
    la t1, tohost
    sw t0, 0(t1)
1:  j 1b
.endm

# optional macros

# print the character in argument c
.macro Putchar_imm c
    # TODO
    unimp
.endm
