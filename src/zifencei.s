# Fence instructions

.macro zifencei_tests
zifencei_exec_1:
    li a2, 0
    li a3, 3

    li a0, 0x00160613 # hex for addi a2, a2, 1
    la a1, 1f
    sw a0, 0(a1)
    la a1, 3f
    sw a0, 0(a1)
    la a1, 5f
    sw a0, 0(a1)
    fence rw, rw # ensure all harts see instruction writes from this hart
    fence.i
zifencei_code_1:
1:  nop
2:  nop
3:  nop
4:  nop
5:  nop
6:  nop
Assert_eq a2, a3
.endm
