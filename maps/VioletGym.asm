const_value set 2
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FalknerScript_0x683c2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext UnknownText_0x68473
	waitbutton
	closetext
	winlosstext UnknownText_0x6854a, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall VioletGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	domaptrigger ELMS_LAB, $2
;	specialphonecall SPECIALCALL_ASSISTANT
	writetext UnknownText_0x685c8
	buttonsound
	verbosegiveitem TM_DIG
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext UnknownText_0x68648
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext UnknownText_0x68735
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBird_keeperRod:
	trainer EVENT_BEAT_BIRD_KEEPER_ROD, YOUNGSTER, MELVIN, Bird_keeperRodSeenText, Bird_keeperRodBeatenText, 0, Bird_keeperRodScript

Bird_keeperRodScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x68837
	waitbutton
	closetext
	end

TrainerBird_keeperAbe:
	trainer EVENT_BEAT_BIRD_KEEPER_ABE, YOUNGSTER, AMIR, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText, 0, Bird_keeperAbeScript

Bird_keeperAbeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x688c7
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext FALKNER, 1, $1
	jumpstd gymstatue2

UnknownText_0x68473:
	text "I'm MACK, the"
	line "WILLOWBRUSH #-"
	cont "MON GYM leader!"

	para "As your first"
	line "challenge, this"
	
	para "might be too"
	line "much for you."
	
	para "You may back out"
	line "now if you wish."
	
	para "Aha! I like your"
	line "enthusiasm!"
	
	para "Let the battle"
	line "commence!"
	done

UnknownText_0x6854a:
	text "I was so close,"
	line "too!"
	
	para "Okay, you've earned"
	line "this!"

	para "It's the official"
	line "#MON LEAGUE"
	cont "COREBADGE."
	done

UnknownText_0x685af:
	text "<PLAYER> received"
	line "COREBADGE."
	done

UnknownText_0x685c8:
	text "The COREBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also allows"
	line "#MON to use"
	
	para "the move FLASH,"
	line "outside of battle."
	
	para "Here, you can also"
	line "have this."
	done

UnknownText_0x68648:
	text "By using a TM, a"
	line "#MON will"

	para "learn a new"
	line "move."

	para "But be mindful of"
	line "who you give it"
	
	para "to, as TMs can"
	line "only be used once!"
	
	para "TM28 is DIG."
	line "You can use it as"
	
	para "A powerful two"
	line "turn attack, or"
	
	para "use it to escape"
	line "from caves if you"
	cont "are feeling lost!"
	done

UnknownText_0x68735:
	text "There are many"
	line "#MON GYMS"
	
	para "around JANTO"
	line "waiting for"
	
	para "challengers like"
	line "you."
	
	para "I wish you luck."
	done

Bird_keeperRodSeenText:
	text "I've been training"
	line "with MACK for"
	cont "years."
	
	para "You won't get any"
	line "further!"
	done

Bird_keeperRodBeatenText:
	text "I don't believe"
	line "it!"
	done

UnknownText_0x68837:
	text "I'll let you pass."
	line "But only because"
	
	para "you won fair and"
	line "square."
	done

Bird_keeperAbeSeenText:
	text "Let's lay out"
	line "the ground rules"
	
	para "before you get to"
	line "MACK!"
	done

Bird_keeperAbeBeatenText:
	text "I've failed!"
	done

UnknownText_0x688c7:
	text "Man, I got bested!"
	done

VioletGymGuyText:
	text "Hey kid, listen"
	line "up!"
	
	para "MACK, the LEADER"
	line "here uses ground-"
	cont "type #MON."
	
	para "So, anything"
	line "electric won't"
	cont "hurt them!"
	
	para "I'll always give"
	line "you the top tips!"
	done

VioletGymGuyWinText:
	text "Well done!"
	line "That was some"
	
	para "fight, champ to"
	line "be!"
	done

VioletGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 2, VIOLET_CITY
	warp_def 15, 5, 2, VIOLET_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 13, 3, SIGNPOST_READ, VioletGymStatue
	signpost 13, 6, SIGNPOST_READ, VioletGymStatue

.ObjectEvents: db 4
	person_event SPRITE_FALKNER, 4, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FalknerScript_0x683c2, -1
	person_event SPRITE_YOUNGSTER, 4, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperRod, -1
	person_event SPRITE_YOUNGSTER, 8, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBird_keeperAbe, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VioletGymGuyScript, -1
