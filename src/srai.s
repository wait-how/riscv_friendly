.macro srai_tests
    Test_Rd_Rs1_Rs2 srai, logic_1, IMM, srai, 0x00000000, 0x00000000, 0
    Test_Rd_Rs1_Rs2 srai, logic_2, IMM, srai, 0xc0000000, 0x80000000, 1
    Test_Rd_Rs1_Rs2 srai, logic_3, IMM, srai, 0xff000000, 0x80000000, 7
    Test_Rd_Rs1_Rs2 srai, logic_4, IMM, srai, 0xfffe0000, 0x80000000, 14
    Test_Rd_Rs1_Rs2 srai, logic_5, IMM, srai, 0xffffffff, 0x80000001, 31
    Test_Rd_Rs1_Rs2 srai, logic_6, IMM, srai, 0x7fffffff, 0x7fffffff, 0
    Test_Rd_Rs1_Rs2 srai, logic_7, IMM, srai, 0x3fffffff, 0x7fffffff, 1
    Test_Rd_Rs1_Rs2 srai, logic_8, IMM, srai, 0x00ffffff, 0x7fffffff, 7
    Test_Rd_Rs1_Rs2 srai, logic_9, IMM, srai, 0x0001ffff, 0x7fffffff, 14
    Test_Rd_Rs1_Rs2 srai, logic_10, IMM, srai, 0x00000000, 0x7fffffff, 31
    Test_Rd_Rs1_Rs2 srai, logic_11, IMM, srai, 0x81818181, 0x81818181, 0
    Test_Rd_Rs1_Rs2 srai, logic_12, IMM, srai, 0xc0c0c0c0, 0x81818181, 1
    Test_Rd_Rs1_Rs2 srai, logic_13, IMM, srai, 0xff030303, 0x81818181, 7
    Test_Rd_Rs1_Rs2 srai, logic_14, IMM, srai, 0xfffe0606, 0x81818181, 14
    Test_Rd_Rs1_Rs2 srai, logic_15, IMM, srai, 0xffffffff, 0x81818181, 31

    Test_Rs1_Rs1_Rs2 srai, shared_1, IMM, srai, 0xff000000, 0x80000000, 7

    Test_Rd_Bypass srai, dst_byp_1, 0, IMM, srai, 0xff000000, 0x80000000, 7
    Test_Rd_Bypass srai, dst_byp_2, 1, IMM, srai, 0xfffe0000, 0x80000000, 14
    Test_Rd_Bypass srai, dst_byp_3, 2, IMM, srai, 0xffffffff, 0x80000001, 31

    Test_Rs1_Bypass srai, src_byp_1, 0, -1, IMM, srai, 0xff000000, 0x80000000, 7
    Test_Rs1_Bypass srai, src_byp_2, 1, -1, IMM, srai, 0xfffe0000, 0x80000000, 14
    Test_Rs1_Bypass srai, src_byp_3, 2, -1, IMM, srai, 0xffffffff, 0x80000001, 31

    Test_Rd_Zero_Imm srai, zero_1, srai, 0, 31
    Test_Zero_Rs1_Rs2 srai, zero_2, IMM, srai, 33, 20
.endm
