;
;Find something for the Headbutt man to do.
;

const_value set 2
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_YOUNGSTER1
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4
	const ILEXFOREST_QUIZ1
	const ILEXFOREST_QUIZ2
	const ILEXFOREST_QUIZ3

IlexForest_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

	; callbacks

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iftrue .DoneFarfetchd
	writetext UnknownText_0x6ef5c
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext UnknownText_0x6f019
	waitbutton
	closetext
	end

.CryAndCheckFacing:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	checkcode VAR_FACING
	end

IlexForestCharcoalMasterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext Text_CharcoalMasterIntro
	buttonsound
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

.AlreadyGotCut:
	writetext Text_CharcoalMasterTalkAfter
	waitbutton
	closetext
	end

; HERE WHEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
; NEW SCRIPT TEST
	
IlexForestQuestion1Script:
	faceplayer
	opentext
	checkevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	iftrue .Question1Correct1
	writetext TextQuizQuestion1
	yesorno
	iffalse .QuizQuestionWrong1
	writetext TextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext TextQuizAnswerRight1_1
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	applymovement ILEXFOREST_QUIZ1, QuestionCorrectMove1
	disappear ILEXFOREST_QUIZ1
	end	
	
.QuizQuestionWrong1
	playsound SFX_WRONG
	writetext TextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ILEX_FOREST_AZALEA_GATE, $0, $5
	end
	
.Question1Correct1
	writetext TextQuizAnswered1
	waitbutton
	closetext
	end
	
IlexForestQuestion2Script:
	faceplayer
	opentext
	checkevent EVENT_ILEX_FOREST_FARFETCHD
	iftrue .Question1Correct2
	writetext TextQuizQuestion2
	yesorno
	iftrue .QuizQuestionWrong2
	writetext TextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext TextQuizAnswerRight1_1
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	applymovement ILEXFOREST_QUIZ2, QuestionCorrectMove2
	disappear ILEXFOREST_QUIZ2
	end

	
.QuizQuestionWrong2
	playsound SFX_WRONG
	writetext TextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ILEX_FOREST_AZALEA_GATE, $0, $5
	end
	
.Question1Correct2
	writetext TextQuizAnswered1
	waitbutton
	closetext
	end
	
IlexForestQuestion3Script:
	faceplayer
	opentext
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .Question1Correct3
	writetext TextQuizQuestion3
	yesorno
	iffalse .QuizQuestionWrong3
	writetext TextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext TextQuizAnswerRight1_1
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_APPRENTICE
	applymovement ILEXFOREST_QUIZ3, QuestionCorrectMove3
	disappear ILEXFOREST_QUIZ3
	end
	
.QuizQuestionWrong3
	playsound SFX_WRONG
	writetext TextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ILEX_FOREST_AZALEA_GATE, $0, $5
	end
	
.Question1Correct3
	writetext TextQuizAnswered1
	waitbutton
	closetext
	end

IlexForestRandomDudeScript:
	faceplayer
	opentext
	writetext IlexForestRandomDudeText
;	checkevent EVENT_GOT_TM02_HEADBUTT
;	iftrue .AlreadyGotHeadbutt
;	writetext Text_HeadbuttIntro
;	buttonsound
;	verbosegiveitem TM_HEADBUTT
;	iffalse .BagFull
;	setevent EVENT_GOT_TM02_HEADBUTT
;.AlreadyGotHeadbutt:
;	writetext Text_HeadbuttOutro
	waitbutton
;.BagFull:
	closetext
	end

TrainerBug_catcherWayne:
	trainer EVENT_BEAT_BUG_CATCHER_WAYNE, BUG_CATCHER, WAYNE, Bug_catcherWayneSeenText, Bug_catcherWayneBeatenText, 0, Bug_catcherWayneScript

Bug_catcherWayneScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherWayneAfterText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	dwb EVENT_ILEX_FOREST_HIDDEN_ETHER, ETHER


IlexForestHiddenSuperPotion:
	dwb EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION, SUPER_POTION


IlexForestHiddenFullHeal:
	dwb EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL, FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

MapIlexForestSignpost0Script:
	jumptext Text_IlexForestSignpost0

MapIlexForestSignpost4Script:
	jumptext Text_IlexForestShrine
;	checkevent EVENT_FOREST_IS_RESTLESS
;	iftrue .ForestIsRestless
;	jump .DontDoCelebiEvent

.ForestIsRestless:
;	checkitem GS_BALL
;	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
;	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_0x6ef58
	pause 30
	spriteface PLAYER, DOWN
	pause 20
	clearflag ENGINE_HAVE_EXAMINED_GS_BALL
	special Special_CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckCaughtCelebi
	iffalse .DidntCatchCelebi
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, MovementData_0x6ef4e
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, MovementData_0x6ef53
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_down
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step_left
	jump_step_left
	big_step_left
	big_step_left
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step_right
	turn_head_up
	step_sleep_1
	turn_head_down
	step_sleep_1
	turn_head_up
	step_sleep_1
	big_step_down
	big_step_down
	fix_facing
	jump_step_up
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step_down
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step_left
	big_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step_left
	big_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ef4e:
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x6ef53:
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x6ef58:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

QuestionCorrectMove1:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end
	
QuestionCorrectMove2:
	step_right
	step_right
	step_right
	step_up
	step_up
	step_right
	step_right
	step_end
	
QuestionCorrectMove3:
	step_left
	step_left
	step_left
	step_left
	step_end
	
UnknownText_0x6ef5c:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

UnknownText_0x6f019:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

Text_ItsTheMissingPokemon:
	text "It's the missing"
	line "#MON!"
	done

Text_Kwaaaa:
	text "FARFETCH'D: Kwaa!"
	done

IlexForestRandomDudeText:
	text "Man, foliage is"
	line "like…"
	
	para "So beautiful,"
	line "man."
	done
	
Text_CharcoalMasterIntro:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

Text_CharcoalMasterOutro:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

Text_CharcoalMasterTalkAfter:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

Text_HeadbuttOutro:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

Text_IlexForestLass:
	text "Some annoying kid"
	line "was asking me"
	
	para "difficult ques-"
	line "tions and kicking"
	
	para "me out of the"
	line "forest!"
	
	para "What is his"
	line "deal?"
	done

Text_IlexForestSignpost0:
	text "ILEX FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestShrine:
	text "CALLOW FOREST"
	
	para "Fresh Leaves"
	line "Breathe In New"
	cont "Life"
	done

Text_ShrineCelebiEvent:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS BALL would fit"
	line "inside it."

	para "Want to put the GS"
	line "BALL here?"
	done

Text_InsertGSBall:
	text "<PLAYER> put in the"
	line "GS BALL."
	done

Text_KurtCaughtCelebi:
	text "Whew, wasn't that"
	line "something!"

	para "<PLAYER>, that was"
	line "fantastic. Thanks!"

	para "The legends about"
	line "that SHRINE were"
	cont "real after all."

	para "I feel inspired by"
	line "what I just saw."

	para "It motivates me to"
	line "make better BALLS!"

	para "I'm going!"
	done

Bug_catcherWayneSeenText:
	text "Surprise!"
	done

Bug_catcherWayneBeatenText:
	text "My net broke!"
	done

Bug_catcherWayneAfterText:
	text "Just like when a"
	line "a bug lands on"
	cont "you."
	
	para "You never suspect"
	line "it, and your heart"
	cont "skips a beat!"
	done
	
TextQuizQuestion1 ;Answer is yes
	text "Hello!"
	
	para "I'm the FOREST QUIZ"
	line "MASTER!"
	
	para "Answer correctly"
	line "and you'll get to"
	cont "pass."
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Is the #MON"
	line "LEAGUE west of"
	cont "SILVERLEAF TOWN?"
	done
	
TextQuizQuestion2: ;Answer is no
	text "Answer correctly"
	line "and you'll get to"
	cont "pass."
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Is FELONWOOD TOWN"
	line "a place that can"
	cont "be found in JANTO?"
	done
	
TextQuizQuestion3: ;Answer is yes
	text "Answer correctly"
	line "and you'll get to"
	cont "pass."
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Can a GREAT BALL"
	line "be found in"
	cont "BRONZE CAVE?"
	done
	
TextQuizAnswerRight1
	text "Well done!"
	done
	
TextQuizAnswerRight1_1
	text "You may pass on"
	line "through!"
	done
	
TextQuizAnswerWrong1
	text "I'm sorry but that"
	line "is incorrect!"
	
	para "Now you'll have to"
	line "go back to the"
	cont "entrance!"
	done
	
TextQuizAnswered1
	text "You're done."
	done

IlexForest_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 2, 2, 3, ROUTE_34_ILEX_FOREST_GATE
	warp_def 42, 27, 1, ILEX_FOREST_AZALEA_GATE
	warp_def 43, 27, 2, ILEX_FOREST_AZALEA_GATE
	warp_def 2, 3, 4, ROUTE_34_ILEX_FOREST_GATE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 17, 3, SIGNPOST_READ, MapIlexForestSignpost0Script
	signpost 22, 23, SIGNPOST_ITEM, IlexForestHiddenEther
	signpost 34, 18, SIGNPOST_ITEM, IlexForestHiddenSuperPotion
	signpost 3, 7, SIGNPOST_ITEM, IlexForestHiddenFullHeal
	signpost 41, 19, SIGNPOST_READ, MapIlexForestSignpost4Script

.ObjectEvents: db 14
	person_event SPRITE_BIRD, 42, 0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, -1
	person_event SPRITE_YOUNGSTER, 43, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, -1
	person_event SPRITE_BLACK_BELT, 43, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, -1
	person_event SPRITE_FISHER, 20, 14, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestRandomDudeScript, -1
	person_event SPRITE_POKE_BALL, 3, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	person_event SPRITE_KURT, 43, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	person_event SPRITE_LASS, 42, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestLassScript, -1
	person_event SPRITE_YOUNGSTER, 13, 27, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 5, TrainerBug_catcherWayne, -1
	person_event SPRITE_POKE_BALL, 12, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	person_event SPRITE_POKE_BALL, 26, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	person_event SPRITE_POKE_BALL, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
	person_event SPRITE_BUG_CATCHER, 31, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, IlexForestQuestion1Script, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	person_event SPRITE_BUG_CATCHER, 15, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, IlexForestQuestion2Script, EVENT_ILEX_FOREST_FARFETCHD
	person_event SPRITE_BUG_CATCHER, 7, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, IlexForestQuestion3Script, EVENT_ILEX_FOREST_APPRENTICE
