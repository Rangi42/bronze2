const_value set 2
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_M
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3

Route44_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperVance1:
	trainer EVENT_BEAT_BIRD_KEEPER_VANCE, BIRD_KEEPER, VANCE1, Bird_keeperVance1SeenText, Bird_keeperVance1BeatenText, 0, Bird_keeperVance1Script

Bird_keeperVance1Script:
;	writecode VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	end_if_just_battled
	opentext
;	checkflag ENGINE_VANCE
;	iftrue UnknownScript_0x19d86a
;	checkcellnum PHONE_BIRDKEEPER_VANCE
;	iftrue UnknownScript_0x19d8eb
;	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x19d853
	writetext UnknownText_0x19dbf3
;	buttonsound
;	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x19d8df
;	jump UnknownScript_0x19d856
	waitbutton
	closetext
	end
	
UnknownScript_0x19d853:
	scall UnknownScript_0x19d8e3
UnknownScript_0x19d856:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext BIRD_KEEPER, VANCE1, $0
	scall UnknownScript_0x19d8e7
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d86a:
	scall UnknownScript_0x19d8f7
	winlosstext Bird_keeperVance1BeatenText, 0
	copybytetovar wVanceFightCount
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
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	loadvar wVanceFightCount, 1
	clearflag ENGINE_VANCE
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	reloadmapafterbattle
	loadvar wVanceFightCount, 2
	clearflag ENGINE_VANCE
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_VANCE
	checkevent EVENT_VANCE_CARBOS
	iftrue UnknownScript_0x19d8cb
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftrue UnknownScript_0x19d8ca
	scall UnknownScript_0x19d90a
	verbosegiveitem CARBOS
	iffalse UnknownScript_0x19d903
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d8ca:
	end

UnknownScript_0x19d8cb:
	opentext
	writetext UnknownText_0x19dc67
	waitbutton
	verbosegiveitem CARBOS
	iffalse UnknownScript_0x19d903
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d8df:
	jumpstd asknumber1m
	end

UnknownScript_0x19d8e3:
	jumpstd asknumber2m
	end

UnknownScript_0x19d8e7:
	jumpstd registerednumberm
	end

UnknownScript_0x19d8eb:
	jumpstd numberacceptedm
	end

UnknownScript_0x19d8ef:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19d8f3:
	jumpstd phonefullm
	end

UnknownScript_0x19d8f7:
	jumpstd rematchm
	end

UnknownScript_0x19d8fb:
	jumpstd giftm
	end

UnknownScript_0x19d8ff:
	jumpstd packfullm
	end

UnknownScript_0x19d903:
	setevent EVENT_VANCE_CARBOS
	jumpstd packfullm
	end

UnknownScript_0x19d90a:
	jumpstd rematchgiftm
	end

TrainerPsychicPhil:
	trainer EVENT_BEAT_PSYCHIC_PHIL, PSYCHIC_T, PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, PsychicPhilScript

PsychicPhilScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19dcfc
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer EVENT_BEAT_FISHER_WILTON, FISHER, WILTON1, FisherWilton1SeenText, FisherWilton1BeatenText, 0, FisherWilton1Script

FisherWilton1Script:
;	writecode VAR_CALLERID, PHONE_FISHER_WILTON
	end_if_just_battled
	opentext
;	checkflag ENGINE_WILTON
;	iftrue UnknownScript_0x19d96e
;	checkflag ENGINE_WILTON_HAS_ITEM
;	iftrue UnknownScript_0x19d9b4
;	checkcellnum PHONE_FISHER_WILTON
;	iftrue UnknownScript_0x19d8eb
;	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x19d957
;	writetext UnknownText_0x19daa8
;	buttonsound
;	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x19d8df
;	jump UnknownScript_0x19d95a
	writetext UnknownText_0x19daa8
	waitbutton
	closetext
	end

UnknownScript_0x19d957:
	scall UnknownScript_0x19d8e3
UnknownScript_0x19d95a:
	askforphonenumber PHONE_FISHER_WILTON
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext FISHER, WILTON1, $0
	scall UnknownScript_0x19d8e7
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d96e:
	scall UnknownScript_0x19d8f7
	winlosstext FisherWilton1BeatenText, 0
	copybytetovar wWiltonFightCount
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
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	loadvar wWiltonFightCount, 1
	clearflag ENGINE_WILTON
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	loadvar wWiltonFightCount, 2
	clearflag ENGINE_WILTON
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON
	end

UnknownScript_0x19d9b4:
	scall UnknownScript_0x19d8fb
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue UnknownScript_0x19d9c9
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue UnknownScript_0x19d9d2
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue UnknownScript_0x19d9db
UnknownScript_0x19d9c9:
	verbosegiveitem ULTRA_BALL
	iffalse UnknownScript_0x19d9e7
	jump UnknownScript_0x19d9e1

UnknownScript_0x19d9d2:
	verbosegiveitem GREAT_BALL
	iffalse UnknownScript_0x19d9e7
	jump UnknownScript_0x19d9e1

UnknownScript_0x19d9db:
	verbosegiveitem POKE_BALL
	iffalse UnknownScript_0x19d9e7
UnknownScript_0x19d9e1:
	clearflag ENGINE_WILTON_HAS_ITEM
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d9e7:
	jump UnknownScript_0x19d8ff

TrainerFisherEdgar:
	trainer EVENT_BEAT_FISHER_EDGAR, FISHER, EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, FisherEdgarScript

FisherEdgarScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19db6f
	waitbutton
	closetext
	end

TrainerCooltrainerfCybil:
	trainer EVENT_BEAT_COOLTRAINERF_CYBIL, COOLTRAINERF, CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, CooltrainerfCybilScript

CooltrainerfCybilScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19df4d
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer EVENT_BEAT_POKEMANIAC_ZACH, POKEMANIAC, ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, PokemaniacZachScript

PokemaniacZachScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19dd7e
	waitbutton
	closetext
	end

TrainerCooltrainermAllen:
	trainer EVENT_BEAT_COOLTRAINERM_ALLEN, COOLTRAINERM, ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText, 0, CooltrainermAllenScript

CooltrainermAllenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19de66
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

FruitTreeScript_0x19da40:
	fruittree FRUITTREE_ROUTE_44

Route44MaxRevive:
	itemball MAX_REVIVE

Route44UltraBall:
	itemball ULTRA_BALL

Route44MaxRepel:
	itemball MAX_REPEL

Route44HiddenElixer:
	dwb EVENT_ROUTE_44_HIDDEN_ELIXER, ELIXER


FisherWilton1SeenText:
	text "Holy moly!"
	
	para "I was expecting"
	line "a bite, not a"
	cont "battle!"
	done

FisherWilton1BeatenText:
	text "Fish out of"
	line "water!"
	done

UnknownText_0x19daa8:
	text "Come fish with"
	line "me!"
	
	para "Then later we"
	line "could battle"
	cont "again!"
	done

FisherEdgarSeenText:
	text "Let me show you"
	line "the #MON I just"
	cont "caught!"
	
	para "There's nothing"
	line "fishy about it!"
	done

FisherEdgarBeatenText:
	text "Perhaps I should"
	line "have trained them!"
	done

UnknownText_0x19db6f:
	text "I'm going to make"
	line "the #MON I"
	
	para "catch stronger be-"
	line "fore I start batt-"
	cont "ling with them."
	done

Bird_keeperVance1SeenText:
	text "I must say, I'm"
	line "pretty hot stuff."
	cont "Wanna duke it out?"
	done

Bird_keeperVance1BeatenText:
	text "Whew! That was too"
	line "much for me to"
	cont "handle!"
	done

UnknownText_0x19dbf3:
	text "If I had a"
	line "legendary #MON"
	
	para "things would be"
	line "different!"
	done

UnknownText_0x19dc67:
	text "Why can't I ever"
	line "beat you?"

	para "Oh yeah, here you"
	line "go. It's that gift"

	para "I couldn't give"
	line "you last time."
	done

PsychicPhilSeenText:
	text "My senses tell me…"
	
	para "You're quite"
	line "strong!"
	done

PsychicPhilBeatenText:
	text "Just as I"
	line "predicted!"
	done

UnknownText_0x19dcfc:
	text "It was a tough"
	line "battle, but I'm"
	
	para "proud of my"
	line "#MON."
	done

PokemaniacZachSeenText:
	text "Have you ever seen"
	line "a #MON that"
	cont "gleams?"
	cont "Do you have one?"
	done

PokemaniacZachBeatenText:
	text "What a beat down!"
	done

UnknownText_0x19dd7e:
	text "I've heard stories"
	line "of #MON that"
	
	para "are different"
	line "colors, that also"
	
	para "shine in the sun-"
	line "light."
	done

CooltrainermAllenSeenText:
	text "Did you hear about"
	line "TEAM ROCKET?"
	
	para "We should battle"
	line "so we can keep"
	
	para "strong enough to"
	line "beat them!"
	done

CooltrainermAllenBeatenText:
	text "Well blast me"
	line "away."
	done

UnknownText_0x19de66:
	text "I'm worried."
	
	para "What if they come"
	line "after our prize"
	cont "#MON?"
	done

CooltrainerfCybilSeenText:
	text "My dad was a great"
	line "trainer."
	
	para "With his coaching,"
	line "there's no way I"
	cont "can lose!"
	done

CooltrainerfCybilBeatenText:
	text "I'm shaken up!"
	done

UnknownText_0x19df4d:
	text "I will continue to"
	line "strive to battle"
	
	para "as well as my"
	line "father taught me!"
	done

Route44Sign1Text:
	text "TRAINER TIPS"
	
	para "It's always a good"
	line "idea to save every"
	cont "now and then."
	
	para "It's more important"
	line "than you think!"
	done

Route44Sign2Text:
	text "ROUTE 9"

	para "NEWPORT CITY -"
	line "ROSEGLEN CITY"
	done

Route44_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 3, 57, 1, ICE_PATH_1F
	warp_def 8, 2, 11, GOLDENRODCITYGATES
	warp_def 9, 2, 12, GOLDENRODCITYGATES
	warp_def 8, 87, 6, OLIVINE_PORT_PASSAGE
	warp_def 9, 87, 7, OLIVINE_PORT_PASSAGE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 7, 53, SIGNPOST_READ, Route44Sign1
	signpost 7, 7, SIGNPOST_READ, Route44Sign2
	signpost 4, 53, SIGNPOST_ITEM, Route44HiddenElixer

.ObjectEvents: db 11
	person_event SPRITE_FISHER, 3, 38, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	person_event SPRITE_FISHER, 12, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerFisherEdgar, -1
	person_event SPRITE_YOUNGSTER, 9, 10, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPsychicPhil, -1
	person_event SPRITE_SUPER_NERD, 10, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerPokemaniacZach, -1
	person_event SPRITE_YOUNGSTER, 5, 51, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerBird_keeperVance1, -1
	person_event SPRITE_COOLTRAINER_M, 6, 72, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainermAllen, -1
	person_event SPRITE_COOLTRAINER_F, 11, 85, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerfCybil, -1
	person_event SPRITE_FRUIT_TREE, 2, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x19da40, -1
	person_event SPRITE_POKE_BALL, 14, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route44MaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 0, 52, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route44UltraBall, EVENT_ROUTE_44_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 4, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route44MaxRepel, EVENT_ROUTE_44_MAX_REPEL
