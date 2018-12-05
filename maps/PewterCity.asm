const_value set 2
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

CooltrainerFScript_0x18c009:
	jumptextfaceplayer UnknownText_0x18c042

BugCatcherScript_0x18c00c:
	jumptextfaceplayer UnknownText_0x18c080

GrampsScript_0x18c00f:
	faceplayer
	opentext
;	checkevent EVENT_GOT_SILVER_WING
;	iftrue UnknownScript_0x18c023
	writetext UnknownText_0x18c0c6
;	buttonsound
;	verbosegiveitem SILVER_WING
;	setevent EVENT_GOT_SILVER_WING
	waitbutton
	closetext
	end

UnknownScript_0x18c023:
	writetext UnknownText_0x18c1aa
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokeCenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign
	
PewterTeacherScript:
	jumptextfaceplayer PewterTeacherText

FruitTreeScript_0x18c03e:
	fruittree FRUITTREE_PEWTER_CITY_1

FruitTreeScript_0x18c040:
	fruittree FRUITTREE_PEWTER_CITY_2
	
BlockedDoor:
	jumptext BlockedDoorText
	
PewterCityBikeShopSign:
	jumptext PewterCityBikeShopSignText

BlockedDoorText:
	text "It's locked."
	done
	
PewterCityBikeShopSignText:
	text "RUSSET BIKE"
	line "SHOP"
	done
	
PewterTeacherText:
	text "The man in that"
	line "that house can"
	
	para "change the"
	line "nickname of a"
	cont "#MON!"
	done
	
UnknownText_0x18c042:
	text "This old bridge"
	line "reminds me of my"
	cont "father."
	
	para "He loved this"
	line "town."
	done

UnknownText_0x18c080:
	text "Have you seen any"
	line "suspicious looking"
	
	para "people around"
	line "here?"
	
	para "I'm a JR."
	line "detective!"
	done

UnknownText_0x18c0c6:
	text "You there."
	line "Are you as tired"
	
	para "of all this"
	line "violence as I am?"
	
	para "Kids these days,"
	line "I tell ya."
	done

UnknownText_0x18c1aa:
	text "Going to new, un-"
	line "known places and"
	cont "seeing new people…"

	para "Those are the joys"
	line "of travel."
	done

PewterCitySignText:
	text "RUSSET TOWN"
	
	para "A Familiar &"
	line "Discreet Setting"
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "#MON GYM"
	cont "LEADER: WEEDY"

	para "The Guy That"
	line "Grows on You"
	done

PewterCityMtMoonGiftShopSignText::
	text "NAME RATER"
	
	para "Rate the nicknames"
	line "of your #MON!"
	done

PewterMuseumSignText:
	text "JUNCTION PARK"
	line "through here."
	done

PewterCityWelcomeSignText:
	text "WELCOME TO"
	line "PEWTER CITY!"
	done

PewterCity_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 15, 21, 1, PEWTER_NIDORAN_SPEECH_HOUSE
	warp_def 3, 8, 1, PEWTER_GYM
	warp_def 3, 29, 2, PEWTER_MART
	warp_def 5, 17, 1, PEWTER_POKECENTER_1F
	warp_def 15, 15, 1, PEWTER_SNOOZE_SPEECH_HOUSE
	warp_def 14, 2, 11, ROUTE25GATES
	warp_def 15, 2, 12, ROUTE25GATES
	warp_def 3, 35, 1, LAVENDER_NAME_RATER
	warp_def 7, 42, 2, MOUNT_MOON

.CoordEvents: db 0

.BGEvents: db 8
	signpost 9, 33, SIGNPOST_READ, PewterCitySign
	signpost 4, 6, SIGNPOST_READ, PewterGymSign
	signpost 16, 6, SIGNPOST_READ, PewterMuseumSign
	signpost 5, 37, SIGNPOST_READ, PewterCityMtMoonGiftShopSign
	signpost 13, 21, SIGNPOST_READ, PewterCityWelcomeSign
	signpost 5, 18, SIGNPOST_READ, PewterCityPokeCenterSign
	signpost 3, 30, SIGNPOST_READ, PewterCityMartSign
	signpost 17, 29, SIGNPOST_READ, PewterCityBikeShopSign

.ObjectEvents: db 7
	person_event SPRITE_COOLTRAINER_F, 8, 23, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x18c009, -1
	person_event SPRITE_YOUNGSTER, 11, 10, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x18c00c, -1
	person_event SPRITE_GRAMPS, 17, 26, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x18c00f, -1
	person_event SPRITE_FRUIT_TREE, 0, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x18c03e, -1
	person_event SPRITE_FRUIT_TREE, 4, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x18c040, -1
	person_event SPRITE_TEACHER, 7, 32, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PewterTeacherScript, -1
	person_event SPRITE_SUICUNE, 15, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlockedDoor, -1
