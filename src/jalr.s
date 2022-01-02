.macro jalr_tests

jalr_jump_1:
    li t0, 0xffffffff

    li ra, 0
    li a0, 20 # same as "la a0, 1f" but entirely pc-relative
    li a2, 0
jalr_jump_addr:
    jalr a0
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
1:  la a1, jalr_jump_addr
    addi a1, a1, 4
    Assert_eq ra, a1
    Assert_eq a2, zero

jalr_jump_zero:
    li t0, 0xffffffff

    li ra, 0
    li a0, 20 # same as "la a0, 1f" but entirely pc-relative
    li a2, 0
    jr a0
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
1:  Assert_eq ra, zero
    Assert_eq a2, zero

    Test_Jalr_Rs_Bypass jalr, src_byp_1, 0
    Test_Jalr_Rs_Bypass jalr, src_byp_2, 1
    Test_Jalr_Rs_Bypass jalr, src_byp_3, 2

    Test_Seq jalr, delay_slot_1, "li a1, 3; li a0, 1; li a2, 20; jalr a2; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1"
    Test_Seq jalr, delay_slot_2, "li a1, 3; li a0, 1; li a2, 20; jr a2; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1"
.endm
