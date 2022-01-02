.macro slt_tests
    Test_Rd_Rs1_Rs2 slt, unsigned_1, REG, slt, 0, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 slt, unsigned_2, REG, slt, 0, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 slt, unsigned_3, REG, slt, 1, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 slt, unsigned_4, REG, slt, 0, 0x00000007, 0x00000003
    Test_Rd_Rs1_Rs2 slt, signed_1, REG, slt, 0, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 slt, signed_2, REG, slt, 1, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 slt, signed_3, REG, slt, 1, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 slt, signed_4, REG, slt, 1, 0x00000000, 0x00007fff
    Test_Rd_Rs1_Rs2 slt, signed_5, REG, slt, 0, 0x7fffffff, 0x00000000
    Test_Rd_Rs1_Rs2 slt, signed_6, REG, slt, 0, 0x7fffffff, 0x00007fff
    Test_Rd_Rs1_Rs2 slt, signed_7, REG, slt, 1, 0x80000000, 0x00007fff
    Test_Rd_Rs1_Rs2 slt, signed_8, REG, slt, 0, 0x7fffffff, 0xffff8000
    Test_Rd_Rs1_Rs2 slt, signed_9, REG, slt, 0, 0x00000000, 0xffffffff
    Test_Rd_Rs1_Rs2 slt, signed_10, REG, slt, 1, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 slt, signed_11, REG, slt, 0, 0xffffffff, 0xffffffff

    Test_Rs1_Rs1_Rs2 slt, shared_1, REG, slt, 0, 14, 13
    Test_Rs2_Rs1_Rs2 slt, shared_2, slt, 1, 11, 13
    Test_Rs1_Rs1_Rs1 slt, shared_3, slt, 0, 13

    Test_Rd_Bypass slt, dst_byp_1, 0, REG, slt, 1, 11, 13
    Test_Rd_Bypass slt, dst_byp_2, 1, REG, slt, 0, 14, 13
    Test_Rd_Bypass slt, dst_byp_3, 2, REG, slt, 1, 12, 13

    Test_Rs1_Bypass slt, src_byp_1, 0, 0, REG, slt, 0, 14, 13
    Test_Rs1_Bypass slt, src_byp_2, 0, 1, REG, slt, 1, 11, 13
    Test_Rs1_Bypass slt, src_byp_3, 0, 2, REG, slt, 0, 15, 13
    Test_Rs1_Bypass slt, src_byp_4, 1, 0, REG, slt, 1, 10, 13
    Test_Rs1_Bypass slt, src_byp_5, 1, 1, REG, slt, 0, 16, 13
    Test_Rs1_Bypass slt, src_byp_6, 2, 0, REG, slt, 1,  9, 13
    Test_Rs2_Bypass slt, src_byp_7, 0, 0, slt, 0, 14, 13
    Test_Rs2_Bypass slt, src_byp_8, 0, 1, slt, 1, 11, 13
    Test_Rs2_Bypass slt, src_byp_9, 0, 2, slt, 0, 15, 13
    Test_Rs2_Bypass slt, src_byp_10, 1, 0, slt, 1, 10, 13
    Test_Rs2_Bypass slt, src_byp_11, 1, 1, slt, 0, 16, 13
    Test_Rs2_Bypass slt, src_byp_12, 2, 0, slt, 1,  9, 13

    Test_Rd_Zero_Rs2 slt, zero_1, slt, 0, -1
    Test_Rd_Rs1_Zero slt, zero_2, slt, 1, -1
    Test_Rd_Zero_Zero slt, zero_3, slt, 0
    Test_Zero_Rs1_Rs2 slt, zero_4, REG, slt, 16, 30
.endm
