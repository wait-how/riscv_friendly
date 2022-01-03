.macro div_tests

    Suite_Setup div

    Test_Rd_Rs1_Rs2 div, div_1, REG, div, 3, 20, 6
    Test_Rd_Rs1_Rs2 div, div_2, REG, div, -3, -20, 6
    Test_Rd_Rs1_Rs2 div, div_3, REG, div, -3, -20, 6
    Test_Rd_Rs1_Rs2 div, div_4, REG, div, -3, 20, -6
    Test_Rd_Rs1_Rs2 div, div_5, REG, div, 3, -20, -6

    Test_Rd_Rs1_Rs2 div, div_6, REG, div, -1<<31, -1<<31, 1
    Test_Rd_Rs1_Rs2 div, div_7, REG, div, -1<<31, -1<<31, -1

    Test_Rd_Rs1_Rs2 div, div_8, REG, div, -1, -1<<31, 0
    Test_Rd_Rs1_Rs2 div, div_9, REG, div, -1, 1, 0
    Test_Rd_Rs1_Rs2 div, div_10, REG, div, -1, 0, 0
.endm
