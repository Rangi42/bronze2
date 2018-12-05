const_value set 2
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3
	const ICEPATH1F_BOULDER1
	const ICEPATH1F_STRENGTH_CLUE_MAN	
	const ICEPATH1F_BOULDER2
	const ICEPATH1F_BOULDER3
	const ICEPATH1F_BOULDER4

IcePath1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePath1FBoulder:
	jumpstd strengthboulder
	
IcePathBoulderClueMan:
	jumptextfaceplayer IcePathBoulderClueManText

IcePath1FHMWaterfall:
	itemball HM_WATERFALL

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN

IcePathBoulderClueManText:
	text "This boulder is"
	line "in the way!"
	
	para "I think with a"
	line "special HM you"
	cont "could move it."
	
	para "Hey, I think I"
	line "remember a man on"
	
	para "ROUTE 2 that"
	line "could do just"
	cont "that!"
	done
	
IcePath1F_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 29, 4, 2, ROUTE_43
	warp_def 27, 36, 1, ROUTE_33
	warp_def 13, 23, 1, ICE_PATH_B1F
	warp_def 19, 23, 7, ICE_PATH_B1F
	warp_def 3, 33, 2, ICE_PATH_B3F
	warp_def 3, 25, 1, ICE_PATH_B3F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 14, -6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	person_event SPRITE_POKE_BALL, 6, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	person_event SPRITE_POKE_BALL, 16, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
	person_event SPRITE_BOULDER, 26, 15, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePath1FBoulder, -1
	person_event SPRITE_ROCKER, 24, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IcePathBoulderClueMan, EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	person_event SPRITE_BOULDER, 6, 21, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePath1FBoulder, -1
	person_event SPRITE_BOULDER, 6, 18, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePath1FBoulder, -1
	person_event SPRITE_BOULDER, 5, 21, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePath1FBoulder, -1
	person_event SPRITE_BOULDER, 24, 37, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePath1FBoulder, -1
