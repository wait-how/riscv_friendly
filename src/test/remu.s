.macro remu_tests

    Suite_Setup remu

    Test_Rd_Rs1_Rs2 remu, rem_1, REG, remu, 2, 20, 6
    Test_Rd_Rs1_Rs2 remu, rem_2, REG, remu, 2, -20, 6
    Test_Rd_Rs1_Rs2 remu, rem_3, REG, remu, 20, 20, -6
    Test_Rd_Rs1_Rs2 remu, rem_4, REG, remu, -20, -20, -6

    Test_Rd_Rs1_Rs2 remu, rem_5, REG, remu, 0, -1<<31, 1
    Test_Rd_Rs1_Rs2 remu, rem_6, REG, remu, -1<<31, -1<<31, -1

    Test_Rd_Rs1_Rs2 remu, rem_7, REG, remu, -1<<31, -1<<31, 0
    Test_Rd_Rs1_Rs2 remu, rem_8, REG, remu, 1, 1, 0
    Test_Rd_Rs1_Rs2 remu, rem_9, REG, remu, 0, 0, 0
.endm
