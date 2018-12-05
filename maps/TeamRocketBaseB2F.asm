const_value set 2
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL
	const TEAMROCKETBASEB2F_YOUNGSTER1
	const TEAMROCKETBASEB2F_YOUNGSTER2
	const TEAMROCKETBASEB2F_PAPER	
	const TEAMROCKETBASEB2F_YOUNGSTER3

TeamRocketBaseB2F_MapScriptHeader:
.MapTriggers:
	db 4

	; triggers
	dw UnknownScript_0x6cf85, 0
	dw UnknownScript_0x6cf86, 0
	dw UnknownScript_0x6cf87, 0
	dw UnknownScript_0x6cf88, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, TransmitterDoorCallback

UnknownScript_0x6cf85:
	end

UnknownScript_0x6cf86:
	end

UnknownScript_0x6cf87:
	end

UnknownScript_0x6cf88:
	end

TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .Change
	return

.Change:
	changeblock $e, $c, $7
	return

UnknownScript_0x6cf95:
	moveperson TEAMROCKETBASEB2F_LANCE, $9, $d
	jump UnknownScript_0x6cfac

UnknownScript_0x6cf9c:
	moveperson TEAMROCKETBASEB2F_ROCKET_GIRL, $15, $10
	moveperson TEAMROCKETBASEB2F_ROCKET1, $15, $10
	moveperson TEAMROCKETBASEB2F_DRAGON, $a, $d
	moveperson TEAMROCKETBASEB2F_LANCE, $a, $d
UnknownScript_0x6cfac:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext UnknownText_0x6d2ad
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_0x6d21f
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d224
	spriteface PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d22f
	opentext
	writetext UnknownText_0x6d2c3
	waitbutton
	closetext
	cry DRAGONITE
	spriteface TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	spriteface PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, MovementData_0x6d236
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d23b
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24c
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d244
	opentext
	writetext UnknownText_0x6d38c
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d241
	opentext
	writetext UnknownText_0x6d3bd
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24a
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d248
	winlosstext UnknownText_0x6d45c, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, 2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext UnknownText_0x6d4c6
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special Special_FadeInQuickly
	dotrigger $2
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	spriteface TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d5d8
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d250
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x6d64e
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d254
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d258
	opentext
	writetext UnknownText_0x6d6cf
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d267
	disappear TEAMROCKETBASEB2F_LANCE

UnknownScript_0x6d075:
	applymovement PLAYER, MovementData_0x6d271
	end

UnknownScript_0x6d07a:
	opentext
	writetext UnknownText_0x6d7ea
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x6d278
	end

LanceHealsScript1:
	spriteface PLAYER, UP
	jump LanceHealsCommon

LanceHealsScript2:
	spriteface PLAYER, RIGHT
	spriteface TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special Mobile_HealParty
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	dotrigger $1
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	checkcode VAR_FACING
	if_equal RIGHT, UnknownScript_0x6d0be
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_LANCE
	end

UnknownScript_0x6d0be:
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d219
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer EVENT_BEAT_ROCKET_GRUNTM_17, GRUNTM, 17, GruntM17SeenText, GruntM17BeatenText, 0, GruntM17Script

GruntM17Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6db88
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer EVENT_BEAT_ROCKET_GRUNTM_18, GRUNTM, 18, GruntM18SeenText, GruntM18BeatenText, 0, GruntM18Script

GruntM18Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6dc1a
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer EVENT_BEAT_ROCKET_GRUNTM_19, GRUNTM, 19, GruntM19SeenText, GruntM19BeatenText, 0, GruntM19Script

GruntM19Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6dcd1
	waitbutton
	closetext
	end

UnknownScript_0x6d182:
	reloadmapafterbattle
	end

UnknownScript_0x6d184:
	moveperson TEAMROCKETBASEB2F_LANCE, $12, $6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d27a
	spriteface PLAYER, RIGHT
	opentext
	writetext UnknownText_0x6d809
	buttonsound
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext UnknownText_0x6d8f8
	waitbutton
	closetext
	spriteface TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d994
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d283
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	dotrigger $3
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

MapTeamRocketBaseB2FSignpostPtr1:
	dw EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	dw MapTeamRocketBaseB2FSignpost1Script


MapTeamRocketBaseB2FSignpost1Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue UnknownScript_0x6d1e8
	writetext UnknownText_0x6dd39
	waitbutton
	closetext
	end

UnknownScript_0x6d1e8:
	writetext UnknownText_0x6dd6b
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock $e, $c, $7
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

MapTeamRocketBaseB2FSignpost21Script:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x6d207
	writetext UnknownText_0x6dda7
	waitbutton
	closetext
	end

UnknownScript_0x6d207:
	writetext UnknownText_0x6de03
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMSteelWing:
	itemball TM_STEEL_WING

TeamRocketBaseB2FHiddenFullHeal:
	dwb EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL, FULL_HEAL
	
B2FRocketYoungster1:
	jumptextfaceplayer B2FRocketYoungster1text

B2FRocketYoungster2:
	jumptextfaceplayer B2FRocketYoungster2text
	
B2FRocketYoungster3:
	jumptextfaceplayer B2FRocketYoungster3text

B2FRocketPaper:
	opentext
	writetext B2FRocketPapertext
	yesorno
	iftrue .B2FRocketPaperReadScript
	closetext
	end
	
.B2FRocketPaperReadScript
	writetext B2FRocketPapertext2
	waitbutton
	closetext
	end
	
MovementData_0x6d212:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MovementData_0x6d219:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MovementData_0x6d21f:
	step_down
	step_down
	step_down
	turn_head_right
	step_end

MovementData_0x6d224:
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	turn_head_down
	step_end

MovementData_0x6d22f:
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end

MovementData_0x6d236:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x6d23b:
	fix_facing
	db $39 ; movement
	jump_step_right
	db $38 ; movement
	remove_fixed_facing
	step_end

MovementData_0x6d241:
	slow_step_down
	turn_head_left
	step_end

MovementData_0x6d244:
	step_right
	step_right
	step_right
	step_end

MovementData_0x6d248:
	big_step_left
	step_end

MovementData_0x6d24a:
	big_step_left
	step_end

MovementData_0x6d24c:
	big_step_left
	big_step_up
	turn_head_left
	step_end

MovementData_0x6d250:
	step_right
	step_right
	turn_head_down
	step_end

MovementData_0x6d254:
	step_up
	step_up
	step_up
	step_end

MovementData_0x6d258:
	step_sleep_8
	step_left
	step_left
	turn_head_up
	step_sleep_8
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_sleep_8
	step_left
	step_left
	turn_head_down
	step_end

MovementData_0x6d267:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x6d271:
	step_up
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x6d278:
	step_left
	step_end

MovementData_0x6d27a:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

MovementData_0x6d283:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x6d28c:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

MovementData_0x6d299:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

MovementData_0x6d2a4:
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

B2FRocketYoungster1text:
	text "I have to write"
	line "an essay on the"
	
	para "true merits of"
	line "TEAM ROCKET."
	
	para "I really love"
	line "this group!"
	
	para "They really get"
	line "me, y'know?"
	done
	
B2FRocketYoungster2text:
	text "Man, TEAM ROCKET"
	line "is great!"
	
	para "They don't tell"
	line "you when to go"
	cont "to bed!"
	done

B2FRocketYoungster3text:
	text "I mean, TEAM"
	line "ROCKET is cool and"
	cont "all…"
	
	para "But sometimes I"
	line "miss my mother's"
	cont "dinners…"
	done
	
B2FRocketPapertext:
	text "It's an essay."
	line "Read it?"
	done
	
B2FRocketPapertext2:
	text "Why I Love TEAM"
	line "ROCKET"
	cont "By TODD"
	
	para "I'm glad to be"
	line "a part of a group"
	
	para "that doesn't have"
	line "to go to school"
	
	para "and can stay up"
	line "all night!"
	
	para "No annoying"
	line "parents."
	
	para "We get to collect"
	line "so many #MON!"
	
	para "All the training"
	line "is such fun!"
	
	para "Every day all day"
	line "training!"
	
	para "If a #MON does-"
	line "n't do what I say,"
	cont "They just…"
	cont "Get me a new one."
	
	para "They take it away,"
	line "and I never see it"
	cont "again."
	
	para "Oh the things I"
	line "coulndn't do with-"
	cont "out them!"
	
	para "………"
	line "………"
	
	para "Help me."
	done
	
UnknownText_0x6d2ad:
	text "Hold it right"
	line "there!"
	done

UnknownText_0x6d2c3:
	text "We can't have a"
	line "brat like you on"
	cont "the loose."

	para "It's harmful to"
	line "TEAM ROCKET's"
	cont "pride, you see."

	para "However strong you"
	line "may be, you can't"

	para "take both of us at"
	line "the same time."

	para "Sorry, baby. Now"
	line "get ready to be"
	cont "thrashed."
	done

UnknownText_0x6d38c:
	text "Hey! Don't be so"
	line "selfish. Spread"
	cont "the fun around."
	done

UnknownText_0x6d3bd:
	text "What? You had an"
	line "accomplice?"

	para "Where is your"
	line "sense of honor?"

	para "As the interim"
	line "boss in place of"

	para "GIOVANNI, I'll"
	line "show you how wrong"

	para "it is to meddle"
	line "with TEAM ROCKET!"
	done

UnknownText_0x6d45c:
	text "Tch, you really"
	line "are strong."

	para "It's too bad."

	para "If you were to"
	line "join TEAM ROCKET,"

	para "you could become"
	line "an EXECUTIVE."
	done

UnknownText_0x6d4c6:
	text "…This hideout is"
	line "done for…"

	para "But that's fine."
	line "The broadcast ex-"
	cont "periment was a"
	cont "total success."

	para "It doesn't matter"
	line "what happens to"
	cont "this hideout now."

	para "We have much big-"
	line "ger plans."

	para "You'll come to"
	line "appreciate TEAM"

	para "ROCKET's true"
	line "power soon enough."

	para "Enjoy yourself"
	line "while you can…"

	para "Fufufufu…"
	done

UnknownText_0x6d5d8:
	text "LANCE: That did"
	line "it. We defeated"

	para "all the ROCKETS"
	line "here."

	para "But I'm concerned"
	line "about the young"

	para "guy I battled in"
	line "the process…"
	done

UnknownText_0x6d64e:
	text "Sorry, <PLAY_G>."
	line "I saw how well you"

	para "were doing, so I"
	line "just hung back."

	para "Now all there is"
	line "left to do is to"

	para "turn off that odd"
	line "radio signal."
	done

UnknownText_0x6d6cf:
	text "It's this machine"
	line "that's causing all"
	cont "the problems."

	para "I don't see a"
	line "switch on it…"

	para "We have no choice."
	line "We have to make"

	para "all the ELECTRODE"
	line "faint."

	para "That should stop"
	line "this machine from"

	para "transmitting that"
	line "strange signal."

	para "It's no fault of"
	line "the #MON, so it"

	para "makes me feel"
	line "guilty."

	para "<PLAY_G>, let's"
	line "split the job."
	done

UnknownText_0x6d7ea:
	text "LANCE: Leave this"
	line "side to me."
	done

UnknownText_0x6d809:
	text "LANCE: That odd"
	line "signal has finally"
	cont "stopped."

	para "The LAKE should be"
	line "back to normal."

	para "You're the hero!"
	line "Let me thank you"

	para "on behalf of all"
	line "the #MON."

	para "Oh, yes. You"
	line "should take this."

	para "I found it here,"
	line "but I don't have"
	cont "any need for it."
	done

UnknownText_0x6d8e6:
	text "<PLAYER> received"
	line "HM06."
	done

UnknownText_0x6d8f8:
	text "That's WHIRLPOOL."
	line "Teach it to a"

	para "#MON to get"
	line "across wild water."

	para "But keep this in"
	line "mind."

	para "You can use that"
	line "out of battle only"

	para "with the BADGE"
	line "from MAHOGANY GYM."
	done

UnknownText_0x6d994:
	text "<PLAY_G>…"

	para "The journey to be-"
	line "coming the #MON"

	para "MASTER is long and"
	line "difficult."

	para "Knowing that, will"
	line "you keep going?"

	para "…"

	para "I see. No, you're"
	line "right."

	para "If you would give"
	line "up that easily,"

	para "you would have"
	line "never chased that"

	para "dream in the first"
	line "place."

	para "I look forward to"
	line "seeing you again!"
	done

LanceHealsText1:
	text "LANCE: Are you all"
	line "right?"

	para "Your #MON are"
	line "hurt and tired."

	para "Here, give them"
	line "some of my medi-"
	cont "cine."
	done

LanceHealsText2:
	text "LANCE: <PLAY_G>,"
	line "let's give it our"
	cont "best for #MON."
	done

GruntM17SeenText:
	text "…<PLAYER>?"
	line "I heard about you."
	
	para "I always knew"
	line "you were trouble."
	done

GruntM17BeatenText:
	text "This is a"
	line "travesty!"
	done

UnknownText_0x6db88:
	text "Get lost, buddy."
	line "You've done enough"
	cont "damage."
	done

GruntM18SeenText:
	text "How did you get"
	line "this far into"
	cont "our hideout?"
	
	para "You think you're"
	line "some hot shot"
	
	para "trainer or some-"
	line "thing?"
	done

GruntM18BeatenText:
	text "Darn, I messed"
	line "up!"
	done

UnknownText_0x6dc1a:
	text "Go ahead, keep"
	line "trying."
	
	para "You're only setting"
	line "yourself up for"
	cont "failure."
	done

GruntM19SeenText:
	text "Someone call the"
	line "exterminator."
	
	para "We've got a pest"
	line "problem!"
	done

GruntM19BeatenText:
	text "You absolute pest."
	done

UnknownText_0x6dcd1:
	text "I'm furious."
	line "I tried my best"
	
	para "for our team,"
	line "but came up short."
	done

UnknownText_0x6dd39:
	text "The door's closed…"

	para "It needs a pass-"
	line "word to open."
	done

UnknownText_0x6dd6b:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the password."

	para "The door opened!"
	done

UnknownText_0x6dda7:
	text "It's the radio"
	line "transmitter that's"

	para "sending the"
	line "sinister signal."

	para "It's working at"
	line "full capacity."
	done

UnknownText_0x6de03:
	text "The radio trans-"
	line "mitter has finally"

	para "stopped its evil"
	line "broadcast."
	done

TeamRocketBaseB2F_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 18, 7, 2, TEAM_ROCKET_BASE_B1F
	warp_def 6, 3, 3, TEAM_ROCKET_BASE_B3F
	warp_def 6, 31, 2, TEAM_ROCKET_BASE_B3F
	warp_def 3, 23, 5, TEAM_ROCKET_BASE_B3F
	warp_def 18, 31, 4, TEAM_ROCKET_BASE_B3F
	warp_def 0, 17, 1, UNDERGROUND_WAREHOUSE
	warp_def 0, 18, 2, UNDERGROUND_WAREHOUSE

.CoordEvents: db 9
	xy_trigger 0, 31, 7, 0, LanceHealsScript1, 0, 0
	xy_trigger 0, 30, 6, 0, LanceHealsScript2, 0, 0
	xy_trigger 1, 31, 18, 0, UnknownScript_0x6cf95, 0, 0
	xy_trigger 1, 31, 19, 0, UnknownScript_0x6cf9c, 0, 0
	xy_trigger 2, 32, 18, 0, UnknownScript_0x6d075, 0, 0
	xy_trigger 2, 32, 19, 0, UnknownScript_0x6d075, 0, 0
	xy_trigger 2, -4, 14, 0, UnknownScript_0x6d07a, 0, 0
	xy_trigger 2, 30, 16, 0, UnknownScript_0x6d07a, 0, 0
	xy_trigger 2, 31, 16, 0, UnknownScript_0x6d07a, 0, 0

.BGEvents: db 3
	signpost 32, 18, SIGNPOST_IFNOTSET, MapTeamRocketBaseB2FSignpostPtr1
	signpost 32, 19, SIGNPOST_IFNOTSET, MapTeamRocketBaseB2FSignpostPtr1
	signpost 21, 30, SIGNPOST_ITEM, TeamRocketBaseB2FHiddenFullHeal

.ObjectEvents: db 12
	person_event SPRITE_ROCKET, 31, -1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	person_event SPRITE_ROCKET_GIRL, 31, -2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 4, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	person_event SPRITE_LANCE, 30, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	person_event SPRITE_DRAGON, 31, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	person_event SPRITE_ROCKET, 14, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 10, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_POKE_BALL, 13, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMSteelWing, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
	person_event SPRITE_YOUNGSTER, 17, 15, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, B2FRocketYoungster1, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_YOUNGSTER, 17, 13, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, B2FRocketYoungster2, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_PAPER, 18, 15, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, B2FRocketPaper, -1
	person_event SPRITE_YOUNGSTER, 21, 17, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, B2FRocketYoungster3, EVENT_TEAM_ROCKET_BASE_POPULATION
