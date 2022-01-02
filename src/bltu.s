.macro bltu_tests
    Test_Branch_Taken bltu, taken_1, bltu, 0x00000000, 0x00000001
    Test_Branch_Taken bltu, taken_2, bltu, 0xfffffffe, 0xffffffff
    Test_Branch_Taken bltu, taken_3, bltu, 0x00000000, 0xffffffff

    Test_Branch_Not_Taken bltu, not_taken_1, bltu, 0x00000001, 0x00000000
    Test_Branch_Not_Taken bltu, not_taken_2, bltu, 0xffffffff, 0xfffffffe
    Test_Branch_Not_Taken bltu, not_taken_3, bltu, 0xffffffff, 0x00000000
    Test_Branch_Not_Taken bltu, not_taken_4, bltu, 0x80000000, 0x7fffffff

    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_1, 0, 0, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_2, 0, 1, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_3, 0, 2, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_4, 1, 0, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_5, 1, 1, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs1_Bypass bltu, src_byp_6, 2, 0, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_7, 0, 0, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_8, 0, 1, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_9, 0, 2, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_10, 1, 0, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_11, 1, 1, bltu, 0xf0000000, 0xefffffff
    Test_Branch_Not_Taken_Rs2_Bypass bltu, src_byp_12, 2, 0, bltu, 0xf0000000, 0xefffffff

    Test_Seq bltu, delay_slot_1, "li a1, 3; li a0, 1; bltu zero, a0, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
