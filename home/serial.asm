Serial:: ; 6ef
; The serial interrupt.

	push af
	push bc
	push de
	push hl

	ld a, [hMobileReceive]
	and a
	jr nz, .mobile

	ld a, [wc2d4]
	bit 0, a
	jr nz, .printer

	ld a, [hLinkPlayerNumber]
	inc a ; is it equal to -1?
	jr z, .init_player_number

	ld a, [rSB]
	ld [hSerialReceive], a

	ld a, [hSerialSend]
	ld [rSB], a

	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player2

	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .player2

.mobile
	call MobileReceive
	jr .end

.printer
	call PrinterReceive
	jr .end

.init_player_number
	ld a, [rSB]
	cp $1
	jr z, .player1
	cp $2
	jr nz, .player2

.player1
	ld [hSerialReceive], a
	ld [hLinkPlayerNumber], a
	cp $2
	jr z, ._player2

	xor a
	ld [rSB], a
	ld a, $3
	ld [rDIV], a

.wait_bit_7
	ld a, [rDIV]
	bit 7, a
	jr nz, .wait_bit_7

	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .player2

._player2
	xor a
	ld [rSB], a

.player2
	ld a, $1
	ld [hFFCA], a
	ld a, -2
	ld [hSerialSend], a

.end
	pop hl
	pop de
	pop bc
	pop af
	reti
; 75f

Function75f:: ; 75f
	ld a, $1
	ld [hFFCC], a
.loop
	ld a, [hl]
	ld [hSerialSend], a
	call Function78a
	push bc
	ld b, a
	inc hl
	ld a, $30
.wait
	dec a
	jr nz, .wait
	ld a, [hFFCC]
	and a
	ld a, b
	pop bc
	jr z, .load
	dec hl
	cp $fd
	jr nz, .loop
	xor a
	ld [hFFCC], a
	jr .loop

.load
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; 78a

Function78a:: ; 78a
	xor a
	ld [hFFCA], a
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .asm_79b
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.asm_79b
	ld a, [hFFCA]
	and a
	jr nz, .asm_7e5
	ld a, [hLinkPlayerNumber]
	cp $1
	jr nz, .asm_7c0
	call Function82b
	jr z, .asm_7c0
	call .asm_825
	push hl
	ld hl, wcf5c
	inc [hl]
	jr nz, .asm_7b7
	dec hl
	inc [hl]

.asm_7b7
	pop hl
	call Function82b
	jr nz, .asm_79b
	jp Function833

.asm_7c0
	ld a, [rIE]
	and $f
	cp $8
	jr nz, .asm_79b
	ld a, [wcf5d]
	dec a
	ld [wcf5d], a
	jr nz, .asm_79b
	ld a, [wcf5d + 1]
	dec a
	ld [wcf5d + 1], a
	jr nz, .asm_79b
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .asm_7e5
	ld a, $ff
.asm_7e2
	dec a
	jr nz, .asm_7e2

.asm_7e5
	xor a
	ld [hFFCA], a
	ld a, [rIE]
	and $f
	sub $8
	jr nz, .asm_7f8
	ld [wcf5d], a
	ld a, $50
	ld [wcf5d + 1], a

.asm_7f8
	ld a, [hSerialReceive]
	cp $fe
	ret nz
	call Function82b
	jr z, .asm_813
	push hl
	ld hl, wcf5c
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .asm_80d
	dec [hl]

.asm_80d
	pop hl
	call Function82b
	jr z, Function833

.asm_813
	ld a, [rIE]
	and $f
	cp $8
	ld a, $fe
	ret z
	ld a, [hl]
	ld [hSerialSend], a
	call DelayFrame
	jp Function78a

.asm_825
	ld a, $f
.asm_827
	dec a
	jr nz, .asm_827
	ret
; 82b

Function82b:: ; 82b
	push hl
	ld hl, wcf5b
	ld a, [hli]
	or [hl]
	pop hl
	ret
; 833

Function833:: ; 833
	dec a
	ld [wcf5b], a
	ld [wcf5c], a
	ret
; 83b

Function83b:: ; 83b
	ld hl, wPlayerLinkAction
	ld de, wOtherPlayerLinkMode
	ld c, $2
	ld a, $1
	ld [hFFCC], a
.asm_847
	call DelayFrame
	ld a, [hl]
	ld [hSerialSend], a
	call Function78a
	ld b, a
	inc hl
	ld a, [hFFCC]
	and a
	ld a, $0
	ld [hFFCC], a
	jr nz, .asm_847
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .asm_847
	ret
; 862

Function862:: ; 862
	call LoadTileMapToTempTileMap
	callab PlaceWaitingText
	call Function87d
	jp Call_LoadTempTileMapToTileMap
; 871


Function871:: ; 871
	call LoadTileMapToTempTileMap
	callab PlaceWaitingText
	jp Function87d
; 87d

; One "giant" leap for machinekind

Function87d:: ; 87d
	ld a, $ff
	ld [wOtherPlayerLinkAction], a
.loop
	call LinkTransfer
	call DelayFrame
	call Function82b
	jr z, .check
	push hl
	ld hl, wcf5c
	dec [hl]
	jr nz, .skip
	dec hl
	dec [hl]
	jr nz, .skip
	pop hl
	xor a
	jp Function833

.skip
	pop hl

.check
	ld a, [wOtherPlayerLinkAction]
	inc a
	jr z, .loop

	ld b, 10
.receive
	call DelayFrame
	call LinkTransfer
	dec b
	jr nz, .receive

	ld b, 10
.acknowledge
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .acknowledge

	ld a, [wOtherPlayerLinkAction]
	ld [wOtherPlayerLinkMode], a
	ret
; 8c1

LinkTransfer:: ; 8c1
	push bc
	ld b, SERIAL_TIMECAPSULE
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .got_high_nybble
	ld b, SERIAL_TIMECAPSULE
	jr c, .got_high_nybble
	cp LINK_TRADECENTER
	ld b, SERIAL_TRADECENTER
	jr z, .got_high_nybble
	ld b, SERIAL_BATTLE

.got_high_nybble
	call .Receive
	ld a, [wPlayerLinkAction]
	add b
	ld [hSerialSend], a
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .player_1
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.player_1
	call .Receive
	pop bc
	ret
; 8f3

.Receive: ; 8f3
	ld a, [hSerialReceive]
	ld [wOtherPlayerLinkMode], a
	and $f0
	cp b
	ret nz
	xor a
	ld [hSerialReceive], a
	ld a, [wOtherPlayerLinkMode]
	and $f
	ld [wOtherPlayerLinkAction], a
	ret
; 908

LinkDataReceived:: ; 908
; Let the other system know that the data has been received.
	xor a
	ld [hSerialSend], a
	ld a, [hLinkPlayerNumber]
	cp $2
	ret nz
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret
; 919

Function919:: ; 919
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	ret
; 92e
