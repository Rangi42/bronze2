const_value set 2
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_SILVER
	const AZALEATOWN_AZALEA_ROCKET3
	const AZALEATOWN_KURT_OUTSIDE

AzaleaTown_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .Flypoint

.Trigger0:
	end

.Trigger1:
	end

.Trigger2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return

AzaleaTownRivalBattleTrigger1:
;	moveperson AZALEATOWN_SILVER, $b, $b
;	spriteface PLAYER, RIGHT
;	showemote EMOTE_SHOCK, PLAYER, 15
;	special Special_FadeOutMusic
;	pause 15
;	appear AZALEATOWN_SILVER
;	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement1
;	spriteface PLAYER, DOWN
;	jump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleTrigger2:
;	spriteface PLAYER, RIGHT
;	showemote EMOTE_SHOCK, PLAYER, 15
;	special Special_FadeOutMusic
;	pause 15
;	appear AZALEATOWN_SILVER
;	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement2
;	spriteface PLAYER, UP
AzaleaTownRivalBattleScript:
;	playmusic MUSIC_RIVAL_ENCOUNTER
;	opentext
;	writetext AzaleaTownRivalBeforeText
;	waitbutton
;	closetext
;	setevent EVENT_RIVAL_AZALEA_TOWN
;	checkevent EVENT_GOT_TOTODILE_FROM_ELM
;	iftrue .Totodile
;	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
;	iftrue .Chikorita
;	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
;	setlasttalked AZALEATOWN_SILVER
;	loadtrainer RIVAL1, RIVAL1_6
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .AfterBattle

;.Totodile:
;	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
;	setlasttalked AZALEATOWN_SILVER
;	loadtrainer RIVAL1, RIVAL1_4
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .AfterBattle

;.Chikorita:
;	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
;	setlasttalked AZALEATOWN_SILVER
;	loadtrainer RIVAL1, RIVAL1_5
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .AfterBattle

;.AfterBattle:
;	playmusic MUSIC_RIVAL_AFTER
;	opentext
;	writetext AzaleaTownRivalAfterText
;	waitbutton
;	closetext
;	spriteface PLAYER, LEFT
;	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleExitMovement
;	playsound SFX_EXIT_BUILDING
;	disappear AZALEATOWN_SILVER
;	dotrigger $0
;	waitsfx
;	playmapmusic
	end

AzaleaTownRocket1Script:
	jumptextfaceplayer GoodSamaritanRocketText

AzaleaTownRocket2Script:
	jumptextfaceplayer TastySlowpokeTailRocketText

AzaleaTownGrampsScript:
	faceplayer
	opentext
;	checkevent EVENT_CLEARED_SLOWPOKE_WELL
;	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	faceplayer
	opentext
;	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
;	iftrue .ChildrenReturned1
	writetext AzaleaTownTeacherText
	waitbutton
	closetext
	end
	
;.ChildrenReturned1
;	writetext AzaleaTownTeacherText
;	waitbutton
;	closetext
;	end	

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
;	opentext
;	writetext AzaleaTownSlowpokeText1
;	pause 60
;	writetext AzaleaTownSlowpokeText2
;	cry SLOWPOKE
;	waitbutton
;	closetext
;	end

WoosterScript:
; unused
;	faceplayer
;	opentext
;	writetext WoosterText
;	cry QUAGSIRE
;	waitbutton
;	closetext
;	end

AzaleaTown_CelebiEventScript:
;	applymovement PLAYER, Movement_PlayerWalksOutOfKurtsHouse
;	opentext
;	writetext IlexForestIsRestlessText
;	buttonsound
;	spriteface AZALEATOWN_KURT_OUTSIDE, RIGHT
;	writetext HeresTheGSBallBackText
;	buttonsound
;	writetext PleaseInvestigateIlexForestText
;	waitbutton
;	verbosegiveitem GS_BALL
;	spriteface AZALEATOWN_KURT_OUTSIDE, LEFT
;	setflag ENGINE_HAVE_EXAMINED_GS_BALL
;	clearevent EVENT_ILEX_FOREST_LASS
;	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
;	dotrigger $0
;	closetext
;	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue .AzChildrenReturned
	writetext PleaseInvestigateIlexForestText
	waitbutton
	closetext
	end

.AzChildrenReturned:
	writetext AzChildrenReturnedText
	waitbutton
	closetext
	end
	
AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokeCenterSign:
	jumpstd pokecentersign

AzaleaTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	dwb EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL, FULL_HEAL

AzaleaTownDEVScript:
	jumptext AzaleaTownDEVScriptText

AzaleaTownRivalBattleApproachMovement1:
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	turn_head_up
;	step_end

AzaleaTownRivalBattleApproachMovement2:
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	step_left
;	turn_head_down
;	step_end

AzaleaTownRivalBattleExitMovement:
;	step_left
;	step_left
;	step_left
;	step_end

Movement_PlayerWalksOutOfKurtsHouse:
;	step_left
;	step_left
;	step_up
;	turn_head_left
;	step_end

AzaleaTownDEVScriptText:
		text "Dev Diary 9"

		para "The 16th of"
		line "FEBUARY 2018"
		
		para "Currently assign-"
		line "ing #MON and"
		
		para "text to trainers"
		line "of the 2nd region."
		
		para "I used to be so"
		line "bad at coming up"
		
		para "with dialog for"
		line "NPCs, but now it"
		cont "flows natrually."
		
		para "I think talking a"
		line "lot of TAUROS crap"
		
		para "in my YOUTUBE"
		line "videos has helped"
		cont "with that."
		
		para "-FREAKO out."
		done
	
AzaleaTownRivalBeforeText:
;	text "…Tell me some-"
;	line "thing."
;
;	para "Is it true that"
;	line "TEAM ROCKET has"
;	cont "returned?"
;
;	para "What? You beat"
;	line "them? Hah! Quit"
;	cont "lying."
;
;	para "You're not joking?"
;	line "Then let's see how"
;	cont "good you are."
;	done

AzaleaTownRivalWinText:
;	text "… Humph! Useless"
;	line "#MON!"
;
;	para "Listen, you. You"
;	line "only won because"
;
;	para "my #MON were"
;	line "weak."
;	done

AzaleaTownRivalAfterText:
;	text "I hate the weak."
;
;	para "#MON, trainers."
;	line "It doesn't matter"
;	cont "who or what."
;
;	para "I'm going to be"
;	line "strong and wipe"
;	cont "out the weak."
;
;	para "That goes for TEAM"
;	line "ROCKET too."
;
;	para "They act big and"
;	line "tough in a group."
;
;	para "But get them"
;	line "alone, and they're"
;	cont "weak."
;
;	para "I hate them all."
;
;	para "You stay out of my"
;	line "way. A weakling"
;
;	para "like you is only a"
;	line "distraction."
;	done

AzaleaTownRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done

GoodSamaritanRocketText:
	text "Hmm… I really want"
	line "to go to the beach"
	
	para "but none of my"
	line "#MON can swim."
	
	para "Maybe I should"
	line "check out the"
	cont "mountain instead."
	done

TastySlowpokeTailRocketText:
;	text "Do you know about"
;	line "SLOWPOKETAIL? I"
;	cont "heard it's tasty!"
;
;	para "Aren't you glad I"
;	line "told you that?"
	done

AzaleaTownGrampsTextBefore:
	text "Have you ever seen"
	line "a legendary #-"
	
	para "MON soar through"
	line "the sky?"
	
	para "I'll never forget"
	line "the day I saw what"
	
	para "looked like a"
	line "bright rainbow"
	cont "with wings."
	done

AzaleaTownGrampsTextAfter:
	text "The SLOWPOKE have"
	line "returned."

	para "Knowing them, they"
	line "could've just been"

	para "goofing off some-"
	line "where."
	done

AzaleaTownTeacherText:
	text "I am an expert at"
	line "baking."
	
	para "I cook many cakes"
	line "for people and"
	cont "#MON alike!"
	done

AzaleaTownYoungsterText:
	text "If I could be any-"
	line "thing, it would be"
	
	para "an ELITE FOUR"
	line "member!"
	
	para "I'm going to keep"
	line "training until I"
	cont "reach my goal!"
	done

AzaleaTownSlowpokeText1:
;	text "SLOWPOKE: …"
;
;	para "<......> <......> <......>"
;	done

AzaleaTownSlowpokeText2:
;	text "<......> <......>Yawn?"
;	done

WoosterText:
;	text "WOOSTER: Gugyoo…"
;	done

IlexForestIsRestlessText:
;	text "ILEX FOREST is"
;	line "restless!"
;
;	para "What is going on?"
;	done

HeresTheGSBallBackText:
;	text "<PLAYER>, here's"
;	line "your GS BALL back!"
;	done

PleaseInvestigateIlexForestText:
	text "I hear there are"
	line "children going"
	
	para "missing around the"
	line "region…"
	
	para "As a mother, this"
	line "really worries me."
	done

AzChildrenReturnedText:
	text "I am so relieved"
	line "to hear all the"
	
	para "missing children"
	line "have been returned"
	cont "safely."
	done
	
AzaleaTownSignText:
	text "FIGBRANCH TOWN"
	
	para "The Foot of the"
	line "Mountains"
	done

KurtsHouseSignText:
	text "KURT'S HOUSE"
	done

AzaleaGymSignText:
	text "FIGBRANCH TOWN"
	line "#MON GYM"
	para "LEADER: CARVER"

	para "As Hard as Stone"
	line "in Body and Mind"
	done

SlowpokeWellSignText:
;	text "SLOWPOKE WELL"
;
;	para "Also known as the"
;	line "RAINMAKER WELL."
;
;	para "Locals believe"
;	line "that a SLOWPOKE's"
;	cont "yawn summons rain."
;
;	para "Records show that"
;	line "a SLOWPOKE's yawn"
;
;	para "ended a drought"
;	line "400 years ago."
	done

CharcoalKilnSignText:
	text "CHARCOAL KILN"
	done

AzaleaTownIlexForestSignText:
	text "KENT'S KARATE"
	line "PLACE"
	
	para "Learn to be a"
	line "BLACK BELT master!"
	done

AzaleaTown_MapEventHeader:: db 0, 0

.Warps: db 14
	warp_def 23, 13, 1, AZALEA_POKECENTER_1F
	warp_def 5, 9, 1, CHARCOAL_KILN
	warp_def 7, 21, 2, AZALEA_MART
	warp_def 7, 17, 1, KURTS_HOUSE
	warp_def 17, 10, 1, MAHOGANY_GYM
	warp_def 5, 35, 1, SURFHOUSE
	warp_def 12, 2, 3, ROUTE33_GATES
	warp_def 13, 2, 4, ROUTE33_GATES
	warp_def 29, 29, 6, ROUTE33_GATES
	warp_def 29, 30, 5, ROUTE33_GATES
	warp_def 12, 37, 9, ROUTE33_GATES
	warp_def 13, 37, 10, ROUTE33_GATES
	warp_def 3, 27, 3, KURTS_HOUSE
	warp_def 21, 21, 5, KURTS_HOUSE

.CoordEvents: db 3
	xy_trigger 1, 30, 0, 0, AzaleaTownRivalBattleTrigger1, 0, 0
	xy_trigger 1, 31, 0, 0, AzaleaTownRivalBattleTrigger2, 0, 0
	xy_trigger 2, 30, 1, 0, AzaleaTown_CelebiEventScript, 0, 0

.BGEvents: db 10
	signpost 11, 19, SIGNPOST_READ, AzaleaTownSign
	signpost 32, 4, SIGNPOST_READ, KurtsHouseSign
	signpost 17, 7, SIGNPOST_READ, AzaleaGymSign
	signpost 32, 7, SIGNPOST_READ, SlowpokeWellSign
	signpost 5, 4, SIGNPOST_READ, CharcoalKilnSign
	signpost 23, 13, SIGNPOST_READ, AzaleaTownPokeCenterSign
	signpost 7, 22, SIGNPOST_READ, AzaleaTownMartSign
	signpost 21, 19, SIGNPOST_READ, AzaleaTownIlextForestSign
	signpost 4, 7, SIGNPOST_ITEM, AzaleaTownHiddenFullHeal
	signpost 22, 12, SIGNPOST_READ, AzaleaTownDEVScript

.ObjectEvents: db 8
	person_event SPRITE_YOUNGSTER, 21, 30, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaTownRocket1Script, -1
	person_event SPRITE_GRAMPS, 11, 21, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	person_event SPRITE_TEACHER, 22, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 24, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	person_event SPRITE_FRUIT_TREE, 32, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, WhiteApricornTree, -1
	person_event SPRITE_YOUNGSTER, -2, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_YOUNGSTER, -2, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaTownRocket2Script, -1
	person_event SPRITE_TEACHER, 6, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaTownKurtScript, -1
