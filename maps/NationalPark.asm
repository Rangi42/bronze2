const_value set 2
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_LOSTBOY
	const NATIONALPARK_ROCKET	
	const NATIONALPARK_RIVAL
	const NATIONALPARK_RIVAL2

NationalPark_MapScriptHeader:
.MapTriggers:
	db 4

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3

.MapCallbacks:
	db 0

.Trigger0:
	end
	
.Trigger1:
	end
	
.Trigger2:
	end
	
.Trigger3:
	end
	
LassScript_0x5c002:
	jumptextfaceplayer UnknownText_0x5c1d3

PokefanFScript_0x5c005:
	jumptextfaceplayer UnknownText_0x5c22e

ParkRivalBattleTriggerLeft:	
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear NATIONALPARK_RIVAL2
	applymovement NATIONALPARK_RIVAL2, ParkRivalWalkDownLeft
	jump ParkRivalBattleStart
	end
	
ParkRivalBattleTriggerRight:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear NATIONALPARK_RIVAL2
	applymovement NATIONALPARK_RIVAL2, ParkRivalWalkDownRight
	spriteface PLAYER, LEFT
	jump ParkRivalBattleStart
	end
	
ParkRivalBattleStart:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext ParkRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext ParkRivalWinText, ParkRivalLossText
	setlasttalked NATIONALPARK_RIVAL2
	loadtrainer RIVAL1, RIVAL1_9
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext ParkRivalWinText, ParkRivalLossText
	setlasttalked NATIONALPARK_RIVAL2
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext ParkRivalWinText, ParkRivalLossText
	setlasttalked NATIONALPARK_RIVAL2
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext ParkRivalAfterText
	waitbutton
	closetext
	spriteface PLAYER, UP
	applymovement NATIONALPARK_RIVAL2, ParkRivalLeave	
;	playsound SFX_EXIT_BUILDING
	disappear NATIONALPARK_RIVAL2
	dotrigger $1
	waitsfx
	playmapmusic
	;after win
	end
	
TeacherScript_0x5c008:
	faceplayer
	opentext
;	checkevent EVENT_GOT_QUICK_CLAW
;	iftrue UnknownScript_0x5c01d
	writetext UnknownText_0x5c265
	waitbutton
;	buttonsound
;	verbosegiveitem QUICK_CLAW
;	iffalse UnknownScript_0x5c021
;	setevent EVENT_GOT_QUICK_CLAW
;UnknownScript_0x5c01d:
;	writetext UnknownText_0x5c30d
;	waitbutton
;UnknownScript_0x5c021:
	closetext
	end

YoungsterScript_0x5c023:
	jumptextfaceplayer UnknownText_0x5c35d

YoungsterScript_0x5c026:
	jumptextfaceplayer UnknownText_0x5c38f

TeacherScript_0x5c029:
	jumptextfaceplayer UnknownText_0x5c3bc

TrainerSchoolboyJack1:
	trainer EVENT_BEAT_SCHOOLBOY_JACK, SCHOOLBOY, JACK1, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, SchoolboyJack1Script

SchoolboyJack1Script:
;	writecode VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	end_if_just_battled
	opentext
;	checkflag ENGINE_JACK
;	iftrue UnknownScript_0x5c088
;	checkcellnum PHONE_SCHOOLBOY_JACK
;	iftrue UnknownScript_0x5c108
;	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x5c071
	writetext UnknownText_0x5c4f3
	waitbutton
	closetext
;	buttonsound
;	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x5c0fc
;	jump UnknownScript_0x5c074
	end
UnknownScript_0x5c071:
	scall UnknownScript_0x5c100
UnknownScript_0x5c074:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	if_equal $1, UnknownScript_0x5c110
	if_equal $2, UnknownScript_0x5c10c
	trainertotext SCHOOLBOY, JACK1, $0
	scall UnknownScript_0x5c104
	jump UnknownScript_0x5c108

UnknownScript_0x5c088:
	scall UnknownScript_0x5c114
	winlosstext SchoolboyJack1BeatenText, 0
	copybytetovar wJackFightCount
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
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadvar wJackFightCount, 1
	clearflag ENGINE_JACK
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadvar wJackFightCount, 2
	clearflag ENGINE_JACK
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadvar wJackFightCount, 3
	clearflag ENGINE_JACK
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadvar wJackFightCount, 4
	clearflag ENGINE_JACK
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK
	end

UnknownScript_0x5c0fc:
	jumpstd asknumber1m
	end

UnknownScript_0x5c100:
	jumpstd asknumber2m
	end

UnknownScript_0x5c104:
	jumpstd registerednumberm
	end

UnknownScript_0x5c108:
	jumpstd numberacceptedm
	end

UnknownScript_0x5c10c:
	jumpstd numberdeclinedm
	end

UnknownScript_0x5c110:
	jumpstd phonefullm
	end

UnknownScript_0x5c114:
	jumpstd rematchm
	end

TrainerPokefanmWilliam:
	trainer EVENT_BEAT_POKEFANM_WILLIAM, POKEFANM, WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, PokefanmWilliamScript

PokefanmWilliamScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5c645
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer EVENT_BEAT_POKEFANF_BEVERLY, POKEFANF, BEVERLY1, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, PokefanfBeverly1Script

PokefanfBeverly1Script:
	writecode VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	end_if_just_battled
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0x5c177
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue UnknownScript_0x5c19b
	checkpoke MARILL
	iffalse UnknownScript_0x5c189
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x5c160
	writetext UnknownText_0x5c5bd
	buttonsound
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x5c18f
	jump UnknownScript_0x5c163

UnknownScript_0x5c160:
	scall UnknownScript_0x5c193
UnknownScript_0x5c163:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	if_equal $1, UnknownScript_0x5c1a3
	if_equal $2, UnknownScript_0x5c19f
	trainertotext POKEFANF, BEVERLY1, $0
	scall UnknownScript_0x5c197
	jump UnknownScript_0x5c19b

UnknownScript_0x5c177:
	scall UnknownScript_0x5c1a7
	verbosegiveitem NUGGET
	iffalse UnknownScript_0x5c186
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	jump UnknownScript_0x5c19b

UnknownScript_0x5c186:
	jump UnknownScript_0x5c1ab

UnknownScript_0x5c189:
	writetext UnknownText_0x5c68a
	waitbutton
	closetext
	end

UnknownScript_0x5c18f:
	jumpstd asknumber1f
	end

UnknownScript_0x5c193:
	jumpstd asknumber2f
	end

UnknownScript_0x5c197:
	jumpstd registerednumberf
	end

UnknownScript_0x5c19b:
	jumpstd numberacceptedf
	end

UnknownScript_0x5c19f:
	jumpstd numberdeclinedf
	end

UnknownScript_0x5c1a3:
	jumpstd phonefullf
	end

UnknownScript_0x5c1a7:
	jumpstd giftf
	end

UnknownScript_0x5c1ab:
	jumpstd packfullf
	end

TrainerLassKrise:
	trainer EVENT_BEAT_LASS_KRISE, LASS, KRISE, LassKriseSeenText, LassKriseBeatenText, 0, LassKriseScript

LassKriseScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5c71d
	waitbutton
	closetext
	end

MapNationalParkSignpost0Script:
	jumptext UnknownText_0x5c750

MapNationalParkSignpost1Script:
	jumptext UnknownText_0x5c771

MapNationalParkSignpost3Script:
	jumptext UnknownText_0x5c7c6
	
NationalParkTriggerSwapScript:
	dotrigger $2
	jumptext UnknownText_0x5c7c6

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	dwb EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL, FULL_HEAL

ParkLostBoyScript:
	showemote EMOTE_SHOCK, NATIONALPARK_LOSTBOY, 15
	faceplayer
	opentext
	writetext ParkLostBoyText1
	waitbutton
	closetext
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement NATIONALPARK_ROCKET, ParkRocketMovement1
	spriteface NATIONALPARK_LOSTBOY, DOWN
	opentext
	writetext ParkRocketText1
	waitbutton
	closetext
	spriteface NATIONALPARK_LOSTBOY, UP
	opentext
	writetext ParkLostBoyText2
	waitbutton
	closetext
	follow NATIONALPARK_ROCKET, NATIONALPARK_LOSTBOY
	applymovement NATIONALPARK_ROCKET, ParkRocketMovement2
	disappear NATIONALPARK_LOSTBOY
	applymovement NATIONALPARK_ROCKET, ParkRocketMovement3
	setevent EVENT_NATIONAL_PARK_TM_DIG
	special RestartMapMusic
	end

ParkRocketTrigger:
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement NATIONALPARK_ROCKET, ParkRocketMovement4
	opentext
	writetext ParkRocketText2
	waitbutton
	closetext
	pause 2
	playsound SFX_TACKLE
	applymovement PLAYER, ParkRocketPushPlayerMovement
	pause 5
	applymovement NATIONALPARK_ROCKET, ParkRocketMovement5
	special RestartMapMusic
	end
	
ParkRivalTrigger:
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement NATIONALPARK_RIVAL, ParkRivalMovement1
	opentext
	writetext ParkRivalText1
	waitbutton
	closetext
	applymovement NATIONALPARK_RIVAL, ParkRivalMovement2
	dotrigger $3
	setevent EVENT_HEALED_MOOMOO
	disappear NATIONALPARK_RIVAL
	disappear NATIONALPARK_ROCKET
	special RestartMapMusic
	end

ParkRivalMovement1:
	big_step_right
	big_step_right
	big_step_right
	step_right
	step_end
	
ParkRivalMovement2:
	step_left
	step_left
	step_left
	step_left
	step_end
	
ParkRocketPushPlayerMovement:
	turn_head_down
	fix_facing
	jump_step_up
	remove_fixed_facing
	turn_head_up
	step_end
	
ParkRocketMovement1:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end
	
ParkRocketMovement2:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
ParkRocketMovement3:
	step_right
	step_end
	
ParkRocketMovement4:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_right
	turn_head_up
	step_end

ParkRocketMovement5:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

ParkRivalWalkDownLeft:
	step_down
	step_down
	step_down
	step_down
	step_end
	
ParkRivalWalkDownRight:
	step_down
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	step_end
	
ParkRivalLeave:
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
ParkRivalText1:
	text "Who goes ther-"
	
	para "Oh, it's you,"
	line "<PLAYER>."
	
	para "So you came to"
	line "join us did you?"
	
	para "That's great!"
	line "I'm glad you came"
	
	para "to switch to our"
	line "side!"
	
	para "Come right in,"
	line "we've got a lot of"
	
	para "training to do"
	line "if you want to be"
	cont "as strong as me!"
	done
	
ParkLostBoyText1:
	text "LOST BOY: Huh?"
	line "What?"
	
	para "My mother?"
	line "Uuuhm…"
	done

ParkLostBoyText2:
	text "LOST BOY: Say good"
	line "-bye to my MOM for"
	cont "me…"
	done
	
ParkRocketText1:
	text "ROCKET GRUNT: Who"
	line "are you talking"
	cont "to?"
	
	para "We've got training"
	line "to do."
	
	para "Come with me and"
	line "stop conversing"
	cont "with this creep."	
	done
	
ParkRocketText2:
	text "What do you think"
	line "you're doing pok-"
	cont "ing around here?"
	
	para "Get lost, kid!"	
	done
	
UnknownText_0x5c1d3:
	text "I can't talk to"
	line "you right now."
	cont "I'm with a boy!"
	
	para "And I'm pretty"
	line "sure my MOM is"
	cont "spying on me…"
	done

UnknownText_0x5c22e:
	text "Shhh! I'm making"
	line "sure my daughter"
	
	para "is okay on her"
	line "date."
	
	para "You never know"
	line "what trouble boys"
	cont "are up to!"
	done

UnknownText_0x5c265:
	text "I could sit here"
	line "forever."
	
	para "It's so beautiful"
	line "that I just may"
	cont "as well!"
	done

UnknownText_0x5c30d:
	text "Let a #MON hold"
	line "that QUICK CLAW."

	para "Sometimes it will"
	line "strike first"
	cont "during battle."
	done

UnknownText_0x5c35d:
	text "I'm on a date right"
	line "now. This could be"
	cont "my big chance!"
	
	para "Nothing at all has"
	line "gone wrong!"
	
	para "I usually get"
	line "really nervous."
	
	para "I didn't hiccup or"
	line "anything!"
	cont "…Hic…"
	cont "Oh no!"
	cont "…Hic…"
	done

UnknownText_0x5c38f:
	text "I've traded #MON"
	line "with people all"
	cont "around the world!"
	
	para "My collection is"
	line "impressive."
	done

UnknownText_0x5c3bc:
	text "If I could set up"
	line "a small shop in"
	
	para "this park, I could"
	line "make a healthy"
	cont "living."
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

UnknownText_0x5c42a:
	text "I'm printing out"
	line "my #DEX."

	para "You can also print"
	line "out stuff like"

	para "MAIL and your PC"
	line "BOXES."
	done

SchoolboyJack1SeenText:
	text "There are 250"
	line "kinds of #MON"
	cont "that I know of."
	
	para "Could you show"
	line "me anything I"
	cont "haven't seen?"
	done

SchoolboyJack1BeatenText:
	text "Waugh!"
	done

UnknownText_0x5c4f3:
	text "I thought I knew"
	line "a lot about #-"
	
	para "MON but those"
	line "moves you pulled--"
	cont "oh man!"
	done

PokefanfBeverly1SeenText:
	text "I'm so proud of"
	line "my #MON."
	
	para "They would never"
	line "let me down!"
	done

PokefanfBeverly1BeatenText:
	text "That was right in"
	line "my pride…"
	done

UnknownText_0x5c5bd:
	text "It doesn't matter."
	line "I still love my"
	cont "#MON!"
	done

PokefanmWilliamSeenText:
	text "Why are you"
	line "sneakin' out"
	cont "around here?"
	
	para "Is something"
	line "going on?"
	done

PokefanmWilliamBeatenText:
	text "Oh my!"
	done

UnknownText_0x5c645:
	text "Don't mind me"
	line "I'm pretty"
	
	para "suspicious of"
	line "everybody."
	done

UnknownText_0x5c68a:
	text "It doesn't matter."
	line "I still love my"
	cont "#MON!"
	done

LassKriseSeenText:
	text "Just what I was"
	line "waiting for!"
	
	para "A spry young go"
	line "getter like me to"
	cont "duel with!"
	done

LassKriseBeatenText:
	text "I like you a"
	line "lot."
	done

UnknownText_0x5c71d:
	text "Strong and cute,"
	line "just the way I"
	cont "like my #MON!"	
	cont "…And trainers."
	done

UnknownText_0x5c750:
	text "FELONWOOD PARK"
	
	para "For People And"
	line "Pokemon Alike"
	done

UnknownText_0x5c771:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

UnknownText_0x5c7c6:
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done

ParkRivalBeforeText:
	text "Oh good, it's you."
	
	para "That was sarcas-"
	line "tic, by the way."
	
	para "Thought you'd"
	line "relax in the park"
	cont "huh?"
	
	para "Too bad I'm gonna"
	line "pummel you before"
	
	para "you can even get"
	line "in."
	done
	
ParkRivalWinText:
	text "Leave me alone,"
	line "twerp."
	done

ParkRivalLossText:
	text "How did you even"
	line "get this far?"
	done
	
ParkRivalAfterText:
	text "I can't stick"
	line "around here with"
	
	para "weaklings like"
	line "you."
	
	para "I found a rad"
	line "crew to hang"
	cont "with."
	done
	
NationalPark_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 18, 33, 1, ROUTE_36_NATIONAL_PARK_GATE
	warp_def 19, 33, 2, ROUTE_36_NATIONAL_PARK_GATE
	warp_def 47, 20, 1, ROUTE_35_NATIONAL_PARK_GATE
	warp_def 47, 21, 2, ROUTE_35_NATIONAL_PARK_GATE
	warp_def 11, 0, 1, TEAM_ROCKET_BASE_B1F

.CoordEvents: db 4
	xy_trigger 1, 9, 6, 0, ParkRocketTrigger, 0, 0
	xy_trigger 2, 10, 6, 0, ParkRivalTrigger, 0, 0
	xy_trigger 0, 43, 20, 0, ParkRivalBattleTriggerLeft, 0, 0
	xy_trigger 0, 43, 21, 0, ParkRivalBattleTriggerRight, 0, 0

.BGEvents: db 5
	signpost 39, 17, SIGNPOST_READ, MapNationalParkSignpost0Script
	signpost 21, 7, SIGNPOST_READ, MapNationalParkSignpost1Script
	signpost 12, 14, SIGNPOST_ITEM, NationalParkHiddenFullHeal
	signpost 17, 29, SIGNPOST_READ, MapNationalParkSignpost3Script
	signpost 7, 4, SIGNPOST_READ, NationalParkTriggerSwapScript

.ObjectEvents: db 15
	person_event SPRITE_LASS, 24, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x5c002, -1
	person_event SPRITE_POKEFAN_F, 17, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 3, PokefanFScript_0x5c005, -1
	person_event SPRITE_LASS, 36, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x5c008, -1
	person_event SPRITE_YOUNGSTER, 24, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x5c023, -1
	person_event SPRITE_YOUNGSTER, 37, 17, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x5c026, -1
	person_event SPRITE_TEACHER, 19, 29, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x5c029, -1
	person_event SPRITE_YOUNGSTER, 14, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	person_event SPRITE_POKEFAN_F, 20, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanfBeverly1, -1
	person_event SPRITE_POKEFAN_M, 4, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerPokefanmWilliam, -1
	person_event SPRITE_LASS, 28, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassKrise, -1
	person_event SPRITE_POKE_BALL, 14, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	person_event SPRITE_YOUNGSTER, 8, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ParkLostBoyScript, EVENT_NATIONAL_PARK_TM_DIG
	person_event SPRITE_ROCKET, 10, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HEALED_MOOMOO
	person_event SPRITE_SILVER, 10, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HEALED_MOOMOO
	person_event SPRITE_SILVER, 38, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
