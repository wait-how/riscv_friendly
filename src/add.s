.macro add_tests
    Test_Rd_Rs1_Rs2 add, arith_1, REG, add, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 add, arith_2, REG, add, 0x00000002, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 add, arith_3, REG, add, 0x0000000a, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 add, arith_4, REG, add, 0xffff8000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 add, arith_5, REG, add, 0x80000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 add, arith_6, REG, add, 0x7fff8000, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 add, arith_7, REG, add, 0x00007fff, 0x00000000, 0x00007fff
    Test_Rd_Rs1_Rs2 add, arith_8, REG, add, 0x7fffffff, 0x7fffffff, 0x00000000
    Test_Rd_Rs1_Rs2 add, arith_9, REG, add, 0x80007ffe, 0x7fffffff, 0x00007fff
    Test_Rd_Rs1_Rs2 add, arith_10, REG, add, 0x80007fff, 0x80000000, 0x00007fff
    Test_Rd_Rs1_Rs2 add, arith_11, REG, add, 0x7fff7fff, 0x7fffffff, 0xffff8000
    Test_Rd_Rs1_Rs2 add, arith_12, REG, add, 0xffffffff, 0x00000000, 0xffffffff
    Test_Rd_Rs1_Rs2 add, arith_13, REG, add, 0x00000000, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 add, arith_14, REG, add, 0xfffffffe, 0xffffffff, 0xffffffff
    Test_Rd_Rs1_Rs2 add, arith_15, REG, add, 0x80000000, 0x00000001, 0x7fffffff

    Test_Rs1_Rs1_Rs2 add, shared_1, REG, add, 24, 13, 11
    Test_Rs2_Rs1_Rs2 add, shared_2, add, 25, 14, 11
    Test_Rs1_Rs1_Rs1 add, shared_3, add, 26, 13

    Test_Rd_Bypass add, dst_byp_1, 0, REG, add, 24, 13, 11
    Test_Rd_Bypass add, dst_byp_2, 1, REG, add, 25, 14, 11
    Test_Rd_Bypass add, dst_byp_3, 2, REG, add, 26, 15, 11

    Test_Rs1_Bypass add, src_byp_1, 0, 0, REG, add, 24, 13, 11
    Test_Rs1_Bypass add, src_byp_2, 0, 1, REG, add, 25, 14, 11
    Test_Rs1_Bypass add, src_byp_3, 0, 2, REG, add, 26, 15, 11
    Test_Rs1_Bypass add, src_byp_4, 1, 0, REG, add, 24, 13, 11
    Test_Rs1_Bypass add, src_byp_5, 1, 1, REG, add, 25, 14, 11
    Test_Rs1_Bypass add, src_byp_6, 2, 0, REG, add, 26, 15, 11
    Test_Rs2_Bypass add, src_byp_7, 0, 0, add, 24, 13, 11
    Test_Rs2_Bypass add, src_byp_8, 0, 1, add, 25, 14, 11
    Test_Rs2_Bypass add, src_byp_9, 0, 2, add, 26, 15, 11
    Test_Rs2_Bypass add, src_byp_10, 1, 0, add, 24, 13, 11
    Test_Rs2_Bypass add, src_byp_11, 1, 1, add, 25, 14, 11
    Test_Rs2_Bypass add, src_byp_12, 2, 0, add, 26, 15, 11

    Test_Rd_Rs1_Zero add, zero_1, add, 15, 15
    Test_Rd_Zero_Rs2 add, zero_2, add, 32, 32
    Test_Rd_Zero_Zero add, zero_3, add, 0
    Test_Zero_Rs1_Rs2 add, zero_4, REG, add, 16, 30
    
.endm
