const_value set 2
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

MountMortar1FOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	dwb EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION, HYPER_POTION


MountMortar1FOutside_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 45, 3, 3, ROUTE_42
	warp_def 47, 17, 4, ROUTE_42
	warp_def 45, 37, 5, ROUTE_42
	warp_def 15, 35, 5, MOUNT_MORTAR_1F_INSIDE
	warp_def 23, 5, 1, MOUNT_MORTAR_1F_INSIDE
	warp_def 31, 29, 2, MOUNT_MORTAR_1F_INSIDE
	warp_def 3, 29, 6, MOUNT_MORTAR_1F_INSIDE
	warp_def 15, 3, 3, MOUNT_MORTAR_1F_INSIDE
	warp_def 15, 17, 4, MOUNT_MORTAR_1F_INSIDE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 39, 29, SIGNPOST_ITEM, MountMortar1FOutsideHiddenHyperPotion

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 32, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	person_event SPRITE_POKE_BALL, 25, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
