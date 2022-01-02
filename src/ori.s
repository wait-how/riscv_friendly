.macro ori_tests
    Test_Rd_Rs1_Rs2 ori, logic_1, IMM, ori, 0xffffff0f, 0xff00ff00, -241 # 0xf0f
    Test_Rd_Rs1_Rs2 ori, logic_2, IMM, ori, 0x0ff00ff0, 0x0ff00ff0, 0x0f0
    Test_Rd_Rs1_Rs2 ori, logic_3, IMM, ori, 0x00ff07ff, 0x00ff00ff, 0x70f
    Test_Rd_Rs1_Rs2 ori, logic_4, IMM, ori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rs1_Rs1_Rs2 ori, shared_1, IMM, ori, 0xff00fff0, 0xff00ff00, 0x0f0

    Test_Rd_Bypass ori, dst_byp_1, 0, IMM, ori, 0x0ff00ff0, 0x0ff00ff0, 0x0f0
    Test_Rd_Bypass ori, dst_byp_2, 1, IMM, ori, 0x00ff07ff, 0x00ff00ff, 0x70f
    Test_Rd_Bypass ori, dst_byp_3, 2, IMM, ori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rs1_Bypass ori, src_byp_1, 0, -1, IMM, ori, 0x0ff00ff0, 0x0ff00ff0, 0x0f0
    Test_Rs1_Bypass ori, src_byp_2, 1, -1, IMM, ori, 0xffffffff, 0x00ff00ff, -241 # 0xf0f
    Test_Rs1_Bypass ori, src_byp_3, 2, -1, IMM, ori, 0xf00ff0ff, 0xf00ff00f, 0x0f0

    Test_Rd_Zero_Imm ori, zero_1, ori, 0x0f0, 0x0f0
    Test_Zero_Rs1_Rs2 ori, zero_2, IMM, ori, 0x00ff00ff, 0x70f
.endm
