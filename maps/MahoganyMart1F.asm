const_value set 2
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGON
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x6c356, 0
	dw UnknownScript_0x6c357, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x6c35b

UnknownScript_0x6c356:
;
	end

UnknownScript_0x6c357:
	priorityjump UnknownScript_0x6c38f
	end

UnknownScript_0x6c35b:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue UnknownScript_0x6c362
	return

UnknownScript_0x6c362:
	changeblock $6, $2, $1e
	return

PharmacistScript_0x6c367:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue UnknownScript_0x6c375
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

UnknownScript_0x6c375:
	writetext UnknownText_0x6c46b
	waitbutton
	closetext
	end

BlackBeltScript_0x6c37b:
	faceplayer
	opentext
	writetext UnknownText_0x6c494
	waitbutton
	closetext
	end

UnknownScript_0x6c389:
	writetext UnknownText_0x6c501
	waitbutton
	closetext
	end

UnknownScript_0x6c38f:
	pause 15
	opentext
	writetext UnknownText_0x6c52a
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGON, MovementData_0x6c3f6
	applymovement MAHOGANYMART1F_BLACK_BELT, MovementData_0x6c3fb
	pause 15
	disappear MAHOGANYMART1F_DRAGON
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c407
	opentext
	writetext UnknownText_0x6c549
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40a
	applymovement MAHOGANYMART1F_PHARMACIST, MovementData_0x6c403
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40e
	stopfollow
	opentext
	writetext UnknownText_0x6c59e
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock $6, $2, $1e
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	spriteface MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext UnknownText_0x6c5ba
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c412
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	dotrigger $0
	waitsfx
	end

GrannyScript_0x6c3ee:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MovementData_0x6c3f6:
	fix_facing
	big_step_left
	big_step_right
	remove_fixed_facing
	step_end

MovementData_0x6c3fb:
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end

MovementData_0x6c403:
	fix_facing
	big_step_left
	remove_fixed_facing
	step_end

MovementData_0x6c407:
	slow_step_left
	turn_head_down
	step_end

MovementData_0x6c40a:
	slow_step_right
	slow_step_up
	slow_step_up
	step_end

MovementData_0x6c40e:
	slow_step_up
	slow_step_right
	slow_step_right
	step_end

MovementData_0x6c412:
	slow_step_right
	step_end

UnknownText_0x6c414:
	text "Hello, kiddo!"

	para "How would you like"
	line "some RAGECANDYBAR?"

	para "It's the thing to"
	line "eat in MAHOGANY!"
	done

UnknownText_0x6c46b:
	text "Arrgh… You found"
	line "the secret stair-"
	cont "way…"
	done

UnknownText_0x6c494:
	text "Hey you!"
	line "Don't tell anyone"
	
	para "I'm buying frozen"
	line "food for the"
	cont "RESTURAUNT!"
	done

UnknownText_0x6c501:
	text "Urrgh…"

	para "That guy's dragon"
	line "#MON are tough…"
	done

UnknownText_0x6c52a:
	text "LANCE: DRAGONITE,"
	line "HYPER BEAM."
	done

UnknownText_0x6c549:
	text "What took you,"
	line "<PLAY_G>?"

	para "Just as I thought,"
	line "that strange radio"

	para "signal is coming"
	line "from here."
	done

UnknownText_0x6c59e:
	text "The stairs are"
	line "right here."
	done

UnknownText_0x6c5ba:
	text "LANCE: <PLAY_G>, we"
	line "should split up to"

	para "check this place."
	line "I'll go first."
	done

MahoganyMart1F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 3, 1, MAHOGANY_TOWN
	warp_def 7, 2, 1, MAHOGANY_TOWN
	warp_def -2, 12, 1, TEAM_ROCKET_BASE_B1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_PHARMACIST, 14, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PharmacistScript_0x6c367, -1
	person_event SPRITE_BLACK_BELT, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x6c37b, -1
	person_event SPRITE_LANCE, 14, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_DRAGON, 14, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x6c3ee, -1
