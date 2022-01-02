.macro xor_tests
    Test_Rd_Rs1_Rs2 xor, logic_1, REG, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 xor, logic_2, REG, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Rs1_Rs2 xor, logic_3, REG, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 xor, logic_4, REG, xor, 0x00ff00ff, 0xf00ff00f, 0xf0f0f0f0

    Test_Rs1_Rs1_Rs2 xor, shared_1, REG, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Rs1_Rs2 xor, shared_2, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Rs1_Rs1 xor, shared_3, xor, 0x00000000, 0xff00ff00

    Test_Rd_Bypass xor, dst_byp_1, 0, REG, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Bypass xor, dst_byp_2, 1, REG, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Bypass xor, dst_byp_3, 2, REG, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f

    Test_Rs1_Bypass xor, src_byp_1, 0, 0, REG, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass xor, src_byp_2, 0, 1, REG, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass xor, src_byp_3, 0, 2, REG, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs1_Bypass xor, src_byp_4, 1, 0, REG, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass xor, src_byp_5, 1, 1, REG, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass xor, src_byp_6, 2, 0, REG, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass xor, src_byp_7, 0, 0, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass xor, src_byp_8, 0, 1, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass xor, src_byp_9, 0, 2, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass xor, src_byp_10, 1, 0, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass xor, src_byp_11, 1, 1, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass xor, src_byp_12, 2, 0, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f

    Test_Rd_Rs1_Zero xor, zero_1, xor, 0xff00ff00, 0xff00ff00
    Test_Rd_Zero_Rs2 xor, zero_2, xor, 0x00ff00ff, 0x00ff00ff
    Test_Rd_Zero_Zero xor, zero_3, xor, 0
    Test_Zero_Rs1_Rs2 xor, zero_4, REG, xor, 0x11111111, 0x22222222
.endm
