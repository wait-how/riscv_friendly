.macro sltiu_tests

    Suite_Setup sltiu

    Test_Rd_Rs1_Rs2 sltiu, unsigned_1, IMM, sltiu, 0, 0x00000000, 0x000
    Test_Rd_Rs1_Rs2 sltiu, unsigned_2, IMM, sltiu, 0, 0x00000001, 0x001
    Test_Rd_Rs1_Rs2 sltiu, unsigned_3, IMM, sltiu, 1, 0x00000003, 0x007
    Test_Rd_Rs1_Rs2 sltiu, unsigned_4, IMM, sltiu, 0, 0x00000007, 0x003

    Test_Rd_Rs1_Rs2 sltiu, signed_1, IMM, sltiu, 1, 0x00000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 sltiu, signed_2, IMM, sltiu, 0, 0x80000000, 0x000
    Test_Rd_Rs1_Rs2 sltiu, signed_3, IMM, sltiu, 1, 0x80000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 sltiu, signed_4, IMM, sltiu, 1, 0x00000000, 0x7ff
    Test_Rd_Rs1_Rs2 sltiu, signed_5, IMM, sltiu, 0, 0x7fffffff, 0x000
    Test_Rd_Rs1_Rs2 sltiu, signed_6, IMM, sltiu, 0, 0x7fffffff, 0x7ff
    Test_Rd_Rs1_Rs2 sltiu, signed_7, IMM, sltiu, 0, 0x80000000, 0x7ff
    Test_Rd_Rs1_Rs2 sltiu, signed_8, IMM, sltiu, 1, 0x7fffffff, -2048 # 0x800
    Test_Rd_Rs1_Rs2 sltiu, signed_9, IMM, sltiu, 1, 0x00000000, -1 # 0xfff
    Test_Rd_Rs1_Rs2 sltiu, signed_10, IMM, sltiu, 0, 0xffffffff, 0x001
    Test_Rd_Rs1_Rs2 sltiu, signed_11, IMM, sltiu, 0, 0xffffffff, -1 # 0xfff

    Test_Rs1_Rs1_Rs2 sltiu, shared_1, IMM, sltiu, 1, 11, 13

    Test_Rd_Bypass sltiu, dst_byp_1, 0, IMM, sltiu, 0, 15, 10
    Test_Rd_Bypass sltiu, dst_byp_2, 1, IMM, sltiu, 1, 10, 16
    Test_Rd_Bypass sltiu, dst_byp_3, 2, IMM, sltiu, 0, 16, 9

    Test_Rs1_Bypass sltiu, src_byp_1, 0, null, IMM, sltiu, 1, 11, 15
    Test_Rs1_Bypass sltiu, src_byp_2, 1, null, IMM, sltiu, 0, 17, 8
    Test_Rs1_Bypass sltiu, src_byp_3, 2, null, IMM, sltiu, 1, 12, 14

    Test_Rd_Zero_Imm sltiu, zero_1, sltiu, 1, -1 # 0xfff
    Test_Zero_Rs1_Rs2 sltiu, zero_2, IMM, sltiu, 0x00ff00ff, -1 # 0xfff
.endm
