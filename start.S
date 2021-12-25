.text
.global _start
_start:
    #define TEST(n) \
	    .global n; \
	    addi x1, zero, 1000; \
	    j n; \
	    .global n ## _ret; \
	    n ## _ret:

	TEST(simple)

	# TEST(add)
	# TEST(addi)
	# TEST(and)
	# TEST(andi)
	# TEST(auipc)
	# TEST(beq)
	# TEST(bge)
	# TEST(bgeu)
	# TEST(blt)
	# TEST(bltu)
	# TEST(bne)
	# TEST(j)
	# TEST(jal)
	# TEST(jalr)
	# TEST(lb)
	# TEST(lbu)
	# TEST(lh)
	# TEST(lhu)
	# TEST(lui)
	# TEST(lw)
	# TEST(or)
	# TEST(ori)
	# TEST(sb)
	# TEST(sh)
	# TEST(sll)
	# TEST(slli)
	# TEST(slt)
	# TEST(slti)
	# TEST(sra)
	# TEST(srai)
	# TEST(srl)
	# TEST(srli)
	# TEST(sub)
	# TEST(sw)
	# TEST(xor)
	# TEST(xori)
