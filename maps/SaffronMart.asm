const_value set 2
	const SAFFRONMART_CLERK
	const SAFFRONMART_COOLTRAINER_M
	const SAFFRONMART_COOLTRAINER_F

SaffronMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18a3bf:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAFFRON
	closetext
	end

CooltrainerMScript_0x18a3c6:
	jumptextfaceplayer UnknownText_0x18a3cc

CooltrainerFScript_0x18a3c9:
	jumptextfaceplayer UnknownText_0x18a3f3

UnknownText_0x18a3cc:
	text "I have special"
	line "hair care products"
	
	para "for my #MON"
	line "that make them"
	cont "look beautiful!"
	done

UnknownText_0x18a3f3:
	text "I use HEADBUTT on"
	line "trees to find"
	cont "more #MON."
	done

SaffronMart_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, CELADON_CITY
	warp_def 7, 3, 1, CELADON_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x18a3bf, -1
	person_event SPRITE_LASS, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x18a3c6, -1
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x18a3c9, -1
