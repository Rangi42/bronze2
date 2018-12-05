const_value set 2
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FisherScript_0x5564a:
	jumptextfaceplayer UnknownText_0x55659

LassScript_0x5564d:
	jumptextfaceplayer UnknownText_0x556ca

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodPPSpeechHouseRadio:
	jumpstd radio2

UnknownText_0x55659:
	text "#MON can't just"
	line "use the same"
	cont "attack forever."
	
	para "Each MOVE has PP"
	line "or POWER POINTS"
	
	para "which can be"
	line "refilled at a"
	cont "#MON CENTER."
	done

UnknownText_0x556ca:
	text "I was stuck in a"
	line "battle with no PP"
	
	para "so my #MON"
	line "started to"
	cont "STRUGGLE!"
	done

GoldenrodPPSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 7, GOLDENROD_CITY
	warp_def 7, 3, 7, GOLDENROD_CITY

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 0, SIGNPOST_READ, GoldenrodPPSpeechHouseBookshelf1
	signpost 1, 1, SIGNPOST_READ, GoldenrodPPSpeechHouseBookshelf2
	signpost 1, 9, SIGNPOST_READ, GoldenrodPPSpeechHouseRadio

.ObjectEvents: db 2
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x5564a, -1
	person_event SPRITE_FISHER, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x5564d, -1
