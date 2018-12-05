ROUTE25GATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

Route25GateMan:
	jumptextfaceplayer Route25GateManText
	
Route25GateMan2:
	jumptextfaceplayer Route25GateMan2Text

Route25GateMan3:
	jumptextfaceplayer Route25GateMan3Text

Route25GateMan4:
	jumptextfaceplayer Route25GateMan4Text

Route25GateMan5:
	jumptextfaceplayer Route25GateMan5Text


.Text:
Route25GateManText:
	text "I think I'd like"
	line "to be a trainer"
		
	para "and explore the"
	line "world."
	
	para "Sure, this job"
	line "pays well, but"
	cont "I have an itch."
	done
	
Route25GateMan2Text:
	text "JUNCTION PARK has"
	line "changed signifi-"
	
	para "cantly over the"
	line "years."
	done
	
Route25GateMan3Text:
	text "JUNCTION PARK"
	line "holds a huge maze."
	
	para "Don't get lost!"
	done
	
Route25GateMan4Text:
	text "When I was your"
	line "age, these under-"
	
	para "ground paths didn't"
	line "exist."
	
	para "We had to go the"
	line "long way, every"
	cont "time."
	done
	
Route25GateMan5Text:
	text "I'm an important"
	line "government agent."
	
	para "Seen any TEAM"
	line "ROCKET lately?"
	done

ROUTE25GATES_MapEventHeader:: db 0, 0

.Warps: db 23
	warp_def 7, 4, 6, ROUTE_25
	warp_def 7, 5, 6, ROUTE_25
	warp_def -5, 11, 2, ROUTE_4
	warp_def -5, 12, 3, ROUTE_4
	warp_def 4, 16, 5, ROUTE_8
	warp_def 5, 16, 4, ROUTE_8
	warp_def 4, 25, 2, ROUTE_25
	warp_def 5, 25, 3, ROUTE_25
	warp_def 18, 16, 4, ROUTE_25
	warp_def 19, 16, 5, ROUTE_25
	warp_def 18, 25, 6, PEWTER_CITY
	warp_def 19, 25, 7, PEWTER_CITY
	warp_def 14, 4, 7, ROUTE_25
	warp_def 14, 5, 8, ROUTE_25
	warp_def 21, 4, 5, ROUTE_14
	warp_def 21, 5, 5, ROUTE_14
	warp_def -4, 12, 3, ROUTE_8
	warp_def -4, 11, 3, ROUTE_8
	warp_def 3, 4, 2, UNDERGROUND
	warp_def -4, 19, 4, ROUTE_9
	warp_def -4, 20, 4, ROUTE_9
	warp_def -5, 19, 6, ROUTE_8
	warp_def -5, 20, 7, ROUTE_8

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_OFFICER, 16, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route25GateMan, -1
	person_event SPRITE_OFFICER, 17, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route25GateMan2, -1
	person_event SPRITE_OFFICER, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route25GateMan3, -1
	person_event SPRITE_GRAMPS, 4, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route25GateMan4, -1
	person_event SPRITE_GENTLEMAN, 17, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route25GateMan5, -1
