.include "test_macros.s"

.include "sanity_tests.s"

# use tests for all rv32i instructions
.include "rv32i.s"

.text
.global _start
_start:

    # quick sanity tests to check that lui, add, addi, and Assert_eq are all working
    # NOTE: check these tests carefully, as the tests below assume these instructions function correctly!
    # sanity_tests

    # # arithmetic tests
    # lui_tests
    # auipc_tests
    # add_tests
    # addi_tests

    # sub_tests
    # and_tests
    # andi_tests
    # or_tests
    # ori_tests
    # xor_tests
    # xori_tests
    # sll_tests
    # slli_tests
    # srl_tests
    # srli_tests
    # sra_tests
    # srai_tests
    # slt_tests
    # slti_sltiu_tests

    # load/store tests
    # lb_sb_tests
    # lbu_tests
    # lh_sh_tests
    # lhu_tests
    # lw_sw_tests
    jal_tests
    jalr_tests

    # beq_tests
    # bne_tests
    # blt_tests
    # bltu_tests
    # bge_tests
    # bgeu_tests

    # TODO: need linker script for jump tests!

    Stop

# space for testing load and store instructions
.data
test_data:
    .fill 64
