const_value set 2
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_BUENA2
	const GOLDENRODGYM_GYM_GUY
	const GOLDENRODGYM_BLOCKER1
	const GOLDENRODGYM_BLOCKER2
	const GOLDENRODGYM_BLOCKER3
	const GOLDENRODGYM_BLOCKER4

GoldenrodGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x5400a, 0
	dw UnknownScript_0x5400b, 0

.MapCallbacks:
	db 0

UnknownScript_0x5400a:
	end

UnknownScript_0x5400b:
	end

WhitneyScript_0x5400c:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext UnknownText_0x54122
	waitbutton
	closetext
	winlosstext UnknownText_0x541a5, 0
	loadtrainer WHITNEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
;	setevent EVENT_MADE_WHITNEY_CRY
	dotrigger $1
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
;	setevent EVENT_SWITCH_13
	opentext
	writetext UnknownText_0x54222
	buttonsound
	waitsfx
	writetext UnknownText_0x54273
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
.FightDone:
	opentext
;	checkevent EVENT_MADE_WHITNEY_CRY
;	iffalse .StoppedCrying
;	writetext UnknownText_0x541f4
;	waitbutton
;	closetext
;	end
;.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue UnknownScript_0x54077
;	checkflag ENGINE_PLAINBADGE
;	iftrue UnknownScript_0x54064
;	checkcode VAR_BADGES
;	scall GoldenrodGymTriggerRockets
;UnknownScript_0x54064:
	writetext UnknownText_0x5428b
	buttonsound
	verbosegiveitem TM_RETURN
	iffalse UnknownScript_0x5407b
	setevent EVENT_GOT_TM45_ATTRACT
	checkevent EVENT_GOT_HM05_FLASH
	iftrue StartTVStationScriptGym
	writetext UnknownText_0x54302
	waitbutton
	closetext
	end

StartTVStationScriptGym:
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	specialphonecall SPECIALCALL_ASSISTANT
	writetext UnknownText_0x54302
	waitbutton
	closetext
	end
	
UnknownScript_0x54077:
	writetext UnknownText_0x54360
	waitbutton
UnknownScript_0x5407b:
	closetext
	end

GoldenrodGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer EVENT_BEAT_LASS_CARRIE, LASS, CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, LassCarrieScript

LassCarrieScript:
	end_if_just_battled
	opentext
	writetext LassCarrieOWText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	spriteface PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	dotrigger $0
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer EVENT_BEAT_LASS_BRIDGET, LASS, BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, LassBridgetScript

LassBridgetScript:
	end_if_just_battled
	opentext
	writetext LassBridgetOWText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer EVENT_BEAT_BEAUTY_VICTORIA, BEAUTY, VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, BeautyVictoriaScript

BeautyVictoriaScript:
	end_if_just_battled
	opentext
	writetext BeautyVictoriaOWText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer EVENT_BEAT_BEAUTY_SAMANTHA, BEAUTY, SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, BeautySamanthaScript

BeautySamanthaScript:
	end_if_just_battled
	opentext
	writetext BeautySamanthaOWText
	waitbutton
	closetext
	end

GoldenrodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuyWinScript
	opentext
	writetext GoldenrodGymGuyText
	waitbutton
	closetext
	end

.GoldenrodGymGuyWinScript:
	opentext
	writetext GoldenrodGymGuyWinText
	waitbutton
	closetext
	end

GoldSwitch1:
	checkevent EVENT_SLOWPOKE_WELL_KURT
	iftrue GoldSwitchesAllActivated
	opentext
	writetext GoldPressSwitchText
	yesorno
	iffalse GoldDoNothing
	closetext
;	playsound SFX_ENTER_DOOR
	playsound SFX_PUSH_BUTTON
	waitsfx
	disappear GOLDENRODGYM_BLOCKER1
	end
	
GoldSwitch2:
	checkevent EVENT_OLIVINE_GYM_JASMINE
	iftrue GoldSwitchesAllActivated
	opentext
	writetext GoldPressSwitchText
	yesorno
	iffalse GoldDoNothing
	closetext
;	playsound SFX_ENTER_DOOR
	playsound SFX_PUSH_BUTTON
	waitsfx
	disappear GOLDENRODGYM_BLOCKER2
	end
	
GoldSwitch3:
	checkevent EVENT_LAKE_OF_RAGE_CIVILIANS
	iftrue GoldSwitchesAllActivated
	opentext
	writetext GoldPressSwitchText
	yesorno
	iffalse GoldDoNothing
	closetext
;	playsound SFX_ENTER_DOOR
	playsound SFX_PUSH_BUTTON
	waitsfx
	disappear GOLDENRODGYM_BLOCKER3
	end
	
GoldSwitch4:
	checkevent EVENT_KURTS_HOUSE_KURT_1
	iftrue GoldSwitchesAllActivated
	opentext
	writetext GoldPressSwitchText
	yesorno
	iffalse GoldDoNothing
	closetext
;	playsound SFX_ENTER_DOOR
	playsound SFX_PUSH_BUTTON
	waitsfx
	disappear GOLDENRODGYM_BLOCKER4
	end

GoldDoNothing:
	closetext
	end

GoldSwitchesAllActivated:
	opentext
	writetext GoldSwitchesAllActivatedText
	waitbutton
	closetext
	end
	
GoldGymBlocker:
	jumptext BlockingObjectText
	
GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, 1, $1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step_left
	turn_head_up
	step_end

BridgetWalksAwayMovement:
	step_right
	turn_head_left
	step_end

GoldSwitchesAllActivatedText:
	text "<PLAYER> tried"
	line "to press the"
	cont "switch."
	
	para "But nothing"
	line "happened…"
	done
	
GoldPressSwitchText:
	text "It's a switch!"
	
	para "Want to press it?"
	done
	
BlockingObjectText:
	text "It looks like a"
	line "switch could"
	cont "remove this."
	done
	
UnknownText_0x54122:
	text "Hey, I'm LUNA!"
	
	para "I specialise in"
	line "all things dark."
	
	para "You should be very"
	line "cautious around"
	cont "me, sunshine!"
	
	para "Oh, am I rambling?"
	
	para "Let's begin the"
	line "battle!"
	done

UnknownText_0x541a5:
	text "Oh… my…"
	
	para "You are indeed"
	line "worthy…"
	done

UnknownText_0x541f4:
	text "Waaaaah!"

	para "Waaaaah!"

	para "…Snivel, hic…"
	line "…You meanie!"
	done

UnknownText_0x54222:
	text "I officially award"
	line "you with the"
	cont "DARKBADGE."
	done

UnknownText_0x54273:
	text "<PLAYER> received"
	line "DARKBADGE."
	done

UnknownText_0x5428b:
	text "DARKBADGE lets"
	line "your #MON use"

	para "CUT outside"
	line "of battle."

	para "It also boosts"
	line "your #MON's"
	cont "SPEED."

	para "Oh, hang on…"
	
	para "You can also have"
	line "this!"
	done

UnknownText_0x54302:
	text "It's RETURN!"
	
	para "The higher your"
	line "#MON's love"
	
	para "is for you, the"
	line "stronger the"
	cont "attack will be."
	
	para "That's why my"
	line "#MON are so"
	cont "powerful!"
	done

UnknownText_0x54360:
	text "I can't wait to"
	line "tell my sisters"
	cont "about this battle!"
	done

LassCarrieSeenText:
	text "Aha! Spotted you!"
	
	para "Let me show you"
	line "the darkness."
	done

LassCarrieBeatenText:
	text "Darn… I think I"
	line "didn't pay enough"
	cont "attention."
	done

LassCarrieOWText:
	text "My #MON are"
	line "stronger than you"
	cont "think."
	done

LassBridgetSeenText:
	text "Oh, I'm up?"
	
	para "I'm a little"
	line "nervous…"
	
	para "But I'll do my"
	line "best!"
	done

LassBridgetBeatenText:
	text "Ouch!"
	done

LassBridgetOWText:
	text "I'm going to train"
	line "harder than you"
	cont "can believe."
	done

BridgetWhitneyCriesText:
	text "Oh, no. You made"
	line "WHITNEY cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done

BeautyVictoriaSeenText:
	text "LUNA trusted me"
	line "to test trainer's"

	para "abilities before"
	line "they got to her!"
	done

BeautyVictoriaBeatenText:
	text "Oh, it's all done…"
	done

BeautyVictoriaOWText:
	text "You're pretty good,"
	line "kid."
	done

BeautySamanthaSeenText:
	text "There's a lot of"
	line "beauty in"
	cont "darkness."
	done

BeautySamanthaBeatenText:
	text "Oh, HOUNDOUR!"
	done

BeautySamanthaOWText:
	text "Press the switch"
	line "to move on, I"
	cont "guess."
	done

GoldenrodGymGuyText:
	text "Yo! CHAMP to be!"

	para "This GYM uses"
	line "dark-type"
	cont "#MON!"
	
	para "I reckon' if"
	line "you hit 'em with"
	
	para "some fighting"
	line "moves you could"
	cont "get through easy!"
	done

GoldenrodGymGuyWinText:
	text "Man, LUNA never"
	line "stood a chance"
	cont "against you, huh?"
	done

GoldenrodGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 31, 4, 3, MAHOGANY_TOWN
	warp_def 31, 5, 3, MAHOGANY_TOWN

.CoordEvents: db 1
	xy_trigger 1, 7, 3, 0, WhitneyCriesScript, 0, 0

.BGEvents: db 6
	signpost 29, 3, SIGNPOST_READ, GoldenrodGymStatue
	signpost 29, 6, SIGNPOST_READ, GoldenrodGymStatue
	signpost 15, 14, SIGNPOST_READ, GoldSwitch1
	signpost 11, 14, SIGNPOST_READ, GoldSwitch2
	signpost 11, 18, SIGNPOST_READ, GoldSwitch3
	signpost 11, 22, SIGNPOST_READ, GoldSwitch4

.ObjectEvents: db 10
	person_event SPRITE_WHITNEY, 12, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, WhitneyScript_0x5400c, -1
	person_event SPRITE_LASS, 14, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassCarrie, -1
	person_event SPRITE_LASS, 13, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassBridget, -1
	person_event SPRITE_BUENA, 15, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	person_event SPRITE_BUENA, 17, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBeautySamantha, -1
	person_event SPRITE_GYM_GUY, 29, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1
	person_event SPRITE_VIRTUAL_BOY, 13, 13, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GoldGymBlocker, EVENT_SLOWPOKE_WELL_KURT
	person_event SPRITE_VIRTUAL_BOY, 19, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GoldGymBlocker, EVENT_OLIVINE_GYM_JASMINE
	person_event SPRITE_VIRTUAL_BOY, 15, 20, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GoldGymBlocker, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_VIRTUAL_BOY, 19, 25, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GoldGymBlocker, EVENT_KURTS_HOUSE_KURT_1
