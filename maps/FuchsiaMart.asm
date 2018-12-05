const_value set 2
	const FUCHSIAMART_CLERK
	const FUCHSIAMART_FISHER
	const FUCHSIAMART_COOLTRAINER_F

FuchsiaMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x195ce8:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

FisherScript_0x195cef:
	jumptextfaceplayer UnknownText_0x195cf5

CooltrainerFScript_0x195cf2:
	jumptextfaceplayer UnknownText_0x195d36

UnknownText_0x195cf5:
	text "When I was a boy,"
	line "# BALLS were"
	cont "a lot cheaper!"
	done

UnknownText_0x195d36:
	text "I am so great!"
	line "That's why I use"
	cont "GREAT BALLS!"
	done

FuchsiaMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, FUCHSIA_CITY
	warp_def $7, $3, 1, FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x195ce8, -1
	person_event SPRITE_FISHER, 2, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FisherScript_0x195cef, -1
	person_event SPRITE_COOLTRAINER_M, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x195cf2, -1
