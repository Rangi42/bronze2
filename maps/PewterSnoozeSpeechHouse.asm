const_value set 2
	const PEWTERSNOOZESPEECHHOUSE_GRAMPS

PewterSnoozeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x1a3059:
	jumptextfaceplayer UnknownText_0x1a305f
	
SnoozeChild
	jumptextfaceplayer SnoozeChildText
	
PewterSnoozeSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x1a305f:
	text "It's hard to"
	line "please my son"
	cont "sometimes."
	done
	
SnoozeChildText:
	text "My dad caught me"
	line "A wild BULBASAUR."
	done

PewterSnoozeSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 5, PEWTER_CITY
	warp_def 7, 3, 5, PEWTER_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost -1, 0, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf
	signpost -1, 1, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a3059, -1
	person_event SPRITE_YOUNGSTER, 3, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SnoozeChild, -1
