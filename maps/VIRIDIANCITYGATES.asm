VIRIDIANCITYGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

viridiancitygateperson_1:
	jumptextfaceplayer viridiancitygatepersontext_1
	
viridiancitygateofficer_1:
	jumptextfaceplayer viridiancitygateofficertext_1

viridiancitygateofficer_2:
	jumptextfaceplayer viridiancitygateofficertext_2	

viridiancitygateperson_2:
	jumptextfaceplayer viridiancitygatepersontext_2
	
.Text:

viridiancitygatepersontext_2:
	text "Boy am I hungry."
	line "You haven't got"
	cont "A burger have you?"
	done
	
viridiancitygateofficertext_1:
	text "You there!"
	line "Keep a look out"
	
	para "for any hooligans,"
	line "would ya?"
	done
	
viridiancitygateofficertext_2:
	text "You and I are"
	line "a lot alike."
	
	para "We're both"
	line "protectors!"
	done
	
viridiancitygatepersontext_1:
	text "#MON MARCH is"
	line "my jam."
	done
	

VIRIDIANCITYGATES_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 4, 0, 3, ROUTE_6
	warp_def 5, 0, 4, ROUTE_6
	warp_def 4, 9, 6, VIRIDIAN_CITY
	warp_def 5, 9, 7, VIRIDIAN_CITY
	warp_def 0, 20, 8, VIRIDIAN_CITY
	warp_def 0, 21, 9, VIRIDIAN_CITY
	warp_def 7, 20, 2, ROUTE_3
	warp_def 7, 21, 2, ROUTE_3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_ROCKER, 3, 22, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, viridiancitygateperson_1, -1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, viridiancitygateofficer_1, -1
	person_event SPRITE_OFFICER, 3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, viridiancitygateofficer_2, -1
	person_event SPRITE_FISHER, 1, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, viridiancitygateperson_2, -1
