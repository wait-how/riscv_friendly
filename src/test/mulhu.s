.macro mulhu_tests

    Suite_Setup mulhu

    Test_Rd_Rs1_Rs2 mulhu, mul_1, REG, mulhu, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulhu, mul_2, REG, mulhu, 0x00000000, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 mulhu, mul_3, REG, mulhu, 0x00000000, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 mulhu, mul_4, REG, mulhu, 0x00000000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mulhu, mul_5, REG, mulhu, 0x00000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulhu, mul_6, REG, mulhu, 0x7fffc000, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mulhu, mul_7, REG, mulhu, 0x0001fefe, 0xaaaaaaab, 0x0002fe7d
    Test_Rd_Rs1_Rs2 mulhu, mul_8, REG, mulhu, 0x0001fefe, 0x0002fe7d, 0xaaaaaaab
    Test_Rd_Rs1_Rs2 mulhu, mul_9, REG, mulhu, 0xfe010000, 0xff000000, 0xff000000
    Test_Rd_Rs1_Rs2 mulhu, mul_10, REG, mulhu, 0xfffffffe, 0xffffffff, 0xffffffff
    Test_Rd_Rs1_Rs2 mulhu, mul_11, REG, mulhu, 0x00000000, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 mulhu, mul_12, REG, mulhu, 0x00000000, 0x00000001, 0xffffffff

    Test_Rs1_Rs1_Rs2 mulhu, shared_1, REG, mulhu, 36608, 13<<20, 11<<20
    Test_Rs2_Rs1_Rs2 mulhu, shared_2, mulhu, 39424, 14<<20, 11<<20
    Test_Rs1_Rs1_Rs1 mulhu, shared_3, mulhu, 43264, 13<<20

    Test_Rd_Bypass mulhu, dst_byp_1, 0, REG, mulhu, 36608, 13<<20, 11<<20
    Test_Rd_Bypass mulhu, dst_byp_2, 1, REG, mulhu, 39424, 14<<20, 11<<20
    Test_Rd_Bypass mulhu, dst_byp_3, 2, REG, mulhu, 42240, 15<<20, 11<<20

    Test_Rs1_Bypass mulhu, src_byp_1, 0, 0, REG, mulhu, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulhu, src_byp_2, 0, 1, REG, mulhu, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulhu, src_byp_3, 0, 2, REG, mulhu, 42240, 15<<20, 11<<20
    Test_Rs1_Bypass mulhu, src_byp_4, 1, 0, REG, mulhu, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulhu, src_byp_5, 1, 1, REG, mulhu, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulhu, src_byp_6, 2, 0, REG, mulhu, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_7, 0, 0, mulhu, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_8, 0, 1, mulhu, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_9, 0, 2, mulhu, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_10, 1, 0, mulhu, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_11, 1, 1, mulhu, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulhu, src_byp_12, 2, 0, mulhu, 42240, 15<<20, 11<<20

    Test_Rd_Rs1_Zero mulhu, zero_1, mulhu, 0, 31<<26
    Test_Rd_Zero_Rs2 mulhu, zero_2, mulhu, 0, 32<<26
    Test_Rd_Zero_Zero mulhu, zero_3, mulhu, 0
    Test_Zero_Rs1_Rs2 mulhu, zero_4, REG, mulhu, 33<<20, 34<<20
.endm
