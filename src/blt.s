.macro blt_tests
    Test_Branch_Taken blt, taken_1, blt, 0, 1
    Test_Branch_Taken blt, taken_2, blt, -1, 1
    Test_Branch_Taken blt, taken_3, blt, -2, -1

    Test_Branch_Not_Taken blt, not_taken_1, blt, 1, 0
    Test_Branch_Not_Taken blt, not_taken_2, blt, 1, -1
    Test_Branch_Not_Taken blt, not_taken_3, blt, -1, -2
    Test_Branch_Not_Taken blt, not_taken_4, blt, 1, -2

    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_1, 0, 0, blt, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_2, 0, 1, blt, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_3, 0, 2, blt, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_4, 1, 0, blt, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_5, 1, 1, blt, 0, -1
    Test_Branch_Not_Taken_Rs1_Bypass blt, src_byp_6, 2, 0, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_7, 0, 0, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_8, 0, 1, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_9, 0, 2, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_10, 1, 0, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_11, 1, 1, blt, 0, -1
    Test_Branch_Not_Taken_Rs2_Bypass blt, src_byp_12, 2, 0, blt, 0, -1

    Test_Seq blt, delay_slot_1, "li a1, 3; li a0, 1; blt zero, a0, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
