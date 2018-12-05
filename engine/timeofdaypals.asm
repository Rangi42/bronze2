UpdateTimeOfDayPal:: ; 8c001
	call UpdateTime
	ld a, [TimeOfDay]
	ld [CurTimeOfDay], a
	call GetTimePalette
	ld [TimeOfDayPal], a
	ret
; 8c011


_TimeOfDayPals:: ; 8c011
; return carry if pals are changed

; forced pals?
	ld hl, wTimeOfDayPalFlags
	bit 7, [hl]
	jr nz, .dontchange

; do we need to bother updating?
	ld a, [TimeOfDay]
	ld hl, CurTimeOfDay
	cp [hl]
	jr z, .dontchange

; if so, the time of day has changed
	ld a, [TimeOfDay]
	ld [CurTimeOfDay], a

; get palette id
	call GetTimePalette

; same palette as before?
	ld hl, TimeOfDayPal
	cp [hl]
	jr z, .dontchange

; update palette id
	ld [TimeOfDayPal], a


; save bg palette 8
	ld hl, UnknBGPals + 8 * 7 ; UnknBGPals + 7 pals

; save wram bank
	ld a, [rSVBK]
	ld b, a
; wram bank 5
	ld a, 5
	ld [rSVBK], a

; push palette
	ld c, 4 ; NUM_PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push

; restore wram bank
	ld a, b
	ld [rSVBK], a


; update sgb pals
	ld b, SCGB_MAPPALS
	call GetSGBLayout


; restore bg palette 8
	ld hl, UnknOBPals - 1 ; last byte in UnknBGPals

; save wram bank
	ld a, [rSVBK]
	ld d, a
; wram bank 5
	ld a, 5
	ld [rSVBK], a

; pop palette
	ld e, 4 ; NUM_PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop

; restore wram bank
	ld a, d
	ld [rSVBK], a

; update palettes
	call _UpdateTimePals
	call DelayFrame

; successful change
	scf
	ret

.dontchange
; no change occurred
	and a
	ret
; 8c070


_UpdateTimePals:: ; 8c070
	ld c, $9 ; normal
	call GetTimePalFade
	call DmgToCgbTimePals
	ret
; 8c079

FadeInPalettes:: ; 8c079
	ld c, $12
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret
; 8c084

FadeOutPalettes:: ; 8c084
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret
; 8c092

Special_BattleTowerFade: ; 8c092
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
.asm_8c09c
	call DmgToCgbTimePals
rept 3
	inc hl
endr
	ld c, $7
	call DelayFrames
	dec b
	jr nz, .asm_8c09c
	ret
; 8c0ab

Special_FadeInQuickly: ; 8c0ab
	ld c, $0
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret
; 8c0b6

Special_FadeBlackQuickly: ; 8c0b6
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret
; 8c0c1


FillWhiteBGColor: ; 8c0c1
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnknBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, UnknBGPals + 1 palettes
	ld c, 6
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 6
	inc hl
endr
	dec c
	jr nz, .loop

	pop af
	ld [rSVBK], a
	ret
; 8c0e5

brightlevel: MACRO
	db (\1 << 6) | (\2 << 4) | (\3 << 2) | \4
ENDM

ReplaceTimeOfDayPals: ; 8c0e5
	ld hl, .BrightnessLevels
	ld a, [wMapTimeOfDay]
	cp $4 ; Dark cave, needs Flash
	jr z, .DarkCave
	and $7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wTimeOfDayPalset], a
	ret

.DarkCave:
	ld a, [StatusFlags]
	bit 2, a ; Flash
	jr nz, .UsedFlash
	ld a, %11111111 ; 3, 3, 3, 3
	ld [wTimeOfDayPalset], a
	ret

.UsedFlash:
	ld a, %10101010 ; 2, 2, 2, 2
	ld [wTimeOfDayPalset], a
	ret
; 8c10f (23:410f)

.BrightnessLevels: ; 8c10f
	brightlevel 3, 2, 1, 0
	brightlevel 1, 1, 1, 1
	brightlevel 2, 2, 2, 2
	brightlevel 0, 0, 0, 0
	brightlevel 3, 3, 3, 3
	brightlevel 3, 2, 1, 0
	brightlevel 3, 2, 1, 0
	brightlevel 3, 2, 1, 0
; 8c117

GetTimePalette: ; 8c117
	ld a, [TimeOfDay]
	ld e, a
	ld d, 0
	ld hl, .TimePalettes
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8c126

.TimePalettes:
	dw .MorningPalette
	dw .DayPalette
	dw .NitePalette
	dw .DarknessPalette

.MorningPalette:
	ld a, [wTimeOfDayPalset]
	and %00000011 ; 0
	ret

.DayPalette:
	ld a, [wTimeOfDayPalset]
	and %00001100 ; 1
	srl a
	srl a
	ret

.NitePalette:
	ld a, [wTimeOfDayPalset]
	and %00110000 ; 2
	swap a
	ret

.DarknessPalette:
	ld a, [wTimeOfDayPalset]
	and %11000000 ; 3
	rlca
	rlca
	ret
; 8c14e


DmgToCgbTimePals: ; 8c14e
	push hl
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	pop de
	pop hl
	ret
; 8c15e

ConvertTimePalsIncHL: ; 8c15e
.loop
	call DmgToCgbTimePals
rept 3
	inc hl
endr
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret
; 8c16d

ConvertTimePalsDecHL: ; 8c16d
.loop
	call DmgToCgbTimePals
rept 3
	dec hl
endr
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret
; 8c17c


GetTimePalFade: ; 8c17c
; check cgb
	ld a, [hCGB]
	and a
	jr nz, .cgb

; else: dmg

; index
	ld a, [TimeOfDayPal]
	and %11

; get fade table
	push bc
	ld c, a
	ld b, $0
	ld hl, .dmgfades
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

; get place in fade table
	ld b, $0
	add hl, bc
	ret

.cgb
	ld hl, .cgbfade
	ld b, $0
	add hl, bc
	ret

.dmgfades
	dw .morn
	dw .day
	dw .nite
	dw .darkness

.morn
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11100100, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.day
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11100100, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.nite
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11100100, %11100100
	db %11101001, %11010000, %11010000
	db %10010000, %10000000, %10000000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000

.darkness
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111111
	db %11111110, %11100100, %11111111
	db %11111101, %11010000, %11111111
	db %11111101, %10000000, %11111111
	db %00000000, %01000000, %00000000
	db %00000000, %00000000, %00000000

.cgbfade
	db %11111111, %11111111, %11111111
	db %11111110, %11111110, %11111110
	db %11111001, %11111001, %11111001
	db %11100100, %11100100, %11100100
	db %10010000, %10010000, %10010000
	db %01000000, %01000000, %01000000
	db %00000000, %00000000, %00000000
; 8c20f
