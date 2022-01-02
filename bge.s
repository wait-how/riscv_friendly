.macro bge_tests
    Test_Branch_Taken bge, taken_1, bge, 0, 0
    Test_Branch_Taken bge, taken_2, bge, 1, 1
    Test_Branch_Taken bge, taken_3, bge, -1, -1
    Test_Branch_Taken bge, taken_4, bge, 1, 0
    Test_Branch_Taken bge, taken_5, bge, 1, -1
    Test_Branch_Taken bge, taken_6, bge, -1, -2

    Test_Branch_Not_Taken bge, not_taken_1, bge, 0, 1
    Test_Branch_Not_Taken bge, not_taken_2, bge, -1, 1
    Test_Branch_Not_Taken bge, not_taken_3, bge, -2, -1
    Test_Branch_Not_Taken bge, not_taken_4, bge, -2, 1

    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_1, 0, 0, bge, -1, 0
    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_2, 0, 1, bge, -1, 0
    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_3, 0, 2, bge, -1, 0
    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_4, 1, 0, bge, -1, 0
    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_5, 1, 1, bge, -1, 0
    Test_Branch_Not_Taken_Rs1_Bypass bge, src_byp_6, 2, 0, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_7, 0, 0, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_8, 0, 1, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_9, 0, 2, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_10, 1, 0, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_11, 1, 1, bge, -1, 0
    Test_Branch_Not_Taken_Rs2_Bypass bge, src_byp_12, 2, 0, bge, -1, 0

    Test_Seq bge, delay_slot_1, "li a1, 3; li a0, 1; bge zero, zero, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
