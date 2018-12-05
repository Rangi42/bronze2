ROUTE1GATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

route1gatesperson_1:
	jumptextfaceplayer route1gatespersontext_1
	
route1gatesofficer_1:
	jumptextfaceplayer route1gatesofficertext_1

route1gatesofficer_2:
	jumptextfaceplayer route1gatesofficertext_2	

.Text:

route1gatespersontext_1:
	text "I used to live"
	line "around here."
	
	para "It just feels so"
	line "homeley."
	done
	
route1gatesofficertext_1:
	text "You're heading out"
	line "to LITTLEPOND?"
	
	para "You should check"
	line "out the water"
	cont "there."
	done
	
route1gatesofficertext_2:
	text "I raise my #-"
	line "mon with as much"
	
	para "love as possible"
	line "and it went and"
	cont "evolved!"
	done

ROUTE1GATES_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 1, ROUTE_6
	warp_def 0, 5, 2, ROUTE_6
	warp_def 7, 4, 1, ROUTE_1
	warp_def 7, 5, 1, ROUTE_1

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_TEACHER, 3, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, route1gatesperson_1, -1
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, route1gatesofficer_1, -1
	person_event SPRITE_COOLTRAINER_M, 6, 2, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, route1gatesofficer_2, -1
