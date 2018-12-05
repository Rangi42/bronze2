const_value set 2
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x9e1b0:
	jumptextfaceplayer UnknownText_0x9e1bc

LassScript_0x9e1b3:
	jumptextfaceplayer UnknownText_0x9e23f

TwinScript_0x9e1b6:
	jumptextfaceplayer UnknownText_0x9e2a9

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x9e1bc:
	text "I find it hard"
	line "to let some"
	cont "#MON evolve."
	
	para "Sometimes I just"
	line "like #MON just"
	cont "the way they are."
	done

UnknownText_0x9e23f:
	text "Every time I"
	line "visit my mother"
	
	para "she tells me"
	line "she hopes I never"
	cont "grow up."
	
	para "She's been saying"
	line "that for about"
	cont "12 years."
	
	para "Oh I love her"
	line "so."
	done

UnknownText_0x9e2a9:
	text "I've heard that"
	line "the whirlpools"

	para "around the islands"
	line "are caused by the"
	cont "sea creature."

	para "You might need a"
	line "special move to"
	cont "get past them."
	done

CianwoodLugiaSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, CIANWOOD_CITY
	warp_def $7, $3, 6, CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CianwoodLugiaSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CianwoodLugiaSpeechHouseBookshelf

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, (1 << 3) | PAL_OW_BLUE, TeacherScript_0x9e1b0, -1
	person_event SPRITE_LASS, 5, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x9e1b3, -1
	person_event SPRITE_TWIN, -5, -5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinScript_0x9e1b6, -1
