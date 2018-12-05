const_value set 2
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0
	
BlueScript_0x9aa26:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_SWIMMERM_RANDALL
	setevent EVENT_BEAT_SWIMMERM_SIMON
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

TrainerSwimmermSancho:
	trainer EVENT_BEAT_SWIMMERM_SIMON, SWIMMERM, SIMON, SwimmermSanchoSeenText, SwimmermSanchoBeatenText, 0, SwimmermSanchoScript

SwimmermSanchoScript:
	end_if_just_battled
	opentext
	writetext SanchoAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmermRedus:
	trainer EVENT_BEAT_SWIMMERM_RANDALL, SWIMMERM, RANDALL, SwimmermRedusSeenText, SwimmermRedusBeatenText, 0, SwimmermRedusScript

SwimmermRedusScript:
	end_if_just_battled
	opentext
	writetext RedusAfterText
	waitbutton
	closetext
	end
	
ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1

.Beaten:
	trainertotext BLUE, 1, $1
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "Oh, a trainer"
	line "from JANTO?"
	
	para "I'm SARAH."
	
	para "I'm a rutheless"
	line "water-type"
	cont "trainer."
	
	para "Here in KOHTO we"
	line "do things diff-"
	cont "erntly."
	
	para "There's no holding"
	line "back!"
	
	para "Let me show you"
	line "my #MON!"
	done

LeaderBlueWinText:
	text "Woah, now."
	
	para "Well I did say"
	line "no holding back."
	
	para "Good job, kid."
	line "you've earned the"
	cont "BUBBLEBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "BUBBLEBADGE."
	done

LeaderBlueAfterText:
	text "I see you've"
	line "been exploring"
	
	para "KOHTO for a while"
	line "now."
	
	para "I should have"
	line "considered that"
	cont "before battle."
	
	para "On you go!"
	done

LeaderBlueEpilogueText:
	text "If you ever want"
	line "to just clear your"
	
	para "mind, go ride on"
	line "the sea!"
	done

ViridianGymGuyText:
	text "Yo, CHAMP!"

	para "What's up?"
	
	para "You've got a bunch"
	line "of badges so far."
	
	para "I'm sure you don't"
	line "need my tips, so"
	cont "just go for it!"
	done

ViridianGymGuyWinText:
	text "That battle bro-"
	line "ught tears to my"
	cont "eyes!"
	
	para "Or maybe it was"
	line "the chlorine."
	done

SwimmermSanchoSeenText:
	text "I can swim from"
	line "KANTO to JOHTO."
	done

SwimmermSanchoBeatenText:
	text "I'm drowning in"
	line "disappointment."
	done

SanchoAfterText:
	text "You've bested me,"
	line "but what about"
	cont "SARAH?"
	done

SwimmermRedusSeenText:
	text "I love to swim"
	line "along side my"
	cont "#MON."
	done

SwimmermRedusBeatenText:
	text "Oh darn. I lost…"
	done

RedusAfterText:
	text "You should try"
	line "jumping in the"
	cont "water yourself!"
	done
	
ViridianGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 17, 4, 1, VIRIDIAN_CITY
	warp_def 17, 5, 1, VIRIDIAN_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 13, 2, SIGNPOST_READ, ViridianGymStatue
	signpost 13, 6, SIGNPOST_READ, ViridianGymStatue

.ObjectEvents: db 4
	person_event SPRITE_BLUE, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BlueScript_0x9aa26, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ViridianGymGuyScript, -1
	person_event SPRITE_SWIMMER_GUY, 8, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerSwimmermSancho, -1
	person_event SPRITE_SWIMMER_GUY, 0, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerSwimmermRedus, -1
