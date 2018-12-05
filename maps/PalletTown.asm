const_value set 2
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

TeacherScript_0x1ac6d5:
	jumptextfaceplayer UnknownText_0x1ac6e7

WeatherManScript:
	faceplayer
	opentext
	writetext WeatherManText
	yesorno
	iffalse .SkyNo
	writetext SkyYesText
	waitbutton
	closetext
	end
	
.SkyNo
	writetext SkyNoText
	waitbutton
	closetext
	end
	
CartridgeBoy1:
	jumptextfaceplayer CartridgeBoy1Text
	
PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

CartridgeBoy1Text:
	text "I knew a guy"
	line "who lived here."
	
	para "They made it to"
	line "the big time and"
	
	para "that's really all"
	line "I heard from them"
	cont "since."
	done
	
UnknownText_0x1ac6e7:
	text "It can be good"
	line "to visit your"
	
	para "parents every"
	line "once in a while."
	done

WeatherManText:
	text "The weather is"
	line "spectacular!"
	cont "Don't you agree?"
	done

SkyNoText:
	text "What weather do"
	line "think is good?"
	done
	
SkyYesText:
	text "Aha, yes that's"
	line "what I thought!"
	done

PalletTownSignText:
	text "CARTRIDGE TOWN"

	para "Where Many"
	line "Adventures Begin"
	done

RedsHouseSignText:
	text "BRONZE'S HOUSE"
	done

OaksLabSignText:
	text "KOA #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "REMOVE THIS"
	line "SIGN"
	done

PalletTown_MapEventHeader:: db 0, 0

.Warps: db 14
	warp_def 3, 7, 1, REDS_HOUSE_1F
	warp_def 15, 17, 1, BLUES_HOUSE
	warp_def 3, 18, 1, OAKS_LAB
	warp_def 6, 2, 1, VIRIDIAN_CITY
	warp_def 7, 2, 1, PEWTER_CITY
	warp_def 8, 2, 1, CERULEAN_CITY
	warp_def 9, 2, 3, VERMILION_CITY
	warp_def 10, 2, 6, LAVENDER_TOWN
	warp_def 11, 2, 1, CELADON_CITY
	warp_def 12, 2, 1, SAFFRON_CITY
	warp_def 13, 2, 1, FUCHSIA_CITY
	warp_def 14, 2, 1, CINNABAR_ISLAND
	warp_def 15, 2, 1, NEW_BARK_TOWN
	warp_def 13, 5, 4, REDS_HOUSE_1F

.CoordEvents: db 0

.BGEvents: db 4
	signpost 5, 11, SIGNPOST_READ, PalletTownSign
	signpost 3, 5, SIGNPOST_READ, RedsHouseSign
	signpost 3, 15, SIGNPOST_READ, OaksLabSign
	signpost 0, 5, SIGNPOST_READ, BluesHouseSign

.ObjectEvents: db 3
	person_event SPRITE_COOLTRAINER_F, 6, 17, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1ac6d5, -1
	person_event SPRITE_FISHER, 12, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, WeatherManScript, -1
	person_event SPRITE_YOUNGSTER, 6, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CartridgeBoy1, -1
