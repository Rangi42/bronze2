; If you were beaten by someone our age, you must be lame.
;
const_value set 2
	const UNDERGROUNDWAREHOUSE_ROCKET1
	const UNDERGROUNDWAREHOUSE_ROCKET2
	const UNDERGROUNDWAREHOUSE_ROCKET3
	const UNDERGROUNDWAREHOUSE_ROCKETBOSS
	const UNDERGROUNDWAREHOUSE_POKE_BALL1
	const UNDERGROUNDWAREHOUSE_POKE_BALL2
	const UNDERGROUNDWAREHOUSE_POKE_BALL3
	const UNDERGROUNDWAREHOUSE_YOUNGSTER1
	const UNDERGROUNDWAREHOUSE_YOUNGSTER2
	const UNDERGROUNDWAREHOUSE_YOUNGSTER3
	const UNDERGROUNDWAREHOUSE_YOUNGSTER4
	const UNDERGROUNDWAREHOUSE_COOLTRAINER_F
	const UNDERGROUNDWAREHOUSE_RIVAL

UndergroundWarehouse_MapScriptHeader:
.MapTriggers:
	db 30

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3
	maptrigger .Trigger4
	maptrigger .Trigger5
	maptrigger .Trigger6
	maptrigger .Trigger7
	maptrigger .Trigger8
	maptrigger .Trigger9
	maptrigger .Trigger10
	maptrigger .Trigger11
	maptrigger .Trigger12
	maptrigger .Trigger13
	maptrigger .Trigger14
	maptrigger .Trigger15
	maptrigger .Trigger16
	maptrigger .Trigger17
	maptrigger .Trigger18
	maptrigger .Trigger19
	maptrigger .Trigger20
	maptrigger .Trigger21
	maptrigger .Trigger22
	maptrigger .Trigger23
	maptrigger .Trigger24
	maptrigger .Trigger25
	maptrigger .Trigger26
	maptrigger .Trigger27
	maptrigger .Trigger28
	maptrigger .Trigger29

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .ResetSwitches

.Trigger0:
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
	
.Trigger6:
	end
	
.Trigger7:
	end
	
.Trigger8:
	end
	
.Trigger9:
	end
	
.Trigger10:
	end

.Trigger11:
	end
	
.Trigger12:
	end

.Trigger13:
	end
	
.Trigger14:
	end
	
.Trigger15:
	end
	
.Trigger16:
	end
	
.Trigger17:
	end
	
.Trigger18:
	end
	
.Trigger19:
	end
	
.Trigger20:
	end
	
.Trigger21:
	end
	
.Trigger22:
	end
	
.Trigger23:
	end
	
.Trigger24:
	end
	
.Trigger25:
	end
	
.Trigger26:
	end
	
.Trigger27:
	end
	
.Trigger28:
	end
	
.Trigger29:
	end

.ResetSwitches:
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	return

TrainerGruntM24:
	trainer EVENT_BEAT_ROCKET_GRUNTM_24, GRUNTM, 24, GruntM24SeenText, GruntM24BeatenText, 0, GruntM24Script

GruntM24Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7da48
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer EVENT_BEAT_ROCKET_GRUNTM_14, GRUNTM, 14, GruntM14SeenText, GruntM14BeatenText, 0, GruntM14Script

GruntM14Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7db01
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer EVENT_BEAT_ROCKET_GRUNTM_15, GRUNTM, 15, GruntM15SeenText, GruntM15BeatenText, 0, GruntM15Script

GruntM15Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7db8e
	waitbutton
	closetext
	end

GentlemanScript_0x7d9bf:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue UnknownScript_0x7d9de
	writetext UnknownText_0x7dbc6
	buttonsound
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_WAREHOUSE_LAYOUT_1
	clearevent EVENT_WAREHOUSE_LAYOUT_2
	clearevent EVENT_WAREHOUSE_LAYOUT_3
	writetext UnknownText_0x7dc5b
	buttonsound
UnknownScript_0x7d9de:
	writetext UnknownText_0x7dc8d
	waitbutton
	closetext
	end

UndergroundWarehouseMaxEther:
	itemball MAX_ETHER

UndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

UndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

WarehouseRocketTrigger1:
	applymovement PLAYER, UndergroundPlayerWalksIn1
	jump WarehouseRocketTriggerMainEvent

WarehouseRocketTrigger2:
	applymovement PLAYER, UndergroundPlayerWalksIn2
	jump WarehouseRocketTriggerMainEvent

WarehouseRocketTriggerMainEvent:
	opentext
	writetext RocketExecSpeech1Text
	waitbutton
	closetext
	showemote EMOTE_SHOCK, UNDERGROUNDWAREHOUSE_ROCKETBOSS, 15
	applymovement UNDERGROUNDWAREHOUSE_ROCKETBOSS, UndergroundRocketWalksToPlayer
	spriteface PLAYER, UP
	opentext
	writetext RocketExecSpeech2Text
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement UNDERGROUNDWAREHOUSE_ROCKETBOSS, UndergroundRocketWalksBack
	opentext
	writetext RocketExecSpeech3Text
	waitbutton
	closetext
	showemote EMOTE_SHOCK, UNDERGROUNDWAREHOUSE_ROCKETBOSS, 15
	applymovement UNDERGROUNDWAREHOUSE_ROCKETBOSS, UndergroundRocketWalksToPlayer
	spriteface PLAYER, UP
	opentext
	writetext RocketExecSpeech4Text
	waitbutton
	closetext
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER3, UndergroundYoungsterMovement1
	spriteface UNDERGROUNDWAREHOUSE_YOUNGSTER1, LEFT
	spriteface UNDERGROUNDWAREHOUSE_YOUNGSTER2, LEFT
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER4, UndergroundYoungster4Movement1
	opentext
	writetext RocketBoySpeechText
	waitbutton
	closetext
;	spriteface UNDERGROUNDWAREHOUSE_YOUNGSTER3, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RocketExecSpeech5Text
	waitbutton
	closetext
;	opentext
;	writetext RocketExecSpeechTempText
;	waitbutton
	winlosstext WarehouseRocketBossWinText, 0
	setlasttalked UNDERGROUNDWAREHOUSE_ROCKETBOSS
	loadtrainer EXECUTIVEM, 5
	startbattle
	reloadmapafterbattle
;	closetext
;	special RestartMapMusic
	opentext
	writetext RocketExecSpeech6Text
	waitbutton
	closetext
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER3, UndergroundYoungsterMovement2
	opentext
	writetext RocketBoySpeechText2
	waitbutton
	closetext
;	spriteface UNDERGROUNDWAREHOUSE_YOUNGSTER4, RIGHT
	opentext
	writetext RocketBoySpeechText3
	waitbutton
	closetext
	follow UNDERGROUNDWAREHOUSE_YOUNGSTER2, UNDERGROUNDWAREHOUSE_YOUNGSTER3
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER2, UndergroundYoungster2Movement2
	applymovement UNDERGROUNDWAREHOUSE_COOLTRAINER_F, UndergroundCooltrainerMovement1
	follow UNDERGROUNDWAREHOUSE_YOUNGSTER1, UNDERGROUNDWAREHOUSE_COOLTRAINER_F
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER1, UndergroundYoungster1Movement1	
	applymovement UNDERGROUNDWAREHOUSE_YOUNGSTER4, UndergroundYoungster4Movement2
	opentext
	writetext RocketExecSpeech7Text
	waitbutton
	closetext
	applymovement UNDERGROUNDWAREHOUSE_ROCKETBOSS, UndergroundRocketLeaves
	follow UNDERGROUNDWAREHOUSE_ROCKET1, UNDERGROUNDWAREHOUSE_ROCKETBOSS
	applymovement UNDERGROUNDWAREHOUSE_ROCKET1, UndergroundRocketLeaves2
	disappear UNDERGROUNDWAREHOUSE_ROCKET1
	disappear UNDERGROUNDWAREHOUSE_ROCKET2
	disappear UNDERGROUNDWAREHOUSE_ROCKET3
	disappear UNDERGROUNDWAREHOUSE_ROCKETBOSS
	disappear UNDERGROUNDWAREHOUSE_YOUNGSTER1
	disappear UNDERGROUNDWAREHOUSE_YOUNGSTER2
	disappear UNDERGROUNDWAREHOUSE_YOUNGSTER3
	disappear UNDERGROUNDWAREHOUSE_YOUNGSTER4
	disappear UNDERGROUNDWAREHOUSE_COOLTRAINER_F
	appear UNDERGROUNDWAREHOUSE_RIVAL
	special Special_FadeOutMusic
	wait 10
	applymovement PLAYER, UndergroundPlayerLeaves
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement UNDERGROUNDWAREHOUSE_RIVAL, UndergroundRivalEnterMovement
	spriteface PLAYER, LEFT
	opentext
	writetext UndergroundRocketRivalText1
	waitbutton
	special Special_FadeOutMusic
	wait 10
	playmusic MUSIC_POKE_FLUTE_CHANNEL
	writetext UndergroundRocketRivalText1Part2
	waitbutton
	closetext
	applymovement UNDERGROUNDWAREHOUSE_RIVAL, UndergroundRivalExitMovement
	disappear UNDERGROUNDWAREHOUSE_RIVAL
	dotrigger $1
	special Special_FadeOutMusic
	wait 10
	special RestartMapMusic
	clearevent EVENT_SECURITY_CAMERA_2
;	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_TEAM_ROCKET_BASE_POPULATION
	end

MapUndergroundWarehouseWarpSign:
	jumptext MapUndergroundWarehouseWarpSignText

SpinPadTrigger1:
	playsound SFX_SQUEAK
	applymovement PLAYER, SpinPad1
	end
	
SpinPad1:
	turn_head_right
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_down
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_left
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_up
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_right
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_down
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_left
	fix_facing
	slide_step_up
	remove_fixed_facing
	turn_head_up
	step_end

UndergroundPlayerWalksIn1:
	step_right
	step_down
	turn_head_right
	step_end
	
UndergroundPlayerWalksIn2:
	step_right
	step_end
	
UndergroundPlayerLeaves:
	step_left
	step_end

UndergroundRocketWalksToPlayer:
	step_down
	step_down
	step_left
	step_left
	step_left
	turn_head_down
	step_end

UndergroundRocketWalksBack:
	step_right
	step_right
	step_right
	step_up
	step_up
	turn_head_down
	step_end
	
UndergroundRocketLeaves:
	step_left
	step_left
	step_left
	step_end
	
UndergroundRocketLeaves2:
	step_left
	step_left
	step_end
	
UndergroundYoungsterMovement1:
	step_up
	big_step_left
	big_step_left
	big_step_left
	step_left
	step_end
	
UndergroundYoungsterMovement2:
	step_down
	turn_head_right
	step_end
	
UndergroundYoungster4Movement1:
	step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_up
	step_end
	
UndergroundYoungster2Movement2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
UndergroundYoungster1Movement1:
	step_right
	step_right
	step_right
	step_right
	step_end
	
UndergroundYoungster4Movement2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
UndergroundCooltrainerMovement1:
	step_right
	step_end
	
UndergroundRivalEnterMovement:
	step_right
	step_right
	step_right
	step_right
	step_end
	
UndergroundRivalExitMovement:
	step_left
	step_left
	step_left
	step_left
	step_end

WarehouseRocketBossWinText:
	text "Cripes!"
	done
	
RocketExecSpeech1Text:
	text "ROCKET: And that"
	line "is how you can"
	
	para "swiftly steal"
	line "# BALLS from"
	
	para "someone's belt"
	line "without them"
	cont "noticing."
	
	para "Now for lesson"
	line "five, harsh"
	
	para "#MON"
	line "discipline!"
	done

RocketExecSpeech2Text:
	text "ROCKET: It appears"
	line "we have a new"
	cont "recruit!"
	
	para "You're late,"
	line "get in formation"
	
	para "so we can cont-"
	line "inue training."
	done

RocketExecSpeech3Text:
	text "ROCKET: Where was"
	line "I…"
	
	para "Right! Now, when"
	line "a #MON steps"
	cont "out of line--"
	done
	
RocketExecSpeech4Text:
	text "ROCKET: I thought"
	line "I gave you an"
	cont "order."
	
	para "When I tell you"
	line "what to do, you"
	cont "do it."
	
	para "……"
	
	para "……"
	
	para "ROCKET: What do"
	line "you mean you're"
	cont "not with us?"
	
	para "Oh you came to"
	line "stop us?"
	
	para "Hahaha!"
	
	para "What kind of a"
	line "trainer do you"	
	cont "think you are,"
	cont "kid?"
	
	para "You couldn't"
	line "possibly take"
	cont "us down."
	done

RocketBoySpeechText:
	text "BOY: Yeah, kick"
	line "their butt!"
	
	para "TEAM ROCKET is"
	line "the strongest team"
	cont "in the world!"
	done
	
RocketExecSpeech5Text:	
	text "ROCKET: Looks like"
	line "I'll be teaching"	
	cont "you a lesson"
	cont "after all."
	
	para "A lesson in pain!"
	
	para "Watch closely,"
	line "recruits!"
	done
	
RocketExecSpeech6Text:	
	text "What?!"
	line "I can't believe"
	cont "this!"
	
	para "Everything we"
	line "worked for."
	
	para "All of our last"
	line "efforts to keep"	
	cont "this team alive…"
	
	para "Ruined by"
	line "mere CHILDREN!"
	done
	
RocketExecSpeech7Text:	
	text "Without new recr-"
	line "uits we cannot"
	cont "continue."
	
	para "TEAM ROCKET is"
	line "done."
	
	para "We can't get our"
	line "leader back, we"	
	cont "can't start a"
	cont "new crew."
	
	para "Our mission is"
	line "doomed."
	
	para "Farewell, forever."
	done

RocketBoySpeechText2:
	text "BOY: Wow."
	line "I can't believe"
	
	para "we looked up to"
	line "these losers."
	
	para "I thought they"
	line "were strong,"
	
	para "and yet they can't"
	line "even beat someone"
	cont "our own age."
	done
	
RocketBoySpeechText3:
	text "BOY: Yeah,"
	line "these guys are"
	cont "pathetic."
	
	para "I'm going back"
	line "home. Are you"
	cont "coming?"
	done	
	
RocketExecSpeechTempText:	
	text "INSERT BATTLE"
	line "HERE"
	done
	
UndergroundRocketRivalText1:
	text "……"
	
	para "Everything I do."
	
	para "Someone is there"
	line "to stop me."
	
	para "Like I'm always in"
	line "the wrong."
	
	para "I just want to be"
	line "a powerful"	
	cont "trainer."
	
	para "I finally find a"
	line "group that sees"
	
	para "things the way I"
	line "do, and again it"
	cont "doesn't work out."
	done
	
UndergroundRocketRivalText1Part2:
	text "Maybe I was wrong."
	
	para "Maybe I am wrong."
	
	para "I just don't know"
	line "anymore."
	
	para "I need some time"
	line "to think."
	done
	
MapUndergroundWarehouseWarpSignText:
	text "Warp to FELONWOOD"
	line "PARK"
	done
	
GruntM24SeenText:
	text "Congratulations."
	line "You've reached the"
	cont "training room."
	
	para "Too bad this is"
	line "where your tirade"
	cont "ends, loser!"
	done

GruntM24BeatenText:
	text "Eliminated…"
	done

UnknownText_0x7da48:
	text "Someone must stop"
	line "you."
	
	para "I can't have any of"
	line "this happen."
	done

GruntM14SeenText:
	text "The kids chose"
	line "to join us of"
	
	para "their own free"
	line "will!"
	
	para "You can't take"
	line "them back!"
	done

GruntM14BeatenText:
	text "I'm done for!"
	done

UnknownText_0x7db01:
	text "Make no mistake,"
	line "I'll be back."
	done

GruntM15SeenText:
	text "Shouldn't you be"
	line "in training?"
	done

GruntM15BeatenText:
	text "You're too much!"
	done

UnknownText_0x7db8e:
	text "I'll make sure"
	line "the leader stops"
	cont "you!"
	done

UnknownText_0x7dbc6:
	text "DIRECTOR: Who?"
	line "What? You came to"
	cont "rescue me?"

	para "Thank you!"

	para "The RADIO TOWER!"

	para "What's happening"
	line "there?"

	para "Taken over by TEAM"
	line "ROCKET?"

	para "Here. Take this"
	line "CARD KEY."
	done

UnknownText_0x7dc5b:
	text "DIRECTOR: Use that"
	line "to open the shut-"
	cont "ters on 3F."
	done

UnknownText_0x7dc8d:
	text "I'm begging you to"
	line "help."

	para "There's no telling"
	line "what they'll do if"

	para "they control the"
	line "transmitter."

	para "They may even be"
	line "able to control"

	para "#MON using a"
	line "special signal!"

	para "You're the only"
	line "one I can call on."

	para "Please save the"
	line "RADIO TOWER…"

	para "And all the #-"
	line "MON nationwide!"
	done

UndergroundWarehouse_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 9, 16, 6, TEAM_ROCKET_BASE_B2F
	warp_def 9, 17, 7, TEAM_ROCKET_BASE_B2F
	warp_def 11, 43, 5, NATIONAL_PARK

.CoordEvents: db 30
	xy_trigger 0, 4, 32, 0, WarehouseRocketTrigger1, 0, 0
	xy_trigger 0, 5, 32, 0, WarehouseRocketTrigger2, 0, 0
	xy_trigger 0, 18, 7, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 7, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 10, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 10, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 11, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 11, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 12, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 12, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 13, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 13, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 14, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 14, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 15, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 15, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 16, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 16, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 17, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 17, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 18, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 18, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 19, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 19, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 20, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 20, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 21, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 21, 0, SpinPadTrigger1, 0, 0
	xy_trigger 0, 18, 22, 0, SpinPadTrigger1, 0, 0
	xy_trigger 1, 18, 22, 0, SpinPadTrigger1, 0, 0

.BGEvents: db 1
	signpost 11, 40, SIGNPOST_UP, MapUndergroundWarehouseWarpSign

.ObjectEvents: db 13
	person_event SPRITE_ROCKET, 3, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerGruntM24, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 8, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM14, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 4, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, TrainerGruntM15, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 2, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x7d9bf, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_POKE_BALL, 8, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UndergroundWarehouseMaxEther, EVENT_UNDERGROUND_WAREHOUSE_MAX_ETHER
	person_event SPRITE_POKE_BALL, 5, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UndergroundWarehouseTMSleepTalk, EVENT_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	person_event SPRITE_POKE_BALL, 1, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UndergroundWarehouseUltraBall, EVENT_UNDERGROUND_WAREHOUSE_ULTRA_BALL
	person_event SPRITE_YOUNGSTER, 6, 36, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_YOUNGSTER, 5, 35, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_YOUNGSTER, 5, 38, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_YOUNGSTER, 6, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_LASS, 6, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SILVER, 5, 27, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHARCOAL_KILN_FARFETCH_D
