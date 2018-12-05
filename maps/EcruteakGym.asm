const_value set 2
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x99d53, 0
	dw UnknownScript_0x99d57, 0

.MapCallbacks:
	db 0

UnknownScript_0x99d53:
	priorityjump UnknownScript_0x99dc6
	end

UnknownScript_0x99d57:
	end
	
MortyScript_0x99d58:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue EcruFightDone
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iftrue GymLate
GymLate2:
	writetext UnknownText_0x99e65
	waitbutton
	closetext
	winlosstext UnknownText_0x9a00a, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext UnknownText_0x9a043
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	setevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_7
	checkcode VAR_BADGES
;	scall EcruteakGymTriggerRockets
;	domaptrigger ECRUTEAK_HOUSE, $1
;	setevent EVENT_RANG_CLEAR_BELL_1
;	setevent EVENT_RANG_CLEAR_BELL_2
EcruFightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue UnknownScript_0x99db1
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext UnknownText_0x9a059
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse UnknownScript_0x99db5
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext UnknownText_0x9a0ec
	waitbutton
	closetext
	end

UnknownScript_0x99db1:
	writetext UnknownText_0x9a145
	waitbutton
UnknownScript_0x99db5:
	closetext
	end

GymLate:
	writetext GymLateText
	buttonsound
	jump GymLate2
	
EcruteakGymTriggerRockets:
;	if_equal 7, .RadioTowerRockets
;	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

UnknownScript_0x99dc6:
	applymovement PLAYER, MovementData_0x99e5d
	applymovement ECRUTEAKGYM_GRAMPS, MovementData_0x99e63
	opentext
	writetext UnknownText_0x9a49c
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, MovementData_0x99e5f
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp GOLDENROD_CITY, $22, $20
	end

TrainerSageJeffrey:
	trainer EVENT_BEAT_SAGE_JEFFREY, COOLTRAINERM, DARREN, SageJeffreySeenText, SageJeffreyBeatenText, 0, SageJeffreyScript

SageJeffreyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a263
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer EVENT_BEAT_SAGE_PING, COOLTRAINERM, JACKO, SagePingSeenText, SagePingBeatenText, 0, SagePingScript

SagePingScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a2b7
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer EVENT_BEAT_MEDIUM_MARTHA, COOLTRAINERF, TABES, MediumMarthaSeenText, MediumMarthaBeatenText, 0, MediumMarthaScript

MediumMarthaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a318
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer EVENT_BEAT_MEDIUM_GRACE, COOLTRAINERF, ELLIE, MediumGraceSeenText, MediumGraceBeatenText, 0, MediumGraceScript

MediumGraceScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a38a
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2

MovementData_0x99e5d:
	step_up
	step_end

MovementData_0x99e5f:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MovementData_0x99e63:
	slow_step_down
	step_end

GymLateText:
	text "Oh, it's"
	line "<PLAYER>, right?"
	
	para "I was starting to"
	line "think you'd"
	cont "never come…"
	
	para "What took you so"
	line "long?"
	cont "Anyway…"
	done
	
UnknownText_0x99e65:
	text "Welcome, <PLAYER>"
	line "to my GYM!"
	
	para "You helped save"
	line "my career from"
	
	para "TEAM ROCKET, but"
	line "that won't change"
	cont "things here."
	
	para "I got a sense of"
	line "your strength at"
	cont "the TV STATION."
	
	para "And I am ready to"
	line "use my full power"
	
	para "and put you to the"
	line "test!"
	
	para "It's time shine!"
	line "can you handle it,"
	cont "<PLAYER>?"
	done

UnknownText_0x9a00a:
	text "Oh my stars!"
	line "We have a new"
	cont "talent!"
	
	para "You've earned a"
	line "brand new shiny"
	cont "BADGE!"
	done

UnknownText_0x9a043:
	text "<PLAYER> received"
	line "STARBADGE."
	done

UnknownText_0x9a059:
	text "By having the"
	line "STARBADGE,"
	
	para "#MON up to"
	line "to L50 will obey"
	cont "you."

	para "Also, your #-"
	line "MON will be able"
	
	para "to use FLY at"
	line "any time!"

	para "You can also have"
	line "this, darling."
	done

UnknownText_0x9a0ec:
	text "It's a SHARP BEAK."
	
	para "Making a #MON"
	line "hold this item"
	
	para "will increase the"
	line "power of flying-"
	cont "type moves!"
	done

UnknownText_0x9a145:
	text "Boy, you were"
	line "just too strong"
	cont "for me."
	
	para "As I said, if"
	line "I ever need a"
	
	para "strong trainer"
	line "in my show, I'll"
	cont "give you a call!"
	done

SageJeffreySeenText:
	text "I'm doing a TV"
	line "special soon."
	
	para "You won't be"
	line "in it!"
	done

SageJeffreyBeatenText:
	text "I'm going to lose"
	line "the contract!"
	done

UnknownText_0x9a263:
	text "You're lucky,"
	line "punk."
	done

SagePingSeenText:
	text "Step right up!"
	line "It's time to get"
	cont "pecked!"
	done

SagePingBeatenText:
	text "Good gravy!"
	done

UnknownText_0x9a2b7:
	text "My birds are"
	line "burning!"
	done

MediumMarthaSeenText:
	text "Can you ride on"
	line "the wings of a"
	cont "star?"
	done

MediumMarthaBeatenText:
	text "Wait a minute…"
	line "Stars don't have"
	cont "wings!"
	done

UnknownText_0x9a318:
	text "Take flight and"
	line "shine bright."
	done

MediumGraceSeenText:
	text "You don't want"
	line "to get caught"
	cont "in my talons!"
	done

MediumGraceBeatenText:
	text "Wha-wha-what?"
	done

UnknownText_0x9a38a:
	text "I'll continue to"
	line "shine bright."
	done

EcruteakGymGuyText:
	text "Look your best,"
	line "because you're in"
	cont "the spotlight!"
	
	para "You'll fly high"
	line "in the sky, among"
	
	para "the stars in this"
	line "GYM!"
	done

EcruteakGymGuyWinText:
	text "You sure shined"
	line "bright among"
	
	para "the stars,"
	line "<PLAYER>!"
	done

UnknownText_0x9a49c:
	text "Sorry dude, but"
	line "there is no way"
	
	para "you're allowed in"
	line "this GYM."
	
	para "Try coming back"
	line "another time, bro."
	done

EcruteakGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 4, 1, GOLDENROD_CITY
	warp_def 19, 5, 1, GOLDENROD_CITY

.CoordEvents: db 0

.BGEvents: db 4
	signpost 17, 3, SIGNPOST_READ, EcruteakGymStatue
	signpost 17, 6, SIGNPOST_READ, EcruteakGymStatue
	signpost 17, 3, SIGNPOST_READ, EcruteakGymStatue
	signpost 17, 6, SIGNPOST_READ, EcruteakGymStatue

.ObjectEvents: db 7
	person_event SPRITE_MORTY, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MortyScript_0x99d58, -1
	person_event SPRITE_COOLTRAINER_M, 6, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerSageJeffrey, -1
	person_event SPRITE_COOLTRAINER_M, 12, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerSagePing, -1
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerMediumMartha, -1
	person_event SPRITE_COOLTRAINER_F, 12, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerMediumGrace, -1
	person_event SPRITE_GYM_GUY, 17, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	person_event SPRITE_ROCKER, 16, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
