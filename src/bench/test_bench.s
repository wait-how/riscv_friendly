# A simple benchmark?

.macro test_bench

	Suite_Setup test_bench

test_bench_1:

	rdcycle a0
	rdcycle a1

	sub a0, a1, a0

	Print_name cycles
	Putchar_imm '\t'
	Print_hex a0
	Putchar_imm '\n'

.endm
