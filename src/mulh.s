.macro mulh_tests

    Suite_Setup mulh

    Test_Rd_Rs1_Rs2 mulh, mul_1, REG, mulh, 0x00000000, 0x00000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulh, mul_2, REG, mulh, 0x00000000, 0x00000001, 0x00000001
    Test_Rd_Rs1_Rs2 mulh, mul_3, REG, mulh, 0x00000000, 0x00000003, 0x00000007
    Test_Rd_Rs1_Rs2 mulh, mul_4, REG, mulh, 0x00000000, 0x00000000, 0xffff8000
    Test_Rd_Rs1_Rs2 mulh, mul_5, REG, mulh, 0x00000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulh, mul_6, REG, mulh, 0x00000000, 0x80000000, 0x00000000
    Test_Rd_Rs1_Rs2 mulh, mul_7, REG, mulh, 0xffff0081, 0xaaaaaaab, 0x0002fe7d
    Test_Rd_Rs1_Rs2 mulh, mul_8, REG, mulh, 0xffff0081, 0x0002fe7d, 0xaaaaaaab
    Test_Rd_Rs1_Rs2 mulh, mul_9, REG, mulh, 0x00010000, 0xff000000, 0xff000000
    Test_Rd_Rs1_Rs2 mulh, mul_10, REG, mulh, 0x00000000, 0xffffffff, 0xffffffff
    Test_Rd_Rs1_Rs2 mulh, mul_11, REG, mulh, 0xffffffff, 0xffffffff, 0x00000001
    Test_Rd_Rs1_Rs2 mulh, mul_12, REG, mulh, 0xffffffff, 0x00000001, 0xffffffff

    Test_Rs1_Rs1_Rs2 mulh, shared_1, REG, mulh, 36608, 13<<20, 11<<20
    Test_Rs2_Rs1_Rs2 mulh, shared_2, mulh, 39424, 14<<20, 11<<20
    Test_Rs1_Rs1_Rs1 mulh, shared_3, mulh, 43264, 13<<20

    Test_Rd_Bypass mulh, dst_byp_1, 0, REG, mulh, 36608, 13<<20, 11<<20
    Test_Rd_Bypass mulh, dst_byp_2, 1, REG, mulh, 39424, 14<<20, 11<<20
    Test_Rd_Bypass mulh, dst_byp_3, 2, REG, mulh, 42240, 15<<20, 11<<20

    Test_Rs1_Bypass mulh, src_byp_1, 0, 0, REG, mulh, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulh, src_byp_2, 0, 1, REG, mulh, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulh, src_byp_3, 0, 2, REG, mulh, 42240, 15<<20, 11<<20
    Test_Rs1_Bypass mulh, src_byp_4, 1, 0, REG, mulh, 36608, 13<<20, 11<<20
    Test_Rs1_Bypass mulh, src_byp_5, 1, 1, REG, mulh, 39424, 14<<20, 11<<20
    Test_Rs1_Bypass mulh, src_byp_6, 2, 0, REG, mulh, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_7, 0, 0, mulh, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_8, 0, 1, mulh, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_9, 0, 2, mulh, 42240, 15<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_10, 1, 0, mulh, 36608, 13<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_11, 1, 1, mulh, 39424, 14<<20, 11<<20
    Test_Rs2_Bypass mulh, src_byp_12, 2, 0, mulh, 42240, 15<<20, 11<<20

    Test_Rd_Rs1_Zero mulh, zero_1, mulh, 0, 31<<26
    Test_Rd_Zero_Rs2 mulh, zero_2, mulh, 0, 31<<26
    Test_Rd_Zero_Zero mulh, zero_3, mulh, 0
    Test_Zero_Rs1_Rs2 mulh, zero_4, REG, mulh, 33<<20, 34<<20
.endm
