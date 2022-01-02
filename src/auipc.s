.macro auipc_tests
    Test_Seq auipc, addr_1, "la a0, auipc_test_1; auipc_test_1: la a1, auipc_test_1"
    Test_Seq auipc, addr_2, "la a0, auipc_test_2; nop; auipc_test_2: la a1, auipc_test_2"
    Test_Seq auipc, addr_3, "la a0, auipc_test_3; nop; nop; auipc_test_3: la a1, auipc_test_3"
    Test_Seq auipc, addr_4, "la a0, auipc_test_4; nop; nop; nop; auipc_test_4: la a1, auipc_test_4"
    Test_Seq auipc, addr_5, "la a0, auipc_test_5; nop; nop; nop; nop; auipc_test_5: la a1, auipc_test_5"
    Test_Seq auipc, addr_6, "la a0, auipc_test_6; nop; nop; nop; nop; nop; auipc_test_6: la a1, auipc_test_6"
    Test_Seq auipc, addr_7, "la a0, auipc_test_7; nop; nop; nop; nop; nop; nop; auipc_test_7: la a1, auipc_test_7"

    Test_Seq auipc, cmp_1, "la a0, 0; li a1, 0"
    Test_Seq auipc, cmp_2, "la a0, 0x12345678; li a1, 0x12345678"
    Test_Seq auipc, cmp_3, "la a0, 0x87654321; li a1, 0x87654321"
.endm
