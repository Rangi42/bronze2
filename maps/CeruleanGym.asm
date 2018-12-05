const_value set 2
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUY

CeruleanGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1883d9, 5
	dw UnknownScript_0x1883da, 5

.MapCallbacks:
	db 0

UnknownScript_0x1883d9:
	end

UnknownScript_0x1883da:
	priorityjump UnknownScript_0x1883de
	end

UnknownScript_0x1883de:
	applymovement CERULEANGYM_ROCKET, MovementData_0x1884e3
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, MovementData_0x1884eb
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext UnknownText_0x1884fb
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, MovementData_0x1884f7
	opentext
	writetext UnknownText_0x188574
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, MovementData_0x1884f5
	opentext
	writetext UnknownText_0x1885a5
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, MovementData_0x1884e8
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	dotrigger $0
	domaptrigger ROUTE_25, $1
	domaptrigger POWER_PLANT, $0
	waitsfx
	special RestartMapMusic
	pause 15
	spriteface PLAYER, DOWN
	pause 15
	end

MistyScript_0x188432:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext UnknownText_0x188674
	waitbutton
	closetext
	winlosstext UnknownText_0x18870c, 0
	loadtrainer MISTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext UnknownText_0x188768
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext UnknownText_0x188782
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer EVENT_BEAT_SWIMMERF_DIANA, BOARDER, BOARD1, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, SwimmerfDianaScript

SwimmerfDianaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x188856
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer EVENT_BEAT_SWIMMERF_BRIANA, BOARDER, BOARD2, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, SwimmerfBrianaScript

SwimmerfBrianaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1888c0
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer EVENT_BEAT_SWIMMERM_PARKER, SKIER, CHICK1, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, SwimmermParkerScript

SwimmermParkerScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x188943
	waitbutton
	closetext
	end

CeruleanGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	waitbutton
	closetext
	end

.CeruleanGymGuyWinScript:
	writetext CeruleanGymGuyWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	dwb EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM, MACHINE_PART


CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MISTY, 1, $1
	jumpstd gymstatue2

MovementData_0x1884e3:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x1884e8:
	big_step_right
	big_step_down
	step_end

MovementData_0x1884eb:
	fix_facing
	db $39 ; movement
	jump_step_up
	db $38 ; movement
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_down
	step_down
	step_end

MovementData_0x1884f5:
	big_step_down
	step_end

MovementData_0x1884f7:
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end

UnknownText_0x1884fb:
	text "Oops! I so sorry!"
	line "You not hurt,"
	cont "okay?"

	para "I very busy."
	line "No time for talk-"
	cont "ing with you. Not"
	cont "good for me if"
	cont "seen by somebody."
	done

UnknownText_0x188574:
	text "Oh no! You seen"
	line "me already! I make"
	cont "big mistake!"
	done

UnknownText_0x1885a5:
	text "Hey, you! Forget"
	line "you see me, okay?"

	para "You see, hear,"
	line "know nothing,"

	para "okay?"
	line "Bye, kid! Nothing!"

	para "Bye-bye a go-go!"
	done

CeruleanGymNote1:
	text "Sorry, I'll be out"
	line "for a while."
	cont "MISTY, GYM LEADER"
	done

CeruleanGymNote2:
	text "Since MISTY's out,"
	line "we'll be away too."
	cont "GYM TRAINERS"
	done

UnknownText_0x188674:
	text "Hey dude,"
	line "I'm ELROY."
	
	para "Only the most"
	line "extreme #-"
	
	para "MON trainer out"
	line "there, dude!"
	
	para "I deal with"
	line "poison-type #-"
	
	para "MON, because I"
	line "live for danger."
	
	para "One on one, here"
	line "we go!"
	done

UnknownText_0x18870c:
	text "Dang, man."
	line "You bested me."
	
	para "I hope my sister"
	line "hasn't lost to"
	cont "you."
	
	para "You've earned the"
	line "POLLUTEBADGE."
	done

UnknownText_0x188768:
	text "<PLAYER> received"
	line "POLLUTEBADGE."
	done

UnknownText_0x188782:
	text "You may be a"
	line "hotshot in JANTO."
	
	para "But KOHTO is the"
	line "real deal."
	
	para "Do you think you"
	line "can handle it,"
	cont "dude?"
	done

SwimmerfDianaSeenText:
	text "Hey, outta the"
	line "way!"
	
	para "I'm trying to do"
	line "a flip trick!"
	done

SwimmerfDianaBeatenText:
	text "Gnarly, dude!"
	done

UnknownText_0x188856:
	text "I'm stunned."
	
	para "You're one hot"
	line "shot trainer."
	done

SwimmerfBrianaSeenText:
	text "Careful, I'm"
	line "poisonous!"
	done

SwimmerfBrianaBeatenText:
	text "Shut down in my"
	line "prime."
	done

UnknownText_0x1888c0:
	text "Bummer, dude."
	
	para "ELROY better not"
	line "lose."
	done

SwimmermParkerSeenText:
	text "Hang tight!"
	
	para "We're going to"
	line "extreme!"
	done

SwimmermParkerBeatenText:
	text "How did you…"
	done

UnknownText_0x188943:
	text "ELROY won't go"
	line "down so easily."
	
	para "He has my back!"
	done

CeruleanGymGuyText:
	text "Yo! CHAMP!"
	
	para "ELROY here uses"
	line "poison-type"
	cont "#MON."
	
	para "I'm sure you don't"
	line "need much help"
	
	para "from me, so go on"
	line "ahead!"
	done

CeruleanGymGuyWinText:
	text "I knew you wouldn't"
	line "let me down."
	
	para "Keep it up,"
	line "<PLAYER>!"
	done

CeruleanGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 17, 6, 5, CERULEAN_CITY
	warp_def 17, 7, 5, CERULEAN_CITY

.CoordEvents: db 0

.BGEvents: db 3
	signpost -6, 2, SIGNPOST_ITEM, CeruleanGymHiddenMachinePart
	signpost 15, 5, SIGNPOST_READ, CeruleanGymStatue;CeruleanGymStatue1
	signpost 15, 8, SIGNPOST_READ, CeruleanGymStatue;CeruleanGymStatue2

.ObjectEvents: db 6
	person_event SPRITE_ROCKET, -6, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MISTY, 5, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MistyScript_0x188432, -1
	person_event SPRITE_ROCKER, 3, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerfDiana, -1
	person_event SPRITE_ROCKER, 8, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSwimmerfBriana, -1
	person_event SPRITE_BUENA, 7, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermParker, -1
	person_event SPRITE_GYM_GUY, 15, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeruleanGymGuyScript, -1
