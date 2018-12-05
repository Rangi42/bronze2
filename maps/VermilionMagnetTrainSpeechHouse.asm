const_value set 2
	const VERMILIONMAGNETTRAINSPEECHHOUSE_POKEFAN_F
	const VERMILIONMAGNETTRAINSPEECHHOUSE_YOUNGSTER

VermilionMagnetTrainSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanFScript_0x191eb7:
	jumptextfaceplayer UnknownText_0x191ec0

YoungsterScript_0x191eba:
	jumptextfaceplayer UnknownText_0x191f16

VermilionMagnetTrainSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x191ec0:
	text "I think I've just"
	line "about read every"
	cont "book in my house."
	done

UnknownText_0x191f16:
	text "I've gained quite"
	line "an affection for"
	
	para "reading, all"
	line "thanks to my dad."
	done

VermilionMagnetTrainSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, VERMILION_CITY
	warp_def 7, 3, 4, VERMILION_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, VermilionMagnetTrainSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, VermilionMagnetTrainSpeechHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x191eb7, -1
	person_event SPRITE_LASS, 3, 0, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x191eba, -1
