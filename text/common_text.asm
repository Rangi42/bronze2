INCLUDE "includes.asm"

SECTION "Text 1", ROMX, BANK[$6F]
INCLUDE "text/common_1.asm"

SECTION "Text 2", ROMX, BANK[$70]
INCLUDE "text/common_2.asm"
INCLUDE "text/common_3.asm"

SECTION "Text 3", ROMX, BANK[$71]
INCLUDE "text/common_4.asm"
INCLUDE "text/common_5.asm"
