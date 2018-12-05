const_value set 2
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_RED_STONE
	const BLACKTHORNCITY_BLUE_STONE	
	const BLACKTHORNCITY_GREEN_STONE
	const BLACKTHORNCITY_BROWN_STONE

BlackthornCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	dbw MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	checkcode VAR_WEEKDAY
	if_equal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlackChildrenReturned
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.BlackChildrenReturned:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornSuperNerdScript1:
	jumptextfaceplayer Text_ClairIsIn

;BROWN STONE SCRIPTS
BlackthornCityBrownStoneSign:
	opentext
	checkevent EVENT_BROWN_STONE_PLACED
	iftrue BlackBoulderDone
	checkitem CLEAR_BELL
	iftrue BlackPlaceBrownStone
	checkevent EVENT_SWITCH_14
	iffalse BlackNoStone
	writetext BlackBrownStoneText
	waitbutton
	closetext
	end
	
BlackPlaceBrownStone:
	writetext TakeBrownStoneText
	yesorno
	iffalse BlackBrownEndScript
	appear BLACKTHORNCITY_BROWN_STONE
;	setevent EVENT_BROWN_STONE_PLACED
;	takeitem CLEAR_BELL
	writetext PlacedBrownStoneText
	buttonsound
	writetext SpawnWhichPokemonText
	loadmenudata MenuDataHeader_BrownStoneQ
	verticalmenu
	closewindow
	if_equal $1, WildLegendCelebi
	if_equal $2, WildLegendMew
	if_equal $3, WildLegendMewTwo
	if_equal $4, BlackBrownQuitMenu
	
MenuDataHeader_BrownStoneQ:
	db $40 ; flags
	db 02, 10 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_BrownStoneQ
	db 1 ; default option
	
MenuData2_BrownStoneQ:
	db $81 ; flags
	db 4 ; items
	db "CELEBI@"
	db "MEW@"
	db "MEWTWO@"
	db "QUIT@"
	closetext
	end
	
WildLegendCelebi
	setevent EVENT_BROWN_STONE_PLACED
	takeitem CLEAR_BELL
	loadwildmon CELEBI, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendMew
	setevent EVENT_BROWN_STONE_PLACED
	takeitem CLEAR_BELL
	loadwildmon MEW, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendMewTwo
	setevent EVENT_BROWN_STONE_PLACED
	takeitem CLEAR_BELL
	loadwildmon MEWTWO, 35
	startbattle
	reloadmapafterbattle
	end
	
;GREEN STONE SCRIPTS
BlackthornCityGreenStoneSign:
	opentext
	checkevent EVENT_GREEN_STONE_PLACED
	iftrue BlackBoulderDone
	checkitem SILVER_WING
	iftrue BlackPlaceGreenStone
	checkevent EVENT_SWITCH_14
	iffalse BlackNoStone
	writetext BlackGreenStoneText
	waitbutton
	closetext
	end
	
BlackPlaceGreenStone
	writetext TakeGreenStoneText
	yesorno
	iffalse BlackGreenEndScript
	appear BLACKTHORNCITY_GREEN_STONE
;	setevent EVENT_GREEN_STONE_PLACED
;	takeitem SILVER_WING
	writetext PlacedGreenStoneText
	buttonsound
	writetext SpawnWhichPokemonText
	loadmenudata MenuDataHeader_GreenStoneQ
	verticalmenu
	closewindow
	if_equal $1, WildLegendArticuno
	if_equal $2, WildLegendZapdos
	if_equal $3, WildLegendMoltres
	if_equal $4, BlackGreenQuitMenu
	
MenuDataHeader_GreenStoneQ:
	db $40 ; flags
	db 02, 8 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_GreenStoneQ
	db 1 ; default option
	
MenuData2_GreenStoneQ:
	db $81 ; flags
	db 4 ; items
	db "ARTICUNO@"
	db "ZAPDOS@"
	db "MOLTRES@"
	db "QUIT@"
	closetext
	end
	
WildLegendArticuno
	setevent EVENT_GREEN_STONE_PLACED
	takeitem SILVER_WING
	loadwildmon ARTICUNO, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendZapdos
	setevent EVENT_GREEN_STONE_PLACED
	takeitem SILVER_WING
	loadwildmon ZAPDOS, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendMoltres
	setevent EVENT_GREEN_STONE_PLACED
	takeitem SILVER_WING
	loadwildmon MOLTRES, 35
	startbattle
	reloadmapafterbattle
	end
	
;BLUE STONE SCRIPTS
BlackthornCityBlueStoneSign:
	opentext
	checkevent EVENT_BLUE_STONE_PLACED
	iftrue BlackBoulderDone
	checkitem RAINBOW_WING
	iftrue BlackPlaceBlueStone
	checkevent EVENT_SWITCH_14
	iffalse BlackNoStone
	writetext BlackBlueStoneText
	waitbutton
	closetext
	end
	
BlackPlaceBlueStone
	writetext TakeBlueStoneText
	yesorno
	iffalse BlackBlueEndScript
	appear BLACKTHORNCITY_BLUE_STONE
;	setevent EVENT_BLUE_STONE_PLACED
;	takeitem RAINBOW_WING
	writetext PlacedBlueStoneText
	buttonsound
	writetext SpawnWhichPokemonText
	loadmenudata MenuDataHeader_BlueStoneQ
	verticalmenu
	closewindow
	if_equal $1, WildLegendHoOh
	if_equal $2, WildLegendLugia
	if_equal $3, BlackBlueQuitMenu
	
MenuDataHeader_BlueStoneQ:
	db $40 ; flags
	db 04, 11 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_BlueStoneQ
	db 1 ; default option
	
MenuData2_BlueStoneQ:
	db $81 ; flags
	db 3 ; items
	db "HO-OH@"
	db "LUGIA@"
	db "QUIT@"
	closetext
	end
	
WildLegendHoOh
	setevent EVENT_BLUE_STONE_PLACED
	takeitem RAINBOW_WING
	loadwildmon HO_OH, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendLugia
	setevent EVENT_BLUE_STONE_PLACED
	takeitem RAINBOW_WING
	loadwildmon LUGIA, 35
	startbattle
	reloadmapafterbattle
	end

;RED STONE SCRIPTS
BlackthornCityRedStoneSign:
	opentext
	checkevent EVENT_RED_STONE_PLACED
	iftrue BlackBoulderDone
	checkitem RED_SCALE
	iftrue BlackPlaceRedStone
	checkevent EVENT_SWITCH_14
	iffalse BlackNoStone
	writetext BlackRedStoneText
	waitbutton
	closetext
	end
	
BlackPlaceRedStone
	writetext TakeRedStoneText
	yesorno
	iffalse BlackRedEndScript
	appear BLACKTHORNCITY_RED_STONE
	writetext PlacedRedStoneText
	buttonsound
	writetext SpawnWhichPokemonText
	loadmenudata MenuDataHeader_RedStoneQ
	verticalmenu
	closewindow
	if_equal $1, WildLegendEntei
	if_equal $2, WildLegendSuicune
	if_equal $3, WildLegendRaikou
	if_equal $4, BlackRedQuitMenu
	
MenuDataHeader_RedStoneQ:
	db $40 ; flags
	db 02, 9 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_RedStoneQ
	db 1 ; default option
	
MenuData2_RedStoneQ:
	db $81 ; flags
	db 4 ; items
	db "ENTEI@"
	db "SUICUNE@"
	db "RAIKOU@"
	db "QUIT@"
	closetext
	end
	
WildLegendEntei
	setevent EVENT_RED_STONE_PLACED
	takeitem RED_SCALE
	loadwildmon ENTEI, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendSuicune
	setevent EVENT_RED_STONE_PLACED
	takeitem RED_SCALE
	loadwildmon SUICUNE, 35
	startbattle
	reloadmapafterbattle
	end
WildLegendRaikou
	setevent EVENT_RED_STONE_PLACED
	takeitem RED_SCALE
	loadwildmon RAIKOU, 35
	startbattle
	reloadmapafterbattle
	end
	
; GENERIC STONE SCRIPTS

BlackRedQuitMenu
	disappear BLACKTHORNCITY_RED_STONE
	closetext
	end
	
BlackBlueQuitMenu
	disappear BLACKTHORNCITY_BLUE_STONE
	closetext
	end
	
BlackGreenQuitMenu
	disappear BLACKTHORNCITY_GREEN_STONE
	closetext
	end
	
BlackBrownQuitMenu
	disappear BLACKTHORNCITY_BROWN_STONE
	closetext
	end

BlackNoStone
	writetext YouHaveNoStones
	waitbutton
	closetext
	end
	
BlackBoulderDone:
	writetext BoulderDoneText
	waitbutton
	closetext
	end
	
BlackRedEndScript
	disappear BLACKTHORNCITY_RED_STONE
	closetext
	end
	
BlackBlueEndScript
	disappear BLACKTHORNCITY_BLUE_STONE
	closetext
	end
	
BlackGreenEndScript
	disappear BLACKTHORNCITY_GREEN_STONE
	closetext
	end
	
BlackBrownEndScript
	disappear BLACKTHORNCITY_BROWN_STONE
	closetext
	end
	
BlackthornGramps1Script:
	faceplayer
	opentext
	checkevent EVENT_RED_STONE_PLACED
	iftrue BlackStoneTree1
BackToOldManScript
	checkitem RED_SCALE
	iftrue BlackFoundAStone
	checkitem RAINBOW_WING
	iftrue BlackFoundAStone
	checkitem SILVER_WING
	iftrue BlackFoundAStone
	checkitem CLEAR_BELL
	iftrue BlackFoundAStone
	checkevent EVENT_SWITCH_14
	iftrue BlackthornGrampsReminderScript
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue BlackthornGrampsHelpScript
	writetext BlackthornGrampsRefuseHelpText
	waitbutton
	closetext
	end

BlackStoneTree1
	checkevent EVENT_BLUE_STONE_PLACED
	iffalse BackToOldManScript
	checkevent EVENT_GREEN_STONE_PLACED
	iffalse BackToOldManScript
	checkevent EVENT_BROWN_STONE_PLACED
	iftrue .FinishedLegendaryQuest
	jump BackToOldManScript
	end

.FinishedLegendaryQuest
	writetext FinishedLegendaryQuestText
	waitbutton
	closetext
	end
	
BlackFoundAStone
	writetext FoundAStoneText
	waitbutton
	closetext
	end

BlackthornGrampsHelpScript:
	writetext BlackthornGrampsHelpText
	buttonsound
	verbosegiveitem PASS
	writetext BlackthornGrampsGoToTrainText
	setevent EVENT_SWITCH_14
	waitbutton
	closetext
	end

BlackthornGrampsReminderScript:
	writetext BlackthornGrampsReminderText
	waitbutton
	closetext
	end
	
BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue .BlackChildrenReturned
	writetext BlackBeltText_ChildrenMissing
	waitbutton
	closetext
	end

.BlackChildrenReturned:
	writetext BlackBeltText_ChildrenReturned
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
;	iftrue .Saturday
;	checkcode VAR_WEEKDAY
;	if_not_equal SATURDAY, .NotSaturday
;	checkevent EVENT_MET_SANTOS_OF_SATURDAY
;	iftrue .MetSantos
;	writetext MeetSantosText
;	buttonsound
;	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
;	writetext SantosGivesGiftText
;	buttonsound
;	verbosegiveitem SPELL_TAG
;	iffalse .Done
;	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
;	writetext SantosGaveGiftText
;	waitbutton
;	closetext
	end

.Saturday:
;	writetext SantosSaturdayText
;	waitbutton
.Done:
;	closetext
	end

.NotSaturday:
;	writetext SantosNotSaturdayText
;	waitbutton
;	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokeCenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

BlackthornCityNowLeavingSign:
	jumptext BlackthornCityNowLeavingText
	
BlackthronHiddenItem1:
	 dwb EVENT_BOULDER_IN_BLACKTHORN_GYM_3, MOON_STONE
	
BlackthornCityGiveStonesSign:
	giveitem RED_SCALE
	giveitem RAINBOW_WING
	giveitem SILVER_WING
	giveitem CLEAR_BELL
	opentext
	writetext BlackItemGet
	waitbutton
	closetext
	end

BlackthornCityDEVScript:
	jumptext BlackthornCityDEVText
	
SpawnWhichPokemonText:
	text "Summon which"
	line "#MON?"
	done
	
TakeBrownStoneText:
	text "Do you want to"
	line "place the"
	
	para "BROWN STONE on the"
	line "boulder?"
	done

PlacedBrownStoneText:
	text "<PLAYER> placed"
	line "the BROWN STONE"
	cont "onto the boulder."
	done
	
BlackBrownStoneText:
	text "It's a giant"
	line "boulder with a"
	para "BROWN STONE"
	line "missing."
	done
	
TakeGreenStoneText:
	text "Do you want to"
	line "place the"
	
	para "GREEN STONE on the"
	line "boulder?"
	done

PlacedGreenStoneText:
	text "<PLAYER> placed"
	line "the GREEN STONE"
	cont "onto the boulder."
	done
	
BlackGreenStoneText:
	text "It's a giant"
	line "boulder with a"
	para "GREEN STONE"
	line "missing."
	done
	
FinishedLegendaryQuestText:
	text "Well done."
	
	para "You have unleash-"
	line "ed the power of"
	
	para "the legendary"
	line "#MON!"
	
	para "Like a true"
	line "powerful trainer."
	
	para "I was honoured"
	line "to witness it!"
	done
	
BoulderDoneText:
	text "It looks like this"
	line "boulder has served"
	cont "its purpose."
	done
	
TakeRedStoneText:
	text "Do you want to"
	line "place the"
	
	para "RED STONE on the"
	line "boulder?"
	done

PlacedRedStoneText:
	text "<PLAYER> placed"
	line "the RED STONE onto"
	cont "the boulder."
	done
	
TakeBlueStoneText:
	text "Do you want to"
	line "place the"
	
	para "BLUE STONE on the"
	line "boulder?"
	done

PlacedBlueStoneText:
	text "<PLAYER> placed"
	line "the BLUE STONE"
	cont "onto the boulder."
	done
	
BlackBlueStoneText:
	text "It's a giant"
	line "boulder with a"
	para "BLUE STONE"
	line "missing."
	done
	
YouHaveNoStones:
	text "It's a giant"
	line "boulder with a"
	cont "chunk missing."
	done
	
BlackRedStoneText:
	text "It's a giant"
	line "boulder with a"
	cont "RED STONE missing."
	done
	
BlackItemGet:
	text "STONES GET!!"
	done

FoundAStoneText:
	text "Ah, you have found"
	line "a STONE!"
	
	para "Place it on the"
	line "correct boulder"
	
	para "to summon a"
	line "legendary #MON!"
	done
	
BlackthornCityNowLeavingText:
	text "Now leaving"
	line "HARDROOT TOWN"
	done

BlackthornGrampsHelpText:
	text "Oh my, you have"
	line "conqured the"
	
	para "#MON LEAGUE,"
	line "and you were sent"
	
	para "here by PROF."
	line "ALDER?"
	
	para "I suppose I can"
	line "tell you what I"
	
	para "know about this"
	line "mysterious place."
	
	para "These giant boul-"
	line "ders hide the key"
	
	para "to summoning"
	line "legendary #MON."
	
	para "But, they are"
	line "incomplete."
	
	para "Pieces have been"
	line "shattered from the"
	
	para "precious stones"
	line "for their glisten-"
	cont "ing beauty."
	
	para "They were taken"
	line "out of the region"
	
	para "by a devious"
	line "collector."
	
	para "They were then"
	line "auctioned off to"
	cont "various people."
	
	para "Here, I have a"
	line "MAGNET TRAIN PASS."
	
	para "It can take you"
	line "to that region."
	done
	
BlackthornGrampsGoToTrainText:
	text "Head to TRAIN"
	line "STATION in"
	cont "WILLOWBRUSH TOWN."
	
	para "It will take you"
	line "where you need to"
	cont "go."
	done
	
BlackthornGrampsReminderText:
	text "Bring back some"
	line "STONE PIECES, and"
	
	para "we can summon the"
	line "legendary #MON!"
	done
	
Text_ClairIsOut:
	text "Nobody should be"
	line "battling in this"
	
	para "town until our"
	line "children are"
	
	para "safely returned"	
	line "to us!"
	done

Text_ClairIsIn:
	text "I'm on a lookout"
	line "for clues for a"
	cont "mystery."
	
	para "If I solve this,"
	line "oh man, who knows"
	
	para "what the reward"
	line "is!"
	done

Text_ClairIsBeaten:
	text "You defeated"
	line "CLAIR?"

	para "That's amazing!"

	para "I've never heard"
	line "of her losing to"

	para "anyone other than"
	line "LANCE."
	done

BlackthornGrampsRefuseHelpText:
	text "I could tell you"
	line "what I know about"
	
	para "these giant"
	line "stones,"
	
	para "but it seems to me"
	line "like you are not"
	
	para "ready as a"
	line "trainer."
	
	para "Please leave."
	done

BlackthornGrampsGrantsEntryText:
	text "There's no under-"
	line "estimating the"
	
	para "power you can"
	line "harness when your"
	
	para "#MON trusts in"
	line "you."
	
	para "Befriend all"
	line "#MON, and you"
	
	para "will know what it"
	line "is to be truly"
	cont "happy."
	done

BlackBeltText_ChildrenMissing:
	text "So I hear this"
	line "talk about kids"
	cont "going missing?"
	
	para "Man, I would never"
	line "be swayed by some-"
	
	para "thing I heard on"
	line "TV."
	done

BlackBeltText_ChildrenReturned:
	text "I'm glad all the"
	line "parents in town"
	
	para "got their loved"
	line "ones back."
	
	para "I was starting"
	line "to worry."
	done

BlackthornCooltrainerF1Text:
	text "My you've collect-"
	line "ed a lot of"
	cont "BADGES!"
	
	para "So you're pretty"
	line "strong, right?"
	cont "I like that."
	done

BlackthornYoungsterText:
	text "A lot of people"
	line "finish their"
	
	para "journey in this"
	line "town."
	
	para "For some, it's"
	line "just beginning."
	done

MeetSantosText:
	text "SANTOS: …"

	para "It's Saturday…"

	para "I'm SANTOS of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "SPELL TAG…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday…"
	done

BlackthornCooltrainerF2Text:
	text "I'm so glad to live"
	line "in a world with"
	cont "#MON."
	
	para "I can't depend on"
	line "a lot of people."
	done

BlackthornCitySignText:
	text "HARDROOT CITY"

	para "Deep in Rich"
	line "History"
	done

BlackthornGymSignText:
	text "HARDROOT CITY"
	line "#MON GYM"
	cont "LEADER: HARKEN"

	para "Fists of Iron,"
	line "Heart of Steel"
	done

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DRAGON'S DEN"
	line "AHEAD"
	done

BlackthornCityTrainerTipsText:
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done
BlackthornCityDEVText:
	text "Dev Diary 11"

	para "The XXth of"
	line "XXXX 2018"
		
	para "-FREAKO out."
	done
	
BlackthornCity_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 11, 18, 1, BLACKTHORN_GYM_1F
	warp_def 9, 29, 1, BLACKTHORN_DRAGON_SPEECH_HOUSE
	warp_def 23, 29, 1, BLACKTHORN_EMYS_HOUSE
	warp_def 29, 9, 2, BLACKTHORN_MART
	warp_def 29, 15, 1, BLACKTHORN_POKECENTER_1F
	warp_def 9, 37, 1, MOVE_DELETERS_HOUSE
	warp_def 21, 2, 4, BLACKTHORNGATES
	warp_def 21, 23, 1, BLACKTHORNEXTRAHOUSE
	warp_def 20, 2, 3, BLACKTHORNGATES

.CoordEvents: db 0

.BGEvents: db 19
	signpost 26, 20, SIGNPOST_READ, BlackthornCitySign
	signpost 11, 15, SIGNPOST_READ, BlackthornGymSign
	signpost 9, 35, SIGNPOST_READ, MoveDeletersHouseSign
	signpost 3, 21, SIGNPOST_READ, DragonDensSign
	signpost 19, 9, SIGNPOST_READ, BlackthornCityTrainerTips
	signpost 29, 10, SIGNPOST_READ, BlackthornCityMartSign
	signpost 29, 16, SIGNPOST_READ, BlackthornCityPokeCenterSign
	signpost 32, 30, SIGNPOST_READ, BlackthornCityNowLeavingSign
	signpost -1, 0, SIGNPOST_READ, BlackthornCityGiveStonesSign
	signpost 1, 1, SIGNPOST_READ, BlackthornCityRedStoneSign
	signpost 1, 0, SIGNPOST_READ, BlackthornCityRedStoneSign
	signpost 1, 5, SIGNPOST_READ, BlackthornCityBlueStoneSign
	signpost 1, 4, SIGNPOST_READ, BlackthornCityBlueStoneSign
	signpost 1, 9, SIGNPOST_READ, BlackthornCityGreenStoneSign
	signpost 1, 8, SIGNPOST_READ, BlackthornCityGreenStoneSign
	signpost 1, 13, SIGNPOST_READ, BlackthornCityBrownStoneSign
	signpost 1, 12, SIGNPOST_READ, BlackthornCityBrownStoneSign
	signpost 28, 14, SIGNPOST_READ, BlackthornCityDEVScript
	signpost 8, 32, SIGNPOST_ITEM, BlackthronHiddenItem1

.ObjectEvents: db 12
	person_event SPRITE_POKEFAN_M, 12, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SUPER_NERD, 12, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackthornSuperNerdScript1, -1
	person_event SPRITE_GRAMPS, 3, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGramps1Script, -1
	person_event SPRITE_GRAMPS, 11, 32, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BlackthornGramps2Script, -1
	person_event SPRITE_YOUNGSTER, 22, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	person_event SPRITE_COOLTRAINER_F, 31, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	person_event SPRITE_YOUNGSTER, 27, 31, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	person_event SPRITE_COOLTRAINER_F, 23, 20, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
	person_event SPRITE_ENTEI, 1, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackthornCityRedStoneSign, EVENT_RED_STONE_PLACED_ON_ROCK
	person_event SPRITE_ENTEI, 1, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BlackthornCityBlueStoneSign, EVENT_BLUE_STONE_PLACED_ON_ROCK
	person_event SPRITE_ENTEI, 1, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BlackthornCityGreenStoneSign, EVENT_GREEN_STONE_PLACED_ON_ROCK
	person_event SPRITE_ENTEI, 1, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BlackthornCityBrownStoneSign, EVENT_BROWN_STONE_PLACED_ON_ROCK
