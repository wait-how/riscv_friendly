.macro lh_sh_tests

    # load tests

    # simple store tests to set up load tests
    Test_Seq_St sh, store_pre_1, sh, 0x00ff, 0, test_data
    Test_Seq_St sh, store_pre_2, sh, 0xff00, 0, test_data+2
    Test_Seq_St sh, store_pre_3, sh, 0x0ff0, 0, test_data+4
    Test_Seq_St sh, store_pre_4, sh, 0xf00f, 0, test_data+6

    Test_Ld lh, load_1, lh, 0x000000ff, 0, test_data
    Test_Ld lh, load_2, lh, 0xffffff00, 2, test_data
    Test_Ld lh, load_3, lh, 0x00000ff0, 4, test_data
    Test_Ld lh, load_4, lh, 0xfffff00f, 6, test_data
    Test_Ld lh, load_5, lh, 0x000000ff, -6, test_data+6
    Test_Ld lh, load_6, lh, 0xffffff00, -4, test_data+6
    Test_Ld lh, load_7, lh, 0x00000ff0, -2, test_data+6
    Test_Ld lh, load_8, lh, 0xfffff00f, 0, test_data+6
    Test_Ld lh, load_9, lh, 0x000000ff, 32, test_data-32

    Test_Ld lh, unaln_1, lh, 0xffffff00, 7, test_data-5

    Test_Ld_Rd_Bypass lh, dst_byp_1, 0, lh, 0x00000ff0, 2, test_data+2
    Test_Ld_Rd_Bypass lh, dst_byp_2, 1, lh, 0xfffff00f, 2, test_data+4
    Test_Ld_Rd_Bypass lh, dst_byp_3, 2, lh, 0xffffff00, 2, test_data

    Test_Ld_Rs_Bypass lh, src_byp_1, 0, lh, 0x00000ff0, 2, test_data+2
    Test_Ld_Rs_Bypass lh, src_byp_2, 1, lh, 0xfffff00f, 2, test_data+4
    Test_Ld_Rs_Bypass lh, src_byp_3, 2, lh, 0xffffff00, 2, test_data

    Test_Seq lh, waw_1, "li a0, 2; la a2, test_data; lh a1, 0(a2); li a1, 2"
    Test_Seq lh, waw_2, "li a0, 2; la a2, test_data; lh a1, 0(a2); nop; li a1, 2"

    # store tests

    # simple store tests to set up more complex store tests
    Test_Seq_St sh, store_pre_5, sh, 0xbeef, 0, test_data
    Test_Seq_St sh, store_pre_6, sh, 0xbeef, 0, test_data+2
    Test_Seq_St sh, store_pre_7, sh, 0xbeef, 0, test_data+4
    Test_Seq_St sh, store_pre_8, sh, 0xbeef, 0, test_data+6
    Test_Seq_St sh, store_pre_9, sh, 0xbeef, 0, test_data+8
    Test_Seq_St sh, store_pre_10, sh, 0xbeef, 0, test_data+10
    Test_Seq_St sh, store_pre_11, sh, 0xbeef, 0, test_data+12
    Test_Seq_St sh, store_pre_12, sh, 0xbeef, 0, test_data+14

    Test_St_Ld sh, store_1, lh, sh, 0x000000aa, 0x000000aa, 0, test_data
    Test_St_Ld sh, store_2, lh, sh, 0xffffaa00, 0xffffaa00, 2, test_data
    Test_St_Ld sh, store_3, lw, sh, 0xbeef0aa0, 0xbeef0aa0, 4, test_data
    Test_St_Ld sh, store_4, lh, sh, 0xffffa00a, 0xffffa00a, 6, test_data
    Test_St_Ld sh, store_5, lh, sh, 0x000000aa, 0x000000aa, -6, test_data+6
    Test_St_Ld sh, store_6, lh, sh, 0xffffaa00, 0xffffaa00, -4, test_data+6
    Test_St_Ld sh, store_7, lh, sh, 0x00000aa0, 0x00000aa0, -2, test_data+6
    Test_St_Ld sh, store_8, lh, sh, 0xffffa00a, 0xffffa00a, 0, test_data+6
    Test_St_Ld sh, store_9, lh, sh, 0x12345678, 0x5678, 32, test_data-32

    Test_St_Ld sh, unaln_1, lh, sh, 0x3098, 0x3098, 7, test_data-5

    Test_St_Val_Addr_Bypass sh, src_byp_1, 0, 0, lh, sh, 0xffffccdd, 0, test_data
    Test_St_Val_Addr_Bypass sh, src_byp_2, 0, 1, lh, sh, 0xffffbccd, 2, test_data
    Test_St_Val_Addr_Bypass sh, src_byp_3, 0, 2, lh, sh, 0xffffbbcc, 4, test_data
    Test_St_Val_Addr_Bypass sh, src_byp_4, 1, 0, lh, sh, 0xffffabbc, 6, test_data
    Test_St_Val_Addr_Bypass sh, src_byp_5, 1, 1, lh, sh, 0xffffaabb, 8, test_data
    Test_St_Val_Addr_Bypass sh, src_byp_6, 2, 0, lh, sh, 0xffffdaab, 10, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_7, 0, 0, lh, sh, 0x2233, 0, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_8, 0, 1, lh, sh, 0x1223, 2, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_9, 0, 2, lh, sh, 0x1122, 4, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_10, 1, 0, lh, sh, 0x0112, 6, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_11, 1, 1, lh, sh, 0x0011, 8, test_data
    Test_St_Addr_Val_Bypass sh, src_byp_12, 2, 0, lh, sh, 0x3001, 10, test_data
.endm
