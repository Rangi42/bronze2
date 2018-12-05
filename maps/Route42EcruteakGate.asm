const_value set 2
	const ROUTE42ECRUTEAKGATE_OFFICER

Route42EcruteakGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x19a4b5:
	jumptextfaceplayer UnknownText_0x19a4b8

UnknownText_0x19a4b8:
	text "Hey, I was wonder-"
	line "ing why nobody was"
	
	para "coming in through"
	line "here."
	
	para "So you shoo'd off"
	line "TEAM ROCKET all"
	cont "by yourself?"
	
	para "I didn't even know"
	line "they were still"
	cont "around!"
	done

Route42EcruteakGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 1, ECRUTEAK_CITY
	warp_def 5, 0, 2, ECRUTEAK_CITY
	warp_def 4, 9, 1, ROUTE_42
	warp_def 5, 9, 2, ROUTE_42

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19a4b5, -1
