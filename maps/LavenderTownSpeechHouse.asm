const_value set 2
	const LAVENDERTOWNSPEECHHOUSE_POKEFAN_F

LavenderTownSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanFScript_0x7ea47:
	jumptextfaceplayer UnknownText_0x7ea4d

LavenderTownSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x7ea4d:
	text "LITTLEPOND has"
	line "expanded in the"
	cont "last few years."
	
	para "But, it's still"
	line "very much little."
	done

LavenderTownSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 3, LAVENDER_TOWN
	warp_def 7, 3, 3, LAVENDER_TOWN

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, LavenderTownSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, LavenderTownSpeechHouseBookshelf

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x7ea47, -1
