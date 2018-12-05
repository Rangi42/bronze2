const_value set 2
	const ROUTE1_YOUNGSTER
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE

Route1_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSchoolboyDanny:
	trainer EVENT_BEAT_SCHOOLBOY_DANNY, SCHOOLBOY, DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, SchoolboyDannyScript

SchoolboyDannyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ac5d7
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer EVENT_BEAT_COOLTRAINERF_QUINN, COOLTRAINERF, QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, CooltrainerfQuinnScript

CooltrainerfQuinnScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ac640
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

FruitTreeScript_0x1ac581:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "You looked at me!"
	
	para "We have to battle!"
	done

SchoolboyDannyBeatenText:
	text "Dang it, man!"
	done

UnknownText_0x1ac5d7:
	text "Let's pretend I"
	line "won that one."
	done

CooltrainerfQuinnSeenText:
	text "Hey there!"
	
	para "Thought you could"
	line "get away, huh?"
	done

CooltrainerfQuinnBeatenText:
	text "Ring out!"
	done

UnknownText_0x1ac640:
	text "You're extremely"
	line "tough!"
	
	para "You aren't from"
	line "around here, aren't"
	cont "you?"
	done

Route1SignText:
	text "ROUTE 2"

	para "ORCHID CITY -"
	line "LITTLEPOND"
	done

Route1_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 1, 39, 3, ROUTE1GATES
	warp_def 0, 40, 2, ROUTE_7
	warp_def 6, 0, 11, LAVENDERTOWNGATES
	warp_def 7, 0, 12, LAVENDERTOWNGATES

.CoordEvents: db 0

.BGEvents: db 1
	signpost 11, 7, SIGNPOST_READ, Route1Sign

.ObjectEvents: db 3
	person_event SPRITE_YOUNGSTER, 10, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	person_event SPRITE_COOLTRAINER_F, 10, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainerfQuinn, -1
	person_event SPRITE_FRUIT_TREE, 6, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1ac581, -1
