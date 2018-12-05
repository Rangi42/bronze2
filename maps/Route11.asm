const_value set 2
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerYoungsterOwen:
	trainer EVENT_BEAT_YOUNGSTER_OWEN, YOUNGSTER, OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, YoungsterOwenScript

YoungsterOwenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x680b2
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer EVENT_BEAT_YOUNGSTER_JASON, YOUNGSTER, JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, YoungsterJasonScript

YoungsterJasonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6814a
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer EVENT_BEAT_PSYCHIC_HERMAN, PSYCHIC_T, HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, PsychicHermanScript

PsychicHermanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6817b
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer EVENT_BEAT_PSYCHIC_FIDEL, PSYCHIC_T, FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, PsychicFidelScript

PsychicFidelScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x681ec
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

FruitTreeScript_0x68055:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	dwb EVENT_ROUTE_11_HIDDEN_REVIVE, REVIVE

Route11Rock:
	jumpstd smashrock

YoungsterOwenSeenText:
	text "Give me a break."
	
	para "I wanna win this"
	line "one!"
	done

YoungsterOwenBeatenText:
	text "How do I keep"
	line "losing?!"
	done

UnknownText_0x680b2:
	text "I'll become"
	line "stronger in time."
	
	para "I just have to"
	line "keep at it!"
	done

YoungsterJasonSeenText:
	text "Big things come in"
	line "small packages."
	
	para "Is that true?"
	done

YoungsterJasonBeatenText:
	text "It's not true…"
	done

UnknownText_0x6814a:
	text "I'm going to catch"
	line "even stronger"
	cont "#MON."
	done

PsychicHermanSeenText:
	text "I will concentrate"
	line "all my mind's"
	cont "power."
	done

PsychicHermanBeatenText:
	text "I don't…"
	done

UnknownText_0x6817b:
	text "I tried to concen-"
	line "trate with my"
	cont "mind."
	
	para "But you were too"
	line "strong."
	done

PsychicFidelSeenText:
	text "There's nothing"
	line "slow about my"
	cont "mind."
	
	para "Let me show you"
	line "my mental powers."
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "this loss."
	done

UnknownText_0x681ec:
	text "You really showed"
	line "me up."
	done

Route11SignText:
	text "ROUTE 9"
	
	para "GAMBOGE TOWN"
	line "AHEAD"
	done

Route11_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 10, 53, 1, ROUTE8GATES
	warp_def 11, 53, 2, ROUTE8GATES
	warp_def 19, 5, 5, ROUTE8GATES
	warp_def 19, 6, 6, ROUTE8GATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 9, 47, SIGNPOST_READ, Route11Sign
	signpost 1, 39, SIGNPOST_ITEM, Route11HiddenRevive

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 2, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	person_event SPRITE_YOUNGSTER, 11, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	person_event SPRITE_YOUNGSTER, 9, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPsychicHerman, -1
	person_event SPRITE_YOUNGSTER, 12, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	person_event SPRITE_FRUIT_TREE, 4, 40, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x68055, -1
	person_event SPRITE_ROCK, 17, 15, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route11Rock, -1
