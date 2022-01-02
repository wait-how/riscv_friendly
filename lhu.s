.macro lhu_tests
    Test_Seq_St sh, ustore_pre_1, sh, 0x00ff, 0, test_data
    Test_Seq_St sh, ustore_pre_2, sh, 0xff00, 0, test_data+2
    Test_Seq_St sh, ustore_pre_3, sh, 0x0ff0, 0, test_data+4
    Test_Seq_St sh, ustore_pre_4, sh, 0xf00f, 0, test_data+6

    Test_Ld lhu, load_1, lhu, 0x000000ff, 0, test_data
    Test_Ld lhu, load_2, lhu, 0x0000ff00, 2, test_data
    Test_Ld lhu, load_3, lhu, 0x00000ff0, 4, test_data
    Test_Ld lhu, load_4, lhu, 0x0000f00f, 6, test_data
    Test_Ld lhu, load_5, lhu, 0x000000ff, -6, test_data+6
    Test_Ld lhu, load_6, lhu, 0x0000ff00, -4, test_data+6
    Test_Ld lhu, load_7, lhu, 0x00000ff0, -2, test_data+6
    Test_Ld lhu, load_8, lhu, 0x0000f00f, 0, test_data+6
    Test_Ld lhu, load_9, lhu, 0x000000ff, 32, test_data-32

    Test_Ld lhu, unaln_1, lhu, 0x0000ff00, 7, test_data-5

    Test_Ld_Rd_Bypass lhu, dst_byp_1, 0, lhu, 0x00000ff0, 2, test_data+2
    Test_Ld_Rd_Bypass lhu, dst_byp_2, 1, lhu, 0x0000f00f, 2, test_data+4
    Test_Ld_Rd_Bypass lhu, dst_byp_3, 2, lhu, 0x0000ff00, 2, test_data

    Test_Ld_Rs_Bypass lhu, src_byp_1, 0, lhu, 0x00000ff0, 2, test_data+2
    Test_Ld_Rs_Bypass lhu, src_byp_2, 1, lhu, 0x0000f00f, 2, test_data+4
    Test_Ld_Rs_Bypass lhu, src_byp_3, 2, lhu, 0x0000ff00, 2, test_data

    Test_Seq lhu, waw_1, "li a0, 2; la a2, test_data; lhu a1, 0(a2); li a1, 2"
    Test_Seq lhu, waw_2, "li a0, 2; la a2, test_data; lhu a1, 0(a2); nop; li a1, 2"
.endm
