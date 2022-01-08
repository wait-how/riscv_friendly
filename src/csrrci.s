.macro csrrci_tests

    Suite_Setup csrrci

    li a0, 0xfdca84ff
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrci, rmw_1, IMM, csrrci, mscratch, 0xfdca84ff, 0b00000
    Test_Rd_Csr_Rs csrrci, rmw_2, IMM, csrrci, mscratch, 0xfdca84fc, 0b00011
    Test_Rd_Csr_Rs csrrci, rmw_3, IMM, csrrci, mscratch, 0xfdca84f0, 0b01111
    Test_Rd_Csr_Rs csrrci, rmw_4, IMM, csrrci, mscratch, 0xfdca84e0, 0b11111

    li a0, 0xffffffff
    csrrw zero, mscratch, a0

    Test_Rd_Csr_Rs csrrci, rmw_5, IMM, csrrci, mscratch, 0xffffffe0, 0x1f

    li a0, 0xaaaa5555
    csrrw zero, mscratch, a0

    Test_Zero_Csr_Rs csrrci, zero_1, IMM, csrrci, mscratch, 0

test_csrrci_zero_4:
    csrrci a0, mcycle, 0 # this should not fail because mcycle is read-only
    csrrci a1, mcycle, 0
    add a1, a1, a0 # add a0 and a1 to avoid unintentionally failing when mcycle rolls over to zero
    Assert_ne a1, zero
.endm
