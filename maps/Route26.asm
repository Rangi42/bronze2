const_value set 2
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL

Route26_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCooltrainermJake:
	trainer EVENT_BEAT_COOLTRAINERM_JAKE, COOLTRAINERM, JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, CooltrainermJakeScript

CooltrainermJakeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a4f08
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer EVENT_BEAT_COOLTRAINERM_GAVEN, COOLTRAINERM, GAVEN3, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, CooltrainermGaven3Script

CooltrainermGaven3Script:
;	writecode VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	end_if_just_battled
	opentext
;	checkflag ENGINE_GAVEN
;	iftrue UnknownScript_0x1a4d79
;	checkcellnum PHONE_COOLTRAINERM_GAVEN
;	iftrue UnknownScript_0x1a4dcb
;	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x1a4d62
	writetext UnknownText_0x1a4fe4
;	buttonsound
;	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x1a4dbf
;	jump UnknownScript_0x1a4d65
	waitbutton
	closetext
	end

UnknownScript_0x1a4d62:
	scall UnknownScript_0x1a4dc3
UnknownScript_0x1a4d65:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	if_equal $1, UnknownScript_0x1a4dd3
	if_equal $2, UnknownScript_0x1a4dcf
	trainertotext COOLTRAINERM, GAVEN3, $0
	scall UnknownScript_0x1a4dc7
	jump UnknownScript_0x1a4dcb

UnknownScript_0x1a4d79:
	scall UnknownScript_0x1a4dd7
	winlosstext CooltrainermGaven3BeatenText, 0
	copybytetovar wGavenFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	loadvar wGavenFightCount, 1
	clearflag ENGINE_GAVEN
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadvar wGavenFightCount, 2
	clearflag ENGINE_GAVEN
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN
	end

UnknownScript_0x1a4dbf:
	jumpstd asknumber1m
	end

UnknownScript_0x1a4dc3:
	jumpstd asknumber2m
	end

UnknownScript_0x1a4dc7:
	jumpstd registerednumberm
	end

UnknownScript_0x1a4dcb:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a4dcf:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a4dd3:
	jumpstd phonefullm
	end

UnknownScript_0x1a4dd7:
	jumpstd rematchm
	end

TrainerCooltrainerfJoyce:
	trainer EVENT_BEAT_COOLTRAINERF_JOYCE, COOLTRAINERF, JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, CooltrainerfJoyceScript

CooltrainerfJoyceScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a50d7
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer EVENT_BEAT_COOLTRAINERF_BETH, COOLTRAINERF, BETH1, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, CooltrainerfBeth1Script

CooltrainerfBeth1Script:
;	writecode VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	end_if_just_battled
	opentext
;	checkflag ENGINE_BETH
;	iftrue UnknownScript_0x1a4e35
;	checkcellnum PHONE_COOLTRAINERF_BETH
;	iftrue UnknownScript_0x1a4e87
;	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x1a4e1e
	writetext UnknownText_0x1a51d9
;	buttonsound
;	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x1a4e7b
;	jump UnknownScript_0x1a4e21
	waitbutton
	closetext
	end
UnknownScript_0x1a4e1e:
	scall UnknownScript_0x1a4e7f
UnknownScript_0x1a4e21:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	if_equal $1, UnknownScript_0x1a4e8f
	if_equal $2, UnknownScript_0x1a4e8b
	trainertotext COOLTRAINERF, BETH1, $0
	scall UnknownScript_0x1a4e83
	jump UnknownScript_0x1a4e87

UnknownScript_0x1a4e35:
	scall UnknownScript_0x1a4e93
	winlosstext CooltrainerfBeth1BeatenText, 0
	copybytetovar wBethFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadvar wBethFightCount, 1
	clearflag ENGINE_BETH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadvar wBethFightCount, 2
	clearflag ENGINE_BETH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH
	end

UnknownScript_0x1a4e7b:
	jumpstd asknumber1f
	end

UnknownScript_0x1a4e7f:
	jumpstd asknumber2f
	end

UnknownScript_0x1a4e83:
	jumpstd registerednumberf
	end

UnknownScript_0x1a4e87:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a4e8b:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a4e8f:
	jumpstd phonefullf
	end

UnknownScript_0x1a4e93:
	jumpstd rematchf
	end

TrainerPsychicRichard:
	trainer EVENT_BEAT_PSYCHIC_RICHARD, PSYCHIC_T, RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, PsychicRichardScript

PsychicRichardScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5278
	waitbutton
	closetext
	end

TrainerFisherScott:
	trainer EVENT_BEAT_FISHER_SCOTT, FISHER, SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, FisherScottScript

FisherScottScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5326
	waitbutton
	closetext
	end

Route26Sign:
	jumptext Route26SignText
	
Route26Sign2:
	jumptext Route26SignText2

FruitTreeScript_0x1a4ec2:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball MAX_ELIXER
	
CooltrainermJakeSeenText:
	text "8 GYMS."

	para "8 GYMS thwarted!"
	
	para "Do you think you"
	line "could stop me at"
	cont "this point?"
	done

CooltrainermJakeBeatenText:
	text "I'm all washed up!"
	done

UnknownText_0x1a4f08:
	text "I'm getting closer"
	line "to being the best"
	cont "trainer in JANTO!"
	
	para "I worked so long"
	line "for it, and I"
	cont "won't stop!"
	done

CooltrainermGaven3SeenText:
	text "Pure power is the"
	line "stuff I'm made of!"
	done

CooltrainermGaven3BeatenText:
	text "Gaaah!"
	done

UnknownText_0x1a4fe4:
	text "Did you know about"
	line "VICTORY ROAD?"
	
	para "It's a tough cave"
	line "people have to get"
	
	para "through before"
	line "they can even see"
	
	para "the #MON"
	line "LEAGUE."
	done

CooltrainerfJoyceSeenText:
	text "We're on the same"
	line "path, you and I."
	
	para "Now this is a"
	line "worthy battle."
	done

CooltrainerfJoyceBeatenText:
	text "Oh dang, dude!"
	done

UnknownText_0x1a50d7:
	text "I'm going to get"
	line "to the ELITE FOUR."
	
	para "I will become"
	line "CHAMPION!"
	done

CooltrainerfBeth1SeenText:
	text "I'm getting cold"
	line "feet."
	
	para "The cave is so"
	line "daunting."
	
	para "Let's battle to"
	line "re-jog the spark!"
	done

CooltrainerfBeth1BeatenText:
	text "I think I'm ready."
	done

UnknownText_0x1a51d9:
	text "I trained my whole"
	line "life for this"
	cont "moment."
	
	para "I can't back off"
	line "now!"
	done

PsychicRichardSeenText:
	text "I can sense the"
	line "future CHAMPION!"
	cont "Could it be you?"
	done

PsychicRichardBeatenText:
	text "Well done!"
	done

UnknownText_0x1a5278:
	text "The future"
	line "CHAMPION is close"
	cont "I can feel it."
	
	para "Do you have the"
	line "determination?"
	done

FisherScottSeenText:
	text "I'm fishing for"
	line "success!"
	cont "Come get a bite!"
	done

FisherScottBeatenText:
	text "I was so close,"
	line "too!"
	done

UnknownText_0x1a5326:
	text "I'm not in this"
	line "for fame."
	
	para "I just want to"
	line "make mama proud."
	done

Route26SignText:
	text "VICTORY ROAD"
	done
	
Route26SignText2:
	text "ROUTE 20"
	done

Route26_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 11, 73, 5, VICTORY_ROAD_GATE
	warp_def 5, 13, 1, ROUTE_26_HEAL_SPEECH_HOUSE
	warp_def 5, 14, 1, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE
	warp_def 5, 8, 1, VICTORY_ROAD
	warp_def 10, 73, 6, VICTORY_ROAD_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 8, 8, SIGNPOST_READ, Route26Sign
	signpost 9, 71, SIGNPOST_READ, Route26Sign2

.ObjectEvents: db 8
	person_event SPRITE_COOLTRAINER_M, 16, 57, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainermJake, -1
	person_event SPRITE_COOLTRAINER_M, 9, 32, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainermGaven3, -1
	person_event SPRITE_COOLTRAINER_F, 5, 63, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	person_event SPRITE_COOLTRAINER_F, 11, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	person_event SPRITE_YOUNGSTER, 13, 38, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerPsychicRichard, -1
	person_event SPRITE_FISHER, 15, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherScott, -1
	person_event SPRITE_FRUIT_TREE, 13, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a4ec2, -1
	person_event SPRITE_POKE_BALL, 13, 46, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
