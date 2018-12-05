const_value set 2
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x7f416:
	jumptextfaceplayer UnknownText_0x7f419

UnknownText_0x7f419:
	text "Welcome to"
	line "CASCADE CITY."
	
	para "Enjoy the"
	line "shopping!"
	done

Route8SaffronGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 14, SAFFRON_CITY
	warp_def 5, 0, 15, SAFFRON_CITY
	warp_def 4, 9, 1, ROUTE_14
	warp_def 5, 9, 2, ROUTE_14

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x7f416, -1
