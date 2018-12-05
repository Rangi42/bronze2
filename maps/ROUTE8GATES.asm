const_value set 2
	const ROUTE8GATE_OFFICER1
	const ROUTE8GATE_OFFICER2
	const ROUTE8GATE_OFFICER3
	const ROUTE8GATE_LASS
	const ROUTE8GATE_YOUNG

ROUTE8GATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

Route8OfficerScript1:
	jumptextfaceplayer Route8OfficerText1

Route8OfficerScript2:
	jumptextfaceplayer Route8OfficerText2
	
Route8OfficerScript3:
	jumptextfaceplayer Route8OfficerText3

Route8YoungScript1:
	jumptextfaceplayer Route8YoungText1
	
Route8LassScript1:
	jumptextfaceplayer Route8LassText1
	
.Text:

Route8OfficerText1:
	text "Does your #-"
	line "MON know the move"
	cont "SWIFT?"
	
	para "I've heard it"
	line "never misses."
	done
	
Route8OfficerText2:
	text "KOHTO trainers"
	line "are pretty strong"
	cont "aren't they?"
	
	para "Much more so than"
	line "JANTO."
	done
	
Route8OfficerText3:
	text "I heard BRANDIES"
	line "CITY's GYM needs"
	cont "a new leader."
	done

Route8YoungText1:
	text "I love sharing hot"
	line "cocoa with my"
	cont "#MON."
	done
	
Route8LassText1:
	text "Huh… I could have"
	line "sworn there was"
	
	para "another town"
	line "directly after"
	cont "this gate…"
	
	para "It's almost like it"
	line "was just… erased"
	cont "from our memory."
	done
	
ROUTE8GATES_MapEventHeader:: db 0, 0

.Warps: db 12
	warp_def 4, 0, 1, ROUTE_11
	warp_def 5, 0, 2, ROUTE_11
	warp_def 4, 9, 1, ROUTE_8
	warp_def 5, 9, 2, ROUTE_8
	warp_def 12, 20, 2, ROUTE_4
	warp_def 12, 21, 3, ROUTE_4
	warp_def 19, 20, 3, ROUTE_8
	warp_def 19, 21, 3, ROUTE_8
	warp_def 12, 4, 6, ROUTE_8
	warp_def 12, 5, 7, ROUTE_8
	warp_def 19, 4, 4, ROUTE_9
	warp_def 19, 5, 4, ROUTE_9

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route8OfficerScript1, -1
	person_event SPRITE_OFFICER, 15, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route8OfficerScript2, -1
	person_event SPRITE_OFFICER, 15, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route8OfficerScript3, -1
	person_event SPRITE_LASS, 1, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route8LassScript1, -1
	person_event SPRITE_YOUNGSTER, 15, 22, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route8YoungScript1, -1
