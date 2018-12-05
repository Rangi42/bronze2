const_value set 2
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BrockScript_0x1a2864:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext UnknownText_0x1a28d0
	waitbutton
	closetext
	winlosstext UnknownText_0x1a29bb, 0
	loadtrainer BROCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext UnknownText_0x1a2a3d
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext UnknownText_0x1a2a57
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x1a2ada
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer EVENT_BEAT_CAMPER_JERRY, CAMPER, JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, CamperJerryScript

CamperJerryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a2c0f
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BROCK, 1, $1
	jumpstd gymstatue2

UnknownText_0x1a28d0:
	text "Hello, hello!"
	
	para "I'm WEEDY."
	
	para "I'm everywhere you"
	line "don't want me to"
	cont "be!"
	
	para "If you think you"
	line "stand a chance,"
	cont "then go on, dude!"
	
	para "You won't whack me"
	line "down, for sure!"
	done

UnknownText_0x1a29bb:
	text "Argh! Cut down"
	line "in my prime!"
	
	para "Guess what, this"
	line "BADGE is yours!"
	done

UnknownText_0x1a2a3d:
	text "<PLAYER> received"
	line "WEEDBADGE."
	done

UnknownText_0x1a2a57:
	text "Thanks, dude."
	
	para "That was quite a"
	line "battle."

	para "Really had me on"
	line "my toes, there."
	done

UnknownText_0x1a2ada:
	text "Trainers every-"
	line "where are gonna"
	
	para "have to train up"
	line "before they meet"
	cont "you."
	
	para "I won't forget"
	line "our battle!"
	done

CamperJerrySeenText:
	text "Apart from the"
	line "LEADER, I'm the"
	cont "only one here."
	
	para "I've got to fight"
	line "extra hard!"
	done

CamperJerryBeatenText:
	text "I'm a little bit"
	line "ashamed."
	done

UnknownText_0x1a2c0f:
	text "It's not fair"
	line "when my buddies"
	cont "aren't here…"
	done

PewterGymGuyText:
	text "Yo! CHAMP!"
	
	para "WEEDY here can"
	line "be a real pest"
	
	para "with their grass-"
	line "type #MON."
	
	para "Best keep on your"
	line "toes."
	done

PewterGymGuyWinText:
	text "I was inspired"
	line "by the way you"
	cont "battled!"
	
	para "Remember us little"
	line "people when you're"
	
	para "at the top, will"
	line "ya?"
	done

PewterGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 2, PEWTER_CITY
	warp_def 15, 5, 2, PEWTER_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 13, 3, SIGNPOST_READ, PewterGymStatue
	signpost 13, 6, SIGNPOST_READ, PewterGymStatue

.ObjectEvents: db 3
	person_event SPRITE_BROCK, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrockScript_0x1a2864, -1
	person_event SPRITE_YOUNGSTER, 7, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperJerry, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, PewterGymGuyScript, -1
