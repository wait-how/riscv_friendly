.macro sanity_tests

    Suite_Setup sanity

	Test_Setup sanity, sanity_check_1
    # check if we can write nonzero values to zero register
    addi a1, zero, 0
    addi a0, zero, 10
    addi zero, a0, 1
    Assert_eq zero, a1

	Test_Setup sanity, sanity_check_2
    # set a0 and a1 to 0 and check for equality
    addi a0, zero, 0
    addi a1, zero, 0
    Assert_eq a0, a1

	Test_Setup sanity, sanity_check_3
    # set a0 and a1 to 2 and check for equality
    addi a0, a0, 2
    addi a1, a1, 2
    Assert_eq a0, a1

	Test_Setup sanity, sanity_check_4
    # set a0 and a1 to 0xffffffff (-1 in signed decimal) and check for equality
    add a0, zero, 1
    addi a0, a0, -2 # 0xfff
    add a1, zero, 1
    addi a1, a1, -2 # 0xfff
    Assert_eq a0, a1

	Test_Setup sanity, sanity_check_5
	# check if a register can be compared to itself
    addi a0, zero, 1
    Assert_eq a0, a0

	Test_Setup sanity, sanity_check_6
	# check if basic forwarding works correctly
	addi a0, zero, 6
	addi a2, a0, 1
	addi a1, a2, -1
	Assert_eq a0, a1

.endm
