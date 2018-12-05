const_value set 2
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PryceScript_0x199a9e:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext UnknownText_0x199b8d
	waitbutton
	closetext
	winlosstext UnknownText_0x199cb3, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext UnknownText_0x199d3b
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
;	setflag ENGINE_GLACIERBADGE
;	checkcode VAR_BADGES
;	scall MahoganyGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue UnknownScript_0x199af0
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext UnknownText_0x199d55
	buttonsound
	verbosegiveitem TM_ROLLOUT
	iffalse UnknownScript_0x199af4
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext UnknownText_0x199def
	waitbutton
	closetext
	end

UnknownScript_0x199af0:
	writetext UnknownText_0x199e59
	waitbutton
UnknownScript_0x199af4:
	closetext
	end

MahoganyGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer EVENT_BEAT_SKIER_ROXANNE, HIKER, RUDD, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, SkierRoxanneScript

SkierRoxanneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a116
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer EVENT_BEAT_SKIER_CLARISSA, HIKER, WILLY, SkierClarissaSeenText, SkierClarissaBeatenText, 0, SkierClarissaScript

SkierClarissaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a18f
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer EVENT_BEAT_BOARDER_RONALD, BOARDER, RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, BoarderRonaldScript

BoarderRonaldScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x199f2d
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer EVENT_BEAT_BOARDER_BRAD, POKEMANIAC, PETE, BoarderBradSeenText, BoarderBradBeatenText, 0, BoarderBradScript

BoarderBradScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x199fdd
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer EVENT_BEAT_BOARDER_DOUGLAS, POKEMANIAC, WENDAL, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, BoarderDouglasScript

BoarderDouglasScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a047
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext PRYCE, 1, $1
	jumpstd gymstatue2

UnknownText_0x199b8d:
	text "The bond I share"
	line "with my #MON"
	
	para "was formed much in"
	line "the same way as"
	
	para "the landscapes in"
	line "this world."
	
	para "With a lot of time"
	line "and patience."
	
	para "And with that"
	line "comes the ultimate"
	cont "trust."
	
	para "I, CARVER will"
	line "show you true"
	cont "power."
	done

UnknownText_0x199cb3:
	text "I have never seen"
	line "A #MON's trust"
	
	para "like I have with"
	line "my #MON from"
	cont "somebody else."
	
	para "You have truly"
	line "earned this BADGE."
	done

UnknownText_0x199d3b:
	text "<PLAYER> received"
	line "FOSSILBADGE."
	done

UnknownText_0x199d55:
	text "That BADGE will"
	line "raise the SPECIAL"
	cont "stats of #MON."

	para "It also lets your"
	line "#MON use SURF"
	cont "out of battle."

	para "And this is a gift"
	line "from me to you."
	done

UnknownText_0x199def:
	text "That TM contains"
	line "ROLLOUT."

	para "ROLLOUT inflicts"
	line "more and more"
	
	para "damage each time"
	line "it hits."
	done

UnknownText_0x199e59:
	text "I sometimes spend"
	line "too much time"
	cont "indoors here."
	
	para "Never be afraid to"
	line "explore the vast"
	
	para "openness of the"
	line "world."
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

UnknownText_0x199f2d:
	text "I think there's a"
	line "move a #MON"

	para "can use while it's"
	line "frozen."
	done

BoarderBradSeenText:
	text "I'm not playing"
	line "games here."
	done

BoarderBradBeatenText:
	text "How dare you!"
	done

UnknownText_0x199fdd:
	text "That was like,"
	line "a complete cave"
	cont "in."
	done

BoarderDouglasSeenText:
	text "You're almost"
	line "there, but sadly"
	cont "it ends here."
	done

BoarderDouglasBeatenText:
	text "Slamming."
	done

UnknownText_0x19a047:
	text "CARVER won't like"
	line "this."
	done

SkierRoxanneSeenText:
	text "Look out, because"
	line "I'm bringing the"
	cont "smack down!"
	done

SkierRoxanneBeatenText:
	text "Gravel rash!"
	done

UnknownText_0x19a116:
	text "I am a tough man,"
	line "I can take a loss."
	done

SkierClarissaSeenText:
	text "Check out my"
	line "little pal!"
	done

SkierClarissaBeatenText:
	text "No! My buddy boy!"
	done

UnknownText_0x19a18f:
	text "I wanted my #-"
	line "MON to evolve."
	done

MahoganyGymGuyText:
	text "CARVER is not an"
	line "easy guy to take"
	cont "on."
	
	para "If you keep your"
	line "wits about you,"
	
	para "things could go"
	line "swimmingly."
	cont "Good luck!"
	done

MahoganyGymGuyWinText:
	text "I thought CARVER"
	line "would be a grand"
	
	para "challenge for"
	line "sure."
	
	para "But you stood the"
	line "test, with or"
	cont "without my help!"
	done

MahoganyGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 23, 5, 5, AZALEA_TOWN
	warp_def 25, 6, 2, CIANWOOD_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost -1, -3, SIGNPOST_READ, MahoganyGymStatue
	signpost -1, -6, SIGNPOST_READ, MahoganyGymStatue

.ObjectEvents: db 9
	person_event SPRITE_PRYCE, 4, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PryceScript_0x199a9e, -1
	person_event SPRITE_FISHER, 18, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	person_event SPRITE_FISHER, 18, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	person_event SPRITE_FISHER, 10, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSkierClarissa, -1
	person_event SPRITE_SUPER_NERD, 14, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	person_event SPRITE_SUPER_NERD, 10, 7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBoarderDouglas, -1
	person_event SPRITE_GYM_GUY, 21, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
	person_event SPRITE_RAIKOU, 21, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MahoganyGymStatue, -1
	person_event SPRITE_RAIKOU, 21, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MahoganyGymStatue, -1
