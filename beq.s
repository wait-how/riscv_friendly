.macro beq_tests
    Test_Branch_Taken beq, taken_1, beq, 0, 0
    Test_Branch_Taken beq, taken_2, beq, 1, 1
    Test_Branch_Taken beq, taken_3, beq, -1, -1

    Test_Branch_Not_Taken beq, not_taken_1, beq, 0, 1
    Test_Branch_Not_Taken beq, not_taken_2, beq, 1, 0
    Test_Branch_Not_Taken beq, not_taken_3, beq, -1, 1
    Test_Branch_Not_Taken beq, not_taken_4, beq, 1, -1

    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_1, 0, 0, beq, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_2, 0, 1, beq, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_3, 0, 2, beq, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_4, 1, 0, beq, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_5, 1, 1, beq, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass beq, src_byp_6, 2, 0, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_7, 0, 0, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_8, 0, 1, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_9, 0, 2, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_10, 1, 0, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_11, 1, 1, beq, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass beq, src_byp_12, 2, 0, beq, 0, -1

    Test_Seq beq, delay_slot_1, "li a1, 3; li a0, 1; beq zero, zero, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
