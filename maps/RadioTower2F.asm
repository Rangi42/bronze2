const_value set 2
	const RADIOTOWER2F_POKE_BALL
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST
	const RADIOTOWER2F_POKE_BALL2

RadioTower2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UnknownScript_0x5d6fd:
	end

Radio2FCoinCaseBall:
	giveitem COIN_CASE
;	iffalse .BagFull
	disappear RADIOTOWER2F_POKE_BALL2
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	opentext
	writetext Text_FoundCoinCase
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext Text_FoundCoinCaseCont
	waitbutton
	closetext
	end

Radio2FBall:
	giveitem BASEMENT_KEY
;	iffalse .BagFull
	disappear RADIOTOWER2F_POKE_BALL
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	opentext
	writetext Text_FoundBuildingKey
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext Text_FoundBuildingKeyCont
	waitbutton
	closetext
	end

TeacherScript_0x5d701:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext UnknownText_0x5d956
	waitbutton
	closetext
	end

.Rockets:
	writetext UnknownText_0x5d983
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

BlackBeltScript_0x5d71f:
	jumptextfaceplayer UnknownText_0x5d9cb

BlackBeltScript_0x5d722:
	jumptextfaceplayer UnknownText_0x5da44

TrainerGruntM4:
	trainer EVENT_BEAT_ROCKET_GRUNTM_4, GRUNTM, 4, GruntM4SeenText, GruntM4BeatenText, 0, GruntM4Script

GruntM4Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5db07
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer EVENT_BEAT_ROCKET_GRUNTM_5, GRUNTM, 5, GruntM5SeenText, GruntM5BeatenText, 0, GruntM5Script

GruntM5Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5db99
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer EVENT_BEAT_ROCKET_GRUNTM_6, GRUNTM, 6, GruntM6SeenText, GruntM6BeatenText, 0, GruntM6Script

GruntM6Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5dc00
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer EVENT_BEAT_ROCKET_GRUNTF_2, GRUNTF, 2, GruntF2SeenText, GruntF2BeatenText, 0, GruntF2Script

GruntF2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5dcd0
	waitbutton
	closetext
	end

Buena:
;	faceplayer
;	opentext
;	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	iftrue UnknownScript_0x5d865
;	checkevent EVENT_MET_BUENA
;	iffalse UnknownScript_0x5d800
;	checkflag ENGINE_BUENAS_PASSWORD_2
;	iftrue UnknownScript_0x5d82f
;	checkcode VAR_HOUR
;	if_less_than 18, UnknownScript_0x5d893
;	checkflag ENGINE_BUENAS_PASSWORD
;	iffalse UnknownScript_0x5d80a
;	checkitem BLUE_CARD
;	iffalse UnknownScript_0x5d86b
;	checkcode VAR_BLUECARDBALANCE
;	if_equal 30, UnknownScript_0x5d87f
;	playmusic MUSIC_BUENAS_PASSWORD
;	writetext UnknownText_0x5de35
;	special AskRememberPassword
;	iffalse UnknownScript_0x5d81e
;	writetext UnknownText_0x5de84
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	checkcode VAR_FACING
;	if_not_equal RIGHT, UnknownScript_0x5d7be
;	applymovement PLAYER, MovementData_0x5d921
UnknownScript_0x5d7be:
;	spriteface PLAYER, RIGHT
;	opentext
;	writetext UnknownText_0x5dedd
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, DOWN
;	refreshscreen $0
;	special SpecialBuenasPassword
;	closetext
;	iffalse UnknownScript_0x5d845
;	opentext
;	writetext UnknownText_0x5dfc1
	waitbutton
;	closetext
;	checkcode VAR_BLUECARDBALANCE
;	addvar $1
;	writevarcode VAR_BLUECARDBALANCE
;	waitsfx
;	playsound SFX_TRANSACTION
;	setflag ENGINE_BUENAS_PASSWORD_2
;	pause 20
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	opentext
;	writetext UnknownText_0x5e054
;	waitbutton
;	closetext
;	special Special_FadeOutMusic
;	pause 20
;	special RestartMapMusic
;	checkcode VAR_BLUECARDBALANCE
;	if_equal $1e, UnknownScript_0x5d8a4
	end

UnknownScript_0x5d800:
;	writetext UnknownText_0x5dcf4
;	buttonsound
;	setevent EVENT_MET_BUENA
;	verbosegiveitem BLUE_CARD
UnknownScript_0x5d80a:
;	writetext UnknownText_0x5de10
;	waitbutton
;	closetext
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d81a
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
;	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d81a:
;	spriteface RADIOTOWER2F_BUENA, RIGHT
	end

UnknownScript_0x5d81e:
;	writetext UnknownText_0x5df29
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	special Special_FadeOutMusic
;	pause 20
;	special RestartMapMusic
	end

UnknownScript_0x5d82f:
;	writetext UnknownText_0x5df6c
;	waitbutton
;	closetext
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d83f
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
;	iftrue UnknownScript_0x5d8cc
;UnknownScript_0x5d83f:
;	spriteface RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

UnknownScript_0x5d845:
;	setflag ENGINE_BUENAS_PASSWORD_2
;	opentext
;	writetext UnknownText_0x5e01c
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	pause 20
;	opentext
;	writetext UnknownText_0x5e054
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	special Special_FadeOutMusic
;	pause 20
;	special RestartMapMusic
	end

UnknownScript_0x5d865:
;	writetext UnknownText_0x5e0c2
;	waitbutton
;	closetext
	end

UnknownScript_0x5d86b:
;	writetext UnknownText_0x5e192
;	waitbutton
;	closetext
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d87b
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
;	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d87b:
;	spriteface RADIOTOWER2F_BUENA, RIGHT
	end

UnknownScript_0x5d87f:
;	writetext UnknownText_0x5e0f1
;	waitbutton
;	closetext
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d88f
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
;	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d88f:
;	spriteface RADIOTOWER2F_BUENA, RIGHT
	end

UnknownScript_0x5d893:
;	writetext UnknownText_0x5e131
;	waitbutton
;	closetext
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d8a3
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
;	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d8a3:
	end

UnknownScript_0x5d8a4:
;	checkcellnum PHONE_BUENA
;	iftrue UnknownScript_0x5d8fe
;	pause 20
;	spriteface RADIOTOWER2F_BUENA, DOWN
;	pause 15
;	spriteface PLAYER, UP
;	pause 15
;	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
;	iftrue UnknownScript_0x5d8cc
;	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
;	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
;	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
;	opentext
;	writetext UnknownText_0x5e1ee
;	jump UnknownScript_0x5d8d0

UnknownScript_0x5d8cc:
;	opentext
;	writetext UnknownText_0x5e2bf
UnknownScript_0x5d8d0:
;	askforphonenumber PHONE_BUENA
;	if_equal $1, UnknownScript_0x5d8f6
;	if_equal $2, UnknownScript_0x5d8ed
;	writetext UnknownText_0x5e2f3
;	playsound SFX_REGISTER_PHONE_NUMBER
;	waitsfx
;	buttonsound
;	writetext UnknownText_0x5e310
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
;	addcellnum PHONE_BUENA
	end

UnknownScript_0x5d8ed:
;	writetext UnknownText_0x5e33c
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
	end

UnknownScript_0x5d8f6:
;	writetext UnknownText_0x5e35e
;	waitbutton
;	closetext
;	spriteface RADIOTOWER2F_BUENA, RIGHT
UnknownScript_0x5d8fe:
	end

ReceptionistScript_0x5d8ff:
;	faceplayer
;	opentext
;	checkitem BLUE_CARD
;	iffalse UnknownScript_0x5d90f
;	writetext UnknownText_0x5e392
;	buttonsound
;	special SpecialBuenaPrize
;	closetext
	end

UnknownScript_0x5d90f:
;	writetext UnknownText_0x5e3d8
;	buttonsound
;	closetext
	end

MapRadioTower2FSignpost0Script:
	jumptext UnknownText_0x5e426

MapRadioTower2FSignpost1Script:
	jumptext UnknownText_0x5e430

MapRadioTower2FSignpost5Script:
	jumptext UnknownText_0x5e463

RadioTower2FBookshelf:
	jumpstd magazinebookshelf

MovementData_0x5d921:
	slow_step_down
	slow_step_right
	step_end

Text_FoundCoinCase:
	text "<PLAYER> found"
	line "COIN CASE!"
	done
	
Text_FoundCoinCaseCont:
	text "<PLAYER> put the"
	line "COIN CASE"
	
	para "in the KEY ITEMS"
	line "POCKET."
	done
	
Text_FoundBuildingKey:
	text "<PLAYER> found"
	line "BUILDING KEY!"
	done
	
Text_FoundBuildingKeyCont:
	text "<PLAYER> put the"
	line "BUILDING KEY"
	
	para "in the KEY ITEMS"
	line "POCKET."
	done
	
UnknownText_0x5d924:
	text "You can listen to"
	line "the radio any-"
	cont "where. Tune in!"
	done

UnknownText_0x5d956:
	text "Lullabies on the"
	line "radio may make"
	cont "#MON sleep."
	done

UnknownText_0x5d983:
	text "Why would they"
	line "want to take over"
	cont "the RADIO TOWER?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

UnknownText_0x5d9cb:
	text "Sorry. Authorized"
	line "personnel only"
	cont "beyond this point."

	para "It wasn't that way"
	line "before."

	para "There's something"
	line "wrong with the"
	cont "DIRECTOR…"
	done

UnknownText_0x5da44:
	text "Feel free to look"
	line "around anywhere."

	para "The DIRECTOR is"
	line "nice again, just"
	cont "as he was before."
	done

GruntM4SeenText:
	text "We won't be"
	line "stopped again."
	done

GruntM4BeatenText:
	text "Great. Now I'm"
	line "fired."
	done

UnknownText_0x5db07:
	text "Our plans won't"
	line "be ruined by you."
	done

GruntM5SeenText:
	text "You've never faced"
	line "a foe quite like"
	cont "TEAM ROCKET!"
	done

GruntM5BeatenText:
	text "What are you,"
	line "trying to be?"
	
	para "Some kind of"
	line "hero?"
	done

UnknownText_0x5db99:
	text "We do whatever"
	line "we like."
	done

GruntM6SeenText:
	text "Oh no!"
	
	para "Our GAME CORNER"
	line "hidout plan"
	cont "failed!"
	
	para "I'm guarding"
	line "the key to the"
	cont "TV STATION."
	
	para "So there's no way"
	line "I'm letting you"
	cont "have it!"
	done

GruntM6BeatenText:
	text "Arggh. I give up."
	done

UnknownText_0x5dc00:
	text "Oh no!"
	
	para "The BUILDING KEY"
	line "is in the open!"
	done

GruntF2SeenText:
	text "Hey!"
	
	para "You can't come in"
	line "here!"
	done

GruntF2BeatenText:
	text "Why have you done"
	line "this?"
	done

UnknownText_0x5dcd0:
	text "I thought hiding"
	line "in the basement"
	
	para "of the GAME CORNER"
	line "was a surefire"
	cont "plan."
	done

UnknownText_0x5dcf4:
	text "BUENA: Hi! I'm"
	line "BUENA!"

	para "Do you know about"
	line "a radio program"
	cont "called PASSWORD?"

	para "If you can tell me"
	line "the password from"

	para "the program, you"
	line "will earn points."

	para "Save up those"
	line "points and trade"

	para "them to that sweet"
	line "young lady over"

	para "there for some"
	line "choice prizes!"

	para "Here you go!"

	para "It's your very own"
	line "point card!"
	done

UnknownText_0x5de10:
	text "BUENA: Tune in to"
	line "my PASSWORD SHOW!"
	done

UnknownText_0x5de35:
	text "BUENA: Hi!"
	line "Did you tune in to"
	cont "my radio show?"

	para "Do you remember"
	line "today's password?"
	done

UnknownText_0x5de84:
	text "BUENA: Oh, wow!"
	line "Thank you!"

	para "What was your name"
	line "again?"

	para "…<PLAY_G>, OK!"

	para "Come on, <PLAY_G>."
	line "Join the show."
	done

UnknownText_0x5dedd:
	text "BUENA: Everyone"
	line "ready?"

	para "I want to hear you"
	line "shout out today's"

	para "password for"
	line "<PLAY_G>!"
	done

UnknownText_0x5df29:
	text "BUENA: Come back"
	line "after you listen"

	para "to my show, OK?"
	line "Catch ya later!"
	done

UnknownText_0x5df6c:
	text "BUENA: Sorry…"

	para "You get just one"
	line "chance each day."

	para "Come back tomorrow"
	line "for another try!"
	done

UnknownText_0x5dfc1:
	text "BUENA: YIPPEE!"
	line "That's right!"

	para "You did tune in!"
	line "I'm so happy!"

	para "You earned one"
	line "point! Congrats!"
	done

UnknownText_0x5e01c:
	text "BUENA: Aww…"
	line "That's not it…"

	para "Did you forget the"
	line "password?"
	done

UnknownText_0x5e054:
	text "BUENA: Yup! Our"
	line "contestant was"

	para "<PLAY_G>."
	line "Thanks for coming!"

	para "I hope all you"
	line "listeners will"

	para "come too!"
	line "I'll be waiting!"
	done

UnknownText_0x5e0c2:
	text "BUENA: Huh?"
	line "Today's password?"

	para "HELP, of course!"
	done

UnknownText_0x5e0f1:
	text "BUENA: Your BLUE"
	line "CARD's full."

	para "Trade it in for a"
	line "fabulous prize!"
	done

UnknownText_0x5e131:
	text "BUENA: Tune in to"
	line "PASSWORD every"

	para "night from six to"
	line "midnight!"

	para "Tune in, then drop"
	line "in for a visit!"
	done

UnknownText_0x5e192:
	text "BUENA: Oh? You"
	line "forgot to bring"
	cont "your BLUE CARD?"

	para "I can't give you"
	line "points if you"
	cont "don't have it."
	done

UnknownText_0x5e1ee:
	text "BUENA: Oh! Your"
	line "BLUE CARD reached"

	para "30 points today!"
	line "That's so wild!"

	para "Hmm… There isn't a"
	line "prize for hitting"
	cont "30 points, but…"

	para "You came by so"
	line "often, <PLAY_G>."

	para "I'll make you a"
	line "special deal!"

	para "How would you like"
	line "my phone number?"
	done

UnknownText_0x5e2bf:
	text "BUENA: <PLAY_G>,"
	line "do you want to"

	para "register my phone"
	line "number?"
	done

UnknownText_0x5e2f3:
	text "<PLAYER> registered"
	line "BUENA's number."
	done

UnknownText_0x5e310:
	text "BUENA: I look"
	line "forward to hearing"
	cont "from you!"
	done

UnknownText_0x5e33c:
	text "BUENA: Aww… It's a"
	line "special prize…"
	done

UnknownText_0x5e35e:
	text "BUENA: <PLAY_G>,"
	line "your phone list"

	para "has no room left"
	line "for me…"
	done

UnknownText_0x5e392:
	text "You can cash in"
	line "your saved points"

	para "for a lovely prize"
	line "of your choice!"
	done

UnknownText_0x5e3d8:
	text "You can't trade in"
	line "points without"
	cont "your BLUE CARD."

	para "Don't forget your"
	line "BLUE CARD!"
	done

UnknownText_0x5e426:
	text "2F SALES"
	done

UnknownText_0x5e430:
	text "PROF.OAK'S #MON"
	line "TALK"

	para "The Hottest Show"
	line "on the Air!"
	done

UnknownText_0x5e463:
	text "Anywhere, Anytime"
	line "#MON Radio"
	done

RadioTower2F_MapEventHeader:: db 0, 0

.Warps: db 20
	warp_def 3, 11, 3, GOLDENROD_GAME_CORNER
	warp_def 19, 45, 3, GOLDENROD_GAME_CORNER
	warp_def 21, 41, 7, RADIO_TOWER_2F
	warp_def 19, 29, 5, RADIO_TOWER_2F
	warp_def 5, 25, 17, RADIO_TOWER_2F
	warp_def 5, 41, 7, RADIO_TOWER_2F
	warp_def 31, 13, 13, RADIO_TOWER_2F
	warp_def 31, 29, 11, RADIO_TOWER_2F
	warp_def 33, 25, 3, RADIO_TOWER_2F
	warp_def 17, 9, 3, RADIO_TOWER_2F
	warp_def 19, 13, 12, RADIO_TOWER_2F
	warp_def 3, 29, 16, RADIO_TOWER_2F
	warp_def 3, 45, 15, RADIO_TOWER_2F
	warp_def 33, 9, 15, RADIO_TOWER_2F
	warp_def 17, 25, 16, RADIO_TOWER_2F
	warp_def 17, 41, 15, RADIO_TOWER_2F
	warp_def 3, 5, 5, RADIO_TOWER_2F
	warp_def 3, 25, 4, RADIO_TOWER_2F
	warp_def 17, 29, 6, RADIO_TOWER_2F
	warp_def 31, 9, 3, RADIO_TOWER_2F

.CoordEvents: db 0

.BGEvents: db 6
	signpost -5, 10, SIGNPOST_READ, MapRadioTower2FSignpost0Script
	signpost -5, 12, SIGNPOST_READ, MapRadioTower2FSignpost1Script
	signpost -5, 14, SIGNPOST_READ, RadioTower2FBookshelf
	signpost -5, 17, SIGNPOST_READ, RadioTower2FBookshelf
	signpost -5, 19, SIGNPOST_READ, RadioTower2FBookshelf
	signpost -5, 23, SIGNPOST_READ, MapRadioTower2FSignpost5Script

.ObjectEvents: db 12
	person_event SPRITE_POKE_BALL, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Radio2FBall, EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	person_event SPRITE_TEACHER, -6, 39, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x5d701, -1
	person_event SPRITE_ROCKET, 4, 35, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 17, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 4, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 32, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_BLACK_BELT, -6, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x5d71f, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	person_event SPRITE_BLACK_BELT, -6, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x5d722, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_JIGGLYPUFF, -6, 20, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	person_event SPRITE_BUENA, -6, 38, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Buena, -1
	person_event SPRITE_RECEPTIONIST, -6, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x5d8ff, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_POKE_BALL, 2, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Radio2FCoinCaseBall, EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
