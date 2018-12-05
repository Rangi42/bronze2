const_value set 2
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TVCamera4F:
	jumptext TVCamera4FText
	
FisherScript_0x5eb82:
	jumptextfaceplayer UnknownText_0x5ec12

TeacherScript_0x5eb85:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue UnknownScript_0x5ebac
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5eb99
	writetext UnknownText_0x5ec68
	waitbutton
	closetext
	end

UnknownScript_0x5eb99:
	writetext UnknownText_0x5ecab
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse UnknownScript_0x5ebb0
	writetext UnknownText_0x5ecef
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

UnknownScript_0x5ebac:
	writetext UnknownText_0x5ed2c
	waitbutton
UnknownScript_0x5ebb0:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer EVENT_BEAT_ROCKET_GRUNTM_10, GRUNTM, 10, GruntM10SeenText, GruntM10BeatenText, 0, GruntM10Script

GruntM10Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ede2
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EVENT_BEAT_ROCKET_EXECUTIVEM_2, EXECUTIVEM, 2, Executivem2SeenText, Executivem2BeatenText, 0, Executivem2Script

Executivem2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ee69
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer EVENT_BEAT_ROCKET_GRUNTF_4, GRUNTF, 4, GruntF4SeenText, GruntF4BeatenText, 0, GruntF4Script

GruntF4Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ef31
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer EVENT_BEAT_SCIENTIST_RICH, SCIENTIST, RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, ScientistRichScript

ScientistRichScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5efcb
	waitbutton
	closetext
	end

MapRadioTower4FSignpost0Script:
	jumptext UnknownText_0x5effe

MapRadioTower4FSignpost1Script:
	jumptext UnknownText_0x5f00d

UnknownText_0x5ec12:
	text "I listened to the"
	line "radio while I was"
	cont "at the RUINS."

	para "I heard a strange"
	line "broadcast there."
	done

UnknownText_0x5ec68:
	text "MARY: Why? Why do"
	line "I have to suffer"
	cont "through this?"

	para "MEOWTH, help me!"
	done

UnknownText_0x5ecab:
	text "MARY: Oh! You're"
	line "my little savior!"

	para "Will you take this"
	line "as my thanks?"
	done

UnknownText_0x5ecef:
	text "MARY: It's just"
	line "right for #MON"

	para "that know normal-"
	line "type moves."
	done

UnknownText_0x5ed2c:
	text "MARY: Please tune"
	line "into me on PROF."

	para "OAK'S #MON TALK"
	line "show."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "Look dude, you've"
	line "got it all wrong!"
	
	para "This is a publi-"
	line "city stunt!"
	cont "Honest!"
	done

GruntM10BeatenText:
	text "You can see right"
	line "through me, can't"
	cont "you?"
	done

UnknownText_0x5ede2:
	text "Go ahead, keep"
	line "pushing forward."
	
	para "You're only going"
	line "to be ground into"
	cont "the dirt."
	done

Executivem2SeenText:
	text "You have no idea"
	line "who you're dealing"
	cont "with this time."
	done

Executivem2BeatenText:
	text "This is very, very"
	line "worrying."
	done

UnknownText_0x5ee69:
	text "I must phone"
	line "ahead."
	
	para "This kid has"
	line "almost made it"
	cont "into the studio!"
	
	para "We can't be stopped"
	line "now."
	done

GruntF4SeenText:
	text "Do you dare step"
	line "into my path?"
	
	para "If you don't scram"
	line "this will not end"
	cont "well for you."
	done

GruntF4BeatenText:
	text "You absolte loser!"
	done

UnknownText_0x5ef31:
	text "I am furious."
	line "Do not talk to me."
	done

ScientistRichSeenText:
	text "Do you think"
	line "TEAM ROCKET could"
	
	para "hijack a TV"
	line "STATION without a"
	cont "tech head like me?"
	done

ScientistRichBeatenText:
	text "You're just a"
	line "minor hitch in our"
	cont "plans."
	done

UnknownText_0x5efcb:
	text "You will never be"
	line "as smart as us."
	
	para "You will never"
	line "defeat us all!"
	done

UnknownText_0x5effe:
	text "3F SUB STUDIOS"
	done

UnknownText_0x5f00d:
	text "4F STUDIO 2"
	done

TVCamera4FText:
	text "It's a TV camera."
	done
	
RadioTower4F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 12, 1, RADIO_TOWER_5F
	warp_def 0, 1, 2, RADIO_TOWER_3F
	warp_def -4, 20, 2, RADIO_TOWER_5F
	warp_def -4, 20, 3, RADIO_TOWER_3F

.CoordEvents: db 0

.BGEvents: db 2
	signpost 0, 3, SIGNPOST_READ, MapRadioTower4FSignpost0Script
	signpost 0, 15, SIGNPOST_READ, MapRadioTower4FSignpost1Script

.ObjectEvents: db 7
	person_event SPRITE_FISHER, 7, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x5eb82, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_UNUSED_GUY, 6, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TVCamera4F, -1
	person_event SPRITE_UNUSED_GUY, 6, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TVCamera4F, -1
	person_event SPRITE_ROCKET, 4, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 1, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 4, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_SCIENTIST, 2, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
