const_value set 2
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE

Route33_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route33LassScript:
	jumptextfaceplayer Route33LassText

TrainerHikerAnthony:
	trainer EVENT_BEAT_HIKER_ANTHONY, HIKER, ANTHONY2, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
;	writecode VAR_CALLERID, PHONE_HIKER_ANTHONY
	end_if_just_battled
	opentext
;	checkflag ENGINE_ANTHONY
;	iftrue .Rematch
;	checkflag ENGINE_DUNSPARCE_SWARM
;	iftrue .Swarm
;	checkcellnum PHONE_HIKER_ANTHONY
;	iftrue .NumberAccepted
;	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
;	iftrue .AskAgain
	writetext HikerAnthony2AfterText
;	buttonsound
;	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
;	scall .AskNumber1
;	jump .AskForPhoneNumber
	waitbutton
	closetext
	end

.AskAgain:
	scall .AskNumber2
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext HIKER, ANTHONY2, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthony2BeatenText, 0
	copybytetovar wAnthonyFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 1
	clearflag ENGINE_ANTHONY
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 2
	clearflag ENGINE_ANTHONY
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 3
	clearflag ENGINE_ANTHONY
	end

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	startbattle
	reloadmapafterbattle
	loadvar wAnthonyFightCount, 4
	clearflag ENGINE_ANTHONY
	end

.LoadFight4:
	loadtrainer HIKER, ANTHONY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY
	end

.Swarm:
	writetext HikerAnthonyDunsparceText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

Route33Sign:
	jumptext Route33SignText

Route33FruitTreeScript:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "Did you just come"
	line "out of SLUDGE"
	cont "CAVE?"
	
	para "You are a braver"
	line "trainer than I."	
	cont "Let's battle!"
	done

HikerAnthony2BeatenText:
	text "What a bummer!"
	done

HikerAnthony2AfterText:
	text "I've visited many"
	line "caves."
	
	para "But that one is"
	line "off limits for"
	cont "me."
	done

HikerAnthonyDunsparceText:
	text "Hey, did you get a"
	line "DUNSPARCE?"

	para "I caught one too."

	para "Take a look at it"
	line "in the light. It's"
	cont "got a funny face!"
	done

Route33LassText:
	text "I don't smell"
	line "do I?"
	
	para "I mean I had no"
	line "other way to get"
	cont "to HARDROOT TOWN."
	
	para "Aw jeez."
	line "Well that's #-"
	
	para "MON training for"
	line "you."
	
	para "Sometimes you have"
	line "to get dirty!"
	done

Route33SignText:
	text "ROUTE 16"
	
	para "MAUVEWOOD TOWN -"
	line "HARDROOT TOWN"
	done

Route33_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 5, 12, 2, ICE_PATH_1F
	warp_def 10, 6, 3, ROUTE_30
	warp_def 11, 6, 4, ROUTE_30
	warp_def 10, 35, 1, BLACKTHORNGATES
	warp_def 11, 35, 2, BLACKTHORNGATES

.CoordEvents: db 0

.BGEvents: db 1
	signpost 9, 15, SIGNPOST_READ, Route33Sign

.ObjectEvents: db 3
	person_event SPRITE_POKEFAN_M, 14, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerHikerAnthony, -1
	person_event SPRITE_YOUNGSTER, 7, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route33LassScript, -1
	person_event SPRITE_FRUIT_TREE, 5, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route33FruitTreeScript, -1
