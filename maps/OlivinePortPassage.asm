const_value set 2
	const OLIVINEPORTPASSAGE_POKEFAN_M
	const OLIVINEPORTPASSAGE_PERSON
	const OLIVINEPORTPASSAGE_OFFICER

OlivinePortPassage_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x76fac:
	jumptextfaceplayer UnknownText_0x76faf

OlivinePortPassageperson_1:
	jumptextfaceplayer OlivinePortPassagepersontext_1
	
OlivinePortPassageofficer_1:
	jumptextfaceplayer OlivinePortPassageofficertext_1
	
UnknownText_0x76faf:
	text "FAST SHIP S.S.AQUA"
	line "sails to KANTO on"

	para "Mondays and Fri-"
	line "days."
	done
	
OlivinePortPassagepersontext_1:
	text "Yo-ho-ho!"
	
	para "NEWPORT CITY"
	line "is the place for"
	cont "me!"
	
	para "That fresh lake"
	line "smell!"
	done
	
OlivinePortPassageofficertext_1:
	text "If you head north"
	line "you can get to"
	cont "FELONWOOD PARK."
	
	para "Check it out if"
	line "you need to"
	
	para "stretch your legs"
	line "and rest!"
	done

OlivinePortPassage_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 0, 14, 10, OLIVINE_CITY
	warp_def 0, 15, 11, OLIVINE_CITY
	warp_def 5, 14, 4, OLIVINE_PORT_PASSAGE
	warp_def 2, 3, 3, OLIVINE_PORT_PASSAGE
	warp_def 14, 3, 1, OLIVINE_PORT
	warp_def 16, 10, 4, ROUTE_44
	warp_def 17, 10, 5, ROUTE_44
	warp_def 16, 19, 12, OLIVINE_CITY
	warp_def 17, 19, 13, OLIVINE_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKEFAN_M, 1, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x76fac, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	person_event SPRITE_SAILOR, 13, 18, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OlivinePortPassageperson_1, -1
	person_event SPRITE_OFFICER, 14, 14, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OlivinePortPassageofficer_1, -1
