const_value set 2
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK

IcePathB3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd smashrock

IcePathB3F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 5, 3, 6, ICE_PATH_1F
	warp_def 5, 29, 5, ICE_PATH_1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 11, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	person_event SPRITE_ROCK, -6, -6, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB3FRock, -1
