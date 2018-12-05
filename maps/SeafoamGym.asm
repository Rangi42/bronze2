const_value set 2
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUY

SeafoamGym_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x1ab4fa, 0

.MapCallbacks:
	db 0

UnknownScript_0x1ab4fa:
	end

BlaineScript_0x1ab4fb:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext UnknownText_0x1ab548
	waitbutton
	closetext
	winlosstext UnknownText_0x1ab646, 0
	loadtrainer BLAINE, 1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext UnknownText_0x1ab683
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext UnknownText_0x1ab69d
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x1ab71c
	waitbutton
	closetext
	end

SeafoamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .GymBeat
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	end

.GymBeat
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

SeafoamGymStatue:
	checkflag ENGINE_VOLCANOBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BLAINE, 1, $1
	jumpstd gymstatue2
	
UnknownText_0x1ab548:
	text "Greetings!"
	
	para "I'm KARLA."
	
	para "I battle with"
	line "flying-type #-"
	cont "MON."
	
	para "Only the most"
	line "majestic of all"
	cont "#MON."
	
	para "Would you like to"
	line "see how they"
	cont "battle?"
	
	para "Try not to get too"
	line "badly hurt."
	done

UnknownText_0x1ab646:
	text "My wings have been"
	line "clipped!"

	para "It looks like"
	line "you've earned the"
	cont "ACROBADGE!"
	done

UnknownText_0x1ab683:
	text "<PLAYER> received"
	line "ACROBADGE."
	done

UnknownText_0x1ab69d:
	text "I was certain I'd"
	line "win this one!"
	
	para "Ah, but I can't get"
	line "too miffed about"
	cont "it."
	
	para "You won fair and"
	line "square."
	
	para "Good luck with"
	line "the rest of your"
	cont "training."
	done

UnknownText_0x1ab71c:
	text "You should catch"
	line "some more flying"
	
	para "#MON if you"
	line "wish."
	
	para "They're only the"
	line "best!"
	done

SeafoamGymGuyWinText:
	text "Hey yo!"
	
	para "KARLA will fly"
	line "high into the sky"
	para "just to beat down"
	line "on you harder."
	
	para "I'd keep your wits"
	line "about you if I"
	cont "were you."
	done

SeafoamGymGuyWinText2:
	text "Woah, <PLAYER>!"
	
	para "You blew me away"
	line "with that gust of"
	cont "power!"
	
	para "Well done to you"
	line "and your #MON."
	done

SeafoamGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 9, 4, 11, CERULEAN_CITY
	warp_def 9, 5, 11, CERULEAN_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 3, SIGNPOST_READ, SeafoamGymStatue
	signpost 7, 6, SIGNPOST_READ, SeafoamGymStatue

.ObjectEvents: db 2
	person_event SPRITE_BLAINE, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlaineScript_0x1ab4fb, -1
	person_event SPRITE_GYM_GUY, 7, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SeafoamGymGuyScript, -1
