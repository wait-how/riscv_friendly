.macro xori_tests
    Test_Rd_Rs1_Rs2 xori, logic_1, IMM, xori, 0xff00f00f, 0x00ff0f00, -241 # 0xf0f
    Test_Rd_Rs1_Rs2 xori, logic_2, IMM, xori, 0x0ff00f00, 0x0ff00ff0, 0x0f0
    Test_Rd_Rs1_Rs2 xori, logic_3, IMM, xori, 0x00ff0ff0, 0x00ff08ff, 0x70f
    Test_Rd_Rs1_Rs2 xori, logic_4, IMM, xori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rs1_Rs1_Rs2 xori, shared_1, IMM, xori, 0xff00f00f, 0xff00f700, 0x70f

    Test_Rd_Bypass xori, dst_byp_1, 0, IMM, xori, 0x0ff00f00, 0x0ff00ff0, 0x0f0
    Test_Rd_Bypass xori, dst_byp_2, 1, IMM, xori, 0x00ff0ff0, 0x00ff08ff, 0x70f
    Test_Rd_Bypass xori, dst_byp_3, 2, IMM, xori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rs1_Bypass xori, src_byp_1, 0, -1, IMM, xori, 0x0ff00f00, 0x0ff00ff0, 0x0f0
    Test_Rs1_Bypass xori, src_byp_2, 1, -1, IMM, xori, 0x00ff0ff0, 0x00ff0fff, 0x00f
    Test_Rs1_Bypass xori, src_byp_3, 2, -1, IMM, xori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rd_Zero_Imm xori, zero_1, xori, 0x0f0, 0x0f0
    Test_Zero_Rs1_Rs2 xori, zero_2, IMM, xori, 0x00ff00ff, 0x70f
.endm
