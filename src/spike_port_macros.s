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
stop:
    # NOTE: writing a 32-bit value to tohost with lsb set to 1 stops the sim, with the upper 31 bits used as the exit code
    li t0, 1
    la t1, tohost
    sw t0, 0(t1)
1:  j 1b
.endm

# put implementation setup here
.macro Imp_setup
    li sp, 0x80001000 # set up stack pointer for calls to putchar
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

# NOTE: spike can print whole strings at a time but the print API is (intentionally) really primitive
putchar_imm:
    li a0, 64 # write syscall
    li a1, 1 # stdout
    li a3, 1 # number of characters to write

    la t0, unused # write syscall buffer to unused .data section
    sw a0, 0(t0)
    sw a1, 8(t0)
    mv t1, a2
    la a2, unused+32 # write character to unused+32 and load that address into a2
    sb t1, 0(a2)
    sw a2, 16(t0)
    sw a3, 24(t0)
    
    la t1, tohost # write buffer to tohost symbol
    sw t0, 0(t1)

    la t1, fromhost # spin until we get a non-zero response from fromhost
1:  lw t0, 0(t1)
    beqz t0, 1b
    sw zero, 0(t1) # set fromhost to zero again

    ret
.endm

# optional macros

# print the character in argument c
.macro Putchar_imm c
    li a2, \c # load character to write
    call putchar_imm # call putchar here or unrolled loop cost will be huge!
.endm
