ROUTE33_GATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

gate33person_1:
	jumptextfaceplayer gate33persontext_1
	
gate33person_2:
	jumptextfaceplayer gate33persontext_2
	
gate33officer_1:
	jumptextfaceplayer gate33officertext_1

gate33officer_2:
	jumptextfaceplayer gate33officertext_2	
	
gate33officer_3:
	jumptextfaceplayer gate33officertext_3

.Text:

gate33persontext_1:
	text "Just 'cause you"
	line "don't have the"
	
	para "strongest #-"
	line "MON doesn't mean"
	cont "you can't win!"
	
	para "You'd be amazed by"
	line "the low level"
	
	para "#MON I've lost"
	line "to."
	done
	
gate33persontext_2:
	text "Man am I tuckered."
	line "This ROCKER was"
	
	para "not made for giant"
	line "rocks."
	done	

gate33officertext_1:
	text "Hey kid! Welcome"
	line "to FIGBRANCH TOWN."
	
	para "To the east of"
	line "town is MT."
	cont "REDSTONE."
	
	para "Stay safe, ya"
	line "hear?"
	done
	
gate33officertext_2:
	text "Heading out to"
	line "the lake I see?"
	
	para "You could probably"
	line "get some neat"
	cont "#MON there."
	done
	
gate33officertext_3:
	text "People come from"
	line "all over to visit"
	cont "MT. REDSTONE."
	
	para "Happy climbing!"
	done

ROUTE33_GATES_MapEventHeader:: db 0, 0

.Warps: db 12
	warp_def 4, 0, 1, ROUTE_38
	warp_def 5, 0, 2, ROUTE_38
	warp_def 4, 9, 7, AZALEA_TOWN
	warp_def 5, 9, 8, AZALEA_TOWN
	warp_def 0, 23, 10, AZALEA_TOWN
	warp_def 0, 22, 9, AZALEA_TOWN
	warp_def 7, 22, 1, ROUTE_40
	warp_def 7, 23, 1, ROUTE_40
	warp_def 16, 0, 11, AZALEA_TOWN
	warp_def 17, 0, 12, AZALEA_TOWN
	warp_def 16, 9, 1, ROUTE_37
	warp_def 17, 9, 2, ROUTE_37

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_LASS, 3, 24, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, gate33person_1, -1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, gate33officer_1, -1
	person_event SPRITE_OFFICER, 3, 18, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, gate33officer_2, -1
	person_event SPRITE_OFFICER, 14, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, gate33officer_3, -1
	person_event SPRITE_ROCKER, 14, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, gate33person_2, -1
