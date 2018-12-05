const_value set 2
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

PokefanMScript_0x1ad6e4:
	faceplayer
	opentext
;	checkevent EVENT_DECIDED_TO_HELP_LANCE
;	iftrue .AlreadyHaveWater
	writetext LavTalkAboutWater
;	buttonsound
;	verbosegiveitem SECRETPOTION
;	writetext LavTalkAboutWater2
;	setevent EVENT_DECIDED_TO_HELP_LANCE
	waitbutton
	closetext
	end
	
;.AlreadyHaveWater
;	writetext LavTalkAboutWater2
;	waitbutton
;	closetext
	end

TeacherScript_0x1ad6e7:
	jumptextfaceplayer UnknownText_0x1ad73a

GrampsScript_0x1ad6ea:
	jumptextfaceplayer UnknownText_0x1ad75c

YoungsterScript_0x1ad6ed:
	jumptextfaceplayer UnknownText_0x1ad7ac

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokeCenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavYoungsterQues:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .YouSawIt
	writetext LavYoungsterQuesText
	waitbutton
	closetext
	end
	
.YouSawIt
	writetext BoyStrangeRoomText
	waitbutton
	closetext
	end
	
LavStrangeObject:
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .JumpToPull
	writetext LavStrangeObjectText
	yesorno
	iffalse .No
	setevent EVENT_DECIDED_TO_HELP_LANCE
	writetext LavFoundWater
	playsound SFX_KEY_ITEM
	waitsfx
	giveitem SECRETPOTION
;	iffalse .PackFull
	buttonsound
	writetext LavGetWater
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext LavSuckedIn
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .PlayerWarpsUp
	if_equal DOWN, .PlayerWarpsDown
	if_equal LEFT, .PlayerWarpsLeft
	if_equal RIGHT, .PlayerWarpsRight

.JumpToPull
	writetext LavStrangeObjectText
	yesorno
	iffalse .No
	showemote EMOTE_SHOCK, PLAYER, 15
	writetext LavSuckedIn
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .PlayerWarpsUp
	if_equal DOWN, .PlayerWarpsDown
	if_equal LEFT, .PlayerWarpsLeft
	if_equal RIGHT, .PlayerWarpsRight
	
.PlayerWarpsUp
	playsound SFX_WARP_TO
	applymovement PLAYER, LavSlideUp
	special FadeOutPalettes
	wait 10
	warpfacing UP, MOUNT_MOON_SQUARE, 25, 3
	end
.PlayerWarpsDown
	playsound SFX_WARP_TO
	applymovement PLAYER, LavSlideDown
	special FadeOutPalettes
	wait 10
	warpfacing DOWN, MOUNT_MOON_SQUARE, 25, 3
	end
.PlayerWarpsLeft
	playsound SFX_WARP_TO
	applymovement PLAYER, LavSlideLeft
	special FadeOutPalettes
	wait 10
	warpfacing LEFT, MOUNT_MOON_SQUARE, 25, 3
	end
.PlayerWarpsRight
	playsound SFX_WARP_TO	
	applymovement PLAYER, LavSlideRight
	special FadeOutPalettes
	wait 10
	warpfacing RIGHT, MOUNT_MOON_SQUARE, 25, 3
	end

;.PackFull
;	end
	
.No
	closetext
	end

LavSlideUp
	slide_step_up
	step_end

LavSlideDown
	slide_step_down
	step_end
	
LavSlideLeft
	slide_step_left
	step_end
	
LavSlideRight
	slide_step_right
	step_end

BoyStrangeRoomText:
	text "Woah, there's a"
	line "secret cave in the"
	cont "lake?"
	
	para "That's so cool!"
	done
	
LavFoundWater:
	text "<PLAYER> found"
	line "SPECIALWATER!"
	done
	
LavGetWater:
	text "<PLAYER> put the"
	line "SPECIALWATER in"
	cont "the KEY POCKET."
	done
	
LavSuckedIn:
	text "<PLAYER> feels a"
	line "tug!"
	done

LavStrangeObjectText:
	text "It's a strange"
	line "shimmering object."
	
	para "Try to pick it up?"
	done
	
LavYoungsterQuesText:
	text "Huh."
	
	para "I wonder what that"
	line "strange glimmering"
	
	para "thing in the water"
	line "is."
	done
	
LavTalkAboutWater:
	text "That's quite a"
	line "lake, huh?"
	
	para "It's so clear you"
	line "you can see right"
	cont "to the bottom."
	
;	para "Here, let me share"
;	line "a souvnire with"
;	cont "you."
	done
	
LavTalkAboutWater2:
	text "Crystal clear"
	line "water for a"
	
	para "crystal clear"
	line "future."
	done

UnknownText_0x1ad73a:
	text "Oh, you are from"
	line "JANTO?"
	cont "It sounds lovely."
	
	para "I'd like to visit"
	line "some time."
	done

UnknownText_0x1ad75c:
	text "I decided to"
	line "retire in"
	cont "LITTLEPOND."
	
	para "I'll spend my"
	line "remaining years"
	
	para "with my beloved"
	line "#MON."
	done

UnknownText_0x1ad7ac:
	text "When my #MON"
	line "are tired, I take"
	
	para "them to the"
	line "#MON CENTER."
	done

LavenderTownSignText:
	text "LITTLEPOND"
	
	para "A Quiet Getaway"
	done

KantoRadioStationSignText:
	text "KANTO RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

SoulHouseSignText:
	text "UNDERGROUND PATH"
	done

LavenderTown_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 3, 19, 1, LAVENDER_POKECENTER_1F
	warp_def 3, 7, 1, MR_FUJIS_HOUSE
	warp_def 11, 5, 1, LAVENDER_TOWN_SPEECH_HOUSE
	warp_def 5, 27, 3, MR_FUJIS_HOUSE
	warp_def 5, 13, 2, LAVENDER_MART
	warp_def 13, 27, 7, LAVENDERTOWNGATES
	warp_def 15, 19, 1, MOUNT_MOON_SQUARE
	warp_def 4, 2, 3, LAVENDERTOWNGATES
	warp_def 5, 2, 4, LAVENDERTOWNGATES
	warp_def 6, 33, 9, LAVENDERTOWNGATES
	warp_def 7, 33, 10, LAVENDERTOWNGATES

.CoordEvents: db 0

.BGEvents: db 6
	signpost 7, 17, SIGNPOST_READ, LavenderTownSign
	signpost 1, 20, SIGNPOST_READ, KantoRadioStationSign
	signpost 3, 14, SIGNPOST_READ, VolunteerPokemonHouseSign
	signpost 13, 25, SIGNPOST_READ, SoulHouseSign
	signpost 3, 20, SIGNPOST_READ, LavenderPokeCenterSignText
	signpost 5, 14, SIGNPOST_READ, LavenderMartSignText

.ObjectEvents: db 6
	person_event SPRITE_POKEFAN_M, 16, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1ad6e4, -1
	person_event SPRITE_TEACHER, 9, 22, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1ad6e7, -1
	person_event SPRITE_GRAMPS, 13, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1ad6ea, -1
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 1, YoungsterScript_0x1ad6ed, -1
	person_event SPRITE_SUDOWOODO, 18, 15, SPRITEMOVEDATA_POKEMON, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, LavStrangeObject, -1
	person_event SPRITE_YOUNGSTER, 15, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, LavYoungsterQues, -1
