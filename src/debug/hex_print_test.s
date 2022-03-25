.macro hex_print_tests

	Suite_Setup hex_print

hex_print_1:
	li x3, 0x3FE
	Print_hex x3
	Putchar_imm '\n'

hex_print_2:
	li x3, 0x12345678
	Print_hex x3
	Putchar_imm '\n'

hex_print_3:
	li x3, 0x5
	Print_hex x3
	Putchar_imm '\n'

hex_print_4:
	li x3, 0x0
	Print_hex x3
	Putchar_imm '\n'

.endm
