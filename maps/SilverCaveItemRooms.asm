const_value set 2
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2

SilverCaveItemRooms_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SilverCaveItemRoomsMaxRevive:
	itemball MAX_REVIVE

SilverCaveItemRoomsFullRestore:
	itemball FULL_RESTORE

SilverCaveItemRooms_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 23, 33, 3, SILVER_CAVE_ROOM_2
	warp_def 3, 9, 4, SILVER_CAVE_ROOM_2

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 3, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SilverCaveItemRoomsMaxRevive, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 35, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SilverCaveItemRoomsFullRestore, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
