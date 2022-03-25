.macro mulhsu_tests

    Suite_Setup mulhsu

    Test_Rd_Rs1_Rs2 mulhsu, mul_1, REG, mulhsu, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulhsu, mul_2, REG, mulhsu, 0x00000000, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 mulhsu, mul_3, REG, mulhsu, 0x00000000, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 mulhsu, mul_4, REG, mulhsu, 0x00000000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mulhsu, mul_5, REG, mulhsu, 0x00000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulhsu, mul_6, REG, mulhsu, 0x80004000, 0x80000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mulhsu, mul_7, REG, mulhsu, 0xffff0081, 0xaaaaaaab, 0x0002fe7d
    Test_Rd_Rs1_Rs2 mulhsu, mul_8, REG, mulhsu, 0x0001fefe, 0x0002fe7d, 0xaaaaaaab
    Test_Rd_Rs1_Rs2 mulhsu, mul_9, REG, mulhsu, 0xff010000, 0xff000000, 0xff000000
    Test_Rd_Rs1_Rs2 mulhsu, mul_10, REG, mulhsu, 0xffffffff, 0xffffffff, 0xffffffff
    Test_Rd_Rs1_Rs2 mulhsu, mul_11, REG, mulhsu, 0xffffffff, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 mulhsu, mul_12, REG, mulhsu, 0x00000000, 0x00000001, 0xffffffff

    Test_Rs1_Rs1_Rs2 mulhsu, shared_1, REG, mulhsu, 36608, 13<<20, 11<<20
    Test_Rs2_Rs1_Rs2 mulhsu, shared_2, mulhsu, 39424, 14<<20, 11<<20
    Test_Rs1_Rs1_Rs1 mulhsu, shared_3, mulhsu, 43264, 13<<20

    Test_Rd_Bypass mulhsu, dst_byp_1, 0, REG, mulhsu, 36608, 13<<20, 11<<20
    Test_Rd_Bypass mulhsu, dst_byp_2, 1, REG, mulhsu, 39424, 14<<20, 11<<20
    Test_Rd_Bypass mulhsu, dst_byp_3, 2, REG, mulhsu, 42240, 15<<20, 11<<20

    Test_Rs1_Bypass mulhsu, src_byp_1, 0, 0, REG, mulhsu, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulhsu, src_byp_2, 0, 1, REG, mulhsu, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulhsu, src_byp_3, 0, 2, REG, mulhsu, 42240, 15<<20, 11<<20
    Test_Rs1_Bypass mulhsu, src_byp_4, 1, 0, REG, mulhsu, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulhsu, src_byp_5, 1, 1, REG, mulhsu, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulhsu, src_byp_6, 2, 0, REG, mulhsu, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_7, 0, 0, mulhsu, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_8, 0, 1, mulhsu, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_9, 0, 2, mulhsu, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_10, 1, 0, mulhsu, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_11, 1, 1, mulhsu, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulhsu, src_byp_12, 2, 0, mulhsu, 42240, 15<<20, 11<<20

    Test_Rd_Rs1_Zero mulhsu zero_1, mulhsu, 0, 31<<26
    Test_Rd_Zero_Rs2 mulhsu zero_2, mulhsu, 0, 32<<26
    Test_Rd_Zero_Zero mulhsu zero_3, mulhsu, 0
    Test_Zero_Rs1_Rs2 mulhsu zero_4, REG, mulhsu, 33<<20, 34<<20
.endm
