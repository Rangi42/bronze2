Route7_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route1Girl:
	jumptextfaceplayer Route1GirlText

Route1Boy:
	jumptextfaceplayer Route1BoyText

Route1GirlText:
	text "I heard the KOHTO"
	line "CHAMPION lives in"
	cont "CARTIRDGE TOWN."
	
	para "They're almost"
	line "never home,"
	cont "though."
	done
	
Route1BoyText
	text "All the #MON"
	line "here are such low"
	cont "level."
	
	para "It's going to take"
	line "a lot of training."
	done
	
Route7UndergroundPathSignText:
	text "ROUTE 1"
	
	para "LITTLEPOND -"
	line "CARTIRDGE TOWN"
	done

Route7LockedDoorText:
	text "ROUTE 1"
	
	para "CARTIRDGE TOWN -"
	line "LITTLEPOND"
	done

Route7_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 10, 49, 1, LAVENDERTOWNGATES
	warp_def 11, 49, 2, LAVENDERTOWNGATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 3, SIGNPOST_READ, Route7UndergroundPathSign
	signpost 12, 46, SIGNPOST_READ, Route7LockedDoor

.ObjectEvents: db 2
	person_event SPRITE_COOLTRAINER_F, 11, 30, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route1Girl, -1
	person_event SPRITE_YOUNGSTER, 3, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route1Boy, -1
