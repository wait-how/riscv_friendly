.macro bne_tests
    Test_Branch_Taken bne, taken_1, bne, 0, 1
    Test_Branch_Taken bne, taken_2, bne, 1, 0
    Test_Branch_Taken bne, taken_3, bne, -1, 1
    Test_Branch_Taken bne, taken_4, bne, 1, -1

    Test_Branch_Not_Taken bne, not_taken_1, bne, 0, 0
    Test_Branch_Not_Taken bne, not_taken_2, bne, 1, 1
    Test_Branch_Not_Taken bne, not_taken_3, bne, -1, -1

    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_1, 0, 0, bne, 0, 0
    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_2, 0, 1, bne, 0, 0
    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_3, 0, 2, bne, 0, 0
    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_4, 1, 0, bne, 0, 0
    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_5, 1, 1, bne, 0, 0
    Test_Branch_Not_Taken_Rs1_Bypass bne, src_byp_6, 2, 0, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_7, 0, 0, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_8, 0, 1, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_9, 0, 2, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_10, 1, 0, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_11, 1, 1, bne, 0, 0
    Test_Branch_Not_Taken_Rs2_Bypass bne, src_byp_12, 2, 0, bne, 0, 0

    Test_Seq bne, delay_slot_1, "li a1, 3; li a0, 1; bne zero, a0, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
