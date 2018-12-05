const_value set 2
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

GrampsScript_0x1a9a4c:
	faceplayer
	opentext
	writetext UnknownText_0x1a9aa5
	yesorno
	iffalse UnknownScript_0x1a9a5b
	writetext UnknownText_0x1a9b6f
	waitbutton
	closetext
	end

UnknownScript_0x1a9a5b:
	writetext UnknownText_0x1a9bb7
	waitbutton
	closetext
	end

GrampsScript_0x1a9a61:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext UnknownText_0x1a9c11
	waitbutton
	closetext
	end

.BlueReturned:
	writetext UnknownText_0x1a9c7e
	waitbutton
	closetext
	end

FisherScript_0x1a9a75:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue UnknownScript_0x1a9a8a
	writetext UnknownText_0x1a9cc4
	buttonsound
	verbosegiveitem PP_UP
	iffalse UnknownScript_0x1a9a8e
	setevent EVENT_GOT_TM42_DREAM_EATER
UnknownScript_0x1a9a8a:
	writetext UnknownText_0x1a9d86
	waitbutton
UnknownScript_0x1a9a8e:
	closetext
	end

YoungsterScript_0x1a9a90:
	jumptextfaceplayer UnknownText_0x1a9daa

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokeCenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

UnknownText_0x1a9aa5:
	text "Would you say your"
	line "favorite thing"
	
	para "about #MON"
	line "is trading?"
	done

UnknownText_0x1a9b6f:
	text "Oh, of course!"
	
	para "It's amazing making"
	line "new friends!"
	done

UnknownText_0x1a9bb7:
	text "So, I guess"
	line "catching is more"
	cont "your thing?"
	done

UnknownText_0x1a9c11:
	text "I'm getting on in"
	line "my days, but I"
	
	para "always take time"
	line "to see the sights."
	done

UnknownText_0x1a9c7e:
	text "Are you going to"
	line "battle the LEADER?"

	para "Good luck to you."
	line "You'll need it."
	done

UnknownText_0x1a9cc4:
	text "Oh hey!"
	line "I'm just enjoying"
	cont "some fishing."
	
	para "Since you took the"
	line "time to say hi,"
	cont "have a gift!"
	done

UnknownText_0x1a9d86:
	text "Ah, the water is"
	line "lovely."
	done

UnknownText_0x1a9daa:
	text "I love science!"
	line "Especially the"
	
	para "science of"
	line "#MON!"
	done

ViridianCitySignText:
	text "ORCHID CITY"

	para "The City of"
	line "Calming Nature"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityWelcomeSignText:
	text "ORCHID CITY"
	line "#MON GYM"
	cont "LEADER: SARAH"

	para "The Ruthless Water"
	line "#MON Trainer"
	done

TrainerHouseSignText:
	text "ORCHID CITY"
	line "LOOKOUT"
	done

ViridianCity_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 7, 14, 1, VIRIDIAN_GYM
	warp_def 7, 23, 1, VIRIDIAN_NICKNAME_SPEECH_HOUSE
	warp_def 19, 27, 1, TRAINER_HOUSE_1F
	warp_def 21, 9, 2, VIRIDIAN_MART
	warp_def 11, 7, 1, VIRIDIAN_POKECENTER_1F
	warp_def 20, 2, 3, VIRIDIANCITYGATES
	warp_def 21, 2, 4, VIRIDIANCITYGATES
	warp_def 33, 29, 5, VIRIDIANCITYGATES
	warp_def 33, 30, 6, VIRIDIANCITYGATES
	warp_def 25, 25, 4, TRAINER_HOUSE_1F
	warp_def 5, 7, 1, TRAINER_HOUSE_B1F

.CoordEvents: db 0

.BGEvents: db 6
	signpost 20, 20, SIGNPOST_READ, ViridianCitySign
	signpost 11, 15, SIGNPOST_READ, ViridianGymSign
	signpost 8, 12, SIGNPOST_READ, ViridianCityWelcomeSign
	signpost 5, 5, SIGNPOST_READ, TrainerHouseSign
	signpost 11, 8, SIGNPOST_READ, ViridianCityPokeCenterSign
	signpost 21, 10, SIGNPOST_READ, ViridianCityMartSign

.ObjectEvents: db 4
	person_event SPRITE_FISHER, 12, 22, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a9a4c, -1
	person_event SPRITE_GRAMPS, 10, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a9a61, -1
	person_event SPRITE_FISHER, 28, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a9a75, -1
	person_event SPRITE_YOUNGSTER, 22, 15, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a9a90, -1
