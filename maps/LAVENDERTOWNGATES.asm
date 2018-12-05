LAVENDERTOWNGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

lavendertowngateperson_1:
	jumptextfaceplayer lavendertowngatepersontext_1
	
lavendertowngateofficer_1:
	jumptextfaceplayer lavendertowngateofficertext_1

lavendertowngateofficer_2:
	jumptextfaceplayer lavendertowngateofficertext_2

lavendertowngateofficer_3:
	jumptextfaceplayer lavendertowngateofficertext_3	

lavendertowngateperson_2:
	jumptextfaceplayer lavendertowngatepersontext_2
	
lavendertowngateperson_3:
	jumptextfaceplayer lavendertowngatepersontext_3
	
	
.Text:

lavendertowngatepersontext_1:
	text "I'm going to dip"
	line "my toes into the"
	cont "pond outside."
	
	para "The water is so"
	line "fresh!"
	done
	
lavendertowngateofficertext_1:
	text "I knew a kid"
	line "like you."
	
	para "They lived near"
	line "here and made"
	
	para "quite a name for"
	line "themselves."
	done
	
lavendertowngateofficertext_2:
	text "You can get to"
	line "JUNCTION PARK"
	cont "from here."
	
	para "Be careful,"
	line "though."
	
	para "The path is quite"
	line "dark."
	done
	
lavendertowngateofficertext_3:
	text "There were so many"
	line "new people coming"
	
	para "to LITTLEPOND that"
	line "we had to put up"
	cont "this gate."
	
	para "Just a little"
	line "extra security to"
	
	para "keep that lake"
	line "pure!"
	done


lavendertowngatepersontext_2:
	text "Hmm… there used"
	line "to be a path here"
	
	para "to KANTO… but I"
	line "think it's closed."
	done
	
lavendertowngatepersontext_3:
	text "I go for jogs in"
	line "the park!"
	
	para "I'll be heading"
	line "there soon."
	done
	
LAVENDERTOWNGATES_MapEventHeader:: db 0, 0

.Warps: db 12
	warp_def 4, 0, 1, ROUTE_7
	warp_def 5, 0, 2, ROUTE_7
	warp_def 4, 9, 8, LAVENDER_TOWN
	warp_def 5, 9, 9, LAVENDER_TOWN
	warp_def 5, 24, 1, UNDERGROUND
	warp_def 7, 16, 5, LAVENDERTOWNGATES
	warp_def 7, 20, 6, LAVENDER_TOWN
	warp_def 7, 21, 6, LAVENDER_TOWN
	warp_def 4, 32, 10, LAVENDER_TOWN
	warp_def 5, 32, 11, LAVENDER_TOWN
	warp_def 4, 41, 3, ROUTE_1
	warp_def 5, 41, 4, ROUTE_1

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_LASS, 2, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, lavendertowngateperson_1, -1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, lavendertowngateofficer_1, -1
	person_event SPRITE_OFFICER, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, lavendertowngateofficer_2, -1
	person_event SPRITE_COOLTRAINER_M, 4, 17, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, lavendertowngateperson_2, -1
	person_event SPRITE_COOLTRAINER_F, 3, 25, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, lavendertowngateperson_3, -1
	person_event SPRITE_OFFICER, 2, 37, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, lavendertowngateofficer_3, -1
