	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b
.frame2
	db $01 ; bitmask
	db $1c, $1d, $1e, $1f, $20
.frame3
	db $01 ; bitmask
	db $21, $22, $23, $24, $25
; 0xd953c
