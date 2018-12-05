MAHOGANYGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

mahoganygateperson_1:
	jumptextfaceplayer mahoganygatepersontext_1
	
mahoganygateofficer_1:
	jumptextfaceplayer mahoganygateofficertext_1

mahoganygateofficer_2:
	jumptextfaceplayer mahoganygateofficertext_2	

MahoganygatePersonScript_3:
	jumptextfaceplayer MahoganygatePersontext_3
	
MahoganygatePersonScript_4:
	jumptextfaceplayer MahoganygatePersontext_4

.Text:

mahoganygatepersontext_1:
	text "…Huff huff…"
	line "I walk everywhere"
	
	para "but I don't lose a"
	line "pound!"
	
	para "Life is like that,"
	line "sometimes."
	done
	
mahoganygateofficertext_1:
	text "The great thing"
	line "about working here"
	
	para "is the amazing"
	line "smell of food"
	
	para "that comes from"
	line "WILDBARK VILLAGE."
	done
	
mahoganygateofficertext_2:
	text "Test7"
	line "Test8"
	cont "Test9"
	done

MahoganygatePersontext_3:
	text "Leaving this place"
	line "eh?"
	
	para "I'd like to get"
	line "a move on too."
	
	para "I still haven't"
	line "managed to beat"
	cont "the GYM here."
	done
	
MahoganygatePersontext_4:
	text "Are you heading"
	line "to ROSEGLEN CITY?"
	
	para "It's my dream to"
	line "make it big there"
	cont "and become a star!"
	done
	
MAHOGANYGATES_MapEventHeader:: db 0, 0

.Warps: db 16
	warp_def 4, 0, 6, ROUTE_42
	warp_def 5, 0, 7, ROUTE_42
	warp_def 4, 9, 6, MAHOGANY_TOWN
	warp_def 5, 9, 7, MAHOGANY_TOWN
	warp_def 4, 16, 8, MAHOGANY_TOWN
	warp_def 5, 16, 9, MAHOGANY_TOWN
	warp_def 4, 25, 7, NEW_BARK_TOWN
	warp_def 5, 25, 8, NEW_BARK_TOWN
	warp_def 12, 4, 10, MAHOGANY_TOWN
	warp_def 12, 5, 11, MAHOGANY_TOWN
	warp_def 17, 4, 13, MAHOGANYGATES
	warp_def 30, 21, 14, MAHOGANYGATES
	warp_def 12, 21, 11, MAHOGANYGATES
	warp_def 27, 4, 12, MAHOGANYGATES
	warp_def 31, 5, 3, ROUTE_35
	warp_def 31, 4, 3, ROUTE_35

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_FISHER, 2, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, mahoganygateperson_1, -1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, mahoganygateofficer_1, -1
	person_event SPRITE_OFFICER, 2, 20, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, mahoganygateofficer_2, -1
	person_event SPRITE_YOUNGSTER, 15, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MahoganygatePersonScript_3, -1
	person_event SPRITE_COOLTRAINER_F, 28, 6, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MahoganygatePersonScript_4, -1
