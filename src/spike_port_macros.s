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
stop_\@:
    # NOTE: writing a 32-bit value to tohost with lsb set to 1 stops the sim, with the upper 31 bits used as the exit code
    li s0, 1
    la t1, tohost
    sw s0, 0(t1)
1:  j 1b
.endm

# put implementation setup here
.macro Imp_setup
	# set up stack pointer in second half of .data section (first half is used by spike struct)
    la sp, unused+128
.endm

# put misc implementation details here
.macro Imp_details

fail:
    li s0, 0b11
    la t1, tohost
    sw s0, 0(t1)
1:  j 1b

# NOTE: spike can print whole strings at a time but the print API is (intentionally) really primitive
putchar_imm:
	addi sp, sp, -20
	sw a0, 16(sp)
	sw a1, 12(sp)
	sw a2, 8(sp)
	sw a3, 4(sp)

    li a0, 64 # write syscall
    li a1, 1 # stdout
    li a3, 1 # number of characters to write

    la a2, unused # write syscall buffer to unused .data section
    sw a0, 0(a2)
    sw a1, 8(a2)
    mv t1, t2
    la t2, unused+32 # write character to unused+32 and load that address into a2
    sb t1, 0(t2)
    sw t2, 16(a2)
    sw a3, 24(a2)

    la t1, tohost # write buffer to tohost symbol
    sw a2, 0(t1)

    la t1, fromhost # spin until we get a non-zero response from fromhost
1:  lw a2, 0(t1)
    beqz a2, 1b
    sw zero, 0(t1) # set fromhost to zero again

	lw a3, 4(sp)
	lw a2, 8(sp)
	lw a1, 12(sp)
	lw a0, 16(sp)
	addi sp, sp, 20

    ret

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
.endm

# print the character in argument c
.macro Putchar_imm c
    li t2, \c # load character to write
    call putchar_imm # call putchar here or unrolled loop cost will be huge!
.endm

# print the character in argument reg
.macro Putchar_reg reg
	mv t2, \reg
	call putchar_imm
.endm
