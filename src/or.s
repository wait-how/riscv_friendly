.macro or_tests
    Test_Rd_Rs1_Rs2 or, logic_1, REG, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 or, logic_2, REG, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Rs1_Rs2 or, logic_3, REG, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 or, logic_4, REG, or, 0xf0fff0ff, 0xf00ff00f, 0xf0f0f0f0

    Test_Rs1_Rs1_Rs2 or, shared_1, REG, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Rs1_Rs2 or, shared_2, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Rs1_Rs1 or, shared_3, or, 0xff00ff00, 0xff00ff00

    Test_Rd_Bypass or, dst_byp_1, 0, REG, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Bypass or, dst_byp_2, 1, REG, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Bypass or, dst_byp_3, 2, REG, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f

    Test_Rs1_Bypass or, src_byp_1, 0, 0, REG, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass or, src_byp_2, 0, 1, REG, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass or, src_byp_3, 0, 2, REG, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs1_Bypass or, src_byp_4, 1, 0, REG, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass or, src_byp_5, 1, 1, REG, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass or, src_byp_6, 2, 0, REG, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass or, src_byp_7, 0, 0, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass or, src_byp_8, 0, 1, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass or, src_byp_9, 0, 2, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass or, src_byp_10, 1, 0, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass or, src_byp_11, 1, 1, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass or, src_byp_12, 2, 0, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f

    Test_Rd_Rs1_Zero or, zero_1, or, 0xff00ff00, 0xff00ff00
    Test_Rd_Zero_Rs2 or, zero_2, or, 0xff00ff00, 0xff00ff00
    Test_Rd_Zero_Zero or, zero_3, or, 0
    Test_Zero_Rs1_Rs2 or, zero_4, REG, or, 0x11111111, 0x22222222
.endm
