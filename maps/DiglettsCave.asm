const_value set 2
	const DIGLETTSCAVE_POKEFAN_M
	const DIG_KENNY
	const DIG_BRET
	const DIG_JOSH
	const DIG_HOLE
	const DIG_QUES1
	const DIG_QUES2
	const DIG_QUES3

DiglettsCave_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x74002:
	jumptextfaceplayer UnknownText_0x74008

DiglettsCaveHiddenMaxRevive:
	dwb EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE, MAX_REVIVE

TrainerBird_keeperBret:
	trainer EVENT_BEAT_BIRD_KEEPER_BRET, BIRD_KEEPER, BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText, 0, Bird_keeperBretScript

Bird_keeperBretScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a2662
	waitbutton
	closetext
	end
	
TrainerHikerKenny:
	trainer EVENT_BEAT_HIKER_KENNY, HIKER, KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, HikerKennyScript

HikerKennyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a26c2
	waitbutton
	closetext
	end
	
TrainerPokefanmJoshua:
	trainer EVENT_BEAT_POKEFANM_JOSHUA, POKEFANM, JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, PokefanmJoshuaScript

PokefanmJoshuaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a254f
	waitbutton
	closetext
	end

Route13AcreForestEntrySign:
	jumptext Route13AcreForestEntrySignText
	
Route13AcreForestExitSign:
	jumptext Route13AcreForestExitSignText

AcreForestHole:
	opentext
	checkevent EVENT_ACRE_FOREST_LOOKING_DAD
	iffalse .HearCry
	writetext AcreHole1
	yesorno
	iffalse .Done
;	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .PlayerJumpsUp
	if_equal DOWN, .PlayerJumpsDown
	if_equal LEFT, .PlayerJumpsLeft
	if_equal RIGHT, .PlayerJumpsRight
.HearCry	
	writetext AcreHole2
	yesorno
	iffalse .Done
;	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .PlayerJumpsUp
	if_equal DOWN, .PlayerJumpsDown
	if_equal LEFT, .PlayerJumpsLeft
	if_equal RIGHT, .PlayerJumpsRight
	
.PlayerJumpsUp
	applymovement PLAYER, AcreSlideStepUp
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement PLAYER, AcreJumpUp
	special FadeOutPalettes
	playsound SFX_KINESIS
	wait 10
	warpfacing UP, WHIRL_ISLAND_NE, 23, 3
	end
	
.PlayerJumpsDown
	applymovement PLAYER, AcreSlideStepDown
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement PLAYER, AcreJumpDown
	special FadeOutPalettes
	playsound SFX_KINESIS
	wait 10
	warpfacing DOWN, WHIRL_ISLAND_NE, 23, 3
	end
	
.PlayerJumpsLeft
	applymovement PLAYER, AcreSlideStepLeft
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement PLAYER, AcreJumpLeft
	special FadeOutPalettes
	playsound SFX_KINESIS
	wait 10
	warpfacing LEFT, WHIRL_ISLAND_NE, 23, 3
	end
	
.PlayerJumpsRight
	applymovement PLAYER, AcreSlideStepRight
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement PLAYER, AcreJumpRight
	special FadeOutPalettes
	playsound SFX_KINESIS
	wait 10
	warpfacing RIGHT, WHIRL_ISLAND_NE, 23, 3
	end
	
.Done
	closetext
	end

AcreForestQuestion1Script:
	faceplayer
	opentext
;	checkevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
;	iftrue .Question1Correct1
	writetext AcreTextQuizQuestion1
	yesorno
	iftrue .QuizQuestionWrong1
	writetext AcreTextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext AcreTextQuizAnswerRight1_1Ex
	waitbutton
	closetext
	setevent EVENT_ACRE_QUESTION_1
	setevent EVENT_ACRE_QUESTION_3
	setevent EVENT_ACRE_HOLE
	setevent EVENT_ACRE_FATHER
	setevent EVENT_FOREST_QUIZ_MASTER_IN_GATE
	playsound SFX_WARP_FROM
	applymovement DIG_QUES1, AcreWarpsAway
	disappear DIG_QUES1
	disappear DIG_QUES3
	disappear DIG_HOLE
	end	
	
.QuizQuestionWrong1
	playsound SFX_WRONG
	writetext AcreTextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ROUTE13FORESTGATES, 16, 5
	end
	
.Question1Correct1
	writetext TextQuizAnswered1
	waitbutton
	closetext
	end
	
AcreForestQuestion2Script:
	faceplayer
	opentext
;	checkevent EVENT_ILEX_FOREST_FARFETCHD
;	iftrue .Question1Correct2
	writetext AcreTextQuizQuestion2
	yesorno
	iffalse .QuizQuestionWrong2
	writetext AcreTextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext AcreTextQuizAnswerRight1_1
	waitbutton
	closetext
	setevent EVENT_ACRE_QUESTION_2
	playsound SFX_WARP_FROM
	applymovement DIG_QUES2, AcreWarpsAway
	disappear DIG_QUES2
	appear DIG_QUES3
	end

	
.QuizQuestionWrong2
	playsound SFX_WRONG
	writetext AcreTextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ROUTE13FORESTGATES, 16, 5
	end
	
.Question1Correct2
	writetext AcreTextQuizAnswered1
	waitbutton
	closetext
	end
	
AcreForestQuestion3Script:
	faceplayer
	opentext
;	checkevent EVENT_ILEX_FOREST_APPRENTICE
;	iftrue .Question1Correct3
	writetext AcreTextQuizQuestion3
	yesorno
	iffalse .QuizQuestionWrong3
	writetext AcreTextQuizAnswerRight1
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext AcreTextQuizAnswerRight1_1
	waitbutton
	closetext
	clearevent EVENT_ACRE_HOLE
	setevent EVENT_ACRE_QUESTION_3
	playsound SFX_WARP_FROM
	applymovement DIG_QUES3, AcreWarpsAway
	disappear DIG_QUES3
	appear DIG_HOLE
	end
	
.QuizQuestionWrong3
	playsound SFX_WRONG
	writetext AcreTextQuizAnswerWrong1
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing RIGHT, ROUTE13FORESTGATES, 16, 5
	end
	
.Question1Correct3
	writetext AcreTextQuizAnswered1
	waitbutton
	closetext
	end
	
AcreWarpsAway:
	teleport_from
	step_end
	
AcreSlideStepUp:
	fix_facing
	step_down
	step_end
	
AcreJumpUp:
	jump_step_up
	step_end
	
AcreSlideStepDown:
	fix_facing
	step_up
	step_end
	
AcreJumpDown:
	jump_step_down
	step_end
	
AcreSlideStepLeft:
	fix_facing
	step_right
	step_end
	
AcreJumpLeft:
	jump_step_left
	step_end
	
AcreSlideStepRight:
	fix_facing
	step_left
	step_end
	
AcreJumpRight:
	jump_step_right
	step_end

AcreTextQuizQuestion1 ;Answer is yes
	text "Hello again!"
	
	para "Guess who it is!"
	
	para "That's right, it's"
	line "me, the FOREST"
	cont "QUIZ MASTER!"
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Is the JANTO #-"
	line "MON LEAGUE CHAMP-"
	cont "ION's name EMMA?"
	done
	
AcreTextQuizQuestion2: ;Answer is no
	text "Answer all"
	line "correctly and"
	cont "you'll get a prize!"
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Does <RIVAL> have"
	line "a HITMONTOP in"
	cont "their party?"
	done
	
AcreTextQuizQuestion3: ;Answer is yes
	text "Answer all"
	line "correctly and"
	cont "you'll get a prize!"
	
	para "Answer incorrect-"
	line "ly and you'll"
	
	para "have to go back"
	line "to the entrance!"
	
	para "Is this region"
	line "KOHTO, west of"
	cont "JANTO?"
	done
	
AcreTextQuizAnswerRight1
	text "Well done!"
	done
	
AcreTextQuizAnswerRight1_1Ex:
	text "I'm gonna go hide"
	line "again."
	
	para "If you find me and"
	line "answer all my"
	
	para "questions corr-"
	line "ectly you'll"
	cont "get a prize!"
	done
	
AcreTextQuizAnswerRight1_1
	text "Come find me"
	line "again!"
	done
	
AcreTextQuizAnswerWrong1
	text "I'm sorry but that"
	line "is incorrect!"
	
	para "Now you'll have to"
	line "go back to the"
	cont "entrance!"
	done
	
AcreTextQuizAnswered1
	text "You're done."
	done
	
AcreHole1:
	text "It's a hole."
	
	para "Jump down it?"
	done
	
AcreHole2:
	text "Huh. It's a hole."
	
	para "You can hear a cry"
	line "deep inside."
	
	para "Jump down it?"
	done
	
Route13AcreForestExitSignText:
	text "Thank you for"
	line "respecting and"
	
	para "caring for our"
	line "forest."
	done

Route13AcreForestEntrySignText:
	text "Please take only"
	line "photos, and leave"
	cont "only footprints."
	
	para "Keep our forest"
	line "beautiful!"
	done
	
PokefanmJoshuaSeenText:
	text "Are you playing"
	line "silly games in"
	cont "here?"
	
	para "Me too!"
	done

PokefanmJoshuaBeatenText:
	text "Hey now, hey hey!"
	done

UnknownText_0x1a254f:
	text "I love to explore"
	line "anywhere."
	
	para "When I'm with my"
	line "#MON,"
	
	para "everything is"
	line "exciting!"
	done
	
Bird_keeperBretSeenText:
	text "Check out the"
	line "feathers on my"
	cont "#MON!"
	done

Bird_keeperBretBeatenText:
	text "I'm all ruffled"
	line "now."
	done

UnknownText_0x1a2662:
	text "There's nothing"
	line "I love more than"
	
	para "flying high above"
	line "the region on my"
	cont "#MON."
	done
	
HikerKennySeenText:
	text "I should test"
	line "out my skills"
	cont "on you."
	done

HikerKennyBeatenText:
	text "I lost… Again!"
	done

UnknownText_0x1a26c2:
	text "This place is"
	line "a danger to my"
	cont "#MON."
	
	para "I might run in"
	line "to more trainers"
	cont "like you!"
	done

UnknownText_0x74008:
	text "Oh my, oh dear…"
	
	para "My boy is missing."
	
	para "He's keeps hanging"
	line "around in"
	cont "dangerous forests."
	done

DiglettsCave_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 6, 5, 3, ROUTE13FORESTGATES
	warp_def 7, 5, 4, ROUTE13FORESTGATES
	warp_def 32, 31, 5, ROUTE13FORESTGATES
	warp_def 33, 31, 6, ROUTE13FORESTGATES
	warp_def 0, 1, 2, DIGLETTS_CAVE
	warp_def 4, 20, 2, WHIRL_ISLAND_NE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 5, 12, SIGNPOST_ITEM, DiglettsCaveHiddenMaxRevive
	signpost 29, 27, SIGNPOST_READ, Route13AcreForestExitSign
	signpost 13, 5, SIGNPOST_READ, Route13AcreForestEntrySign

.ObjectEvents: db 8
	person_event SPRITE_GENTLEMAN, 13, 19, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x74002, EVENT_ACRE_FOREST_LOOKING_DAD
	person_event SPRITE_POKEFAN_M, 28, 26, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerHikerKenny, -1
	person_event SPRITE_YOUNGSTER, 17, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperBret, -1
	person_event SPRITE_POKEFAN_M, 22, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerPokefanmJoshua, -1
	person_event SPRITE_UNUSED_GUY, 4, 20, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AcreForestHole, EVENT_ACRE_HOLE
	person_event SPRITE_BUG_CATCHER, 26, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcreForestQuestion1Script, EVENT_ACRE_QUESTION_1
	person_event SPRITE_BUG_CATCHER, 22, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcreForestQuestion2Script, EVENT_ACRE_QUESTION_2
	person_event SPRITE_BUG_CATCHER, 42, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcreForestQuestion3Script, EVENT_ACRE_QUESTION_3
