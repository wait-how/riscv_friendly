.macro bgeu_tests
    Test_Branch_Taken bgeu, taken_1, bgeu, 0x00000000, 0x00000000
    Test_Branch_Taken bgeu, taken_2, bgeu, 0x00000001, 0x00000001
    Test_Branch_Taken bgeu, taken_3, bgeu, 0xffffffff, 0xffffffff
    Test_Branch_Taken bgeu, taken_4, bgeu, 0x00000001, 0x00000000
    Test_Branch_Taken bgeu, taken_5, bgeu, 0xffffffff, 0xfffffffe
    Test_Branch_Taken bgeu, taken_6, bgeu, 0xffffffff, 0x00000000

    Test_Branch_Not_Taken bgeu, not_taken_1, bgeu, 0x00000000, 0x00000001
    Test_Branch_Not_Taken bgeu, not_taken_2, bgeu, 0xfffffffe, 0xffffffff
    Test_Branch_Not_Taken bgeu, not_taken_3, bgeu, 0x00000000, 0xffffffff
    Test_Branch_Not_Taken bgeu, not_taken_4, bgeu, 0x7fffffff, 0x80000000

    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_1, 0, 0, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_2, 0, 1, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_3, 0, 2, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_4, 1, 0, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_5, 1, 1, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs1_Bypass bgeu, src_byp_6, 2, 0, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_7, 0, 0, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_8, 0, 1, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_9, 0, 2, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_10, 1, 0, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_11, 1, 1, bgeu, 0xefffffff, 0xf0000000
    Test_Branch_Not_Taken_Rs2_Bypass bgeu, src_byp_12, 2, 0, bgeu, 0xefffffff, 0xf0000000

    Test_Seq bgeu, delay_slot_1, "li a1, 3; li a0, 1; bgeu zero, zero, 1f; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; addi a0, a0, 1; 1: addi a0, a0, 1; addi a0, a0, 1"
.endm
