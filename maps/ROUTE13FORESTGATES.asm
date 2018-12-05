ROUTE13FORESTGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

Route13GateMan:
	jumptextfaceplayer Route13GateManText
	
Route13GateMan2:
	jumptextfaceplayer Route13GateMan2Text

Route13GateMan3:
	jumptextfaceplayer Route13GateMan3Text

.Text:

Route13GateManText:
	text "ACRE FOREST is"
	line "a sacred place."
	
	para "Please respect"
	line "it."
	done
	
Route13GateMan2Text:
	text "Catch any #-"
	line "MON in there?"
	
	para "There's a whole"
	line "bunch you can't"	
	cont "get anywhere else!"
	done
	
Route13GateMan3Text:
	text "I'm going to"
	line "pick some flowers"
	cont "for my boyfriend."
	
	para "Shhh, don't tell"
	line "anyone!"
	done

ROUTE13FORESTGATES_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 4, 0, 3, ROUTE_15
	warp_def 5, 0, 4, ROUTE_15
	warp_def 4, 9, 1, DIGLETTS_CAVE
	warp_def 5, 9, 2, DIGLETTS_CAVE
	warp_def 4, 16, 3, DIGLETTS_CAVE
	warp_def 5, 16, 4, DIGLETTS_CAVE
	warp_def 4, 25, 3, ROUTE_13
	warp_def 5, 25, 4, ROUTE_13

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_OFFICER, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route13GateMan, -1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route13GateMan2, -1
	person_event SPRITE_LASS, 6, 24, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route13GateMan3, -1
