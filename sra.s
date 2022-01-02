.macro sra_tests
    Test_Rd_Rs1_Rs2 sra, logic_1, REG, sra, 0x80000000, 0x80000000, 0
    Test_Rd_Rs1_Rs2 sra, logic_2, REG, sra, 0xc0000000, 0x80000000, 1
    Test_Rd_Rs1_Rs2 sra, logic_3, REG, sra, 0xff000000, 0x80000000, 7
    Test_Rd_Rs1_Rs2 sra, logic_4, REG, sra, 0xfffe0000, 0x80000000, 14
    Test_Rd_Rs1_Rs2 sra, logic_5, REG, sra, 0xffffffff, 0x80000001, 31
    Test_Rd_Rs1_Rs2 sra, logic_6, REG, sra, 0x7fffffff, 0x7fffffff, 0
    Test_Rd_Rs1_Rs2 sra, logic_7, REG, sra, 0x3fffffff, 0x7fffffff, 1
    Test_Rd_Rs1_Rs2 sra, logic_8, REG, sra, 0x00ffffff, 0x7fffffff, 7
    Test_Rd_Rs1_Rs2 sra, logic_9, REG, sra, 0x0001ffff, 0x7fffffff, 14
    Test_Rd_Rs1_Rs2 sra, logic_10, REG, sra, 0x00000000, 0x7fffffff, 31
    Test_Rd_Rs1_Rs2 sra, logic_11, REG, sra, 0x81818181, 0x81818181, 0
    Test_Rd_Rs1_Rs2 sra, logic_12, REG, sra, 0xc0c0c0c0, 0x81818181, 1
    Test_Rd_Rs1_Rs2 sra, logic_13, REG, sra, 0xff030303, 0x81818181, 7
    Test_Rd_Rs1_Rs2 sra, logic_14, REG, sra, 0xfffe0606, 0x81818181, 14
    Test_Rd_Rs1_Rs2 sra, logic_15, REG, sra, 0xffffffff, 0x81818181, 31

    # ensure that shifts only use lower 5 bits
    Test_Rd_Rs1_Rs2 sra, low_bits_1, REG, sra, 0x81818181, 0x81818181, 0xffffffc0
    Test_Rd_Rs1_Rs2 sra, low_bits_2, REG, sra, 0xc0c0c0c0, 0x81818181, 0xffffffc1
    Test_Rd_Rs1_Rs2 sra, low_bits_3, REG, sra, 0xff030303, 0x81818181, 0xffffffc7
    Test_Rd_Rs1_Rs2 sra, low_bits_4, REG, sra, 0xfffe0606, 0x81818181, 0xffffffce
    Test_Rd_Rs1_Rs2 sra, low_bits_5, REG, sra, 0xffffffff, 0x81818181, 0xffffffff

    Test_Rs1_Rs1_Rs2 sra, shared_1, REG, sra, 0xff000000, 0x80000000, 7
    Test_Rs2_Rs1_Rs2 sra, shared_2, sra, 0xfffe0000, 0x80000000, 14
    Test_Rs1_Rs1_Rs1 sra, shared_3, sra, 0, 7

    Test_Rd_Bypass sra, dst_byp_1, 0, REG, sra, 0xff000000, 0x80000000, 7
    Test_Rd_Bypass sra, dst_byp_2, 1, REG, sra, 0xfffe0000, 0x80000000, 14
    Test_Rd_Bypass sra, dst_byp_3, 2, REG, sra, 0xffffffff, 0x80000000, 31

    Test_Rs1_Bypass sra, src_byp_1, 0, 0, REG, sra, 0xff000000, 0x80000000, 7
    Test_Rs1_Bypass sra, src_byp_2, 0, 1, REG, sra, 0xfffe0000, 0x80000000, 14
    Test_Rs1_Bypass sra, src_byp_3, 0, 2, REG, sra, 0xffffffff, 0x80000000, 31
    Test_Rs1_Bypass sra, src_byp_4, 1, 0, REG, sra, 0xff000000, 0x80000000, 7
    Test_Rs1_Bypass sra, src_byp_5, 1, 1, REG, sra, 0xfffe0000, 0x80000000, 14
    Test_Rs1_Bypass sra, src_byp_6, 2, 0, REG, sra, 0xffffffff, 0x80000000, 31
    Test_Rs2_Bypass sra, src_byp_7, 0, 0, sra, 0xff000000, 0x80000000, 7
    Test_Rs2_Bypass sra, src_byp_8, 0, 1, sra, 0xfffe0000, 0x80000000, 14
    Test_Rs2_Bypass sra, src_byp_9, 0, 2, sra, 0xffffffff, 0x80000000, 31
    Test_Rs2_Bypass sra, src_byp_10, 1, 0, sra, 0xff000000, 0x80000000, 7
    Test_Rs2_Bypass sra, src_byp_11, 1, 1, sra, 0xfffe0000, 0x80000000, 14
    Test_Rs2_Bypass sra, src_byp_12, 2, 0, sra, 0xffffffff, 0x80000000, 31

    Test_Rd_Rs1_Zero sra, zero_1, sra, 32, 32
    Test_Rd_Zero_Rs2 sra, zero_2, sra, 0, 15
    Test_Rd_Zero_Zero sra, zero_3, sra, 0
    Test_Zero_Rs1_Rs2 sra, zero_4, REG, sra, 1024, 2048
.endm
