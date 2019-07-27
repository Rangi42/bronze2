const_value set 2
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2

RockTunnel1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY, X_ACCURACY


RockTunnel1FHiddenXDefend:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND, X_DEFEND


RockTunnel1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 24, SIGNPOST_ITEM, RockTunnel1FHiddenXAccuracy
	signpost 15, 21, SIGNPOST_ITEM, RockTunnel1FHiddenXDefend

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 18, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	person_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
