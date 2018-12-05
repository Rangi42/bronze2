const_value set 2
	const VERMILIONHOUSEDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GentlemanScript_0x192031:
	jumptextfaceplayer UnknownText_0x192034

UnknownText_0x192034:
	text "You should see"
	line "my HAUNTER."
	
	para "It sometimes"
	line "enters my dreams"
	
	para "at night and plays"
	line "tricks on me."
	done

VermilionHouseDiglettsCaveSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 6, VERMILION_CITY
	warp_def 7, 3, 6, VERMILION_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x192031, -1
