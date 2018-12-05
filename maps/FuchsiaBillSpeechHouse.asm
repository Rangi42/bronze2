const_value set 2
	const FUCHSIABILLSPEECHHOUSE_POKEFAN_F
	const FUCHSIABILLSPEECHHOUSE_YOUNGSTER
	const FUCHSIABILLSPEECHHOUSE_N64

FuchsiaBillSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanFScript_0x1963bd:
	jumptextfaceplayer UnknownText_0x1963c3

YoungsterScript_0x1963c0:
	jumptextfaceplayer UnknownText_0x1963f9

BillNintendo64:
	jumptext BillNintendo64Text
	
UnknownText_0x1963c3:
	text "I spoil my son."
	line "I really do."
	done

UnknownText_0x1963f9:
	text "My MOM bought me"
	line "my very own"
	cont "NINTENDO 64!"
	
	para "I can play so"
	line "many great games"
	cont "now!"
	done
	
BillNintendo64Text:
	text "It's a NINTENDO"
	line "64 game console!"
	done

FuchsiaBillSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, FUCHSIA_CITY
	warp_def 7, 3, 4, FUCHSIA_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_TEACHER, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1963bd, -1
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1963c0, -1
	person_event SPRITE_N64, 2, 2, SPRITEMOVEDATA_ITEM_TREE, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BillNintendo64, -1
