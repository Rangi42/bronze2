const_value set 2
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScriptHeader:
.MapTriggers:
	db 6

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3
	maptrigger .Trigger4
	maptrigger .Trigger5

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback_MoveElm

.Trigger0:
	priorityjump ElmsLab_AutowalkUpToElm
	end

.Trigger1:
	end

.Trigger2:
	end

.Trigger3:
	end

.Trigger4:
	end

.Trigger5:
	end

.Callback_MoveElm:
	checktriggers
	iftrue .Skip
	moveperson ELMSLAB_ELM, $5, $2
.Skip:
	return

ElmsLab_AutowalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
;	spriteface ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
;ElmsLab_RefuseLoop:
;	yesorno
;	iftrue ElmsLab_ElmGetsEmail
;	writetext ElmText_Refused
;	jump ElmsLab_RefuseLoop

;ElmsLab_ElmGetsEmail:
;	writetext ElmText_Accepted
;	buttonsound
;	writetext ElmText_ResearchAmbitions
;	waitbutton
;	closetext
;	playsound SFX_GLASS_TING
;	pause 30
;	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
;	spriteface ELMSLAB_ELM, DOWN
;	opentext
;	writetext ElmText_GotAnEmail
;	waitbutton
;	closetext
;	opentext
;	spriteface ELMSLAB_ELM, RIGHT
;	writetext ElmText_MissionFromMrPokemon
;	waitbutton
;	closetext
;	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
;	spriteface PLAYER, UP
;	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
;	spriteface PLAYER, RIGHT
;	opentext
;	writetext ElmText_ChooseAPokemon
	waitbutton
	dotrigger $1
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_CERULEAN_GYM_ROCKET
	iftrue ElmGiveMasterBallScript
	checkevent EVENT_SWITCH_13
	iftrue ElmANormalDay
	checkevent EVENT_SWITCH_14
	iftrue ElmANormalDay
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmRocksReminder
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iftrue ElmGiveTicketScript
ElmRocksReminder:
	writetext ElmGoToHardrootTownText
	waitbutton
	closetext
	end
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
;	iftrue ElmCheckEverstone
;	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
;ElmCheckEverstone:
;	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
;	iftrue ElmScript_CallYou
;	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
;	iftrue ElmGiveEverstoneScript
;	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
;	iffalse ElmCheckTogepiEgg
;	writebyte TOGEPI
;	special Special_FindThatSpeciesYourTrainerID
;	iftrue ShowElmTogepiScript
;	writebyte TOGETIC
;	special Special_FindThatSpeciesYourTrainerID
;	iftrue ShowElmTogepiScript
;	writetext UnknownText_0x79a40
;	waitbutton
;	closetext
	end
	
ElmANormalDay:
	writetext ElmDiscoveries
	waitbutton
	closetext
	end
	
ElmEggHatchedScript:
	writebyte TOGEPI
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	jump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmGoToHardrootTown
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	spriteface ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x78f70
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5, BERRY
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	jump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	spriteface PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
;	addcellnum PHONE_ELM
;	opentext
;	writetext GotElmsNumberText
;	playsound SFX_REGISTER_PHONE_NUMBER
;	waitsfx
;	waitbutton
;	closetext
	spriteface ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	spriteface ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	dotrigger $5
	domaptrigger NEW_BARK_TOWN, $1
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special Mobile_HealParty
	special HealParty
	playmusic MUSIC_NONE
	writebyte 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
;	checkitem MYSTERY_EGG
;	iffalse ElmAfterTheftDoneScript
;	buttonsound
;	writetext ElmAfterTheftText2
;	waitbutton
;	takeitem MYSTERY_EGG
;	scall ElmJumpBackScript1
;	writetext ElmAfterTheftText3
;	waitbutton
;	scall ElmJumpBackScript2
;	writetext ElmAfterTheftText4
;	buttonsound
;	writetext ElmAfterTheftText5
;	buttonsound
;	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
;	setflag ENGINE_BUG_CONTEST_ON
;	domaptrigger ROUTE_29, $1
;	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
;	setevent EVENT_ROUTE_30_BATTLE
;	writetext ElmAfterTheftText6
	waitbutton
	closetext
;	dotrigger $6
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	buttonsound
	writetext ShowElmTogepiText3
	buttonsound
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue .end
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	clearevent EVENT_CERULEAN_GYM_ROCKET
	writetext ElmGiveMasterBallText2
;	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iftrue .Also
	waitbutton
.end
.notdone
	closetext
	end

.Also
	buttonsound
	writetext ElmAlsoText
	buttonsound
	writetext ElmGiveTicketText1Alt
	jump ElmAlso2
ElmGiveTicketScript:
	writetext ElmGiveTicketText1
;	buttonsound
;	verbosegiveitem PASS
ElmAlso2
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
;	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, ElmJumpDownScript
	if_equal UP, ElmJumpUpScript
	if_equal LEFT, ElmJumpLeftScript
	if_equal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, ElmJumpUpScript
	if_equal UP, ElmJumpDownScript
	if_equal LEFT, ElmJumpRightScript
	if_equal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotions1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	dotrigger $2
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	spriteface PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	spriteface PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	buttonsound
	itemtotext POKE_BALL, $1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	dotrigger $2
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	spriteface ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	buttonsound
	playmusic MUSIC_RIVAL_ENCOUNTER
	writetext BattleOfferText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext LabRivalWinText, LabRivalLossText
	setlasttalked ELMSLAB_OFFICER
	loadtrainer RIVAL1, RIVAL1_3
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
;	writetext ElmsLabOfficerTextTemp
;	waitbutton
;	special SpecialNameRival
;	special RestartMapMusic
	jump .ElmBattleDone

.Totodile:
	winlosstext LabRivalWinText, LabRivalLossText
	setlasttalked ELMSLAB_OFFICER
	loadtrainer RIVAL1, RIVAL1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
;	dontrestartmapmusic
	reloadmap
;	iftrue .AfterVictorious
	jump .ElmBattleDone

.Chikorita:
	winlosstext LabRivalWinText, LabRivalLossText
	setlasttalked ELMSLAB_OFFICER
	loadtrainer RIVAL1, RIVAL1_2
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
;	dontrestartmapmusic
	reloadmap
;	iftrue .AfterVictorious
	jump .ElmBattleDone
	
.ElmBattleDone
	special HealParty
;	special RestartMapMusic
	playmapmusic
	opentext
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	domaptrigger ROUTE_29, $1
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	wait 10
	applymovement ELMSLAB_ELM, ElmGiveDexMovement
	opentext
	writetext ElmsLab_GiveDexText
	waitbutton
	writetext ElmsLab_GetDexText
	playsound SFX_ITEM
	waitsfx
	writetext ElmsLab_GiveDexText2
	waitbutton
	clearflag ENGINE_TIME_CAPSULE
	closetext
	setflag ENGINE_POKEDEX
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
;	dotrigger $2
	dotrigger $6
	applymovement ELMSLAB_ELM, ElmGiveDexMovement2
	end
	
ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	jump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmGoToHardrootTown:
	writetext ElmGoToHardrootTownText
	waitbutton
	closetext
	end
	
ElmsLab_WalkUpToElmMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_up
	step_end

MovementData_0x78f70:
	step_up
	step_end

MeetCopScript2_StepLeft:
	step_left
	step_end

MeetCopScript_WalkUp:
	step_up
	step_up
	turn_head_right
	step_end

OfficerLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AideWalksRight1:
	step_right
	step_right
	turn_head_up
	step_end

AideWalksRight2:
	step_right
	step_right
	step_right
	turn_head_up
	step_end

AideWalksLeft1:
	step_left
	step_left
	turn_head_down
	step_end

AideWalksLeft2:
	step_left
	step_left
	step_left
	turn_head_down
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step_up
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step_down
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step_left
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step_right
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step_up
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step_right
	step_right
	step_up
	turn_head_down
	step_end

AfterCyndaquilMovement:
	step_left
	step_up
	turn_head_up
	step_end

AfterTotodileMovement:
	step_left
	step_left
	step_up
	turn_head_up
	step_end

AfterChikoritaMovement:
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end
	
ElmGiveDexMovement:
	step_down
	turn_head_left
	step_end
	
ElmGiveDexMovement2:
	step_up
	turn_head_down
	step_end

ElmDiscoveries:
	text "ALDER: Keep up the"
	line "excellent work and"
	
	para "who knows what you"
	line "might discover!"
	done
	
ElmGoToHardrootTownText:
	text "ALDER: Go check"
	line "out the boulders"
	cont "in HARDROOT TOWN."
	
	para "I'm counting on"
	line "you!"
	done
	
ElmText_Intro:
	text "ALDER: <PLAY_G>!"
	line "So good to see"
	cont "you!"

	para "I've just finished"
	line "cleaning up for"
	cont "the big day!"
	
	para "It's time for you"
	line "to pick your first"
	cont "#MON!"
	
	para "But, where is"
	line "<RIVAL>?"
	
	para "I can't believe"
	line "they've forgotten."
	
	para "<PLAY_G>, do you"
	line "think you could"
	
	para "travel to"
	line "SILVERLEAF TOWN"
	cont "and bring her back"
	cont "here?"
	
	para "Hmm…"
	
	para "Well, it might not"
	line "be fair, but I'll"
	
	para "let you pick your"
	line "#MON first, so"
	
	para "you don't run into"
	line "any trouble on the"
	cont "way there."
	
	para "I have three #"
	line "BALLS here on the"
	cont "table with #-"
	cont "MON inside."
	
	para "You may pick one"
	line "to raise as a"
	cont "partner!"
	done

ElmText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "You're a great"
	line "help!"
	done

ElmText_Refused:
	text "But… Please, I"
	line "need your help!"
	done

ElmText_ResearchAmbitions:
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done

ElmText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para $56, $56, $56
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "ALDER: Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "ALDER: You'll take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

TakeTotodileText:
	text "ALDER: Do you want"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "ALDER: So, you"
	
	line "like BULBASAUR"
	para "the grass"
	line "#MON?"
	done

DidntChooseStarterText:
	text "ALDER: Think it"
	line "over carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "ALDER: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "<RIVAL> lives"
	line "just west of here."
	
	para "bring them back"
	line "to the lab so she"
	
	para "can choose a"
	line "#MON too!"
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you can"

	para "heal it with this"
	line "machine."

	para "You can use it"
	line "anytime you want."
	done

ElmDirectionsText3:
	text "<PLAY_G>, I"
	line "know you can do"
	cont "it!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "Head out to"
	line "SILVERLEAF TOWN!"
	
	para "It's west of here,"
	line "remember?"	
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ALDER."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmAfterTheftText1:
	text "ALDER: Keep it up,"
	line "<PLAY_G>!"
	
	para "I know you can"
	line "shoot to the top!"
	done

ElmAfterTheftText2:
	text "<PLAYER> handed"
	line "the MYSTERY EGG to"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "ELM: This?"
	done

ElmAfterTheftText4:
	text "But… Is it a"
	line "#MON EGG?"

	para "If it is, it is a"
	line "great discovery!"
	done

ElmAfterTheftText5:
	text "ELM: What?!?"

	para "PROF.OAK gave you"
	line "a #DEX?"

	para "<PLAY_G>, is that"
	line "true? Th-that's"
	cont "incredible!"

	para "He is superb at"
	line "seeing the poten-"
	cont "tial of people as"
	cont "trainers."

	para "Wow, <PLAY_G>. You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too."

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "The closest GYM"
	line "would be the one"
	cont "in VIOLET CITY."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. The"
	line "road to the"

	para "championship will"
	line "be a long one."

	para "Before you leave,"
	line "make sure that you"
	cont "talk to your MOM"
	done

ElmStudyingEggText:
	text "…<PLAY_G>. The"
	line "path to the"

	para "championship will"
	line "be a hard one."

	para "Before you go,"
	line "make sure that you"
	cont "talk to your MOM."
	
	para "she'll want to"
	line "know if you've"
	cont "left."
	done

ElmAideHasEggText:
	text "ELM: Ah, life"
	line "is good."
	
	para "So many discover-"
	line "ies to be made!"
	done

ElmWaitingEggHatchText:
	text "ELM: Hey, has that"
	line "EGG changed any?"
	done

UnknownText_0x79a40:
	text "<PLAY_G>? I thought"
	line "the EGG hatched."

	para "Where is the"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, you"
	line "look great!"
	done

ShowElmTogepiText2:
	text "What?"
	line "That #MON!?!"
	done

ShowElmTogepiText3:
	text "The EGG hatched!"
	line "So, #MON are"
	cont "born from EGGS…"

	para "No, perhaps not"
	line "all #MON are."

	para "Wow, there's still"
	line "a lot of research"
	cont "to be done."
	done

ElmGiveEverstoneText1:
	text "Thanks, <PLAY_G>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done

ElmGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

ElmText_CallYou:
	text "ALDER: <PLAY_G>"
	line "I'll call you if"
	cont "anything comes up."
	done

AideText_AfterTheft:
	text "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done

ElmGiveMasterBallText1:
	text "ALDER: Hi,"
	line "<PLAY_G>!"

	para "Research is going"
	line "swimmingly!"

	para "I want you to"
	line "have this."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the greatest!"

	para "It is the ultimate"
	line "in # BALL"
	cont "technology."
	
	para "It will catch any"
	line "#MON without"
	cont "fail!"
	
	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "But I think you"
	line "need it more than"
	cont "me."
	done

ElmGiveTicketText1:
	text "ALDER: <PLAY_G>!"
	line "You're here!"

	para "I've got a really"
	line "important job for"
	cont "you!"
	
	para "Have you been to"
	line "the boulders up"
	cont "in HARDROOT TOWN?"
	
	para "I've heard that"
	line "apparently they're"
	
	para "somehow linked to"
	line "a strange power."
	
	para "I'd go check it"
	line "out myself, but"
	
	para "you've more than"
	line "proved your worth"
	cont "as a trainer!"
	
	para "I'm counting on"
	line "you!"
	done

ElmGiveTicketText1Alt:
	text "I've got a really"
	line "important job for"
	cont "you!"
	
	para "Have you been to"
	line "the boulders up"
	cont "in HARDROOT TOWN?"
	
	para "I've heard that"
	line "apparently they're"
	
	para "somehow linked to"
	line "a strange power."
	
	para "I'd go check it"
	line "out myself, but"
	
	para "you've more than"
	line "proved your worth"
	cont "as a trainer!"
	
	para "I'm counting on"
	line "you!"
	done
	
ElmGiveTicketText2:
	text "Looks like you're"
	line "in for another ad-"
	cont "venture, <PLAYER>."
	
	para "Be sure to docu-"
	line "ment all the new"
	
	para "#MON you can"
	line "find!"
	
	para "It's always fun"
	line "to explore with"
	cont "#MON!"
	done

ElmsLabSignpostText_Egg:
	text "It's the #MON"
	line "EGG being studied"
	cont "by PROF.ELM."
	done

AideText_GiveYouPotions:
	text "<PLAY_G>, you"
	line "should take this"
	
	para "in case you run"
	line "into some trouble."
	done

AideText_AlwaysBusy:
	text "Keep it up,"
	line "<PLAY_G>!"
	done

AideText_TheftTestimony:
	text "There was a loud"
	line "noise outside…"

	para "When we went to"
	line "look, someone"
	cont "stole a #MON."

	para "It's unbelievable"
	line "that anyone would"
	cont "do that!"

	para "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Use these on your"
	line "#DEX quest!"
	done

AideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

ElmsLabOfficerText1:
	text "<RIVAL>: About"
	line "time you got here,"
	cont "<PLAY_G>."
	
	para "PROF. ALDER let me"
	line "have his strongest"
	cont "#MON!"
	
	para "It's way better"
	line "than yours!"
	done
	
BattleOfferText:
	text "Hey, how about I"
	line "show you with a"
	cont "battle?"
	
	para "I'm not going to"
	line "hold back."
	done
	
ElmsLabOfficerTextTemp:
	text "INSERT RIVAL"
	line "BATTLE HERE"
	done

ElmsLabOfficerText2:
	text "Humph."
	
	para "I have no words"
	line "for you."
	
	para "Catch ya later,"
	line "dog breath."
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "There's some broken"
	line "# BALLS in"
	cont "here."
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done
	
ElmsLab_GiveDexText:
	text "ALDER: Oh,"
	line "<PLAYER>!"
	cont "I must not forget!"
	
	para "Every trainer"
	line "shouldn't be with-"
	cont "out one of these."
	done	
	
ElmsLab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done	

ElmsLab_GiveDexText2:
	text "It's a #MON"
	line "ENCYLOPEDIA!"
	
	para "Fill it up with"
	line "information as"
	
	para "you catch #-"
	line "MON."
	
	para "It's time for you"
	line "to finally go out"
	cont "your own."
	
	para "Make us all proud,"
	line "<PLAY_G>!"
	
	para "I'll call you on"
	line "your cell phone if"
	
	para "anything important"
	line "comes up."
	done

LabRivalWinText:
	text "Beginner's luck."
	line "I clearly picked"
	cont "the wrong #MON."
	done

LabRivalLossText:
	text "I knew you didn't"
	line "have it in you."
	done 

ElmAlsoText:
	text "Oh, also!"
	line "Before I forget--"
	done
	
ElmsLab_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 11, 4, 1, NEW_BARK_TOWN
	warp_def 11, 5, 1, NEW_BARK_TOWN

.CoordEvents: db 8
	xy_trigger 1, 6, 4, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 1, 6, 5, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 3, 5, 4, 0, MeetCopScript, 0, 0
	xy_trigger 3, 5, 5, 0, MeetCopScript2, 0, 0
	xy_trigger 5, 8, 4, 0, AideScript_WalkPotions1, 0, 0
	xy_trigger 5, 8, 5, 0, AideScript_WalkPotions2, 0, 0
	xy_trigger 6, 8, 4, 0, AideScript_WalkBalls1, 0, 0
	xy_trigger 6, 8, 5, 0, AideScript_WalkBalls2, 0, 0

.BGEvents: db 16
	signpost 1, 2, SIGNPOST_READ, ElmsLabHealingMachine
	signpost 1, 6, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 7, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 8, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 9, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 0, SIGNPOST_READ, ElmsLabTravelTip1
	signpost 7, 1, SIGNPOST_READ, ElmsLabTravelTip2
	signpost 7, 2, SIGNPOST_READ, ElmsLabTravelTip3
	signpost 7, 3, SIGNPOST_READ, ElmsLabTravelTip4
	signpost 7, 6, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 7, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 8, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 9, SIGNPOST_READ, ElmsLabBookshelf
	signpost 3, 9, SIGNPOST_READ, ElmsLabTrashcan
	signpost 0, 5, SIGNPOST_READ, ElmsLabWindow
	signpost -3, 3, SIGNPOST_DOWN, ElmsLabPC

.ObjectEvents: db 6
	person_event SPRITE_ELM, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ProfElmScript, -1
	person_event SPRITE_SCIENTIST, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_SILVER, 3, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
