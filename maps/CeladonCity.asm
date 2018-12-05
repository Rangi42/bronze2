const_value set 2
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

FisherScript_0x1a9f43:
	jumptextfaceplayer UnknownText_0x1a9f7d

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

TeacherScript_0x1a9f50:
	jumptextfaceplayer UnknownText_0x1a9fde

WalletManBran:
	jumptextfaceplayer WalletManBranText

GrampsScript_0x1a9f56:
	jumptextfaceplayer UnknownText_0x1aa0dc

YoungsterScript_0x1a9f59:
	jumptextfaceplayer UnknownText_0x1aa115

YoungsterScript_0x1a9f5c:
	faceplayer
	opentext
	writetext UnknownText_0x1aa155
	waitbutton
	closetext
	spriteface CELADONCITY_YOUNGSTER2, LEFT
	end

TeacherScript_0x1a9f5f:
	jumptextfaceplayer UnknownText_0x1aa1bd

LassScript_0x1a9f62:
	jumptextfaceplayer UnknownText_0x1aa306

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokeCenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	dwb EVENT_CELADON_CITY_HIDDEN_PP_UP, PP_UP

BrandiesCityRock:
	jumpstd smashrock
	
UnknownText_0x1a9f7d:
	text "I'm thinking about"
	line "starting a restu-"
	cont "raunt for #MON."
	
	para "Wouldn't that look"
	line "adorable?"
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Go away,"
	line "you silly wall-"
	cont "hacker!"
	done

UnknownText_0x1a9fde:
	text "I'm a #MON"
	line "match maker."
	
	para "I find partners"
	line "for #MON!"
	done

WalletManBranText:
	text "I gave a lost"
	line "wallet to a boy a"
	
	para "few years ago to"
	line "return, he had no"
	
	para "idea what to do"
	line "with it."
	
	para "I don't think he"
	line "even listened to"
	cont "me."
	
	para "I mean, I told him"
	line "where to go."
	done

UnknownText_0x1aa0dc:
	text "Thinking of"
	line "moving to KOHTO"
	cont "at all?"
	
	para "I could get you"
	line "a nice deal on"
	cont "a house!"
	done

UnknownText_0x1aa115:
	text "I'm a big fan of"
	line "JANTO's SCARLET."
	done

UnknownText_0x1aa155:
	text "Holy moly,"
	line "they've got a"
	
	para "massive #-"
	line "DOLL collection"
	cont "in there!"
	done

UnknownText_0x1aa1bd:
	text "BRANDIES CITY has"
	line "a brand new GYM"
	cont "LEADER."
	
	para "You should try"
	line "challenging him!"
	done

; possibly unused
UnknownText_0x1aa25b:
	text "I love being"
	line "surrounded by tall"
	cont "buildings!"

	para "Isn't it true that"
	line "GOLDENROD #MON"

	para "CENTER was made"
	line "much, much bigger?"

	para "That is so neat!"
	line "I wish we had a"

	para "place like that in"
	line "KANTO…"
	done

UnknownText_0x1aa306:
	text "I try not to"
	line "step on the cracks"
	
	para "between the"
	line "pavings."
	cont "It's like a game!"
	done

CeladonCitySignText:
	text "BRANDIES CITY"

	para "A Rock Solid"
	line "Fortress"
	done

CeladonGymSignText:
	text "BRANDIES CITY"
	line "#MON GYM"
	cont "LEADER: ……………"
	
	para "There's no name"
	line "here…"
	done

CeladonCityDeptStoreSignText:
	text "For All Your"
	line "#MON Needs"
	
	para "#MON MART"
	done

CeladonCityMansionSignText:
	text "CELADON MANSION"
	done

CeladonCityGameCornerSignText:
	text "The Playground for"
	line "Everybody--CELADON"
	cont "GAME CORNER"
	done

CeladonCityTrainerTipsText:
	text "TRAINER TIPS"

	para "GUARD SPEC."
	line "protects #MON"

	para "against SPECIAL"
	line "attacks such as"
	cont "fire and water."

	para "Get your items at"
	line "CELADON DEPT."
	cont "STORE!"
	done

CeladonCity_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 17, 11, 2, SAFFRON_MART
	warp_def 23, 11, 1, CELADON_MANSION_1F
	warp_def 17, 23, 3, CELADON_CAFE
	warp_def 25, 25, 5, CELADON_GAME_CORNER_PRIZE_ROOM
	warp_def 25, 21, 1, CELADON_POKECENTER_1F
	warp_def 25, 5, 3, CELADON_GAME_CORNER_PRIZE_ROOM
	warp_def 31, 11, 1, CELADON_GAME_CORNER_PRIZE_ROOM
	warp_def 3, 8, 1, CELADON_GYM
	warp_def 9, 27, 1, CELADON_CAFE
	warp_def 33, 25, 1, CELADONCITYGATES
	warp_def 33, 26, 2, CELADONCITYGATES

.CoordEvents: db 0

.BGEvents: db 8
	signpost 29, 27, SIGNPOST_READ, CeladonCitySign
	signpost 10, 12, SIGNPOST_READ, CeladonGymSign
	signpost 17, 12, SIGNPOST_READ, CeladonCityDeptStoreSign
	signpost 6, 21, SIGNPOST_READ, CeladonCityMansionSign
	signpost 6, 23, SIGNPOST_READ, CeladonCityGameCornerSign
	signpost 6, 22, SIGNPOST_READ, CeladonCityTrainerTips
	signpost 25, 22, SIGNPOST_READ, CeladonCityPokeCenterSign
	signpost 6, 1, SIGNPOST_ITEM, CeladonCityHiddenPpUp

.ObjectEvents: db 10
	person_event SPRITE_TEACHER, 11, 24, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 3, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a9f43, -1
	person_event SPRITE_POLIWAG, 0, 39, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	person_event SPRITE_TEACHER, 27, 28, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1a9f50, -1
	person_event SPRITE_GRAMPS, 19, 15, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, WalletManBran, -1
	person_event SPRITE_GRAMPS, 32, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a9f56, -1
	person_event SPRITE_YOUNGSTER, 19, 23, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a9f59, -1
	person_event SPRITE_YOUNGSTER, 17, 32, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a9f5c, -1
	person_event SPRITE_TEACHER, 15, 7, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1a9f5f, -1
	person_event SPRITE_LASS, 25, 15, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LassScript_0x1a9f62, -1
	person_event SPRITE_ROCK, 20, 1, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BrandiesCityRock, -1
