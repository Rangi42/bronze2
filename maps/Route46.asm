const_value set 2
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL

Route46_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCamperTed:
	trainer EVENT_BEAT_CAMPER_TED, CAMPER, TED, CamperTedSeenText, CamperTedBeatenText, 0, CamperTedScript

CamperTedScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a9851
	waitbutton
	closetext
	end

TrainerPicnickerErin1:
	trainer EVENT_BEAT_PICNICKER_ERIN, PICNICKER, ERIN1, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, PicnickerErin1Script

PicnickerErin1Script:
;	writecode VAR_CALLERID, PHONE_PICNICKER_ERIN
	end_if_just_battled
	opentext
;	checkflag ENGINE_ERIN
;	iftrue UnknownScript_0x1a96da
;	checkcellnum PHONE_PICNICKER_ERIN
;	iftrue UnknownScript_0x1a975b
;	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x1a96c3
;	writetext UnknownText_0x1a98c6
;	buttonsound
;	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x1a974f
;	jump UnknownScript_0x1a96c6
	writetext UnknownText_0x1a98c6
	waitbutton
	closetext
	end
	
UnknownScript_0x1a96c3:
	scall UnknownScript_0x1a9753
UnknownScript_0x1a96c6:
	askforphonenumber PHONE_PICNICKER_ERIN
	if_equal $1, UnknownScript_0x1a9763
	if_equal $2, UnknownScript_0x1a975f
	trainertotext PICNICKER, ERIN1, $0
	scall UnknownScript_0x1a9757
	jump UnknownScript_0x1a975b

UnknownScript_0x1a96da:
	scall UnknownScript_0x1a9767
	winlosstext PicnickerErin1BeatenText, 0
	copybytetovar wErinFightCount
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
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	loadvar wErinFightCount, 1
	clearflag ENGINE_ERIN
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	loadvar wErinFightCount, 2
	clearflag ENGINE_ERIN
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN
	checkevent EVENT_ERIN_CALCIUM
	iftrue UnknownScript_0x1a973b
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue UnknownScript_0x1a973a
	scall UnknownScript_0x1a9772
	verbosegiveitem CALCIUM
	iffalse UnknownScript_0x1a976b
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump UnknownScript_0x1a975b

UnknownScript_0x1a973a:
	end

UnknownScript_0x1a973b:
	opentext
	writetext UnknownText_0x1a9927
	waitbutton
	verbosegiveitem CALCIUM
	iffalse UnknownScript_0x1a976b
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump UnknownScript_0x1a975b

UnknownScript_0x1a974f:
	jumpstd asknumber1f
	end

UnknownScript_0x1a9753:
	jumpstd asknumber2f
	end

UnknownScript_0x1a9757:
	jumpstd registerednumberf
	end

UnknownScript_0x1a975b:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a975f:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a9763:
	jumpstd phonefullf
	end

UnknownScript_0x1a9767:
	jumpstd rematchf
	end

UnknownScript_0x1a976b:
	setevent EVENT_ERIN_CALCIUM
	jumpstd packfullf
	end

UnknownScript_0x1a9772:
	jumpstd rematchgiftf
	end

TrainerHikerBailey:
	trainer EVENT_BEAT_HIKER_BAILEY, HIKER, BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, HikerBaileyScript

HikerBaileyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a97e8
	waitbutton
	closetext
	end

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

FruitTreeScript_0x1a978f:
	fruittree FRUITTREE_ROUTE_46_1

FruitTreeScript_0x1a9791:
	fruittree FRUITTREE_ROUTE_46_2

HikerBaileySeenText:
	text "I just got down"
	line "this hill, so"
	cont "I'm full of pep!"
	done

HikerBaileyBeatenText:
	text "What a rollout!"
	done

UnknownText_0x1a97e8:
	text "I might just try"
	line "climbing back up"
	cont "the hill!"
	done

CamperTedSeenText:
	text "I've come a long"
	line "way to get here."
	
	para "I'm going to keep"
	line "moving forward!"
	done

CamperTedBeatenText:
	text "Uh oh…"
	done

UnknownText_0x1a9851:
	text "This only means"
	line "I can still get"
	cont "even stronger."
	
	para "Thank you for"
	line "testing me!"
	done

PicnickerErin1SeenText:
	text "I raised my #-"
	line "MON from an EGG!"
	
	para "See how they"
	line "battle!"
	done

PicnickerErin1BeatenText:
	text "Cracked up!"
	done

UnknownText_0x1a98c6:
	text "There's no bond"
	line "stronger than the"
	
	para "one you form with"
	line "a #MON you"
	cont "hatched yourself!"
	done

UnknownText_0x1a9927:
	text "Aww… I keep losing"
	line "all the time!"

	para "I'll just have to"
	line "try harder!"

	para "Anyway, thanks for"
	line "battling me again"

	para "and again. Here's"
	line "that present from"
	cont "the other time."
	done

Route46SignText:
	text "ROUTE 18"
	
	para "HARDROOD TOWN -"
	line "OLD OAK TOWN"
	done

Route46_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 33, 7, 1, ROUTE_29_46_GATE
	warp_def 33, 8, 2, ROUTE_29_46_GATE
	warp_def 5, 14, 3, DARK_CAVE_VIOLET_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 27, 9, SIGNPOST_READ, Route46Sign

.ObjectEvents: db 6
	person_event SPRITE_POKEFAN_M, 13, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerHikerBailey, -1
	person_event SPRITE_YOUNGSTER, 21, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperTed, -1
	person_event SPRITE_LASS, 18, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	person_event SPRITE_FRUIT_TREE, 5, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a978f, -1
	person_event SPRITE_FRUIT_TREE, 6, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a9791, -1
	person_event SPRITE_POKE_BALL, 15, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
