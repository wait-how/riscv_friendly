.macro csrrw_tests
    #Test_Rd_Csr_Rs csrrw, rmw_1, csrrw, mscratch, 0, 0
    #Test_Rd_Csr_Rs csrrw, rmw_2, csrrw, mscratch, 1, 1 # TODO: this fails on spike for some reason
    #Test_Rd_Csr_Rs csrrw, rmw_3, csrrw, mscratch, 0xffaa, 0xffaa
    #Test_Rd_Csr_Rs csrrw, rmw_4, csrrw, mscratch, 0xaaaafffd, 0xaaaafffd
    #Test_Rd_Csr_Rs csrrw, rmw_5, csrrw, mscratch, 0xffffffff, 0xffffffff

    #Test_Zero_Csr_Rs csrrw, zero_1, csrrw, dpc, 0 # TODO: assuming this CSR doesn't exist
    #Test_Rd_Csr_Zero csrrw, zero_2, csrrw, mscratch, 0
.endm
