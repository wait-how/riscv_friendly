.macro csrrw_tests

    Suite_Setup csrrw

    Test_Rd_Csr_Rs csrrw, rmw_1, REG, csrrw, mscratch, 0, 0
    Test_Rd_Csr_Rs csrrw, rmw_2, REG, csrrw, mscratch, 1, 1
    Test_Rd_Csr_Rs csrrw, rmw_3, REG, csrrw, mscratch, 0xffaa, 0xffaa
    Test_Rd_Csr_Rs csrrw, rmw_4, REG, csrrw, mscratch, 0xaaaafffd, 0xaaaafffd
    Test_Rd_Csr_Rs csrrw, rmw_5, REG, csrrw, mscratch, 0xffffffff, 0xffffffff

    Test_Zero_Csr_Rs csrrw, zero_1, REG, csrrw, mscratch, 0xff
    Test_Rd_Csr_Zero csrrw, zero_2, csrrw, mscratch, 0
    Test_Zero_Csr_Zero csrrw, zero_3, csrrw, mscratch
.endm
