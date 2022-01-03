.macro rem_tests

    Suite_Setup rem

    Test_Rd_Rs1_Rs2 rem, rem_1, REG, rem, 2, 20, 6
    Test_Rd_Rs1_Rs2 rem, rem_2, REG, rem, -2, -20, 6
    Test_Rd_Rs1_Rs2 rem, rem_3, REG, rem, 2, 20, -6
    Test_Rd_Rs1_Rs2 rem, rem_4, REG, rem, -2, -20, -6
    Test_Rd_Rs1_Rs2 rem, rem_5, REG, rem, 0, -1<<31, 1
    Test_Rd_Rs1_Rs2 rem, rem_6, REG, rem, 0, -1<<31, -1
    Test_Rd_Rs1_Rs2 rem, rem_7, REG, rem, -1<<31, -1<<31, 0
    Test_Rd_Rs1_Rs2 rem, rem_8, REG, rem, 1, 1, 0
    Test_Rd_Rs1_Rs2 rem, rem_9, REG, rem, 0, 0, 0
.endm
