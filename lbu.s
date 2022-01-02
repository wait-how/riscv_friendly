.macro lbu_tests
    Test_Seq_St sb, ustore_pre_1, sb, 0xff, 0, test_data
    Test_Seq_St sb, ustore_pre_2, sb, 0x00, 0, test_data+1
    Test_Seq_St sb, ustore_pre_3, sb, 0xf0, 0, test_data+2
    Test_Seq_St sb, ustore_pre_4, sb, 0x0f, 0, test_data+3

    Test_Ld lbu, load_1, lbu, 0x000000ff, 0, test_data
    Test_Ld lbu, load_2, lbu, 0x00000000, 1, test_data
    Test_Ld lbu, load_3, lbu, 0x000000f0, 2, test_data
    Test_Ld lbu, load_4, lbu, 0x0000000f, 3, test_data
    Test_Ld lbu, load_5, lbu, 0x000000ff, -3, test_data+3
    Test_Ld lbu, load_6, lbu, 0x00000000, -2, test_data+3
    Test_Ld lbu, load_7, lbu, 0x000000f0, -1, test_data+3
    Test_Ld lbu, load_8, lbu, 0x0000000f, 0, test_data+3
    Test_Ld lbu, load_9, lbu, 0x000000ff, 32, test_data-32

    Test_Seq lbu, unaln_1, "la a2, test_data; addi a2, a2, -6; lbu a1, 7(a2)"

    Test_Ld_Rd_Bypass lbu, dst_byp_1, 0, lbu, 0x000000f0, 1, test_data+1
    Test_Ld_Rd_Bypass lbu, dst_byp_2, 1, lbu, 0x0000000f, 1, test_data+2
    Test_Ld_Rd_Bypass lbu, dst_byp_3, 2, lbu, 0x00000000, 1, test_data

    Test_Ld_Rs_Bypass lbu, src_byp_1, 0, lbu, 0x000000f0, 1, test_data+1
    Test_Ld_Rs_Bypass lbu, src_byp_2, 1, lbu, 0x0000000f, 1, test_data+2
    Test_Ld_Rs_Bypass lbu, src_byp_3, 2, lbu, 0x00000000, 1, test_data

    Test_Seq lbu, waw_1, "li a0, 2; la a2, test_data; lbu a1, 0(a2); li a1, 2"
    Test_Seq lbu, waw_2, "li a0, 2; la a2, test_data; lbu a1, 0(a2); nop; li a1, 2"
.endm
