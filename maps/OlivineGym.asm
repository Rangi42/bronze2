const_value set 2
	const OLIVINEGYM_JASMINE_LEFT
	const OLIVINEGYM_GYM_GUY
	const OLIVINEGYM_JASMINE_RIGHT

OlivineGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0
	
MakeLeaderAppearLeft:
	opentext
	checkevent EVENT_SWITCH_11
	iffalse PsyGymLeaderLeft
	writetext PsyLockedDoorText
	waitbutton
	closetext
	end

MakeLeaderAppearRight:	
	opentext
	checkevent EVENT_SWITCH_11
	iffalse PsyGymLeaderRight
	writetext PsyLockedDoorText
	waitbutton
	closetext
	end

PsyGymLeaderLeft:
	writetext PsyBehindYouText
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_PSYCHIC 
	wait 15
	appear OLIVINEGYM_JASMINE_LEFT
	clearevent EVENT_SWITCH_9
	special FadeInPalettes
;	wait 10
	spriteface OLIVINEGYM_JASMINE_LEFT, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	spriteface PLAYER, DOWN
	jump PsyGymLeader
	end

PsyGymLeaderRight:
	writetext PsyBehindYouText
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_PSYCHIC 
	wait 15
	appear OLIVINEGYM_JASMINE_RIGHT
	clearevent EVENT_SWITCH_10
	special FadeInPalettes
;	wait 10
	spriteface OLIVINEGYM_JASMINE_RIGHT, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	spriteface PLAYER, DOWN
	jump PsyGymLeader
	end
	
PsyGymLeader:
	faceplayer
	opentext
	setevent EVENT_SWITCH_11
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext UnknownText_0x9c1b9
	waitbutton
	closetext
	winlosstext UnknownText_0x9c2bb, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext UnknownText_0x9c33a
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
;	setflag ENGINE_MINERALBADGE
;	checkcode VAR_BADGES
;	scall OlivineGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue UnknownScript_0x9c172
	writetext UnknownText_0x9c354
	buttonsound
	verbosegiveitem TM_PSYCHIC
	iffalse UnknownScript_0x9c176
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext UnknownText_0x9c3a5
	waitbutton
	closetext
	end

UnknownScript_0x9c172:
	writetext UnknownText_0x9c3d1
	waitbutton
UnknownScript_0x9c176:
	closetext
	end

OlivineGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

OlivineGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuyWinScript
;	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	checkevent EVENT_SWITCH_11
	iffalse .OlivineGymGuyPreScript
	opentext
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end

.OlivineGymGuyWinScript:
	opentext
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuyPreScript:
	opentext
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JASMINE, 1, $1
	jumpstd gymstatue2

PsyBehindYouText:
	text "…Behind you…"
	done
	
PsyLockedDoorText:
	text "It's a big fake"
	line "door…"
	done
	
UnknownText_0x9c1b9:
	text "Eheheh…"
	
	para "They always fall"
	line "for the trick"
	cont "door."
	
	para "You've come here"
	line "to challenge me,"
	cont "have you not?"
	
	para "I am SEBASTIAN."
	
	para "Master of psychic-"
	line "type #MON."
	
	para "Let the"
	line "battle begin!"
	done

UnknownText_0x9c2bb:
	text "It pleases me"
	line "to see those that"
	
	para "can overcome the"
	line "unknown."
	cont "I owe you a BADGE."
	done

UnknownText_0x9c33a:
	text "<PLAYER> received"
	line "LOREBADGE."
	done

UnknownText_0x9c354:
	text "LOREBADGE"
	line "raises #MON's"
	
	para "DEFENSE, and"
	line "allows you to"
	
	para "use STRENGTH"
	line "outside of"
	cont "battle."

	para "Please take"
	line "this too."
	done

UnknownText_0x9c393:
	text "<PLAYER> received"
	line "TM29."
	done

UnknownText_0x9c3a5:
	text "That move there is"
	line "PSYCHIC."
	
	para "A powerful"
	line "psychic-type move"
	
	para "you just cannot do"
	line "without!"
	done

UnknownText_0x9c3d1:
	text "I'll see you"
	line "again…"
	
	para "In another"
	line "dimension,"
	cont "perhaps?"
	done

OlivineGymGuyText:
	text "I don't know"
	line "why I never"
	
	para "bothered to check"
	line "the door."
	done

OlivineGymGuyWinText:
	text "Well done!"
	
	para "SEBASTIAN can be"
	line "pretty sneaky in"
	
	para "battle, but you"
	line "could handle it."
	done

OlivineGymGuyPreText:
	text "Hmm… not even I"
	line "know where"
	cont "SEBASTIAN is."
	
	para "I wish I could"
	line "tell you, but"
	
	para "he's really tricky"
	line "that guy."
	done

OlivineGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 2, CIANWOOD_CITY
	warp_def 15, 5, 2, CIANWOOD_CITY

.CoordEvents: db 0

.BGEvents: db 4
	signpost 13, 3, SIGNPOST_READ, OlivineGymStatue
	signpost 13, 6, SIGNPOST_READ, OlivineGymStatue
	signpost 1, 4, SIGNPOST_READ, MakeLeaderAppearLeft
	signpost 1, 5, SIGNPOST_READ, MakeLeaderAppearRight

.ObjectEvents: db 3
	person_event SPRITE_JASMINE, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PsyGymLeader, EVENT_SWITCH_9
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
	person_event SPRITE_JASMINE, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PsyGymLeader, EVENT_SWITCH_10
