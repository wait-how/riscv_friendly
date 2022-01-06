.macro csrrs_tests

    Suite_Setup csrrs

    li a0, 0xfdca8421
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrs, rmw_1, REG, csrrs, mscratch, 0xfdca8421, 0x00000000
    Test_Rd_Csr_Rs csrrs, rmw_2, REG, csrrs, mscratch, 0xfdca842f, 0x0000000f
    Test_Rd_Csr_Rs csrrs, rmw_3, REG, csrrs, mscratch, 0xfdca84ff, 0x000000f0
    Test_Rd_Csr_Rs csrrs, rmw_4, REG, csrrs, mscratch, 0xfdcaffff, 0x0000ff00
    Test_Rd_Csr_Rs csrrs, rmw_5, REG, csrrs, mscratch, 0xfdcfffff, 0x000f0000
    Test_Rd_Csr_Rs csrrs, rmw_6, REG, csrrs, mscratch, 0xfdffffff, 0x00f00000
    Test_Rd_Csr_Rs csrrs, rmw_7, REG, csrrs, mscratch, 0xffffffff, 0xff000000

    li a0, 0x00000000
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrs, rmw_8, REG, csrrs, mscratch, 0xffffffff, 0xffffffff

    li a0, 0xaaaa5555
    csrrw zero, mscratch, a0

    Test_Zero_Csr_Rs csrrs, zero_1, REG, csrrs, mscratch, 0
    Test_Rd_Csr_Zero csrrs, zero_2, csrrs, mscratch, 0xaaaa5555
    Test_Zero_Csr_Zero csrrs, zero_3, csrrs, mscratch

test_csrrs_zero_4:
    csrrs a0, mcycle, zero # this should not fail because mcycle is read-only
    csrrs a1, mcycle, zero
    add a1, a1, a0 # add a0 and a1 to avoid unintentionally failing when mcycle rolls over to zero
    Assert_ne a1, zero

.endm
