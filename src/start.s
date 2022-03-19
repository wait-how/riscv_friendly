.include "test_macros.s"

.include "config.s"

.text
.global _start
_start:
    # set up the test suite environment
    Imp_setup

    # quick sanity tests to check that lui, add, addi, and Assert_eq are all working
    # NOTE: check these tests carefully, as the tests below assume these instructions function correctly!
    sanity_tests

    # arithmetic tests
    lui_tests
    auipc_tests
    add_tests
    addi_tests

    sub_tests
    and_tests
    andi_tests
    or_tests
    ori_tests
    xor_tests
    xori_tests
    sll_tests
    slli_tests
    srl_tests
    srli_tests
    sra_tests
    srai_tests
    slt_tests
    slti_tests
    sltiu_tests

    # load/store tests
    lb_sb_tests
    lbu_tests
    lh_sh_tests
    lhu_tests
    lw_sw_tests

    # jump/branch tests
    beq_tests
    bne_tests
    blt_tests
    bltu_tests
    bge_tests
    bgeu_tests
    jal_tests
    jalr_tests

    # misc tests
    fence_tests

.ifdef Test_zifencei
    # Zifencei extension tests
    zifencei_tests
.endif

.ifdef Test_m
    # M extension tests
    mul_tests
    mulh_tests
    mulhu_tests
    mulhsu_tests
    div_tests
    divu_tests
    rem_tests
    remu_tests
.endif

.ifdef Test_zicsr
    # Zicsr extension tests
    csrrw_tests
    csrrwi_tests
    csrrs_tests
    csrrsi_tests
    csrrc_tests
    csrrci_tests
.endif

    # stop execution
    Stop

    Imp_details

.bss
# space for testing load and store instructions
test_data:
    .align 4
    .fill 64

.data
# not used but defined
unused:
    .align 4
    .fill 64
