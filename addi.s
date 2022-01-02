.macro addi_tests
    Test_Rd_Rs1_Rs2 addi, arith_1, IMM, addi, 0x00000000, 0x00000000, 0x000
    Test_Rd_Rs1_Rs2 addi, arith_2, IMM, addi, 0x00000002, 0x00000001, 0x001
    Test_Rd_Rs1_Rs2 addi, arith_3, IMM, addi, 0x0000000a, 0x00000003, 0x007
    Test_Rd_Rs1_Rs2 addi, arith_4, IMM, addi, 0xfffff800, 0x00000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 addi, arith_5, IMM, addi, 0x80000000, 0x80000000, 0x000
    Test_Rd_Rs1_Rs2 addi, arith_6, IMM, addi, 0x7ffff800, 0x80000000, -2048 # 0x800
    Test_Rd_Rs1_Rs2 addi, arith_7, IMM, addi, 0x000007ff, 0x00000000, 0x7ff
    Test_Rd_Rs1_Rs2 addi, arith_8, IMM, addi, 0x7fffffff, 0x7fffffff, 0x000
    Test_Rd_Rs1_Rs2 addi, arith_9, IMM, addi, 0x800007fe, 0x7fffffff, 0x7ff
    Test_Rd_Rs1_Rs2 addi, arith_10, IMM, addi, 0x800007ff, 0x80000000, 0x7ff
    Test_Rd_Rs1_Rs2 addi, arith_11, IMM, addi, 0x7ffff7ff, 0x7fffffff, -2048 # 0x800
    Test_Rd_Rs1_Rs2 addi, arith_12, IMM, addi, 0xffffffff, 0x00000000, -1 # 0xfff
    Test_Rd_Rs1_Rs2 addi, arith_13, IMM, addi, 0x00000000, 0xffffffff, 0x001
    Test_Rd_Rs1_Rs2 addi, arith_14, IMM, addi, 0xfffffffe, 0xffffffff, -1 # 0xfff
    Test_Rd_Rs1_Rs2 addi, arith_15, IMM, addi, 0x80000000, 0x7fffffff, 0x001

    Test_Rs1_Rs1_Rs2 addi, shared_1, IMM, addi, 24, 13, 11

    Test_Rd_Bypass addi, dst_byp_1, 0, IMM, addi, 24, 13, 11
    Test_Rd_Bypass addi, dst_byp_2, 1, IMM, addi, 23, 13, 10
    Test_Rd_Bypass addi, dst_byp_3, 2, IMM, addi, 22, 13, 9

    Test_Rs1_Bypass addi, src_byp_1, 0, -1, IMM, addi, 24, 13, 11
    Test_Rs1_Bypass addi, src_byp_2, 1, -1, IMM, addi, 23, 13, 10
    Test_Rs1_Bypass addi, src_byp_3, 2, -1, IMM, addi, 22, 13, 9

    Test_Rd_Zero_Imm addi, zero_1, addi, 32, 32
    Test_Zero_Rs1_Rs2 addi, zero_2, IMM, addi, 33, 50
.endm
