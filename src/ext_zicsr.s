# Control and status register extension instructions

# enable testing of non-standard extension
.equiv Test_zicsr, 1

.include "csrrw.s"
.include "csrrwi.s"
.include "csrrs.s"
.include "csrrsi.s"
.include "csrrc.s"
.include "csrrci.s"
