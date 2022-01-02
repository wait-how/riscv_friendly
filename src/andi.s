.macro andi_tests
    Test_Rd_Rs1_Rs2 andi, logic_1, IMM, andi, 0xff00ff00, 0xff00ff00, -241 # 0xf0f
    Test_Rd_Rs1_Rs2 andi, logic_2, IMM, andi, 0x000000f0, 0x0ff00ff0, 0x0f0
    Test_Rd_Rs1_Rs2 andi, logic_3, IMM, andi, 0x0000000f, 0x00ff00ff, 0x70f
    Test_Rd_Rs1_Rs2 andi, logic_4, IMM, andi, 0x00000000, 0xf00ff00f, 0x0f0

    Test_Rs1_Rs1_Rs2 andi, shared_1, IMM, andi, 0x00000000, 0xff00ff00, 0x0f0

    Test_Rd_Bypass andi, dst_byp_1, 0, IMM, andi, 0x00000700, 0x0ff00ff0, 0x70f
    Test_Rd_Bypass andi, dst_byp_2, 1, IMM, andi, 0x000000f0, 0x00ff00ff, 0x0f0
    Test_Rd_Bypass andi, dst_byp_3, 2, IMM, andi, 0xf00ff00f, 0xf00ff00f, -241 # 0xf0f

    Test_Rs1_Bypass andi, src_byp_1, 0, -1, IMM, andi, 0x00000700, 0x0ff00ff0, 0x70f
    Test_Rs1_Bypass andi, src_byp_2, 1, -1, IMM, andi, 0x000000f0, 0x00ff00ff, 0x0f0
    Test_Rs1_Bypass andi, src_byp_3, 2, -1, IMM, andi, 0x0000000f, 0xf00ff00f, 0x70f

    Test_Rd_Zero_Imm andi, zero_1, andi, 0, 0x0f0
    Test_Zero_Rs1_Rs2 andi, zero_2, IMM, andi, 0x00ff00ff, 0x70f
.endm
