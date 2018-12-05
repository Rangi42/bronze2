const_value set 2
	const VICTORYROAD_SILVER
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5

VictoryRoad_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x74490, 0
	dw UnknownScript_0x74491, 0

.MapCallbacks:
	db 0

UnknownScript_0x74490:
	end

UnknownScript_0x74491:
	end

UnknownScript_0x74492:
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement PLAYER, VictoryJumpDown
;	moveperson VICTORYROAD_SILVER, $12, $b
;	spriteface PLAYER, DOWN
;	showemote EMOTE_SHOCK, PLAYER, 15
;	special Special_FadeOutMusic
;	pause 15
;	appear VICTORYROAD_SILVER
;	applymovement VICTORYROAD_SILVER, MovementData_0x74539
;	scall UnknownScript_0x744d4
;	applymovement VICTORYROAD_SILVER, MovementData_0x7454c
;	disappear VICTORYROAD_SILVER
;	dotrigger $1
;	playmapmusic
	end

UnknownScript_0x744b5:
;	spriteface PLAYER, DOWN
;	showemote EMOTE_SHOCK, PLAYER, 15
;	special Special_FadeOutMusic
;	pause 15
;	appear VICTORYROAD_SILVER
;	applymovement VICTORYROAD_SILVER, MovementData_0x74542
;	scall UnknownScript_0x744d4
;	applymovement VICTORYROAD_SILVER, MovementData_0x74555
;	disappear VICTORYROAD_SILVER
;	dotrigger $1
;	playmapmusic
	end

UnknownScript_0x744d4:
;	spriteface PLAYER, DOWN
;	playmusic MUSIC_RIVAL_ENCOUNTER
;	opentext
;	writetext UnknownText_0x7455f
;	waitbutton
;	closetext
;	setevent EVENT_RIVAL_VICTORY_ROAD
;	checkevent EVENT_GOT_TOTODILE_FROM_ELM
;	iftrue UnknownScript_0x744ff
;	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
;	iftrue UnknownScript_0x7450f
;	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
;	setlasttalked VICTORYROAD_SILVER
;	loadtrainer RIVAL1, RIVAL1_15
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump UnknownScript_0x7451f

UnknownScript_0x744ff:
;	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
;	setlasttalked VICTORYROAD_SILVER
;	loadtrainer RIVAL1, RIVAL1_13
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump UnknownScript_0x7451f

UnknownScript_0x7450f:
;	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
;	setlasttalked VICTORYROAD_SILVER
;	loadtrainer RIVAL1, RIVAL1_14
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump UnknownScript_0x7451f

UnknownScript_0x7451f:
;	playmusic MUSIC_RIVAL_AFTER
;	opentext
;	writetext UnknownText_0x746ce
;	waitbutton
;	closetext
	end

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	dwb EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION, MAX_POTION


VictoryRoadHiddenFullHeal:
	dwb EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL, FULL_HEAL

VictoryRoadBoulder:
	jumpstd strengthboulder

VictoryJumpDown:
	jump_step_down
	slide_step_down
	step_end
	
MovementData_0x74539:
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	step_up
;	step_up
;	step_end

MovementData_0x74542:
;	step_up
;	step_up
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	step_up
;	step_up
;	step_end

MovementData_0x7454c:
;	step_down
;	step_down
;	step_right
;	step_right
;	step_right
;	step_right
;	step_right
;	step_right
;	step_end

MovementData_0x74555:
;	step_down
;	step_down
;	step_right
;	step_right
;	step_right
;	step_right
;	step_right
;	step_down
;	step_down
;	step_end

UnknownText_0x7455f:
	text "Hold it."

	para "…Are you going to"
	line "take the #MON"
	cont "LEAGUE challenge?"

	para "…Don't make me"
	line "laugh."

	para "You're so much"
	line "weaker than I am."

	para "I'm not like I was"
	line "before."

	para "I now have the"
	line "best and strongest"

	para "#MON with me."
	line "I'm invincible!"

	para "<PLAYER>!"
	line "I challenge you!"
	done

UnknownText_0x7463d:
	text "…I couldn't win…"

	para "I gave it every-"
	line "thing I had…"

	para "What you possess,"
	line "and what I lack…"

	para "I'm beginning to"
	line "understand what"

	para "that dragon master"
	line "said to me…"
	done

UnknownText_0x746ce:
	text "…I haven't given up"
	line "on becoming the"
	cont "greatest trainer…"

	para "I'm going to find"
	line "out why I can't"

	para "win and become"
	line "stronger…"

	para "When I do, I will"
	line "challenge you."

	para "And I'll beat you"
	line "down with all my"
	cont "power."

	para "…Humph! You keep"
	line "at it until then."
	done

UnknownText_0x747aa:
	text "…Humph!"

	para "When it comes down"
	line "to it, nothing can"
	cont "beat power."

	para "I don't need any-"
	line "thing else."
	done

VictoryRoad_MapEventHeader:: db 0, 0

.Warps: db 10
	warp_def 63, 19, 4, ROUTE_26
	warp_def 23, 27, 3, VICTORY_ROAD
	warp_def 15, 27, 2, VICTORY_ROAD
	warp_def 23, 11, 6, VICTORY_ROAD
	warp_def 41, -8, 4, VICTORY_ROAD
	warp_def 13, 3, 4, VICTORY_ROAD
	warp_def 40, -8, 6, VICTORY_ROAD
	warp_def 5, 3, 9, VICTORY_ROAD
	warp_def 9, 13, 8, VICTORY_ROAD
	warp_def 5, 25, 3, ROUTE_23

.CoordEvents: db 2
	xy_trigger 0, 19, 19, 0, UnknownScript_0x74492, 0, 0
	xy_trigger 0, -8, 28, 0, UnknownScript_0x744b5, 0, 0

.BGEvents: db 2
	signpost 29, 16, SIGNPOST_ITEM, VictoryRoadHiddenMaxPotion
	signpost 53, 15, SIGNPOST_ITEM, VictoryRoadHiddenFullHeal

.ObjectEvents: db 12
	person_event SPRITE_SILVER, -8, 30, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	person_event SPRITE_POKE_BALL, 55, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 32, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 26, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 9, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	person_event SPRITE_POKE_BALL, 32, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	person_event SPRITE_BOULDER, 33, 16, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	person_event SPRITE_BOULDER, 49, 23, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	person_event SPRITE_BOULDER, 25, 26, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	person_event SPRITE_BOULDER, 52, 5, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	person_event SPRITE_BOULDER, 45, 26, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	person_event SPRITE_BOULDER, 48, -8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
