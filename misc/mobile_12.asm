InitMobileProfile: ; 4802f (12:402f)
	xor a
	set 6, a
	ld [wd002], a
	ld hl, wd003
	set 0, [hl]
	ld a, c
	and a
	call z, InitCrystalData
	call ClearBGPalettes
	call Function48d3d
	ld a, [wd479]
	bit 1, a
	jr z, .asm_4805a
	ld a, [wd003]
	set 0, a
	set 1, a
	set 2, a
	set 3, a
	ld [wd003], a
.asm_4805a
	call Function486bf
	call LoadFontsExtra
	ld de, GFX_488c3
	ld hl, VTiles2 tile $10
	lb bc, BANK(GFX_488c3), 1
	call Request1bpp
	ld de, GFX_488cb
	ld hl, VTiles2 tile $11
	lb bc, BANK(GFX_488cb), 1
	call Request1bpp
	call Function4a3a7
	call ClearBGPalettes
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4808a
	call Function48689
	jr .asm_480d7
.asm_4808a
	ld a, $5
	ld [MusicFade], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU / $100
	ld [MusicFadeIDHi], a
	ld c, 20
	call DelayFrames
	ld b, $1
	call GetMysteryGift_MobileAdapterLayout
	call ClearBGPalettes
	hlcoord 0, 0
	ld b,  2
	ld c, 20
	call ClearBox
	hlcoord 0, 1
	ld a, $c
	ld [hl], a
	ld bc, $13
	add hl, bc
	ld [hl], a
	ld de, MobileProfileString
	hlcoord 1, 1
	call PlaceString
	hlcoord 0, 2
	ld b, $a
	ld c, $12
	call Function48cdc
	hlcoord 2, 4
	ld de, MobileString_Gender
	call PlaceString
.asm_480d7
	hlcoord 2, 6
	ld de, MobileString_Age
	call PlaceString
	hlcoord 2, 8
	ld de, MobileString_Address
	call PlaceString
	hlcoord 2, 10
	ld de, MobileString_ZipCode
	call PlaceString
	hlcoord 2, 12
	ld de, MobileString_OK
	call PlaceString
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_48113
	ld a, [PlayerGender]
	ld hl, Strings_484fb
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 11, 4
	call PlaceString
.asm_48113
	hlcoord 11, 6
	call Function487ec
	ld a, [wd474]
	dec a
	ld hl, Prefectures
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 11, 8
	call PlaceString
	hlcoord 11, 10
	call Function489ea
	hlcoord 0, 14
	ld b, $2
	ld c, $12
	call TextBox
	hlcoord 1, 16
	ld de, MobileString_PersonalInfo
	call PlaceString
	call Function48187
	call WaitBGMap2
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4815f

Function48157: ; 48157 (12:4157)
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4815f: ; 4815f (12:415f)
	bit 0, a
	jp nz, Function4820d
	ld b, a
	ld a, [wd002]
	bit 6, a
	jr z, .asm_48177
	ld hl, wd479
	bit 1, [hl]
	jr z, .asm_48177
	bit 1, b
	jr nz, .asm_4817a
.asm_48177
	jp Function48272
.asm_4817a
	call ClearBGPalettes
	call Function48d30
	pop bc
	call ClearTileMap
	ld a, $ff
	ret

Function48187: ; 48187 (12:4187)
	ld a, [wd479]
	bit 1, a
	jr nz, .asm_481f1
	ld a, [wd003]
	ld d, a
	call Function48725
	jr c, .asm_481a2
	lb bc, 1, 4
	hlcoord 2, 12
	call ClearBox
	jr .asm_481ad
.asm_481a2
	push de
	hlcoord 2, 12
	ld de, MobileString_OK
	call PlaceString
	pop de
.asm_481ad
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_481c1
	bit 0, d
	jr nz, .asm_481c1
	lb bc, 1, 8
	hlcoord 11, 4
	call ClearBox
.asm_481c1
	bit 1, d
	jr nz, .asm_481ce
	lb bc, 1, 8
	hlcoord 11, 6
	call ClearBox
.asm_481ce
	bit 2, d
	jr nz, .asm_481db
	lb bc, 2, 8
	hlcoord 11, 7
	call ClearBox
.asm_481db
	bit 3, d
	jr nz, .asm_481f1
	ld a, [wd479]
	bit 0, a
	jr nz, .asm_481f8
	lb bc, 1, 8
	hlcoord 11, 10
	call ClearBox
	jr .asm_48201
.asm_481f1
	ld a, [wd479]
	bit 0, a
	jr nz, .asm_48201
.asm_481f8
	hlcoord 11, 10
	ld de, .String_TellLater
	call PlaceString
.asm_48201
	ret
; 48202 (12:4202)

.String_TellLater: ; 48202
	db "Tell Later@"
; 4820d

Function4820d: ; 4820d (12:420d)
	call PlaceHollowCursor
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4821f
	pop af
	inc a
	push af
.asm_4821f
	pop af
	cp $1
	jr z, asm_4828d
	cp $2
	jp z, Function4876f
	cp $3
	jp z, Function48304
	cp $4
	jp z, Function488d3
	ld a, $2
	call MenuClickSound
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4825c
	jr .asm_4825c
; 48241 (12:4241)

	hlcoord 1, 15
	ld b, $2
	ld c, $12
	call ClearBox
	ld de, MobileString_ProfileChanged
	hlcoord 1, 16
	call PlaceString
	call WaitBGMap
	ld c, 48
	call DelayFrames

.asm_4825c
	call ClearBGPalettes
	call Function48d30
	pop bc
	call ClearTileMap
	ld b, SCGB_08
	call GetSGBLayout
	ld hl, wd479
	set 1, [hl]
	xor a
	ret

Function48272: ; 48272 (12:4272)
	jp Function4840c
; 48275 (12:4275)

MobileString_PersonalInfo: ; 48275
	db "Personal Info@"
; 48283

Function48283: ; 48283 (12:4283)
	lb bc, 2, 18
	hlcoord 1, 15
	call ClearBox
	ret

asm_4828d: ; 4828d (12:428d)
	call Function48283
	hlcoord 1, 16
	ld de, MobileDesc_Gender
	call PlaceString
	ld hl, MenuDataHeader_0x484f1
	call LoadMenuDataHeader
	call Function4873c
	hlcoord 11, 2
	ld b, $4
	ld c, $7
	call Function48cdc
	hlcoord 13, 4
	ld de, String_484fb
	call PlaceString
	hlcoord 13, 6
	ld de, String_484ff
	call PlaceString
	call WaitBGMap
	ld a, [PlayerGender]
	inc a
	ld [wMenuCursorBuffer], a
	call StaticMenuJoypad
	call PlayClickSFX
	call ExitMenu
	bit 0, a
	jp z, Function4840c
	ld hl, wMenuCursorY
	ld a, [hl]
	ld hl, Strings_484fb
	cp $1
	jr z, .asm_482ed
.asm_482e1
	ld a, [hli]
	cp $50
	jr nz, .asm_482e1
	ld a, $1
	ld [PlayerGender], a
	jr .asm_482f1
.asm_482ed
	xor a
	ld [PlayerGender], a
.asm_482f1
	ld d, h
	ld e, l
	hlcoord 11, 4
	call PlaceString
	ld a, [wd003]
	set 0, a
	ld [wd003], a
	jp Function4840c

Function48304: ; 48304 (12:4304)
	call Function48283
	hlcoord 1, 16
	ld de, MobileDesc_Address
	call PlaceString
	ld hl, MenuDataHeader_0x48504
	call LoadMenuDataHeader
	ld hl, MenuDataHeader_0x48513
	call LoadMenuDataHeader
	hlcoord 10, 0
	ld b, $c
	ld c, $8
	call Function48cdc
	ld a, [wMenuCursorBuffer]
	ld b, a
	ld a, [wMenuScrollPosition]
	ld c, a
	push bc
	ld a, [wd474]
	dec a
	cp $29
	jr c, .asm_4833f
	sub $29
	inc a
	ld [wMenuCursorBuffer], a
	ld a, $29
.asm_4833f
	ld [wMenuScrollPosition], a
	callba Function104148
.asm_48348
	call ScrollingMenu
	ld de, $629
	call Function48383
	jr c, .asm_48348
	ld d, a
	pop bc
	ld a, b
	ld [wMenuCursorBuffer], a
	ld a, c
	ld [wMenuScrollPosition], a
	ld a, d
	push af
	call ExitMenu
	call ExitMenu
	pop af
	ld a, [hJoyPressed]
	bit 0, a
	jr z, .asm_48377
	call Function483bb
	ld a, [wd003]
	set 2, a
	ld [wd003], a
.asm_48377
	call Function48187
	callba Function104148
	jp Function4840c

Function48383: ; 48383 (12:4383)
	push bc
	push af
	bit 5, a
	jr nz, .asm_48390
	bit 4, a
	jr nz, .asm_4839f
	and a
	jr .asm_483b7
.asm_48390
	ld a, [wMenuScrollPosition]
	sub d
	ld [wMenuScrollPosition], a
	jr nc, .asm_483af
	xor a
	ld [wMenuScrollPosition], a
	jr .asm_483af
.asm_4839f
	ld a, [wMenuScrollPosition]
	add d
	ld [wMenuScrollPosition], a
	cp e
	jr c, .asm_483af
	ld a, e
	ld [wMenuScrollPosition], a
	jr .asm_483af
.asm_483af
	ld hl, wMenuCursorY
	ld a, [hl]
	ld [wMenuCursorBuffer], a
	scf
.asm_483b7
	pop bc
	ld a, b
	pop bc
	ret

Function483bb: ; 483bb (12:43bb)
	ld hl, wScrollingMenuCursorPosition
	ld a, [hl]
	inc a
	ld [wd474], a
	dec a
	ld b, a
	ld hl, Prefectures
.asm_483c8
	and a
	jr z, .asm_483d5
.asm_483cb
	ld a, [hli]
	cp "@"
	jr nz, .asm_483cb
	ld a, b
	dec a
	ld b, a
	jr .asm_483c8
.asm_483d5
	ld d, h
	ld e, l
	ld b, $2
	ld c, $8
	hlcoord 11, 7
	call ClearBox
	hlcoord 11, 8
	call PlaceString
	ret
; 483e8 (12:43e8)

Function483e8: ; 483e8
	push de
	ld hl, Prefectures
	ld a, [MenuSelection]
	cp $ff
	jr nz, .asm_483f8
	ld hl, Wakayama ; last string
	jr .asm_48405

.asm_483f8
	ld d, a
	and a
	jr z, .asm_48405
.asm_483fc
	ld a, [hli]
	cp "@"
	jr nz, .asm_483fc
	ld a, d
	dec a
	jr .asm_483f8

.asm_48405
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret
; 4840c

Function4840c: ; 4840c (12:440c)
	call Function48187
	call Function48283
	hlcoord 1, 16
	ld de, MobileString_PersonalInfo
	call PlaceString
	call Function486bf
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_48437
	ld b, 9
	ld c, 1
	hlcoord 1, 4
	call ClearBox
	jp Function48157
.asm_48437
	ld b, 7
	ld c, 1
	hlcoord 1, 6
	call ClearBox
	jp Function48157

Mobile12_Bin2Dec: ; 48444 (12:4444)
	push bc
	push af
	push de
	push hl
	ld hl, .DigitStrings
.loop
	and a
	jr z, .got_string
	inc hl
	inc hl
	dec a
	jr .loop
.got_string
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	pop de
	pop af
	pop bc
	ret
; 4845d (12:445d)

.DigitStrings: ; 4845d
; 4845d
	db "0@"
	db "1@"
	db "2@"
	db "3@"
	db "4@"
	db "5@"
	db "6@"
	db "7@"
	db "8@"
	db "9@"
; 48471

MobileProfileString:         db "  Mobile Profile@"
MobileString_Gender:         db "Gender@"
MobileString_Age:            db "Age@"
MobileString_Address:        db "Address@"
MobileString_ZipCode:        db "Zip Code@"
MobileString_OK:             db "OK@"
MobileString_ProfileChanged: db "Profile Changed@"
MobileDesc_Gender:           db "Boy or girl?@"
MobileDesc_Age:              db "How old are you?@"
MobileDesc_Address:          db "Where do you live?@"
MobileDesc_ZipCode:          db "Your zip code?@"
; 484f1

MenuDataHeader_0x484f1: ; 0x484f1
	db $40 ; flags
	db 02, 11 ; start coords
	db 07, 19 ; end coords
	dw MenuData2_0x484f9
	db 1 ; default option
; 0x484f9

MenuData2_0x484f9: ; 0x484f9
	db $a0 ; flags
	db 2 ; items
Strings_484fb:
String_484fb: db "Boy@"
String_484ff: db "Girl@"
; 0x48504

MenuDataHeader_0x48504: ; 0x48504
	db $40 ; flags
	db 00, 10 ; start coords
	db 17, 19 ; end coords

MenuDataHeader_0x48509: ; 0x48509
	db $40 ; flags
	db 05, 10 ; start coords
	db 07, 19 ; end coords

MenuDataHeader_0x4850e: ; 0x4850e
	db $40 ; flags
	db 09, 10 ; start coords
	db 11, 19 ; end coords

MenuDataHeader_0x48513: ; 0x48513
	db $40 ; flags
	db 01, 11 ; start coords
	db 12, 18 ; end coords
	dw MenuData2_0x4851b
	db 1 ; default option
; 0x4851b

MenuData2_0x4851b: ; 0x4851b
	db $1d ; flags
	db 6 ; items

Unknown_4851d: ; 4851d
	db $00, $01, $12, $2b, $45, $12, $e8, $43, $00, $00, $00, $00, $00, $00, $2e, $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c
	db $2d, $ff

Prefectures:
Aichi:     db "あいちけん@"   ; Aichi
Aomori:    db "あおもりけん@" ; Aomori
Akita:     db "あきたけん@"   ; Akita
Ishikawa:  db "いしかわけん@" ; Ishikawa
Ibaraki:   db "いばらきけん@" ; Ibaraki
Iwate:     db "いわてけん@"   ; Iwate
Ehime:     db "えひめけん@"   ; Ehime
Oita:      db "おおいたけん@" ; Oita
Osakafu:   db "おおさかふ@"   ; Osakafu
Okayama:   db "おかやまけん@" ; Okayama
Okinawa:   db "おきなわけん@" ; Okinawa
Kagawa:    db "かがわけん@"   ; Kagawa
Kagoshima: db "かごしまけん@" ; Kagoshima
Kanagawa:  db "かながわけん@" ; Kanagawa
Gifu:      db "ぎふけん@"     ; Gifu
Kyotofu:   db "きょうとふ@"   ; Kyotofu
Kumamoto:  db "くまもとけん@" ; Kumamoto
Gunma:     db "ぐんまけん@"   ; Gunma
Kochi:     db "こうちけん@"   ; Kochi
Saitama:   db "さいたまけん@" ; Saitama
Saga:      db "さがけん@"     ; Saga
Shiga:     db "しがけん@"     ; Shiga
Shizuoka:  db "しずおかけん@" ; Shizuoka
Shimane:   db "しまねけん@"   ; Shimane
Chiba:     db "ちばけん@"     ; Chiba
Tokyo:     db "とうきょうと@" ; Tokyo
Tokushima: db "とくしまけん@" ; Tokushima
Tochigi:   db "とちぎけん@"   ; Tochigi
Tottori:   db "とっとりけん@" ; Tottori
Toyama:    db "とやまけん@"   ; Toyama
Nagasaki:  db "ながさきけん@" ; Nagasaki
Nagano:    db "ながのけん@"   ; Nagano
Naraken:   db "ならけん@"     ; Naraken
Niigata:   db "にいがたけん@" ; Niigata
Hyogo:     db "ひょうごけん@" ; Hyogo
Hiroshima: db "ひろしまけん@" ; Hiroshima
Fukui:     db "ふくいけん@"   ; Fukui
Fukuoka:   db "ふくおかけん@" ; Fukuoka
Fukushima: db "ふくしまけん@" ; Fukushima
Hokkaido:  db "ほっかいどう@" ; Hokkaido
Mie:       db "みえけん@"     ; Mie
Miyagi:    db "みやぎけん@"   ; Miyagi
Miyazaki:  db "みやざきけん@" ; Miyazaki
Yamagata:  db "やまがたけん@" ; Yamagata
Yamaguchi: db "やまぐちけん@" ; Yamaguchi
Yamanashi: db "やまなしけん@" ; Yamanashi
Wakayama:  db "わかやまけん@" ; Wakayama
; 48689

Function48689: ; 48689 (12:4689)
	ld c, 7
	call DelayFrames
	ld b, $1
	call GetMysteryGift_MobileAdapterLayout
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, $4
	ld c, $14
	call ClearBox
	hlcoord 0, 2
	ld a, $c
	ld [hl], a
	ld bc, $13
	add hl, bc
	ld [hl], a
	ld de, MobileProfileString
	hlcoord 1, 2
	call PlaceString
	hlcoord 0, 4
	ld b, $8
	ld c, $12
	call Function48cdc
	ret

Function486bf: ; 486bf (12:46bf)
	ld hl, w2DMenuCursorInitY
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_486ce
	ld a, $4
	ld [hli], a
	jr .asm_486d1
.asm_486ce
	ld a, $6
	ld [hli], a
.asm_486d1
	ld a, $1
	ld [hli], a
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_486e7
	call Function48725
	ld a, $4
	jr nc, .asm_486e4
	ld a, $5
.asm_486e4
	ld [hli], a
	jr .asm_486fb
.asm_486e7
	ld a, [wd479]
	bit 1, a
	jr nz, .asm_486f8
	call Function48725
	jr c, .asm_486f8
	ld a, $3
	ld [hli], a
	jr .asm_486fb
.asm_486f8
	ld a, $4
	ld [hli], a
.asm_486fb
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	push af
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4871a
	pop af
	add $2
	push af
.asm_4871a
	pop af
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	xor a
rept 3
	ld [hli], a
endr
	ret

Function48725: ; 48725 (12:4725)
	ld a, [wd003]
	bit 0, a
	jr z, .asm_4873a
	bit 1, a
	jr z, .asm_4873a
	bit 2, a
	jr z, .asm_4873a
	bit 3, a
	jr z, .asm_4873a
	scf
	ret
.asm_4873a
	and a
	ret

Function4873c: ; 4873c (12:473c)
	ld hl, w2DMenuCursorInitY
	ld a, $4
	ld [hli], a
	ld a, $c
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $2
	ld [hli], a
	ld a, [PlayerGender]
	and a
	jr z, .asm_48764
	ld a, $2
	jr .asm_48766
.asm_48764
	ld a, $1
.asm_48766
	ld [hli], a
	ld a, $1
	ld [hli], a
	xor a
rept 3
	ld [hli], a
endr
	ret

Function4876f: ; 4876f (12:476f)
	call Function48283
	hlcoord 1, 16
	ld de, MobileDesc_Age
	call PlaceString
	ld hl, MenuDataHeader_0x48509
	call LoadMenuDataHeader
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	call WaitBGMap
	ld a, [wd473]
	and a
	jr z, .asm_487ab
	cp $64
	jr z, .asm_487b2
	hlcoord 12, 5
	ld [hl], $10
	hlcoord 12, 7
	ld [hl], $11
	jr .asm_487b7
.asm_487ab
	hlcoord 12, 5
	ld [hl], $10
	jr .asm_487b7
.asm_487b2
	hlcoord 12, 7
	ld [hl], $11
.asm_487b7
	hlcoord 11, 6
	call Function487ec
	ld c, 10
	call DelayFrames
	ld a, [wd473]
	push af
.asm_487c6
	call JoyTextDelay
	call Function4880e
	jr nc, .asm_487c6
	ld a, $1
	call MenuClickSound
	pop bc
	jr nz, .asm_487da
	ld a, b
	ld [wd473], a
.asm_487da
	ld a, [wd473]
	call ExitMenu
	hlcoord 11, 6
	call Function487ec
	pop af
	ld [hInMenu], a
	jp Function4840c

Function487ec: ; 487ec (12:47ec)
	push hl
	ld de, wd473
	call Function487ff
	pop hl
rept 4
	inc hl
endr
	ld de, String_4880d
	call PlaceString
	ret

Function487ff: ; 487ff (12:47ff)
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	ld b, PRINTNUM_LEADINGZEROS | 1
	ld c, 3
	call PrintNum
	ret
; 4880d (12:480d)

String_4880d: ; 4880d
	db "@"
; 4880e

Function4880e: ; 4880e (12:480e)
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, Function488b9
	ld a, [hJoyPressed]
	and B_BUTTON
	jp nz, Function488b4
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_48843
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_48838
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_4884f
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_4885f
	call DelayFrame
	and a
	ret
.asm_48838
	ld hl, wd473
	ld a, [hl]
	and a
	jr z, .asm_48840
	dec a
.asm_48840
	ld [hl], a
	jr .asm_4886f
.asm_48843
	ld hl, wd473
	ld a, [hl]
	cp $64
	jr nc, .asm_4884c
	inc a
.asm_4884c
	ld [hl], a
	jr .asm_4886f
.asm_4884f
	ld a, [wd473]
	cp $5b
	jr c, .asm_48858
	ld a, $5a
.asm_48858
	add $a
	ld [wd473], a
	jr .asm_4886f
.asm_4885f
	ld a, [wd473]
	cp $a
	jr nc, .asm_48868
	ld a, $a
.asm_48868
	sub $a
	ld [wd473], a
	jr .asm_4886f
.asm_4886f
	ld a, [wd473]
	and a
	jr z, .asm_48887
	cp $64
	jr z, .asm_48898
	jr z, .asm_488a7
	hlcoord 12, 5
	ld [hl], $10
	hlcoord 12, 7
	ld [hl], $11
	jr .asm_488a7
.asm_48887
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 5
	ld [hl], $10
	jr .asm_488a7
.asm_48898
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 7
	ld [hl], $11
.asm_488a7
	hlcoord 11, 6
	call Function487ec
	call WaitBGMap
	ld a, $1
	and a
	ret

Function488b4: ; 488b4 (12:48b4)
	ld a, $0
	and a
	scf
	ret

Function488b9: ; 488b9 (12:48b9)
	ld a, [wd003]
	set 1, a
	ld [wd003], a
	scf
	ret
; 488c3 (12:48c3)

GFX_488c3: ; 488c3
INCBIN "gfx/unknown/0488c3.2bpp"

GFX_488cb: ; 488cb
INCBIN "gfx/unknown/0488cb.2bpp"

Function488d3: ; 488d3 (12:48d3)
	call Function48283
	hlcoord 1, 16
	ld de, MobileDesc_ZipCode
	call PlaceString
	call Function48a3a
	jp c, Function4840c
	ld hl, MenuDataHeader_0x4850e
	call LoadMenuDataHeader
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	ld a, [wd475]
	and $f
	ld d, $0
	hlcoord 11, 10
	call Function489ea
	call WaitBGMap
	ld a, [wd475]
	ld b, a
	ld a, [wd476]
	ld c, a
	ld a, [wd477]
	ld d, a
	ld a, [wd478]
	ld e, a
	push de
	push bc
	ld d, $0
	ld b, $0

asm_48922: ; 48922 (12:4922)
	push bc
	call JoyTextDelay
	ld a, [hJoyDown]
	and a
	jp z, Function4896e
	bit 0, a
	jp nz, Function4896e
	bit 1, a
	jp nz, Function4896e
	ld a, [wd002]
	and %11001111
	res 7, a
	ld [wd002], a
	pop bc
	inc b
	ld a, b
	cp $5
	push bc
	jr c, .asm_4894c
	pop bc
	ld b, $4
	push bc
.asm_4894c
	pop bc
	push bc
	ld a, b
	cp $4
	jr nz, asm_48972
	ld c, 10
	call DelayFrames
	jr asm_48972
; 4895a (12:495a)

Function4895a: ; 4895a
	ld a, [hJoyPressed]
	and a
	jr z, .asm_48965
	pop bc
	ld b, $1
	push bc
	jr asm_48972

.asm_48965
	ld a, [hJoyLast]
	and a
	jr z, asm_48972

	pop bc
	ld b, $1
	push bc

Function4896e: ; 4896e (12:496e)
	pop bc
	ld b, $0
	push bc

asm_48972: ; 48972 (12:4972)
	call Function48ab5
	push af
	cp $f0
	jr z, .asm_48994
	cp $f
	jr nz, .asm_48988
	ld a, [wd002]
	set 7, a
	and $cf
	ld [wd002], a
.asm_48988
	hlcoord 11, 10
	ld b, $0
	ld c, d
	add hl, bc
	ld b, $3
	call Function48c11
.asm_48994
	call WaitBGMap
	pop af
	pop bc
	jr nc, asm_48922
	jr nz, .asm_489b1
	pop bc
	ld a, b
	ld [wd475], a
	ld a, c
	ld [wd476], a
	pop bc
	ld a, b
	ld [wd477], a
	ld a, c
	ld [wd478], a
	jr .asm_489c5
.asm_489b1
	push af
	ld a, [wd479]
	set 0, a
	ld [wd479], a
	ld a, [wd003]
	set 3, a
	ld [wd003], a
	pop af
	pop bc
	pop bc
.asm_489c5
	push af
	push bc
	push de
	push hl
	ld a, $1
	call MenuClickSound
	pop hl
	pop de
	pop bc
	pop af
	call ExitMenu
	hlcoord 11, 10
	call Function489ea
	hlcoord 11, 9
	lb bc, 1, 8
	call ClearBox
	pop af
	ld [hInMenu], a
	jp Function4840c

Function489ea: ; 489ea (12:49ea)
	push de
	ld a, [wd475]
	and $f
	call Mobile12_Bin2Dec
	ld a, [wd476]
	and $f0
	swap a
	inc hl
	call Mobile12_Bin2Dec
	ld a, [wd476]
	and $f
	inc hl
	call Mobile12_Bin2Dec
	inc hl
	ld de, String_48a38
	call PlaceString
	ld a, [wd477]
	and $f0
	swap a
	inc hl
	call Mobile12_Bin2Dec
	ld a, [wd477]
	and $f
	inc hl
	call Mobile12_Bin2Dec
	ld a, [wd478]
	and $f0
	swap a
	inc hl
	call Mobile12_Bin2Dec
	ld a, [wd478]
	and $f
	inc hl
	call Mobile12_Bin2Dec
	pop de
	ret
; 48a38 (12:4a38)

String_48a38: ; 48a38
	db "-@"
; 48a3a

Function48a3a: ; 48a3a (12:4a3a)
	ld hl, MenuDataHeader_0x48a9c
	call LoadMenuDataHeader
	call Function4873c
	ld a, $a
	ld [w2DMenuCursorInitY], a
	ld a, $b
	ld [w2DMenuCursorInitX], a
	ld a, $1
	ld [wMenuCursorY], a
	hlcoord 10, 8
	ld b, $4
	ld c, $8
	call Function48cdc
	hlcoord 12, 10
	ld de, String_48aa1
	call PlaceString
	call StaticMenuJoypad
	push af
	call PlayClickSFX
	call ExitMenu
	pop af
	bit 1, a
	jp nz, Function48a9a
	ld a, [wMenuCursorY]
	cp $1
	jr z, .asm_48a98
	ld a, [wd003]
	set 3, a
	ld [wd003], a
	ld a, [wd479]
	res 0, a
	ld [wd479], a
	xor a
	ld bc, $4
	ld hl, wd475
	call ByteFill
	jr Function48a9a
.asm_48a98
	and a
	ret

Function48a9a: ; 48a9a (12:4a9a)
	scf
	ret
; 48a9c (12:4a9c)

MenuDataHeader_0x48a9c: ; 0x48a9c
	db $40 ; flags
	db 08, 10 ; start coords
	db 13, 19 ; end coord

String_48aa1: ; 48aa1
	db   "Tell Now"
	next "Tell Later@"
; 48ab5


Function48ab5: ; 48ab5 (12:4ab5)
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, Function48c0f
	ld a, [hJoyPressed]
	and B_BUTTON
	jp nz, Function48c0d
	ld a, d
	and a
	jr z, .asm_48adf
	cp $1
	jr z, .asm_48ae7
	cp $2
	jr z, .asm_48af1
	cp $3
	jr z, .asm_48af9
	cp $4
	jr z, .asm_48b03
	cp $5
	jr z, .asm_48b0b
	cp $6
	jr .asm_48b15
.asm_48adf
	ld hl, wd475
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48ae7
	ld hl, wd476
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48af1
	ld hl, wd476
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48af9
	ld hl, wd477
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48b03
	ld hl, wd477
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48b0b
	ld hl, wd478
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48b15
	ld hl, wd478
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48b1d
	push hl
	push af
	ld e, $0
	hlcoord 11, 10
	ld a, d
.asm_48b25
	and a
	jr z, .asm_48b2c
	inc e
	dec a
	jr .asm_48b25
.asm_48b2c
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_48b8d
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_48b55
	ld a, [hl]
	and D_LEFT
	jp nz, Function48bd7
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_48b9d
	hlcoord 11, 10
	call Function489ea
	ld a, [wd002]
	bit 7, a
	jr nz, .asm_48b51
.asm_48b51
	pop bc
	pop bc
	and a
	ret
.asm_48b55
	pop af
	ld b, a
	and $f
	and a
	ld a, b
	jr nz, .asm_48b61
	and $f0
	add $a
.asm_48b61
	dec a
.asm_48b62
	push de
	push af
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop af
	pop de
	hlcoord 11, 10
	ld b, a
	ld a, d
	cp $3
	jr c, .asm_48b7a
	inc hl
.asm_48b7a
	ld a, b
	pop hl
	bit 7, a
	jr z, .asm_48b85
	call Function48c4d
	jr .asm_48b88
.asm_48b85
	call Function48c5a
.asm_48b88
	ld a, $f0
	jp Function48c00
.asm_48b8d
	pop af
	ld b, a
	and $f
	cp $9
	ld a, b
	jr c, .asm_48b9a
	and $f0
	add $ff
.asm_48b9a
	inc a
	jr .asm_48b62
.asm_48b9d
	push de
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop de
	ld a, d
	cp $6
	jr nc, .asm_48baf
	inc d
.asm_48baf
	pop af
	pop hl
	ld b, a
	ld a, d
	cp $6
	ld a, b
	jr z, .asm_48bc4
	bit 7, a
	jr nz, .asm_48bc4
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr asm_48bc7
.asm_48bc4
	ld a, [hl]
	and $f

asm_48bc7: ; 48bc7 (12:4bc7)
	hlcoord 11, 10
	push af
	ld a, d
	cp $3
	pop bc
	ld a, b
	jr c, .asm_48bd3
	inc hl
.asm_48bd3
	ld a, $f
	jr Function48c00

Function48bd7: ; 48bd7 (12:4bd7)
	push de
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop de
	ld a, d
	and a
	pop af
	pop hl
	ld b, a
	ld a, d
	and a
	ld a, b
	jr z, .asm_48bf3
	bit 7, a
	jr z, .asm_48bf8
	dec d
	dec hl
.asm_48bf3
	ld a, [hl]
	and $f
	jr asm_48bc7
.asm_48bf8
	dec d
	ld a, [hl]
	swap a
	and $f
	jr asm_48bc7

Function48c00: ; 48c00 (12:4c00)
	push af
	hlcoord 11, 10
	call Function489ea
	ld a, $1
	and a
	pop bc
	ld a, b
	ret

Function48c0d: ; 48c0d (12:4c0d)
	xor a
	and a

Function48c0f: ; 48c0f (12:4c0f)
	scf
	ret

Function48c11: ; 48c11 (12:4c11)
	ld a, [wd002]
	bit 7, a
	jr z, .asm_48c20
	ld a, d
	cp $3
	jr c, .asm_48c1e
	inc hl
.asm_48c1e
	ld [hl], $7f
.asm_48c20
	ld a, [wd002]
	swap a
	and $3
	inc a
	cp b
	jr nz, .asm_48c40
	ld a, [wd002]
	bit 7, a
	jr z, .asm_48c3a
	res 7, a
	ld [wd002], a
	xor a
	jr .asm_48c40
.asm_48c3a
	set 7, a
	ld [wd002], a
	xor a
.asm_48c40
	swap a
	ld b, a
	ld a, [wd002]
	and $cf
	or b
	ld [wd002], a
	ret

Function48c4d: ; 48c4d (12:4c4d)
	swap a
	and $f0
	push af
	ld a, [hl]
	and $f
	ld [hl], a
	pop af
	or [hl]
	ld [hl], a
	ret

Function48c5a: ; 48c5a (12:4c5a)
	push af
	ld a, [hl]
	and $f0
	ld [hl], a
	pop af
	or [hl]
	ld [hl], a
	ret

Function48c63: ; 48c63
	ld a, "@"
	ld [de], a
	ld a, c
	cp $30
	jr nc, .asm_48c8c
	and a
	jr z, .asm_48c8c
	dec c
	push de
	ld h, d
	ld l, e
	ld a, "@"
	ld b, 7
.asm_48c76
	ld [hli], a
	dec b
	jr nz, .asm_48c76
	ld hl, Prefectures
	ld a, c
	call GetNthString
.asm_48c81
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	cp "@"
	jr nz, .asm_48c81
	and a
	pop de
	ret

.asm_48c8c
	scf
	ret
; 48c8e

Function48c8e: ; 48c8e
; unreferenced
	ld hl, $d02a
	ld d, h
	ld e, l
	callba Function48c63
	hlcoord 10, 7
	call PlaceString
	call WaitBGMap
	ret
; 48ca3

Function48ca3: ; 48ca3
	push af
	push bc
	push de
	push hl
	ld b, 0
	ld c, 0
	ld d, 0
.asm_48cad
	cp 100
	jr c, .asm_48cb6
	sub 100
	inc b
	jr .asm_48cad

.asm_48cb6
	cp 10
	jr c, .asm_48cbf
	sub 10
	inc c
	jr .asm_48cb6

.asm_48cbf
	cp 1
	jr c, .asm_48cc7
	dec a
	inc d
	jr .asm_48cbf

.asm_48cc7
	ld a, b
	call Mobile12_Bin2Dec
	inc hl
	ld a, c
	call Mobile12_Bin2Dec
	inc hl
	ld a, d
	call Mobile12_Bin2Dec
	pop hl
	pop de
	pop bc
	pop af
	ret
; 48cda

Function48cda: ; 48cda (12:4cda)
	ld h, d
	ld l, e

Function48cdc: ; 48cdc (12:4cdc)
	push bc
	push hl
	call Function48cfd
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $0
.asm_48ced
	push bc
	push hl
.asm_48cef
	ld [hli], a
	dec c
	jr nz, .asm_48cef
	pop hl
	ld de, $14
	add hl, de
	pop bc
	dec b
	jr nz, .asm_48ced
	ret

Function48cfd: ; 48cfd (12:4cfd)
	push hl
	ld a, $4
	ld [hli], a
	inc a
	call Function48d2a
	inc a
	ld [hl], a
	pop hl
	ld de, $14
	add hl, de
.asm_48d0c
	push hl
	ld a, $7
	ld [hli], a
	ld a, $7f
	call Function48d2a
	ld [hl], $8
	pop hl
	ld de, $14
	add hl, de
	dec b
	jr nz, .asm_48d0c
	ld a, $9
	ld [hli], a
	ld a, $a
	call Function48d2a
	ld [hl], $b
	ret

Function48d2a: ; 48d2a (12:4d2a)
	ld d, c
.asm_48d2b
	ld [hli], a
	dec d
	jr nz, .asm_48d2b
	ret

Function48d30: ; 48d30 (12:4d30)
	ld hl, wd475
	call Function48d4a
	ld hl, wd477
	call Function48d4a
	ret

Function48d3d: ; 48d3d (12:4d3d)
	ld hl, wd475
	call Function48d94
	ld hl, wd477
	call Function48d94
	ret

Function48d4a: ; 48d4a (12:4d4a)
	inc hl
	ld a, [hl]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	push bc
	ld c, 10
	ld a, b
	call SimpleMultiply
	pop bc
	add c
	ld [hld], a
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	srl a
	srl a
	srl a
	srl a
	ld c, 10
	call SimpleMultiply
	ld b, a
	ld a, [hli]
	and $f
	add b
	ld [hMultiplicand + 2], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
	ld e, [hl]
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, c
	ld [hld], a
	ld [hl], b
	ret

Function48d94: ; 48d94 (12:4d94)
	xor a
	ld [hDividend + 0], a
	ld [hDividend + 1], a
	ld a, [hli]
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, 100
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hRemainder]
	ld c, 10
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hld], a
	ld a, [hQuotient + 2]
	ld c, 10
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hl], a
	ret
