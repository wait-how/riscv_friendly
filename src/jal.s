.macro jal_tests

    # using a manually constructed test here because the test is pretty specialized

jal_jump_1:
    li t0, 0xffffffff

    li ra, 0
    li a1, 0
jal_jump_addr:
    jal 1f
    addi a1, a1, 1
    addi a1, a1, 1
    addi a1, a1, 1
    addi a1, a1, 1
1:  la a0, jal_jump_addr
    addi a0, a0, 4
    Assert_eq ra, a0
    Assert_eq a1, zero

jal_jump_zero:
    li t0, 0xffffffff

    li ra, 0
    j 1f
    addi a1, a1, 1
    addi a1, a1, 1
    addi a1, a1, 1
    addi a1, a1, 1
1:  Assert_eq ra, zero
    Assert_eq a1, zero

    Test_Seq jal, delay_slot_1, "li a1, 3; li a0, 1; jal 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
    Test_Seq jal, delay_slot_2, "li a1, 3; li a0, 1; j 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
