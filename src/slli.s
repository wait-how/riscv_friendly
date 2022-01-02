.macro slli_tests
    Test_Rd_Rs1_Rs2 slli, logic_1, IMM, slli, 0x00000001, 0x00000001, 0
    Test_Rd_Rs1_Rs2 slli, logic_2, IMM, slli, 0x00000002, 0x00000001, 1
    Test_Rd_Rs1_Rs2 slli, logic_3, IMM, slli, 0x00000080, 0x00000001, 7
    Test_Rd_Rs1_Rs2 slli, logic_4, IMM, slli, 0x00004000, 0x00000001, 14
    Test_Rd_Rs1_Rs2 slli, logic_5, IMM, slli, 0x80000000, 0x00000001, 31
    Test_Rd_Rs1_Rs2 slli, logic_6, IMM, slli, 0xffffffff, 0xffffffff, 0
    Test_Rd_Rs1_Rs2 slli, logic_7, IMM, slli, 0xfffffffe, 0xffffffff, 1
    Test_Rd_Rs1_Rs2 slli, logic_8, IMM, slli, 0xffffff80, 0xffffffff, 7 
    Test_Rd_Rs1_Rs2 slli, logic_9, IMM, slli, 0xffffc000, 0xffffffff, 14
    Test_Rd_Rs1_Rs2 slli, logic_10, IMM, slli, 0x80000000, 0xffffffff, 31
    Test_Rd_Rs1_Rs2 slli, logic_11, IMM, slli, 0x21212121, 0x21212121, 0
    Test_Rd_Rs1_Rs2 slli, logic_12, IMM, slli, 0x42424242, 0x21212121, 1
    Test_Rd_Rs1_Rs2 slli, logic_13, IMM, slli, 0x90909080, 0x21212121, 7
    Test_Rd_Rs1_Rs2 slli, logic_14, IMM, slli, 0x48484000, 0x21212121, 14
    Test_Rd_Rs1_Rs2 slli, logic_15, IMM, slli, 0x80000000, 0x21212121, 31

    Test_Rs1_Rs1_Rs2 slli, shared_1, IMM, slli, 0x00000080, 0x00000001, 7

    Test_Rd_Bypass slli, dst_byp_1, 0, IMM, slli, 0x00000080, 0x00000001, 7
    Test_Rd_Bypass slli, dst_byp_2, 1, IMM, slli, 0x00004000, 0x00000001, 14
    Test_Rd_Bypass slli, dst_byp_3, 2, IMM, slli, 0x80000000, 0x00000001, 31

    Test_Rs1_Bypass slli, src_byp_1, 0, -1, IMM, slli, 0x00000080, 0x00000001, 7
    Test_Rs1_Bypass slli, src_byp_2, 1, -1, IMM, slli, 0x00004000, 0x00000001, 14
    Test_Rs1_Bypass slli, src_byp_3, 2, -1, IMM, slli, 0x80000000, 0x00000001, 31

    Test_Rd_Zero_Imm slli, zero_1, slli, 0, 31
    Test_Zero_Rs1_Rs2 slli, zero_2, IMM, slli, 33, 20

.endm
