.macro srli_tests
    Test_Rd_Rs1_Rs2 srli, logic_1, IMM, srli, 0xffff8000, 0xffff8000, 0
    Test_Rd_Rs1_Rs2 srli, logic_2, IMM, srli, 0x7fffc000, 0xffff8000, 1
    Test_Rd_Rs1_Rs2 srli, logic_3, IMM, srli, 0x01ffff00, 0xffff8000, 7
    Test_Rd_Rs1_Rs2 srli, logic_4, IMM, srli, 0x0003fffe, 0xffff8000, 14
    Test_Rd_Rs1_Rs2 srli, logic_5, IMM, srli, 0x0001ffff, 0xffff8001, 15
    Test_Rd_Rs1_Rs2 srli, logic_6, IMM, srli, 0xffffffff, 0xffffffff, 0
    Test_Rd_Rs1_Rs2 srli, logic_7, IMM, srli, 0x7fffffff, 0xffffffff, 1
    Test_Rd_Rs1_Rs2 srli, logic_8, IMM, srli, 0x01ffffff, 0xffffffff, 7
    Test_Rd_Rs1_Rs2 srli, logic_9, IMM, srli, 0x0003ffff, 0xffffffff, 14
    Test_Rd_Rs1_Rs2 srli, logic_10, IMM, srli, 0x00000001, 0xffffffff, 31
    Test_Rd_Rs1_Rs2 srli, logic_11, IMM, srli, 0x21212121, 0x21212121, 0
    Test_Rd_Rs1_Rs2 srli, logic_12, IMM, srli, 0x10909090, 0x21212121, 1
    Test_Rd_Rs1_Rs2 srli, logic_13, IMM, srli, 0x00424242, 0x21212121, 7
    Test_Rd_Rs1_Rs2 srli, logic_14, IMM, srli, 0x00008484, 0x21212121, 14
    Test_Rd_Rs1_Rs2 srli, logic_15, IMM, srli, 0x00000000, 0x21212121, 31

    Test_Rs1_Rs1_Rs2 srli, shared_1, IMM, srli, 0x7fffc000, 0xffff8000, 1

    Test_Rd_Bypass srli, dst_byp_1, 0, IMM, srli, 0x7fffc000, 0xffff8000, 1
    Test_Rd_Bypass srli, dst_byp_2, 1, IMM, srli, 0x0003fffe, 0xffff8000, 14
    Test_Rd_Bypass srli, dst_byp_3, 2, IMM, srli, 0x0001ffff, 0xffff8000, 15

    Test_Rs1_Bypass srli, src_byp_1, 0, -1, IMM, srli, 0x7fffc000, 0xffff8000, 1
    Test_Rs1_Bypass srli, src_byp_2, 1, -1, IMM, srli, 0x0003fffe, 0xffff8000, 14
    Test_Rs1_Bypass srli, src_byp_3, 2, -1, IMM, srli, 0x0001ffff, 0xffff8000, 15

    Test_Rd_Zero_Imm srli, zero_1, srli, 0, 31
    Test_Zero_Rs1_Rs2 srli, zero_2, IMM, srli, 33, 20
.endm
