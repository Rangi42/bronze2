const_value set 2
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_GRAMPS
	const FUCHSIACITY_FISHER
	const FUCHSIACITY_LASS

FuchsiaCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaGrampsScript:
	jumptextfaceplayer FuchsiaGrampsText
	
FuchsiaLassScript:
	jumptextfaceplayer FuchsiaLassText
	
FuchsiaFisherScript:
	jumptextfaceplayer FuchsiaFisherText
	
YoungsterScript_0x194b22:
	jumptextfaceplayer UnknownText_0x194b45

PokefanMScript_0x194b25:
	jumptextfaceplayer UnknownText_0x194b83

TeacherScript_0x194b28:
	jumptextfaceplayer UnknownText_0x194bd3

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokeCenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FruitTreeScript_0x194b43:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaLassText:
	text "I'm taking photos"
	line "for my scrap book."
	
	para "This town has such"
	line "wonderful archi-"
	cont "tecture!"
	done
	
FuchsiaFisherText:
	text "Im visiting from"
	line "JANTO."
	
	para "You're from JANTO"
	line "as well?"
	
	para "I kinda miss home,"
	line "so seeing a local"
	cont "is nice."
	done
	
FuchsiaGrampsText:
	text "Hello little boy"
	line "or girl…"
	
	para "I'm sorry, my"
	line "glasses are"
	cont "broken."
	
	para "Have you seen my"
	line "wife?"
	done
	
UnknownText_0x194b45:
	text "The only way to"
	line "get to GAMBOGE"
	
	para "TOWN used to be"
	line "through a cave."
	
	para "They've since"
	line "removed it and we"
	
	para "now get a lot of"
	line "tourists."
	done

UnknownText_0x194b83:
	text "I love to fly"
	line "around with my"
	cont "PIDGY."
	
	para "My PIDGY is"
	line "very strong."
	done

UnknownText_0x194bd3:
	text "I've got to keep"
	line "fit, so I'm"
	
	para "jogging on this"
	line "path!"
	done

FuchsiaCitySignText:
	text "GAMBOGE TOWN"

	para "A Town of Sweet"
	line "Delights"
	done

FuchsiaGymSignText:
	text "GAMBOGE TOWN"
	line "#MON GYM"
	cont "LEADER: KOHEN"

	para "The Jolty Sparker"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneClosedSignText:
	text "THE GRAB N'"
	line "MUNCH EATERY"
	done

NoLitteringSignText:
	text "GAMBOGE TOWN"
	line "POST DEPARTMENT"
	done

FuchsiaCity_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 9, 27, 2, FUCHSIA_MART
	warp_def 21, 25, 1, GRABANDMUNCH
	warp_def 13, 8, 1, FUCHSIA_GYM
	warp_def 25, 15, 1, FUCHSIA_BILL_SPEECH_HOUSE
	warp_def 9, 17, 1, FUCHSIA_POKECENTER_1F
	warp_def 25, 3, 3, SAFARI_ZONE_WARDENS_HOME
	warp_def 23, 34, 1, SAFARI_ZONE_BETA
	warp_def 22, 39, 1, ROUTE_15_FUCHSIA_GATE
	warp_def 23, 39, 2, ROUTE_15_FUCHSIA_GATE
	warp_def 31, 13, 1, SAFARI_ZONE_WARDENS_HOME
	warp_def 1, 23, 7, ROUTE8GATES

.CoordEvents: db 0

.BGEvents: db 8
	signpost 10, 24, SIGNPOST_READ, FuchsiaCitySign
	signpost 13, 5, SIGNPOST_READ, FuchsiaGymSign
	signpost 37, 13, SIGNPOST_READ, SafariZoneOfficeSign
	signpost 37, 10, SIGNPOST_READ, WardensHomeSign
	signpost 21, 29, SIGNPOST_READ, SafariZoneClosedSign
	signpost 23, 31, SIGNPOST_READ, NoLitteringSign
	signpost 9, 18, SIGNPOST_READ, FuchsiaCityPokeCenterSign
	signpost 9, 28, SIGNPOST_READ, FuchsiaCityMartSign

.ObjectEvents: db 7
	person_event SPRITE_TEACHER, 11, 22, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x194b22, -1
	person_event SPRITE_FISHER, 29, 11, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x194b25, -1
	person_event SPRITE_YOUNGSTER, 18, 13, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x194b28, -1
	person_event SPRITE_FRUIT_TREE, 15, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x194b43, -1
	person_event SPRITE_GRAMPS, 24, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FuchsiaGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 32, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FuchsiaFisherScript, -1
	person_event SPRITE_YOUNGSTER, 10, 32, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FuchsiaLassScript, -1
