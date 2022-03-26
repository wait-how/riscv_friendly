.macro csrrsi_tests

    Suite_Setup csrrsi

    li a0, 0xfdca8421
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrsi, rmw_1, IMM, csrrsi, mscratch, 0xfdca8421, 0b00000
    Test_Rd_Csr_Rs csrrsi, rmw_2, IMM, csrrsi, mscratch, 0xfdca8423, 0b00011
    Test_Rd_Csr_Rs csrrsi, rmw_3, IMM, csrrsi, mscratch, 0xfdca842f, 0b01111
    Test_Rd_Csr_Rs csrrsi, rmw_4, IMM, csrrsi, mscratch, 0xfdca843f, 0b11111

    csrrw zero, mscratch, zero

    Test_Rd_Csr_Rs csrrsi, rmw_5, IMM, csrrsi, mscratch, 0x0000001f, 0x1f

    li a0, 0xaaaa5555
    csrrw zero, mscratch, a0

    Test_Zero_Csr_Rs csrrsi, zero_1, IMM, csrrsi, mscratch, 0

	Test_Setup csrrsi, test_csrrsi_zero_4
    csrrsi a0, mcycle, 0 # this should not fail because mcycle is read-only
    csrrsi a1, mcycle, 0
    add a1, a1, a0 # add a0 and a1 to avoid unintentionally failing when mcycle rolls over to zero
    Assert_ne a1, zero
.endm
