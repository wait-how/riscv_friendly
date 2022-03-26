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

	Test_Setup csrrw, csrrw_read_cycle
    rdcycle a0
    nop
    nop
    nop
    rdcycle a1
    sub a1, a1, a0
    Assert_ne a1, zero

	Test_Setup csrrw, csrrw_read_time
# rdtime is an illegal instruction in Spike
#     rdtime a0
    nop
    nop
    nop
#     rdtime a1
    sub a1, a1, a0

    # a1 - a0 could very well be zero if the time CSR doesn't count that fast compared to the core

	Test_Setup csrrw, csrrw_read_instret
    rdinstret a0
    nop
    nop
    nop
    rdinstret a1
    sub a1, a1, a0
    Assert_ne a1, zero # a1 == 4 on Spike

.endm
