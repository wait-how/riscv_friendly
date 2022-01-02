.macro srl_tests
    Test_Rd_Rs1_Rs2 srl, logic_1, REG, srl, 0xffff8000, 0xffff8000, 0
    Test_Rd_Rs1_Rs2 srl, logic_2, REG, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rd_Rs1_Rs2 srl, logic_3, REG, srl, 0x01ffff00, 0xffff8000, 7
    Test_Rd_Rs1_Rs2 srl, logic_4, REG, srl, 0x0003fffe, 0xffff8000, 14
    Test_Rd_Rs1_Rs2 srl, logic_5, REG, srl, 0x0001ffff, 0xffff8001, 15
    Test_Rd_Rs1_Rs2 srl, logic_6, REG, srl, 0xffffffff, 0xffffffff, 0
    Test_Rd_Rs1_Rs2 srl, logic_7, REG, srl, 0x7fffffff, 0xffffffff, 1
    Test_Rd_Rs1_Rs2 srl, logic_8, REG, srl, 0x01ffffff, 0xffffffff, 7
    Test_Rd_Rs1_Rs2 srl, logic_9, REG, srl, 0x0003ffff, 0xffffffff, 14
    Test_Rd_Rs1_Rs2 srl, logic_10, REG, srl, 0x00000001, 0xffffffff, 31
    Test_Rd_Rs1_Rs2 srl, logic_11, REG, srl, 0x21212121, 0x21212121, 0
    Test_Rd_Rs1_Rs2 srl, logic_12, REG, srl, 0x10909090, 0x21212121, 1
    Test_Rd_Rs1_Rs2 srl, logic_13, REG, srl, 0x00424242, 0x21212121, 7
    Test_Rd_Rs1_Rs2 srl, logic_14, REG, srl, 0x00008484, 0x21212121, 14
    Test_Rd_Rs1_Rs2 srl, logic_15, REG, srl, 0x00000000, 0x21212121, 31

    # ensure that shifts only use lower 5 bits
    Test_Rd_Rs1_Rs2 srl, low_bits_1, REG, srl, 0x21212121, 0x21212121, 0xffffffe0
    Test_Rd_Rs1_Rs2 srl, low_bits_2, REG, srl, 0x10909090, 0x21212121, 0xffffffe1
    Test_Rd_Rs1_Rs2 srl, low_bits_3, REG, srl, 0x00424242, 0x21212121, 0xffffffe7
    Test_Rd_Rs1_Rs2 srl, low_bits_4, REG, srl, 0x00008484, 0x21212121, 0xffffffee
    Test_Rd_Rs1_Rs2 srl, low_bits_5, REG, srl, 0x00000000, 0x21212121, 0xffffffff

    Test_Rs1_Rs1_Rs2 srl, shared_1, REG, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rs2_Rs1_Rs2 srl, shared_2, srl, 0x0003fffe, 0xffff8000, 14
    Test_Rs1_Rs1_Rs1 srl, shared_3, srl, 0, 7

    Test_Rd_Bypass srl, dst_byp_1, 0, REG, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rd_Bypass srl, dst_byp_2, 1, REG, srl, 0x0003fffe, 0xffff8000, 14
    Test_Rd_Bypass srl, dst_byp_3, 2, REG, srl, 0x0001ffff, 0xffff8000, 15

    Test_Rs1_Bypass srl, src_byp_1, 0, 0, REG, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rs1_Bypass srl, src_byp_2, 0, 1, REG, srl, 0x01ffff00, 0xffff8000, 7
    Test_Rs1_Bypass srl, src_byp_3, 0, 2, REG, srl, 0x0001ffff, 0xffff8000, 15
    Test_Rs1_Bypass srl, src_byp_4, 1, 0, REG, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rs1_Bypass srl, src_byp_5, 1, 1, REG, srl, 0x01ffff00, 0xffff8000, 7
    Test_Rs1_Bypass srl, src_byp_6, 2, 0, REG, srl, 0x0001ffff, 0xffff8000, 15
    Test_Rs2_Bypass srl, src_byp_7, 0, 0, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rs2_Bypass srl, src_byp_8, 0, 1, srl, 0x01ffff00, 0xffff8000, 7
    Test_Rs2_Bypass srl, src_byp_9, 0, 2, srl, 0x0001ffff, 0xffff8000, 15
    Test_Rs2_Bypass srl, src_byp_10, 1, 0, srl, 0x7fffc000, 0xffff8000, 1
    Test_Rs2_Bypass srl, src_byp_11, 1, 1, srl, 0x01ffff00, 0xffff8000, 7
    Test_Rs2_Bypass srl, src_byp_12, 2, 0, srl, 0x0001ffff, 0xffff8000, 15

    Test_Rd_Rs1_Zero srl, zero_1, srl, 32, 32
    Test_Rd_Zero_Rs2 srl, zero_2, srl, 0, 15
    Test_Rd_Zero_Zero srl, zero_3, srl, 0
    Test_Zero_Rs1_Rs2 srl, zero_4, REG, srl, 1024, 2048
.endm
