.macro csrrwi_tests

    Suite_Setup csrrwi

    Test_Rd_Csr_Rs csrrwi, rmw_1, IMM, csrrwi, mscratch, 0, 0
    Test_Rd_Csr_Rs csrrwi, rmw_2, IMM, csrrwi, mscratch, 1, 1
    Test_Rd_Csr_Rs csrrwi, rmw_3, IMM, csrrwi, mscratch, 0xf, 0xf
    Test_Rd_Csr_Rs csrrwi, rmw_4, IMM, csrrwi, mscratch, 0x1f, 0x1f

    Test_Zero_Csr_Rs csrrwi, zero_1, IMM, csrrwi, mscratch, 0x1f

.endm
