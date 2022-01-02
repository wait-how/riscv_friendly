.macro slti_sltiu_tests
    Test_Rd_Rs1_Rs2 slti, unsigned_1, IMM, slti, 0, 0x00000000, 0x000
    Test_Rd_Rs1_Rs2 slti, unsigned_2, IMM, slti, 0, 0x00000001, 0x001
    Test_Rd_Rs1_Rs2 slti, unsigned_3, IMM, slti, 1, 0x00000003, 0x007
    Test_Rd_Rs1_Rs2 slti, unsigned_4, IMM, slti, 0, 0x00000007, 0x003

    Test_Rd_Rs1_Rs2 slti, signed_1, IMM, slti, 0, 0x00000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 slti, signed_2, IMM, slti, 1, 0x80000000, 0x000
    Test_Rd_Rs1_Rs2 slti, signed_3, IMM, slti, 1, 0x80000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 slti, signed_4, IMM, slti, 1, 0x00000000, 0x7ff
    Test_Rd_Rs1_Rs2 slti, signed_5, IMM, slti, 0, 0x7fffffff, 0x000
    Test_Rd_Rs1_Rs2 slti, signed_6, IMM, slti, 0, 0x7fffffff, 0x7ff
    Test_Rd_Rs1_Rs2 slti, signed_7, IMM, slti, 1, 0x80000000, 0x7ff
    Test_Rd_Rs1_Rs2 slti, signed_8, IMM, slti, 0, 0x7fffffff, -2048 # 0x800
    Test_Rd_Rs1_Rs2 slti, signed_9, IMM, slti, 0, 0x00000000, -1 # 0xfff
    Test_Rd_Rs1_Rs2 slti, signed_10, IMM, slti, 1, 0xffffffff, 0x001
    Test_Rd_Rs1_Rs2 slti, signed_11, IMM, slti, 0, 0xffffffff, -1 # 0xfff

    Test_Rs1_Rs1_Rs2 slti, shared_1, IMM, slti, 1, 11, 13

    Test_Rd_Bypass slti, dst_byp_1, 0, IMM, slti, 0, 15, 10
    Test_Rd_Bypass slti, dst_byp_2, 1, IMM, slti, 1, 10, 16
    Test_Rd_Bypass slti, dst_byp_3, 2, IMM, slti, 0, 16, 9

    Test_Rs1_Bypass slti, src_byp_1, 0, -1, IMM, slti, 1, 11, 15
    Test_Rs1_Bypass slti, src_byp_2, 1, -1, IMM, slti, 0, 17, 8
    Test_Rs1_Bypass slti, src_byp_3, 2, -1, IMM, slti, 1, 12, 14

    Test_Rd_Zero_Imm slti, zero_1, slti, 0, -1 # 0xfff
    Test_Zero_Rs1_Rs2 slti, zero_2, IMM, slti, 0x00ff00ff, -1 # 0xfff
.endm
