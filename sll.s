.macro sll_tests
    Test_Rd_Rs1_Rs2 sll, logic_1, REG, sll, 0x00000001, 0x00000001, 0
    Test_Rd_Rs1_Rs2 sll, logic_2, REG, sll, 0x00000002, 0x00000001, 1
    Test_Rd_Rs1_Rs2 sll, logic_3, REG, sll, 0x00000080, 0x00000001, 7
    Test_Rd_Rs1_Rs2 sll, logic_4, REG, sll, 0x00004000, 0x00000001, 14
    Test_Rd_Rs1_Rs2 sll, logic_5, REG, sll, 0x80000000, 0x00000001, 31
    Test_Rd_Rs1_Rs2 sll, logic_6, REG, sll, 0xffffffff, 0xffffffff, 0
    Test_Rd_Rs1_Rs2 sll, logic_7, REG, sll, 0xfffffffe, 0xffffffff, 1
    Test_Rd_Rs1_Rs2 sll, logic_8, REG, sll, 0xffffff80, 0xffffffff, 7
    Test_Rd_Rs1_Rs2 sll, logic_9, REG, sll, 0xffffc000, 0xffffffff, 14
    Test_Rd_Rs1_Rs2 sll, logic_10, REG, sll, 0x80000000, 0xffffffff, 31
    Test_Rd_Rs1_Rs2 sll, logic_11, REG, sll, 0x21212121, 0x21212121, 0
    Test_Rd_Rs1_Rs2 sll, logic_12, REG, sll, 0x42424242, 0x21212121, 1
    Test_Rd_Rs1_Rs2 sll, logic_13, REG, sll, 0x90909080, 0x21212121, 7
    Test_Rd_Rs1_Rs2 sll, logic_14, REG, sll, 0x48484000, 0x21212121, 14
    Test_Rd_Rs1_Rs2 sll, logic_15, REG, sll, 0x80000000, 0x21212121, 31

    # ensure that shifts only use lower 5 bits
    Test_Rd_Rs1_Rs2 sll, low_bits_1, REG, sll, 0x21212121, 0x21212121, 0xffffffe0
    Test_Rd_Rs1_Rs2 sll, low_bits_2, REG, sll, 0x42424242, 0x21212121, 0xffffffe1
    Test_Rd_Rs1_Rs2 sll, low_bits_3, REG, sll, 0x90909080, 0x21212121, 0xffffffe7
    Test_Rd_Rs1_Rs2 sll, low_bits_4, REG, sll, 0x48484000, 0x21212121, 0xffffffee
    Test_Rd_Rs1_Rs2 sll, low_bits_5, REG, sll, 0x00000000, 0x21212120, 0xffffffff

    Test_Rs1_Rs1_Rs2 sll, shared_1, REG, sll, 0x00000080, 0x00000001, 7
    Test_Rs2_Rs1_Rs2 sll, shared_2, sll, 0x00004000, 0x00000001, 14
    Test_Rs1_Rs1_Rs1 sll, shared_3, sll, 24, 3

    Test_Rd_Bypass sll, dst_byp_1, 0, REG, sll, 0x00000080, 0x00000001, 7
    Test_Rd_Bypass sll, dst_byp_2, 1, REG, sll, 0x00004000, 0x00000001, 14
    Test_Rd_Bypass sll, dst_byp_3, 2, REG, sll, 0x80000000, 0x00000001, 31

    Test_Rs1_Bypass sll, src_byp_1, 0, 0, REG, sll, 0x00000080, 0x00000001, 7
    Test_Rs1_Bypass sll, src_byp_2, 0, 1, REG, sll, 0x00004000, 0x00000001, 14
    Test_Rs1_Bypass sll, src_byp_3, 0, 2, REG, sll, 0x80000000, 0x00000001, 31
    Test_Rs1_Bypass sll, src_byp_4, 1, 0, REG, sll, 0x00000080, 0x00000001, 7
    Test_Rs1_Bypass sll, src_byp_5, 1, 1, REG, sll, 0x00004000, 0x00000001, 14
    Test_Rs1_Bypass sll, src_byp_6, 2, 0, REG, sll, 0x80000000, 0x00000001, 31
    Test_Rs2_Bypass sll, src_byp_7, 0, 0, sll, 0x00000080, 0x00000001, 7
    Test_Rs2_Bypass sll, src_byp_8, 0, 1, sll, 0x00004000, 0x00000001, 14
    Test_Rs2_Bypass sll, src_byp_9, 0, 2, sll, 0x80000000, 0x00000001, 31
    Test_Rs2_Bypass sll, src_byp_10, 1, 0, sll, 0x00000080, 0x00000001, 7
    Test_Rs2_Bypass sll, src_byp_11, 1, 1, sll, 0x00004000, 0x00000001, 14
    Test_Rs2_Bypass sll, src_byp_12, 2, 0, sll, 0x80000000, 0x00000001, 31

    Test_Rd_Rs1_Zero sll, zero_1, sll, 32, 32
    Test_Rd_Zero_Rs2 sll, zero_2, sll, 0, 15
    Test_Rd_Zero_Zero sll, zero_3, sll, 0
    Test_Zero_Rs1_Rs2 sll, zero_4, REG, sll, 1024, 2048
.endm
