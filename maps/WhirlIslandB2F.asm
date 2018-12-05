const_value set 2
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3
	const RELIC_BOULDER
	const RELIC_DRAGON
	const RELIC_ROCK

WhirlIslandB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WhirlIslandB2FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER

RelicCavernBoulder:
	jumpstd strengthboulder

RelicCavernRock:
	jumpstd smashrock
	
RelicAerodactylScript:
	faceplayer
	opentext
	writetext AeroCryText
	cry AERODACTYL
	waitbutton
	closetext
	loadwildmon AERODACTYL, 34
	startbattle
	reloadmapafterbattle
	disappear RELIC_DRAGON
	end
	
AeroCryText:
	text "AERODACTYL:"
	line "RAAAAAAAUGH!"
	done
	
WhirlIslandB2F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 25, 7, 6, ROUTE_14
	warp_def 1, -1, 8, WHIRL_ISLAND_B1F
	warp_def 2, -1, 1, WHIRL_ISLAND_LUGIA_CHAMBER
	warp_def 4, -1, 5, WHIRL_ISLAND_SW

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_POKE_BALL, 17, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 17, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 6, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
	person_event SPRITE_BOULDER, 11, 4, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RelicCavernBoulder, -1
	person_event SPRITE_DRAGON, 18, 40, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RelicAerodactylScript, EVENT_FOUGHT_AERODACTYL
	person_event SPRITE_ROCK, 8, 43, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RelicCavernRock, -1
