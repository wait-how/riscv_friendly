.macro csrrc_tests

    Suite_Setup csrrc

    li a0, 0xfdca8421
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrc, rmw_1, REG, csrrc, mscratch, 0xfdca8421, 0x00000000
    Test_Rd_Csr_Rs csrrc, rmw_2, REG, csrrc, mscratch, 0xfdca8420, 0x0000000f
    Test_Rd_Csr_Rs csrrc, rmw_3, REG, csrrc, mscratch, 0xfdca8400, 0x000000f0
    Test_Rd_Csr_Rs csrrc, rmw_4, REG, csrrc, mscratch, 0xfdca0000, 0x0000ff00
    Test_Rd_Csr_Rs csrrc, rmw_5, REG, csrrc, mscratch, 0xfdc00000, 0x000f0000
    Test_Rd_Csr_Rs csrrc, rmw_6, REG, csrrc, mscratch, 0xfd000000, 0x00f00000
    Test_Rd_Csr_Rs csrrc, rmw_7, REG, csrrc, mscratch, 0x00000000, 0xff000000

    li a0, 0xffffffff
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrc, rmw_8, REG, csrrc, mscratch, 0x00000000, 0xffffffff

    li a0, 0xaaaa5555
    csrrw zero, mscratch, a0

    Test_Zero_Csr_Rs csrrc, zero_1, REG, csrrc, mscratch, 0
    Test_Rd_Csr_Zero csrrc, zero_2, csrrc, mscratch, 0xaaaa5555
    Test_Zero_Csr_Zero csrrc, zero_3, csrrc, mscratch

test_csrrc_zero_4:
    csrrc a0, mcycle, zero # this should not fail because mcycle is read-only
    csrrc a1, mcycle, zero
    add a1, a1, a0 # add a0 and a1 to avoid unintentionally failing when mcycle rolls over to zero
    Assert_ne a1, zero

.endm
