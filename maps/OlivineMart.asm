const_value set 2
	const OLIVINEMART_CLERK
	const OLIVINEMART_COOLTRAINER_F
	const OLIVINEMART_LASS

OlivineMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x9cac7:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

CooltrainerFScript_0x9cace:
	jumptextfaceplayer UnknownText_0x9cad4

LassScript_0x9cad1:
	jumptextfaceplayer UnknownText_0x9cb16

UnknownText_0x9cad4:
	text "I can ride my"
	line "#MON across"
	
	para "water like a"
	line "surfboard!"
	
	para "I can use them to"
	line "get to places I"
	cont "couldn't before!"
	done

UnknownText_0x9cb16:
	text "If a MART could"
	line "sell a ROD, that"
	cont "would be pretty…"
	
	para "Awful! I don't"
	line "want competition!"	
	done

OlivineMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 8, OLIVINE_CITY
	warp_def $7, $3, 8, OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x9cac7, -1
	person_event SPRITE_COOLTRAINER_F, 2, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x9cace, -1
	person_event SPRITE_FISHING_GURU, 6, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x9cad1, -1
