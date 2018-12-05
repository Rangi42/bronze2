const_value set 2
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerGentlemanAlfred:
	trainer EVENT_BEAT_GENTLEMAN_ALFRED, SUPER_NERD, SHELDON, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, GentlemanAlfredScript

GentlemanAlfredScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b13e
	waitbutton
	closetext
	end

TrainerSailorHuey1:
	trainer EVENT_BEAT_SAILOR_HUEY, SUPER_NERD, DEXTER, SailorHuey1SeenText, SailorHuey1BeatenText, 0, SailorHuey1Script

SailorHuey1Script:
;	writecode VAR_CALLERID, PHONE_SAILOR_HUEY
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b0be
	waitbutton 
	closetext
;	checkflag ENGINE_HUEY
;	iftrue UnknownScript_0x5afc7
;	checkcellnum PHONE_SAILOR_HUEY
;	iftrue UnknownScript_0x5b05f
;	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x5afb0
;	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x5b053
;	jump UnknownScript_0x5afb3
	end
UnknownScript_0x5afb0:
	scall UnknownScript_0x5b057
UnknownScript_0x5afb3:
	askforphonenumber PHONE_SAILOR_HUEY
	if_equal $1, UnknownScript_0x5b067
	if_equal $2, UnknownScript_0x5b063
	trainertotext SAILOR, HUEY1, $0
	scall UnknownScript_0x5b05b
	jump UnknownScript_0x5b05f

UnknownScript_0x5afc7:
	scall UnknownScript_0x5b06b
	winlosstext SailorHuey1BeatenText, 0
	copybytetovar wHueyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 1
	clearflag ENGINE_HUEY
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 2
	clearflag ENGINE_HUEY
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 3
	clearflag ENGINE_HUEY
	end

.LoadFight3:
	loadtrainer SAILOR, HUEY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY
	checkevent EVENT_HUEY_PROTEIN
	iftrue UnknownScript_0x5b03f
	checkevent EVENT_GOT_PROTEIN_FROM_HUEY
	iftrue UnknownScript_0x5b03e
	scall UnknownScript_0x5b076
	verbosegiveitem PROTEIN
	iffalse UnknownScript_0x5b06f
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump UnknownScript_0x5b05f

UnknownScript_0x5b03e:
	end

UnknownScript_0x5b03f:
	opentext
	writetext UnknownText_0x5b1b6
	waitbutton
	verbosegiveitem PROTEIN
	iffalse UnknownScript_0x5b06f
	clearevent EVENT_HUEY_PROTEIN
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump UnknownScript_0x5b05f

UnknownScript_0x5b053:
	jumpstd asknumber1m
	end

UnknownScript_0x5b057:
	jumpstd asknumber2m
	end

UnknownScript_0x5b05b:
	jumpstd registerednumberm
	end

UnknownScript_0x5b05f:
	jumpstd numberacceptedm
	end

UnknownScript_0x5b063:
	jumpstd numberdeclinedm
	end

UnknownScript_0x5b067:
	jumpstd phonefullm
	end

UnknownScript_0x5b06b:
	jumpstd rematchm
	end

UnknownScript_0x5b06f:
	setevent EVENT_HUEY_PROTEIN
	jumpstd packfullm
	end

UnknownScript_0x5b076:
	jumpstd rematchgiftm
	end

SailorHuey1SeenText:
	text "Ooh. A challenger!"
	
	para "I've never seen"
	line "you in this club!"
	done

SailorHuey1BeatenText:
	text "Dang!"
	done

; possibly unused
UnknownText_0x5b0be:
	text "I can't believe"
	line "my calculations"
	cont "were incorrect!"
	done

GentlemanAlfredSeenText:
	text "Nnghey!"
	
	para "This is a secret"
	line "club."

	para "No outsiders!"
	done

GentlemanAlfredBeatenText:
	text "Oh my."
	done

UnknownText_0x5b13e:
	text "The noble one has"
	line "invited you?"
	
	para "In that case,"
	line "go ahead."
	done

UnknownText_0x5b1b6:
	text "Man! You're as"
	line "tough as ever!"

	para "Anyway, here's"
	line "that medicine from"
	cont "before."
	done

OlivineLighthouse2F_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 9, 3, 3, OLIVINE_LIGHTHOUSE_1F
	warp_def 15, 3, 2, OLIVINE_LIGHTHOUSE_3F
	warp_def 15, 14, 4, OLIVINE_LIGHTHOUSE_1F
	warp_def 15, 15, 5, OLIVINE_LIGHTHOUSE_1F
	warp_def 14, 14, 4, OLIVINE_LIGHTHOUSE_3F
	warp_def 14, 15, 5, OLIVINE_LIGHTHOUSE_3F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SUPER_NERD, 12, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSailorHuey1, -1
	person_event SPRITE_SUPER_NERD, 12, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
