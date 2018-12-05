const_value set 2
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

LassScript_0x19932a:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x199338
	writetext UnknownText_0x19938d
	waitbutton
	closetext
	end

UnknownScript_0x199338:
	writetext UnknownText_0x19940d
	waitbutton
	closetext
	end

PokefanMScript_0x19933e:
	faceplayer
	opentext
;	checkevent EVENT_RETURNED_MACHINE_PART
;	iftrue UnknownScript_0x19934c
	writetext UnknownText_0x199460
	waitbutton
	closetext
	end

UnknownScript_0x19934c:
	writetext UnknownText_0x1994ae
	waitbutton
	closetext
	end

CooltrainerMScript_0x199352:
	jumptextfaceplayer UnknownText_0x1994fe

CooltrainerFScript_0x199355:
	jumptextfaceplayer UnknownText_0x19958e

FisherScript_0x199358:
	faceplayer
	opentext
;	checkevent EVENT_RETURNED_MACHINE_PART
;	iftrue UnknownScript_0x199366
	writetext UnknownText_0x1995fc
	waitbutton
	closetext
	end

UnknownScript_0x199366:
	writetext UnknownText_0x19964b
	waitbutton
	closetext
	end

YoungsterScript_0x19936c:
	jumptextfaceplayer UnknownText_0x1996a5

YoungsterScript_0x19936f:
	jumptextfaceplayer UnknownText_0x1996e5

LassScript_0x199372:
	jumptextfaceplayer UnknownText_0x199745

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokeCenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumptext CasMartSign
	
SaffronCityMarketSign:
	jumptext SaffronCityMarketText

SaffronCityGameCornerScript:
	jumptext SaffronCityGameCornerText

TvStudioGuard
	jumptextfaceplayer TvStudioGuardText1
	
TvStudioGuardText1:
	text "Sorry kid."
	
	para "TV personalities"
	line "only."
	
	para "Unless you're"
	line "an actor, you can't"
	cont "come in here."
	done
	
CasMartSign:
	text "Find What You"
	line "Need at CASCADE"
	cont "DEPT.STORE!"
	done
	
UnknownText_0x19938d:
	text "What do you think"
	line "is easier to deal"
	cont "with?"
	
	para "Boys or #MON?"
	
	para "I wish I could"
	line "find someone like"
	cont "me."
	done

UnknownText_0x19940d:
	text "The COPYCAT girl"
	line "looked unhappy."

	para "She said she lost"
	line "her favorite #"
	cont "DOLL--CLEFAIRY."
	done

UnknownText_0x199460:
	text "The MART that used"
	line "to stand here was"
	
	para "demolished after"
	line "the DEPT. STORE"
	cont "was built."
	
	para "I'm thinking of"
	line "starting my own"
	cont "business."
	done

UnknownText_0x1994ae:
	text "You came out from"
	line "JOHTO?"

	para "You can zip back"
	line "home by hopping on"
	cont "the MAGNET TRAIN."
	done

UnknownText_0x1994fe:
	text "I'm working on"
	line "a documentary"
	
	para "about people's"
	line "homes and the"
	
	para "#MON that"
	line "live with them."
	done

UnknownText_0x19958e:
	text "Do you like my"
	line "hair?"
	cont"I had it dyed red!"
	done

UnknownText_0x1995fc:
	text "A few years ago"
	line "some hooligan kids"
	
	para "were stealing"
	line "things and money"
	cont "in this town."
	
	para "A trainer in a"
	line "hoodie with their"
	
	para "powerful #MON"
	line "stopped them."
	done

UnknownText_0x19964b:
	text "Chew… Chew…"

	para "I hear there was"
	line "big trouble at the"
	cont "POWER PLANT."

	para "Chew… Chew…"
	line "Haaah, I'm full!"
	done

UnknownText_0x1996a5:
	text "They changed"
	line "this town's name"
	cont "A while ago."
	
	para "Personally, I'm"
	line "happy with it!"
	done

UnknownText_0x1996e5:
	text "Walk with me!"
	line "Talk with me!"
	
	para "With #MON,"
	line "that's all I"
	cont "need to be--"
	
	para "Oh, I'm trying"
	line "to write a rap"
	cont "about #MON!"
	done

UnknownText_0x199745:
	text "CASCADE…"
	line "CASCADE…"
	
	para "CASCADE CITY"
	line "just sounds so"
	cont "wholesome!"
	done

SaffronCitySignText:
	text "CASCADE CITY"

	para "A Welcome Place"
	line "For All People"
	done

SaffronGymSignText:
	text "CASCADE CITY"
	line "#MON GYM"
	cont "LEADER: BIANCA"

	para "The Red Head"
	line "Super Queen"
	done

FightingDojoSignText:
	text "Everyone Welcome!"
	line "FIGHTING DOJO"
	done

SilphCoSignText:
	text "GAME FREAKO"
	line "HEAD OFFICE"
	done

MrPsychicsHouseSignText:
	text "MR.PSYCHIC'S"
	line "HOUSE"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRON CITY"
	line "MAGNET TRAIN"
	cont "STATION"
	done

SaffronCityMarketText:
	text "We regret to"
	line "inform that the"
	
	para "CASCADE MARKETS"
	line "are closed"
	cont "indefinitely."
	done
	
SaffronCityGameCornerText:
	text "CASCADE CITY"
	line "STUDIOS"
	done
	
SaffronCity_MapEventHeader:: db 0, 0

.Warps: db 18
	warp_def 11, 4, 1, FIGHTING_DOJO
	warp_def 27, 4, 1, SAFFRON_GYM
	warp_def 11, 2, 2, SAFFRON_MART
	warp_def 13, 21, 1, SAFFRON_POKECENTER_1F
	warp_def 5, 5, 1, MR_PSYCHICS_HOUSE
	warp_def 12, 4, 2, SAFFRON_TRAIN_STATION
	warp_def 19, 3, 1, CELADON_MANSION_1F
	warp_def 11, 3, 1, COPYCATS_HOUSE_1F
	warp_def 12, 3, 3, ROUTE_5_SAFFRON_CITY_GATE
	warp_def 8, 2, 3, ROUTE_7_SAFFRON_GATE
	warp_def 9, 2, 4, ROUTE_7_SAFFRON_GATE
	warp_def 27, 24, 1, CELADON_MANSION_ROOF
	warp_def 33, 19, 2, ROUTE_6_SAFFRON_GATE
	warp_def 16, 33, 1, ROUTE_8_SAFFRON_GATE
	warp_def 17, 33, 2, ROUTE_8_SAFFRON_GATE
	warp_def 7, 22, 1, CELADON_DEPT_STORE_1F
	warp_def 1, 7, 1, PEELEXTRAHOUSES
	warp_def 1, 17, 3, PEELEXTRAHOUSES

.CoordEvents: db 0

.BGEvents: db 10
	signpost 17, 18, SIGNPOST_READ, SaffronCitySign
	signpost 27, 9, SIGNPOST_READ, SaffronGymSign
	signpost 5, 27, SIGNPOST_READ, FightingDojoSign
	signpost 21, 5, SIGNPOST_READ, SilphCoSign
	signpost 5, 8, SIGNPOST_READ, MrPsychicsHouseSign
	signpost 13, 3, SIGNPOST_READ, SaffronCityMagnetTrainStationSign
	signpost 13, 22, SIGNPOST_READ, SaffronCityPokeCenterSign
	signpost 7, 24, SIGNPOST_READ, SaffronCityMartSign
	signpost 21, 9, SIGNPOST_READ, SaffronCityMarketSign
	signpost 27, 28, SIGNPOST_READ, SaffronCityGameCornerScript

.ObjectEvents: db 9
	person_event SPRITE_LASS, 29, 18, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LassScript_0x19932a, -1
	person_event SPRITE_POKEFAN_M, 12, 14, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x19933e, -1
	person_event SPRITE_YOUNGSTER, 2, 3, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x199352, -1
	person_event SPRITE_COOLTRAINER_F, 17, 24, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x199355, -1
	person_event SPRITE_FISHER, 12, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x199358, -1
	person_event SPRITE_YOUNGSTER, 19, 17, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x19936c, -1
	person_event SPRITE_YOUNGSTER, 6, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x19936f, -1
	person_event SPRITE_LASS, 8, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x199372, -1
	person_event SPRITE_FISHER, 28, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TvStudioGuard, EVENT_STUDIO_BLOCKER_MAN
