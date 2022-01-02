.macro lui_tests
    Test_Val lui, logic_1, 0x00000000, "lui a1, 0x00000"
    Test_Val lui, logic_2, 0x00005000, "lui a1, 0x00005"
    Test_Val lui, logic_3, 0xfffff000, "lui a1, 0xfffff"
    Test_Val lui, logic_4, 0x00000000, "li a1, 0x00000fff; lui a1, 0x00000"
    Test_Val lui, logic_5, 0x7fffe000, "li a1, 0x0abcd8fe; lui a1, 0x7fffe"
    Test_Val lui, logic_6, 0xbbbbb000, "li a1, 0xaaaaa000; lui a1, 0xbbbbb"
    Test_Val lui, logic_7, 0x8ffff000, "lui a1, 0x8ffff"

    Test_Val lui, dst_byp_1, 0x7fffe000, "lui a2, 0x7fffe; mv a1, a2"
    Test_Val lui, dst_byp_2, 0x7aaae000, "lui a2, 0x7aaae; nop; mv a1, a2"
    Test_Val lui, dst_byp_3, 0x7bbbe000, "lui a2, 0x7bbbe; nop; nop; mv a1, a2"

    Test_Val lui, zero_1, 0, "lui zero, 0xbbbbb; mv a1, zero"
.endm
