.macro lw_sw_tests

    # load tests

    # simple store tests to set up load tests
    Test_Seq_St sw, store_pre_1, sw, 0x00ff00ff, 0, test_data
    Test_Seq_St sw, store_pre_2, sw, 0xff00ff00, 0, test_data+4
    Test_Seq_St sw, store_pre_3, sw, 0x0ff00ff0, 0, test_data+8
    Test_Seq_St sw, store_pre_4, sw, 0xf00ff00f, 0, test_data+12

    Test_Ld lw, load_1, lw, 0x00ff00ff, 0, test_data
    Test_Ld lw, load_2, lw, 0xff00ff00, 4, test_data
    Test_Ld lw, load_3, lw, 0x0ff00ff0, 8, test_data
    Test_Ld lw, load_4, lw, 0xf00ff00f, 12, test_data
    Test_Ld lw, load_5, lw, 0x00ff00ff, -12, test_data+12
    Test_Ld lw, load_6, lw, 0xff00ff00, -8, test_data+12
    Test_Ld lw, load_7, lw, 0x0ff00ff0, -4, test_data+12
    Test_Ld lw, load_8, lw, 0xf00ff00f, 0, test_data+12
    Test_Ld lw, load_9, lw, 0x00ff00ff, 32, test_data-32

    Test_Ld lw, unaln_1, lw, 0xff00ff00, 7, test_data-3

    Test_Ld_Rd_Bypass lw, dst_byp_1, 0, lw, 0xf00ff00f, 4, test_data+8
    Test_Ld_Rd_Bypass lw, dst_byp_2, 1, lw, 0xff00ff00, 4, test_data
    Test_Ld_Rd_Bypass lw, dst_byp_3, 2, lw, 0x0ff00ff0, 4, test_data+4

    Test_Ld_Rs_Bypass lw, src_byp_1, 0, lw, 0xf00ff00f, 4, test_data+8
    Test_Ld_Rs_Bypass lw, src_byp_2, 1, lw, 0xff00ff00, 4, test_data
    Test_Ld_Rs_Bypass lw, src_byp_3, 2, lw, 0x0ff00ff0, 4, test_data+4

    Test_Seq lw, waw_1, "li a0, 2; la a2, test_data+8; lw a1, 0(a2); li a1, 2"
    Test_Seq lw, waw_2, "li a0, 2; la a2, test_data+4; lw a1, 0(a2); nop; li a1, 2"

    # store tests

    # simple store tests to set up more complex store tests
    Test_Seq_St sw, store_pre_5, sw, 0xdeadbeef, 0, test_data
    Test_Seq_St sw, store_pre_6, sw, 0xdeadbeef, 0, test_data+4
    Test_Seq_St sw, store_pre_7, sw, 0xdeadbeef, 0, test_data+8
    Test_Seq_St sw, store_pre_8, sw, 0xdeadbeef, 0, test_data+12
    Test_Seq_St sw, store_pre_9, sw, 0xdeadbeef, 0, test_data+16
    Test_Seq_St sw, store_pre_10, sw, 0xdeadbeef, 0, test_data+20
    Test_Seq_St sw, store_pre_11, sw, 0xdeadbeef, 0, test_data+24
    Test_Seq_St sw, store_pre_12, sw, 0xdeadbeef, 0, test_data+28

    Test_St_Ld sw, store_1, lw, sw, 0x00aa00aa, 0x00aa00aa, 0, test_data
    Test_St_Ld sw, store_2, lw, sw, 0xaa00aa00, 0xaa00aa00, 4, test_data
    Test_St_Ld sw, store_3, lw, sw, 0x0aa00aa0, 0x0aa00aa0, 8, test_data
    Test_St_Ld sw, store_4, lw, sw, 0xa00aa00a, 0xa00aa00a, 12, test_data
    Test_St_Ld sw, store_5, lw, sw, 0x00aa00aa, 0x00aa00aa, -12, test_data+12
    Test_St_Ld sw, store_6, lw, sw, 0xaa00aa00, 0xaa00aa00, -8, test_data+12
    Test_St_Ld sw, store_7, lw, sw, 0x0aa00aa0, 0x0aa00aa0, -4, test_data+12
    Test_St_Ld sw, store_8, lw, sw, 0xa00aa00a, 0xa00aa00a, 0, test_data+12
    Test_St_Ld sw, store_9, lw, sw, 0x12345678, 0x12345678, -32, test_data+32

    Test_Seq sw, unaln_1, "li a0, 0x58213098; la a2, test_data-3; li a3, 0x58213098; sw a3, 7(a2); lw a1, 7(a2)"

    Test_St_Val_Addr_Bypass sw, src_byp_1, 0, 0, lw, sw, 0xaabbccdd, 0, test_data
    Test_St_Val_Addr_Bypass sw, src_byp_2, 0, 1, lw, sw, 0xdaabbccd, 4, test_data
    Test_St_Val_Addr_Bypass sw, src_byp_3, 0, 2, lw, sw, 0xddaabbcc, 8, test_data
    Test_St_Val_Addr_Bypass sw, src_byp_4, 1, 0, lw, sw, 0xcddaabbc, 12, test_data
    Test_St_Val_Addr_Bypass sw, src_byp_5, 1, 1, lw, sw, 0xccddaabb, 16, test_data
    Test_St_Val_Addr_Bypass sw, src_byp_6, 2, 0, lw, sw, 0xbccddaab, 20, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_7, 0, 0, lw, sw, 0x00112233, 0, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_8, 0, 1, lw, sw, 0x30011223, 4, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_9, 0, 2, lw, sw, 0x33001122, 8, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_10, 1, 0, lw, sw, 0x23300112, 12, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_11, 1, 1, lw, sw, 0x22330011, 16, test_data
    Test_St_Addr_Val_Bypass sw, src_byp_12, 2, 0, lw, sw, 0x12233001, 20, test_data
.endm
