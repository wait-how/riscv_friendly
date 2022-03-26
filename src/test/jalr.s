.macro jalr_tests

    Suite_Setup jalr

	Test_Setup jalr, jalr_jump_1

    li ra, 0
    la a0, 2f # same as "la a0, 2f" but entirely pc-relative
    li a2, 0
1:  jalr a0
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
    addi a2, a2, 1
2:  la a1, 1b
    addi a1, a1, 4
    Assert_eq ra, a1
    Assert_eq a2, zero

	Test_Setup jalr, jalr_jump_zero

    li ra, 0
    la a0, 1f # same as "la a0, 1f" but entirely pc-relative
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

    Test_Seq jalr, delay_slot_1, "li a1, 3; li a0, 1; la a2, 1f; jalr a2; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
    Test_Seq jalr, delay_slot_2, "li a1, 3; li a0, 1; la a2, 1f; jr a2; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
