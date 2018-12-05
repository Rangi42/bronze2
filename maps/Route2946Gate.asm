const_value set 2
	const ROUTE2946GATE_OFFICER
	const ROUTE2946GATE_YOUNGSTER

Route2946Gate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x7b5bb:
	jumptextfaceplayer UnknownText_0x7b5c1

YoungsterScript_0x7b5be:
	jumptextfaceplayer UnknownText_0x7b60d

UnknownText_0x7b5c1:
	text "Nobody really"
	line "comes through"
	
	para "this gate,"
	line "so sometimes I sit"
	
	para "at my desk playing"
	line "GAME BOY."
	
	para "Just don't tell"
	line "my boss!"
	done

UnknownText_0x7b60d:
	text "I can tell you"
	line "like to explore."
	cont "Join the club!"
	done

Route2946Gate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 1, ROUTE_46
	warp_def 0, 5, 2, ROUTE_46
	warp_def 7, 4, 1, ROUTE_29
	warp_def 7, 5, 1, ROUTE_29

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x7b5bb, -1
	person_event SPRITE_COOLTRAINER_F, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x7b5be, -1
