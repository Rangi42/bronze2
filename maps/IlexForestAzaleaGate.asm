const_value set 2
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x62c7a:
	jumptextfaceplayer UnknownText_0x62c80

GrannyScript_0x62c7d:
	jumptextfaceplayer UnknownText_0x62cb0

UnknownText_0x62c80:
	text "The forest is big"
	line "and lush with"
	cont "foliage."
	
	para "Be sure not to get"
	line "lost!"
	done

UnknownText_0x62cb0:
	text "Ah, it fills my"
	line "heart with glee to"

	para "see a young one in"
	line "touch with nature!"
	done

IlexForestAzaleaGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 2, ILEX_FOREST
	warp_def 5, 0, 3, ILEX_FOREST
	warp_def 4, 9, 8, ROUTE_34
	warp_def 5, 9, 9, ROUTE_34

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x62c7a, -1
	person_event SPRITE_GRAMPS, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrannyScript_0x62c7d, -1
