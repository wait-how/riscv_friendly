.macro divu_tests

    Suite_Setup divu

    Test_Rd_Rs1_Rs2 divu, div_1, REG, divu, 3, 20, 6
    Test_Rd_Rs1_Rs2 divu, div_2, REG, divu, 715827879, -20, 6
    Test_Rd_Rs1_Rs2 divu, div_3, REG, divu, 0, 20, -6
    Test_Rd_Rs1_Rs2 divu, div_4, REG, divu, 0, -20, -6
    Test_Rd_Rs1_Rs2 divu, div_5, REG, divu, -1<<31, -1<<31, 1
    Test_Rd_Rs1_Rs2 divu, div_6, REG, divu, 0, -1<<31, -1
    Test_Rd_Rs1_Rs2 divu, div_7, REG, divu, -1, -1<<31, 0
    Test_Rd_Rs1_Rs2 divu, div_8, REG, divu, -1, 1, 0
    Test_Rd_Rs1_Rs2 divu, div_9, REG, divu, -1, 0, 0
.endm
