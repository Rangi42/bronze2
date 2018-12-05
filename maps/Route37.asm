const_value set 2
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, SunnyCallback

SunnyCallback:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerTwinsAnnandanne1:
	trainer EVENT_DEREK_ASKED_FOR_PHONE_NUMBER, SUPER_NERD, ELIO, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, TwinsAnnandanne1Script

TwinsAnnandanne1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8e62
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer EVENT_BEAT_TWINS_ANN_AND_ANNE, COOLTRAINERM, MANNY, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, TwinsAnnandanne2Script

TwinsAnnandanne2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8eec
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer EVENT_BEAT_PSYCHIC_GREG, PSYCHIC_T, GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, PsychicGregScript

PsychicGregScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8f80
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

FruitTreeScript_0x1a8e09:
	fruittree FRUITTREE_ROUTE_37_1

FruitTreeScript_0x1a8e0b:
	fruittree FRUITTREE_ROUTE_37_2

FruitTreeScript_0x1a8e0d:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	dwb EVENT_ROUTE_37_HIDDEN_ETHER, ETHER

MountainEntranceSign:
	jumptext MountainEntranceSignText

MountainEntranceSignText:
	text "MT. REDSTONE"
	line "ENTRANCE"
	
	para "Just through"
	line "the cave."
	done
	
TwinsAnnandanne1SeenText:
	text "Let's go go go!"
	line "I'm going to give"
	cont "it my all!"
	done

TwinsAnnandanne1BeatenText:
	text "I did my best!"
	done

UnknownText_0x1a8e62:
	text "I'm not going to"
	line "give up!"
	cont "You have my word!"
	done

TwinsAnnandanne2SeenText:
	text "Are you heading to"
	line "the mountain?"
	done

TwinsAnnandanne2BeatenText:
	text "I built it up too"
	line "much."
	done

UnknownText_0x1a8eec:
	text "I could never be"
	line "happy unless I"
	cont "had my #MON."
	done

PsychicGregSeenText:
	text "I don't talk,"
	line "I battle."
	done

PsychicGregBeatenText:
	text "I have nothing"
	line "to say."
	done

UnknownText_0x1a8f80:
	text "I most focus my"
	line "power."
	done

MeetSunnyText:
	text "SUNNY: Hi!"

	para "I'm SUNNY of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

Route37SignText:
	text "ROUTE 12"
	
	para "MT. REDSTONE -"
	line "FIGBRANCH TOWN"
	done

Route37_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 10, 2, 11, ROUTE33_GATES
	warp_def 11, 2, 12, ROUTE33_GATES
	warp_def 9, 58, 1, MOUNTAINCAVEGATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 7, 7, SIGNPOST_READ, Route37Sign
	signpost 10, 56, SIGNPOST_READ, MountainEntranceSign
	signpost 17, 4, SIGNPOST_ITEM, Route37HiddenEther

.ObjectEvents: db 7
	person_event SPRITE_SUPER_NERD, 5, 53, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerTwinsAnnandanne1, -1
	person_event SPRITE_COOLTRAINER_M, 9, 39, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerTwinsAnnandanne2, -1
	person_event SPRITE_YOUNGSTER, 1, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	person_event SPRITE_FRUIT_TREE, 16, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e09, -1
	person_event SPRITE_BUG_CATCHER, -7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunnyScript, -1
	person_event SPRITE_FRUIT_TREE, 16, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e0b, -1
	person_event SPRITE_FRUIT_TREE, 24, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e0d, -1
