.macro mul_tests

    Suite_Setup mul

    Test_Rd_Rs1_Rs2 mul, mul_1, REG, mul, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 mul, mul_2, REG, mul, 0x00000001, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 mul, mul_3, REG, mul, 0x00000015, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 mul, mul_4, REG, mul, 0x00000000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mul, mul_5, REG, mul, 0x00000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 mul, mul_6, REG, mul, 0x00000000, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mul, mul_7, REG, mul, 0x0000ff7f, 0xaaaaaaab, 0x0002fe7d
    Test_Rd_Rs1_Rs2 mul, mul_8, REG, mul, 0x0000ff7f, 0x0002fe7d, 0xaaaaaaab
    Test_Rd_Rs1_Rs2 mul, mul_9, REG, mul, 0x00000000, 0xff000000, 0xff000000
    Test_Rd_Rs1_Rs2 mul, mul_10, REG, mul, 0x00000001, 0xffffffff, 0xffffffff
    Test_Rd_Rs1_Rs2 mul, mul_11, REG, mul, 0xffffffff, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 mul, mul_12, REG, mul, 0xffffffff, 0x00000001, 0xffffffff

    Test_Rd_Rs1_Rs2 mul, long_mul_1, REG, mul, 0x00001200, 0x00007e00, 0xb6db6db7
    Test_Rd_Rs1_Rs2 mul, long_mul_2, REG, mul, 0x00001240, 0x00007fc0, 0xb6db6db7

    Test_Rs1_Rs1_Rs2 mul, shared_1, REG, mul, 143, 13, 11
    Test_Rs2_Rs1_Rs2 mul, shared_2, mul, 154, 14, 11
    Test_Rs1_Rs1_Rs1 mul, shared_3, mul, 169, 13

    Test_Rd_Bypass mul, dst_byp_1, 0, REG, mul, 143, 13, 11
    Test_Rd_Bypass mul, dst_byp_2, 1, REG, mul, 154, 14, 11
    Test_Rd_Bypass mul, dst_byp_3, 2, REG, mul, 165, 15, 11

    Test_Rs1_Bypass mul, src_byp_1, 0, 0, REG, mul, 143, 13, 11
    Test_Rs1_Bypass mul, src_byp_2, 0, 1, REG, mul, 154, 14, 11
    Test_Rs1_Bypass mul, src_byp_3, 0, 2, REG, mul, 165, 15, 11
    Test_Rs1_Bypass mul, src_byp_4, 1, 0, REG, mul, 143, 13, 11
    Test_Rs1_Bypass mul, src_byp_5, 1, 1, REG, mul, 154, 14, 11
    Test_Rs1_Bypass mul, src_byp_6, 2, 0, REG, mul, 165, 15, 11
    Test_Rs2_Bypass mul, src_byp_7, 0, 0, mul, 143, 13, 11
    Test_Rs2_Bypass mul, src_byp_8, 0, 1, mul, 154, 14, 11
    Test_Rs2_Bypass mul, src_byp_9, 0, 2, mul, 165, 15, 11
    Test_Rs2_Bypass mul, src_byp_10, 1, 0, mul, 143, 13, 11
    Test_Rs2_Bypass mul, src_byp_11, 1, 1, mul, 154, 14, 11
    Test_Rs2_Bypass mul, src_byp_12, 2, 0, mul, 165, 15, 11

    Test_Rd_Rs1_Zero mul, zero_1, mul, 0, 31
    Test_Rd_Zero_Rs2 mul, zero_2, mul, 0, 31
    Test_Rd_Zero_Zero mul, zero_3, mul, 0
    Test_Zero_Rs1_Rs2 mul, zero_4, REG, mul, 33, 34
.endm
