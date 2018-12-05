const_value set 2
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Tuscany

.Trigger0:
	end

.Trigger1:
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	return

.DoesTuscanyAppear:
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	return

Route29Tutorial1:
	spriteface ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	spriteface PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	spriteface ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	spriteface PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	dotrigger $0
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	dotrigger $0
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	checkcode VAR_BOXSPACE
	if_equal $0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext UnknownText_0x1a10a7
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

CooltrainerMScript_0x1a1031:
	jumptextfaceplayer Text_WaitingForDay
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step_up
	step_up
	step_up
	step_right
	step_end

DudeMovementData2a:
	step_up
	step_up
	step_right
	step_end

DudeMovementData1b:
	step_left
	step_down
	step_down
	step_down
	step_end

DudeMovementData2b:
	step_left
	step_down
	step_down
	step_end

UnknownText_0x1a10a7:
	text "#MON like to"
	line "hide in thick,"
	cont "tall grass."
	
	para "They can pop out"
	line "at any time!"
	done

CatchingTutorialIntroText:
	text "Hey, <PLAYER>"
	line "is it?"
	
	para "I've seen you pass"
	line "by a few times."
	
	para "Do you know how to"
	line "catch #MON?"
	
	para "Want me to show"
	line "you how?"
	done

CatchingTutorialDebriefText:
	text "And that's how"
	line "it's done!"
	
	para "But, it's easier"
	line "if you weaken the"
	
	para "target #MON"
	line "first."
	done

CatchingTutorialDeclinedText:
	text "Oh, okay."
	
	para "Just stick to the"
	line "grass if you"
	
	para "want #MON to"
	line "appear."
	done

CatchingTutorialRepeatText:
	text "Would you like me"
	line "to teach you how"
	
	para "to catch #MON"
	line "now?"
	done

Route29YoungsterText:
	text "When my #MON"
	line "aren't feeling"
	
	para "too hot,"
	line "I avoid the"
	cont "tall grass."
	done

Route29TeacherText:
	text "When I've come a"
	line "long way, I save"
	
	para "so I don't lose"
	line "my progress."
	done

Route29FisherText:
	text "I'm a big guy, but"
	line "not even I can"	
	cont "climb those"
	cont "ledges."
	
	para "I can jump down"
	line "them, though!"
	done

; possibly unused
Text_WaitingForDay:
	text "Different #MON"
	line "can appear at"
	
	para "different times of"
	line "the day!"
	
	para "Try coming back at"
	line "day or night to"
	cont "look in the tall"
	cont "grass!"
	done

Text_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Text_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "ROUTE 1"

	para "OLD OAK TOWN -"
	line "SILVERLEAF TOWN"
	done

Route29Sign2Text:
	text "ROUTE 1"

	para "SILVERLEAF TOWN -"
	line "OLD OAK TOWN"
	done

Route29_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 1, 49, 3, ROUTE_29_46_GATE

.CoordEvents: db 2
	xy_trigger 1, 14, 52, 0, Route29Tutorial1, 0, 0
	xy_trigger 1, 15, 52, 0, Route29Tutorial2, 0, 0

.BGEvents: db 2
	signpost 13, 45, SIGNPOST_READ, Route29Sign2
	signpost 9, 5, SIGNPOST_READ, Route29Sign1

.ObjectEvents: db 8
	person_event SPRITE_COOLTRAINER_M, 17, 50, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	person_event SPRITE_YOUNGSTER, 7, 28, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	person_event SPRITE_TEACHER, 11, 7, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route29TeacherScript, -1
	person_event SPRITE_FRUIT_TREE, 1, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route29FruitTree, -1
	person_event SPRITE_FISHER, 12, 41, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route29FisherScript, -1
	person_event SPRITE_COOLTRAINER_M, 3, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_TEACHER, -8, 26, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	person_event SPRITE_POKE_BALL, 6, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
