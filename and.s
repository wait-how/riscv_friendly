.macro and_tests
    Test_Rd_Rs1_Rs2 and, logic_1, REG, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 and, logic_2, REG, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Rs1_Rs2 and, logic_3, REG, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f
    Test_Rd_Rs1_Rs2 and, logic_4, REG, and, 0xf000f000, 0xf00ff00f, 0xf0f0f0f0

    Test_Rs1_Rs1_Rs2 and, shared_1, REG, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Rs1_Rs2 and, shared_2, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Rs1_Rs1 and, shared_3, and, 0xff00ff00, 0xff00ff00

    Test_Rd_Bypass and, dst_byp_1, 0, REG, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rd_Bypass and, dst_byp_2, 1, REG, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rd_Bypass and, dst_byp_3, 2, REG, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f

    Test_Rs1_Bypass and, src_byp_1, 0, 0, REG, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass and, src_byp_2, 0, 1, REG, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass and, src_byp_3, 0, 2, REG, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs1_Bypass and, src_byp_4, 1, 0, REG, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rs1_Bypass and, src_byp_5, 1, 1, REG, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs1_Bypass and, src_byp_6, 2, 0, REG, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass and, src_byp_7, 0, 0, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass and, src_byp_8, 0, 1, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass and, src_byp_9, 0, 2, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f
    Test_Rs2_Bypass and, src_byp_10, 1, 0, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f
    Test_Rs2_Bypass and, src_byp_11, 1, 1, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0
    Test_Rs2_Bypass and, src_byp_12, 2, 0, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f

    Test_Rd_Rs1_Zero and, zero_1, and, 0, 0xff00ff00
    Test_Rd_Zero_Rs2 and, zero_2, and, 0, 0x00ff00ff
    Test_Rd_Zero_Zero and, zero_3, and, 0
    Test_Zero_Rs1_Rs2 and, zero_4, REG, and, 0x11111111, 0x22222222
.endm
