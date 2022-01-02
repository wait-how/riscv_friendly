.macro lb_sb_tests

    # load tests

    # simple store tests to set up load tests
    Test_Seq_St sb, store_pre_1, sb, 0xff, 0, test_data
    Test_Seq_St sb, store_pre_2, sb, 0x00, 0, test_data+1
    Test_Seq_St sb, store_pre_3, sb, 0xf0, 0, test_data+2
    Test_Seq_St sb, store_pre_4, sb, 0x0f, 0, test_data+3

    Test_Ld lb, load_1, lb, 0xffffffff, 0, test_data
    Test_Ld lb, load_2, lb, 0x00000000, 1, test_data
    Test_Ld lb, load_3, lb, 0xfffffff0, 2, test_data
    Test_Ld lb, load_4, lb, 0x0000000f, 3, test_data
    Test_Ld lb, load_5, lb, 0x0000000f, -1, test_data+4
    Test_Ld lb, load_6, lb, 0xfffffff0, -2, test_data+4
    Test_Ld lb, load_7, lb, 0x00000000, -3, test_data+4
    Test_Ld lb, load_8, lb, 0xffffffff, -4, test_data+4
    Test_Ld lb, load_9, lb, 0xffffffff, 32, test_data-32

    Test_Seq lb, unaln_1, "la a2, test_data; addi a2, a2, -6; lb a1, 7(a2)"

    Test_Ld_Rd_Bypass lb, dst_byp_1, 0, lb, 0xfffffff0, 1, test_data+1
    Test_Ld_Rd_Bypass lb, dst_byp_2, 1, lb, 0x0000000f, 1, test_data+2
    Test_Ld_Rd_Bypass lb, dst_byp_3, 2, lb, 0x00000000, 1, test_data

    Test_Ld_Rs_Bypass lb, src_byp_1, 0, lb, 0xfffffff0, 1, test_data+1
    Test_Ld_Rs_Bypass lb, src_byp_2, 1, lb, 0x0000000f, 1, test_data+2
    Test_Ld_Rs_Bypass lb, src_byp_3, 2, lb, 0x00000000, 1, test_data

    Test_Seq lb, waw_1, "li a0, 2; la a2, test_data; lb a1, 0(a2); li a1, 2"
    Test_Seq lb, waw_2, "li a0, 2; la a2, test_data; lb a1, 0(a2); nop; li a1, 2"

    # store tests

    # simple store tests to set up more complex store tests
    Test_Seq_St sb, store_pre_5, sb, 0xef, 0, test_data
    Test_Seq_St sb, store_pre_6, sb, 0xef, 0, test_data+1
    Test_Seq_St sb, store_pre_7, sb, 0xef, 0, test_data+2
    Test_Seq_St sb, store_pre_8, sb, 0xef, 0, test_data+3
    Test_Seq_St sb, store_pre_9, sb, 0xef, 0, test_data+4
    Test_Seq_St sb, store_pre_10, sb, 0xef, 0, test_data+5
    Test_Seq_St sb, store_pre_11, sb, 0xef, 0, test_data+6
    Test_Seq_St sb, store_pre_12, sb, 0xef, 0, test_data+7

    Test_St_Ld sb, store_1, lb, sb, 0xffffffaa, 0xffffffaa, 0, test_data
    Test_St_Ld sb, store_2, lb, sb, 0x00000000, 0x00000000, 1, test_data
    Test_St_Ld sb, store_3, lh, sb, 0xffffefa0, 0xffffefa0, 2, test_data
    Test_St_Ld sb, store_4, lb, sb, 0x0000000a, 0x0000000a, 3, test_data
    Test_St_Ld sb, store_5, lb, sb, 0xffffffaa, 0xffffffaa, -3, test_data+8
    Test_St_Ld sb, store_6, lb, sb, 0x00000000, 0x00000000, -2, test_data+8
    Test_St_Ld sb, store_7, lb, sb, 0xffffffa0, 0xffffffa0, -1, test_data+8
    Test_St_Ld sb, store_8, lb, sb, 0x0000000a, 0x0000000a, 0, test_data+8
    Test_St_Ld sb, store_9, lb, sb, 0x12345678, 0x00000078, -32, test_data+32

    Test_Seq sb, unaln_1, "li a0, 0x43; la a2, test_data-6; li a3, 0x5da9ff43; sb a3, 7(a2); lb a1, 7(a2)"
    Test_Seq sb, unaln_2, "li a0, 0xffffffef; la a2, test_data; li a3, 0xef; sb a3, 3(a2); lb a1, 3(a2)"

    Test_St_Val_Addr_Bypass sb, src_byp_1, 0, 0, lb, sb, 0xffffffdd, 0, test_data
    Test_St_Val_Addr_Bypass sb, src_byp_2, 0, 1, lb, sb, 0xffffffcd, 1, test_data
    Test_St_Val_Addr_Bypass sb, src_byp_3, 0, 2, lb, sb, 0xffffffcc, 2, test_data
    Test_St_Val_Addr_Bypass sb, src_byp_4, 1, 0, lb, sb, 0xffffffbc, 3, test_data
    Test_St_Val_Addr_Bypass sb, src_byp_5, 1, 1, lb, sb, 0xffffffbb, 4, test_data
    Test_St_Val_Addr_Bypass sb, src_byp_6, 2, 0, lb, sb, 0xffffffab, 5, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_7, 0, 0, lb, sb, 0x33, 0, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_8, 0, 1, lb, sb, 0x23, 1, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_9, 0, 2, lb, sb, 0x22, 2, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_10, 1, 0, lb, sb, 0x12, 3, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_11, 1, 1, lb, sb, 0x11, 4, test_data
    Test_St_Addr_Val_Bypass sb, src_byp_12, 2, 0, lb, sb, 0x01, 5, test_data
.endm
