.macro sub_tests
    Test_Rd_Rs1_Rs2 sub, arith_1, REG, sub, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 sub, arith_2, REG, sub, 0x00000000, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 sub, arith_3, REG, sub, 0xfffffffc, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 sub, arith_4, REG, sub, 0x00008000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 sub, arith_5, REG, sub, 0x80000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 sub, arith_6, REG, sub, 0x80008000, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 sub, arith_7, REG, sub, 0xffff8001, 0x00000000, 0x00007fff
    Test_Rd_Rs1_Rs2 sub, arith_8, REG, sub, 0x7fffffff, 0x7fffffff, 0x00000000
    Test_Rd_Rs1_Rs2 sub, arith_9, REG, sub, 0x7fff8000, 0x7fffffff, 0x00007fff
    Test_Rd_Rs1_Rs2 sub, arith_10, REG, sub, 0x7fff8001, 0x80000000, 0x00007fff
    Test_Rd_Rs1_Rs2 sub, arith_11, REG, sub, 0x80007fff, 0x7fffffff, 0xffff8000
    Test_Rd_Rs1_Rs2 sub, arith_12, REG, sub, 0x00000001, 0x00000000, 0xffffffff
    Test_Rd_Rs1_Rs2 sub, arith_13, REG, sub, 0xfffffffe, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 sub, arith_14, REG, sub, 0x00000000, 0xffffffff, 0xffffffff

    Test_Rs1_Rs1_Rs2 sub, shared_1, REG, sub, 2, 13, 11
    Test_Rs2_Rs1_Rs2 sub, shared_2, sub, 3, 14, 11
    Test_Rs1_Rs1_Rs1 sub, shared_3, sub, 0, 13

    Test_Rd_Bypass sub, dst_byp_1, 0, REG, sub, 2, 13, 11
    Test_Rd_Bypass sub, dst_byp_2, 1, REG, sub, 3, 14, 11
    Test_Rd_Bypass sub, dst_byp_3, 2, REG, sub, 4, 15, 11

    Test_Rs1_Bypass sub, src_byp_1, 0, 0, REG, sub, 2, 13, 11
    Test_Rs1_Bypass sub, src_byp_2, 0, 1, REG, sub, 3, 14, 11
    Test_Rs1_Bypass sub, src_byp_3, 0, 2, REG, sub, 4, 15, 11
    Test_Rs1_Bypass sub, src_byp_4, 1, 0, REG, sub, 2, 13, 11
    Test_Rs1_Bypass sub, src_byp_5, 1, 1, REG, sub, 3, 14, 11
    Test_Rs1_Bypass sub, src_byp_6, 2, 0, REG, sub, 4, 15, 11
    Test_Rs2_Bypass sub, src_byp_7, 0, 0, sub, 2, 13, 11
    Test_Rs2_Bypass sub, src_byp_8, 0, 1, sub, 3, 14, 11
    Test_Rs2_Bypass sub, src_byp_9, 0, 2, sub, 4, 15, 11
    Test_Rs2_Bypass sub, src_byp_10, 1, 0, sub, 2, 13, 11
    Test_Rs2_Bypass sub, src_byp_11, 1, 1, sub, 3, 14, 11
    Test_Rs2_Bypass sub, src_byp_12, 2, 0, sub, 4, 15, 11

    # zero register
    Test_Rd_Rs1_Zero sub, zero_1, sub, 15, 15
    Test_Rd_Zero_Rs2 sub, zero_2, sub, 32, -32
    Test_Rd_Zero_Zero sub, zero_3, sub, 0
    Test_Zero_Rs1_Rs2 sub, zero_4, REG, sub, 16, 30
.endm
