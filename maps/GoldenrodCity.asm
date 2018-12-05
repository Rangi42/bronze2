const_value set 2
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_DOORBLOCKER
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_ROCKET7
	const GOLDENRODCITY_POKEFAN_M2

GoldenrodCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPointAndFloria
;	dbw MAPCALLBACK_OBJECTS, .MoveTutor

.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLORIA
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	return

;.MoveTutor:
;	checkevent EVENT_BEAT_ELITE_FOUR
;	iffalse .MoveTutorDone
;	checkitem COIN_CASE
;	iffalse .MoveTutorDisappear
;	checkcode VAR_WEEKDAY
;	if_equal WEDNESDAY, .MoveTutorAppear
;	if_equal SATURDAY, .MoveTutorAppear
;.MoveTutorDisappear:
;	disappear GOLDENRODCITY_POKEFAN_M2
;	return
;
;.MoveTutorAppear:
;	checkflag ENGINE_DAILY_MOVE_TUTOR
;	iftrue .MoveTutorDone
;	appear GOLDENRODCITY_POKEFAN_M2
;.MoveTutorDone:
;	return
;
;MoveTutor:
;	faceplayer
;	opentext
;	writetext UnknownText_0x199042
;	yesorno
;	iffalse .Refused
;	special Special_DisplayCoinCaseBalance
;	writetext UnknownText_0x199090
;	yesorno
;	iffalse .Refused2
;	checkcoins 4000
;	if_equal $2, .NotEnoughMoney
;	writetext UnknownText_0x1990ce
;	loadmenudata .MoveMenuDataHeader
;	verticalmenu
;	closewindow
;	if_equal $1, .Flamethrower
;	if_equal $2, .Thunderbolt
;	if_equal $3, .IceBeam
;	jump .Incompatible
;
;.Flamethrower:
;	writebyte $1
;	writetext UnknownText_0x1991cf
;	special Special_MoveTutor
;	if_equal $0, .TeachMove
;	jump .Incompatible
;
;.Thunderbolt:
;	writebyte $2
;	writetext UnknownText_0x1991cf
;	special Special_MoveTutor
;	if_equal $0, .TeachMove
;	jump .Incompatible
;
;.IceBeam:
;	writebyte $3
;	writetext UnknownText_0x1991cf
;	special Special_MoveTutor
;	if_equal $0, .TeachMove
;	jump .Incompatible
;
;
;.MoveMenuDataHeader:
;	db $40 ; flags
;	db 02, 00 ; start coords
;	db 11, 15 ; end coords
;	dw .MenuData2
;	db 1 ; default option
;
;.MenuData2:
;	db $80 ; flags
;	db 4 ; items
;	db "FLAMETHROWER@"
;	db "THUNDERBOLT@"
;	db "ICE BEAM@"
;	db "CANCEL@"
;
;
;.Refused:
;	writetext UnknownText_0x1990b4
;	waitbutton
;	closetext
;	end
;
;.Refused2:
;	writetext UnknownText_0x199107
;	waitbutton
;	closetext
;	end
;
;.TeachMove:
;	writetext UnknownText_0x19913a
;	buttonsound
;	takecoins 4000
;	waitsfx
;	playsound SFX_TRANSACTION
;	special Special_DisplayCoinCaseBalance
;	writetext UnknownText_0x19918b
;	waitbutton
;	closetext
;	checkcode VAR_FACING
;	if_equal LEFT, .WalkAroundPlayer
;	applymovement GOLDENRODCITY_POKEFAN_M2, MovementData_0x198a5f
;	jump .GoInside
;
;.WalkAroundPlayer:
;	applymovement GOLDENRODCITY_POKEFAN_M2, MovementData_0x198a63
;.GoInside:
;	playsound SFX_ENTER_DOOR
;	disappear GOLDENRODCITY_POKEFAN_M2
;	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
;	setflag ENGINE_DAILY_MOVE_TUTOR
;	waitsfx
;	end
;
;.Incompatible:
;	writetext UnknownText_0x1991a4
;	waitbutton
;	closetext
;	end
;
;.NotEnoughMoney:
;	writetext UnknownText_0x1991ac
;	waitbutton
;	closetext
;	end

GoldenrodCityRock:
;	jumptextfaceplayer UnknownText_0x198a69
	jumpstd smashrock

TVLockedDoorBlocker:
	opentext
	checkitem BASEMENT_KEY
	iftrue .UnlockDoor
	writetext UnknownText_0x198aa9
	waitbutton
	closetext
	end
	
.UnlockDoor
	writetext UnlockDoorText
	disappear GOLDENRODCITY_DOORBLOCKER
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	waitbutton
	playsound SFX_ENTER_DOOR
	waitsfx
	closetext
	end	

GoldSecretDoorUnlock:
	disappear GOLDENRODCITY_DOORBLOCKER
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	end
	
CooltrainerFScript_0x1989e9:
	faceplayer
	opentext
;	checkevent EVENT_CLEARED_RADIO_TOWER
;	iftrue .ClearedRadioTower
	writetext UnknownText_0x198ae6
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext UnknownText_0x198b2d
	waitbutton
	closetext
	end

CooltrainerFScript_0x1989fd:
	faceplayer
	opentext
;	checkflag ENGINE_RADIO_CARD
;	iftrue .GotRadioCard
	writetext UnknownText_0x198b73
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext UnknownText_0x198c14
	waitbutton
	closetext
	end

YoungsterScript_0x198a11:
	jumptextfaceplayer UnknownText_0x198c36

LassScript_0x198a14:
	jumptextfaceplayer UnknownText_0x198c83

GrampsScript_0x198a17:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .GrampsAfterGymWin
	writetext GrampsBeforeGymWinText
	waitbutton
	closetext
	end

.GrampsAfterGymWin
	writetext GrampsAfterGymWinText
	waitbutton
	closetext
	end
	
RocketScript_0x198a1a:
	faceplayer
	opentext
;	writetext UnknownText_0x198d0d
;	buttonsound
	writetext UnknownText_0x198d2a
	waitbutton
	spriteface GOLDENRODCITY_ROCKET1, LEFT
	closetext
	end

RocketScript_0x198a29:
	jumptextfaceplayer UnknownText_0x198d4e

RocketScript_0x198a2c:
	jumptext GoldenrodBlockLeftText

RocketScript_0x198a2f:
	jumptext GoldenrodBlockRightText

GoldenrodWorriedBoyScript:
	faceplayer
	opentext
	checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	iftrue .RocketsGone
	writetext UnknownText_0x198de2
	waitbutton
	closetext
	end
	
.RocketsGone
	writetext WorriedBoyRocketsGoneText
	waitbutton
	closetext
	end

GoldWorriedGirlScript:
	faceplayer
	opentext
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .WorriedGirlUnlockedDoor
	writetext GoldWorriedGirl
	waitbutton
	closetext
	end
	
.WorriedGirlUnlockedDoor
	writetext GoldWorriedGirlUnlockedDoorText
	waitbutton
	closetext
	end
	
RocketScript_0x198a38:
	faceplayer
	opentext
	writetext UnknownText_0x198e4b
	special PlaceMoneyTopRight
	yesorno
	iffalse BadgeRefusedMoney
	checkmoney $0, 1000
	if_equal $2, BadgeNoCashScript
	setflag ENGINE_FOGBADGE
	setevent EVENT_SWITCH_7
	setevent EVENT_SWITCH_8
;	iffalse UnknownScript_0x9cefc
	takemoney $0, 1000
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext BadgeBoughtText
	buttonsound
	writetext FakeBadgeGetText
	playsound SFX_GET_BADGE
	waitsfx
	writetext BadgeBoughtEndText
	waitbutton
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear GOLDENRODCITY_ROCKET7
	waitsfx
	special Special_FadeInQuickly
;	warp VICTORY_ROAD_GATE, $8, $8
	end

BadgeRefusedMoney:
	writetext BadgeRefusedMoneyText
	waitbutton
	closetext
	end

BadgeNoCashScript:
	writetext BadgeNoCashText
	waitbutton
	closetext
	end
	
SurprisedCiv1Script:
	jumptextfaceplayer SurprisedCiv1Text

SurprisedCiv2Script:
	jumptextfaceplayer SurprisedCiv2Text

TauntRocket1Script:
	jumptextfaceplayer TauntRocket1Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityTVTowerSign:
	jumptext GoldenrodCityTVTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityDEVScript:
	jumptext GoldenrodCityDEVScriptText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokeCenterSign:
	jumpstd pokecentersign
	
GoldenrodFenceSign:
	jumptext GoldenrodFenceSignText

GoldenrodCityGymTriggerSign:
	opentext
	writetext GoldenrodCityGymTriggerSignText
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	domaptrigger ECRUTEAK_GYM, $1
	waitbutton
	closetext
	end

GoldenrodParkSign:
	jumptext GoldParkSignText

MovementData_0x198a5f:
	step_right
	step_right
	step_up
	step_end

MovementData_0x198a63:
	step_down
	step_right
	step_right
	step_up
	step_up
	step_end
	
GoldenrodCityDEVScriptText:
	text "Dev Diary 7"

	para "The 20th of FEB-"
	line "UARY 2017"
	
	para "#MON PRISM was"
	line "released a little"
	
	para "while ago, I"
	line "played the heck"
	cont "out of it."
	
	para "There were a bunch"
	line "of mistakes and"
	
	para "junk in it that"
	line "I had been making"
	
	para "sure to avoid in"
	line "in BRONZE 2."
	
	para "BRONZE 2 will"
	line "never be as pop-"
	
	para "ular as PRISM,"
	line "but maybe that's"
	
	para "a good thing,"
	line "all things"
	cont "considered."
	
	para "It's not a good"
	line "thing for AXMAN,"
	cont "though."
	
	para "His incompetence"
	line "will be the down-"
	
	para "fall of the"
	line "internet."
	
	para "-FREAKO out."
	done
	
UnlockDoorText:
	text "<PLAYER> inserted"
	line "the BUILDING KEY"
	
	para "and the door"
	line "unlocked!"
	done
	
GoldParkSignText:
	text "Please refrain"
	line "from making"
	
	para "shady deals in"
	line "the park."
	
	para "Thank you."
	done
	
GoldenrodFenceSignText:
	text "Please keep our"
	line "city as tidy"
	cont "as possible."
	
	para "Do not litter."
	line "Thank you!"
	done
	
GrampsAfterGymWinText:
	text "Oh my! The GYM's"
	line "leader was TV's"
	cont "SCARLET?"
	
	para "If only I could"
	line "meet her myself!"
	done
	
FakeBadgeGetText:
	text "<PLAYER> received"
	line "STARBADGE."
	done
	
BadgeBoughtEndText:
	text "Seeya, kid!"
	line "Heh heh…"
	done
	
BadgeBoughtText:
	text "Heh heh…"
	line "Pleasure doing"
	
	para "buisness with ya,"
	line "kid."
	done
	
BadgeNoCashText:
	text "Sorry."
	line "No cash, no sale!"
	done
	
BadgeRefusedMoneyText:
	text "Aw, c'mon kid."
	done
	
UnknownText_0x198a69:
	text "I made the long"
	line "trek here this"
	cont "morning."
	
	para "I'm dreding going"
	line "all the way back"
	cont "home on foot."
	done
	
UnknownText_0x198aa9:
	text "The door appears"
	line "to be locked."
	done

UnknownText_0x198ae6:
	text "Where did you get"
	line "your hat?"
	
	para "It's so trendy!"
	line "Where do you shop?"
	done

UnknownText_0x198b2d:
	text "Was that man in"
	line "black really part"

	para "of TEAM ROCKET? I"
	line "can't believe it!"
	done

UnknownText_0x198b73:
	text "Oh, hello!"
	line "Are you new here?"
	
	para "It's so wonderful"
	line "to meet new"
	cont "people!"
	
	para "You should stay a"
	line "while!"
	done
	
UnknownText_0x198c14:
	text "Oh, your #GEAR"
	line "works as a radio!"
	done

UnknownText_0x198c36:
	text "I hear TV person-"
	line "alities hang"
	cont "around this city."
	
	para "So that's why"
	line "I come here often."
	
	para "I want to be"
	line "famous too!"
	done

UnknownText_0x198c83:
	text "Do you think my"
	line "#MON look cute"
	
	para "with flowers in"
	line "their hair?"

	para "A cute #MON is"
	line "a happy #MON!"	
	done

GrampsBeforeGymWinText:
	text "This GYM is great!"
	line "I hear the leader"
	
	para "is someone really"
	line "important!"
	done

UnknownText_0x198d0d:
	text "So this is the"
	line "RADIO TOWER…"
	done

UnknownText_0x198d2a:
	text "I often wonder"
	line "what lies beyond…"
	
	para "This fence,"
	line "I mean."
	done

UnknownText_0x198d4e:
	text "The GAME CORNER?"
	
	para "Seriously?"
	
	para "What were they"
	line "thinking."
	
	para "HEY!"
	
	para "Buzz off, kid."
	line "There ain't nothing"
	cont "to be seen here."
	done

GoldenrodBlockLeftText:
	text "SCARLET is beauti-"
	line "ful and amazing!"
	
	para "I would do any-"
	line "thing to meet her!"
	done

GoldenrodBlockRightText:
	text "I hear SCARLET is"
	line "somewhere in the"
	cont "city right now!"
	done

UnknownText_0x198de2:
	text "Why, SCARLET,"
	line "why?"
	
	para "I looked up to"
	line "you, I watched all"
	cont "your shows…"
	done

GoldWorriedGirlUnlockedDoorText:
	text "You see some"
	line "people as your"
	cont "heroes,"
	
	para "and then they go"
	line "and do this."
	
	para "I don't know what's"
	line "going on…"
	
	para "Someone needs to"
	line "get in there!"
	done
	
GoldWorriedGirl:
	text "You see some"
	line "people as your"
	cont "heroes,"
	
	para "and then they go"
	line "and do this."
	
	para "I don't know what's"
	line "going on…"
	
	para "If only someone"
	line "could find the key"
	cont "and get in there!"
	done

UnknownText_0x198e4b:
	text "Heh heh…"
	line "Hey kid!"
	
	para "Lookin' fer an"
	line "easy way to get a"
	cont "a BADGE?"
	
	para "I can sell you"
	line "this town's GYM"
	
	para "BADGE for a few"
	line "dollars."
	
	para "It works just like"
	line "the real thing,"
	cont "too!"
	
	para "You can even use"
	line "the FLY HM outside"
	cont "of battle."
	
	para "It's yours fer just"
	line "¥1000!"
	done
	
SurprisedCiv1Text:
	text "Hey, brat! You"
	line "don't belong here!"
	cont "Get lost!"
	done

SurprisedCiv2Text:
	text "Come taste the"
	line "true terror of"
	cont "TEAM ROCKET!"
	done

WorriedBoyRocketsGoneText:
	text "SCARLET was being"
	line "forced to say"
	cont "bad things?"
	
	para "I never thought"
	line "something like"
	
	para "that would happen"
	line "around here."
	done
	
TauntRocket1Text:
	text "Fuck you."
	done
	
GoldenrodCityStationSignText:
	text "GOLDENROD CITY"
	line "STATION"
	done

GoldenrodCityTVTowerSignText:
	text "ROSEGLEN CITY"
	line "TV STATION"
	
	para "Where Stars are"
	line "Born"
	done

GoldenrodDeptStoreSignText:
	text "Full Selection of"
	line "#MON Goods!"

	para "ROSEGLEN CITY"
	line "DEPT.STORE"
	done

GoldenrodGymSignText:
	text "ROSEGLEN CITY"
	line "#MON GYM"
	cont "LEADER: ???"

	para "The description"
	line "appears to be"
	cont "missing."
	done

GoldenrodCitySignText:
	text "ROSEGLEN CITY"

	para "The Hub of All"
	line "Entertainment"
	done

GoldenrodCityBikeShopSignText:
	text "The World is a"
	line "Cycle Path!"
	cont "BIKE SHOP"
	done

GoldenrodCityGameCornerSignText:
	text "Your Playground!"

	para "ROSEGLEN CITY"
	line "GAME CORNER"
	done

GoldenrodCityNameRaterSignText:
	text "NAME RATER"

	para "Get Your #MON"
	line "Nicknames Rated"
	done

GoldenrodCityUndergroundSignSouthText:
	text "UNDERGROUND"
	line "ENTRANCE"
	done

PokeComCenterSignText:
; unused in the english version
	text "For Mobile Tips!"
	line "#COM CENTER"
	done

GoldenrodCityGymTriggerSignText:
	text "Events Activated!"
	done

UnknownText_0x199042:
	text "I can teach your"
	line "#MON amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

UnknownText_0x199090:
	text "It will cost you"
	line "4000 coins. Okay?"
	done

UnknownText_0x1990b4:
	text "Aww… But they're"
	line "amazing…"
	done

UnknownText_0x1990ce:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

UnknownText_0x199107:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

UnknownText_0x19913a:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

UnknownText_0x19918b:
	text "Wahahah!"
	line "Farewell, kid!"
	done

UnknownText_0x1991a4:
	text "B-but…"
	done

UnknownText_0x1991ac:
	text "…You don't have"
	line "enough coins here…"
	done

UnknownText_0x1991cf:
	text ""
	done

GoldenrodCity_MapEventHeader:: db 0, 0

.Warps: db 20
	warp_def 31, 34, 1, ECRUTEAK_GYM
	warp_def 21, 31, 1, GOLDENROD_BIKE_SHOP
	warp_def 29, 25, 1, GOLDENROD_HAPPINESS_RATER
	warp_def 23, 9, 1, GOLDENROD_BILLS_HOUSE
	warp_def 34, 27, 2, GOLDENROD_MAGNET_TRAIN_STATION
	warp_def 3, 5, 1, GOLDENROD_FLOWER_SHOP
	warp_def 7, 15, 1, GOLDENROD_PP_SPEECH_HOUSE
	warp_def 7, 33, 1, GOLDENROD_NAME_RATER
	warp_def 7, 10, 1, GOLDENROD_DEPT_STORE_1F
	warp_def 13, 9, 1, GOLDENROD_GAME_CORNER
	warp_def 7, 28, 1, RADIO_TOWER_1F
	warp_def 1, 26, 7, GOLDENRODCITYGATES
	warp_def 34, 25, 8, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def 34, 26, 5, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def 13, 17, 1, GOLDENROD_POKECENTER_1F
	warp_def 32, 2, 3, GOLDENRODCITYGATES
	warp_def 33, 2, 4, GOLDENRODCITYGATES
	warp_def 1, 19, 3, ROUTE_35_GOLDENROD_GATE
	warp_def 10, 43, 9, GOLDENRODCITYGATES
	warp_def 11, 43, 10, GOLDENRODCITYGATES

.CoordEvents: db 0

.BGEvents: db 15
	signpost 33, 23, SIGNPOST_READ, GoldenrodCityStationSign
	signpost 7, 25, SIGNPOST_READ, GoldenrodCityTVTowerSign
	signpost 7, 12, SIGNPOST_READ, GoldenrodDeptStoreSign
	signpost 31, 38, SIGNPOST_READ, GoldenrodGymSign
	signpost 18, 16, SIGNPOST_READ, GoldenrodCitySign
	signpost 34, 24, SIGNPOST_READ, GoldenrodCityBikeShopSign
	signpost 13, 14, SIGNPOST_READ, GoldenrodCityGameCornerSign
	signpost 7, 36, SIGNPOST_READ, GoldenrodCityNameRaterSign
	signpost 12, 19, SIGNPOST_READ, GoldenrodCityDEVScript
	signpost 33, 24, SIGNPOST_READ, GoldenrodCityUndergroundSignSouth
	signpost 13, 18, SIGNPOST_UP, GoldenrodCityPokeCenterSign
	signpost 29, 32, SIGNPOST_READ, GoldenrodCityGymTriggerSign
	signpost 16, 4, SIGNPOST_READ, GoldenrodFenceSign
	signpost 21, 28, SIGNPOST_READ, GoldenrodParkSign
	signpost 6, 29, SIGNPOST_READ, GoldSecretDoorUnlock

.ObjectEvents: db 14
	person_event SPRITE_ROCK, 23, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenrodCityRock, -1
	person_event SPRITE_FRUIT_TREE, 7, 28, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TVLockedDoorBlocker, EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	person_event SPRITE_COOLTRAINER_F, 11, 38, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x1989e9, -1
	person_event SPRITE_COOLTRAINER_F, 26, 20, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x1989fd, -1
	person_event SPRITE_YOUNGSTER, 18, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x198a11, -1
	person_event SPRITE_LASS, 9, 14, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x198a14, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_GRAMPS, 31, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x198a17, -1
	person_event SPRITE_YOUNGSTER, 17, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x198a1a, -1
	person_event SPRITE_ROCKET, 6, 25, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x198a29, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_YOUNGSTER, 13, 20, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x198a2c, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	person_event SPRITE_COOLTRAINER_F, 13, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RocketScript_0x198a2f, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	person_event SPRITE_YOUNGSTER, 9, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodWorriedBoyScript, -1
	person_event SPRITE_COOLTRAINER_F, 8, 30, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldWorriedGirlScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_POKEFAN_M, 22, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x198a38, EVENT_SWITCH_8
