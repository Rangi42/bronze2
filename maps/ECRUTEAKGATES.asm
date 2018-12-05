ECRUTEAKGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

EcruteakGateperson_1:
	jumptextfaceplayer EcruteakGatepersontext_1
	
EcruteakGateofficer_1:
	jumptextfaceplayer EcruteakGateofficertext_1

.Text:

EcruteakGatepersontext_1:
	text "You youngins need"
	line "to work hard for"
	cont "the future."
	
	para "One day you will"
	line "run everything."
	done
	
EcruteakGateofficertext_1:
	text "FERNWORTH TOWN is"
	line "home to a very"
	
	para "well regarded ART"
	line "MUSEUM."
	
	para "Be sure to give it"
	line "a visit!"
	done

ECRUTEAKGATES_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 14, ECRUTEAK_CITY
	warp_def 0, 5, 15, ECRUTEAK_CITY
	warp_def 7, 4, 6, ROUTE_32
	warp_def 7, 5, 6, ROUTE_32

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_GRANNY, 3, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruteakGateperson_1, -1
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EcruteakGateofficer_1, -1
