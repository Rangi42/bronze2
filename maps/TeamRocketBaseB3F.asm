const_value set 2
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScriptHeader:
.MapTriggers:
	db 4

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .CheckGiovanniDoor

.Trigger0:
	priorityjump LanceGetPasswordScript
	end

.Trigger1:
	end

.Trigger2:
	end

.Trigger3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock $a, $8, $7
	return

LanceGetPasswordScript:
;	spriteface PLAYER, LEFT
;	pause 5
;	pause 20
;	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12a
;	opentext
;	writetext LanceGetPasswordText
;	waitbutton
;	closetext
;	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12c
;	disappear TEAMROCKETBASEB3F_LANCE
	dotrigger $1
	end

RocketBaseRival:
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_SILVER
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalEnterMovement
	spriteface PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_SILVER
	dotrigger $2
	special RestartMapMusic
	end

RocketScript_0x6e048:
	jumptextfaceplayer UnknownText_0x6e235

UnknownScript_0x6e04b:
	applymovement PLAYER, MovementData_0x6e133
	jump UnknownScript_0x6e056

UnknownScript_0x6e052:
	applymovement PLAYER, MovementData_0x6e13a
UnknownScript_0x6e056:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext UnknownText_0x6e400
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e142
	winlosstext UnknownText_0x6e511, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, 4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext UnknownText_0x6e548
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_ROCKET1
	dotrigger $3
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer EVENT_BEAT_ROCKET_GRUNTF_5, GRUNTF, 5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e611
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer EVENT_BEAT_ROCKET_GRUNTM_28, GRUNTM, 28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e737
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer EVENT_BEAT_SCIENTIST_ROSS, SCIENTIST, ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, ScientistRossScript

ScientistRossScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e822
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer EVENT_BEAT_SCIENTIST_MITCH, SCIENTIST, MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, ScientistMitchScript

ScientistMitchScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e90a
	waitbutton
	closetext
	end

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	dw .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	jump .OpenSesame

.NeedsPassword:
	writetext UnknownText_0x6e970
	waitbutton
	closetext
	end

.OpenSesame:
	writetext UnknownText_0x6e9a3
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock $a, $8, $7
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

MapTeamRocketBaseB3FSignpost9Script:
	jumpstd teamrocketoath

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

MovementData_0x6e12a:
	step_right
	step_end

MovementData_0x6e12c:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x6e133:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x6e13a:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x6e142:
	step_down
	step_end

MovementData_0x6e144:
	big_step_right
	big_step_right
	step_end

MovementData_0x6e147:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	slow_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end

RocketBaseRivalEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

RocketBaseRivalLeaveMovement:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step_right
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "LANCE: It takes"
	line "two passwords to"

	para "get into the"
	line "boss's quarters."

	para "Those passwords"
	line "are known only to"
	cont "a few ROCKETS."

	para "That ROCKET there"
	line "very graciously"
	cont "told me so."

	para "<PLAY_G>, let's go"
	line "get the passwords."
	done

UnknownText_0x6e235:
	text "I'm kind of lost."
	line "I'm supposed to"
	
	para "go to training,"
	line "but they designed"
	
	para "this place like a"
	line "maze."
	done

RocketBaseRivalText:
	text "…"

	para "Didn't I tell you"
	line "that I was going"

	para "to destroy TEAM"
	line "ROCKET?"

	para "…Tell me, who was"
	line "the guy in the"

	para "cape who used"
	line "dragon #MON?"

	para "My #MON were no"
	line "match at all."

	para "I don't care that"
	line "I lost. I can beat"

	para "him by getting"
	line "stronger #MON."

	para "It's what he said"
	line "that bothers me…"

	para "He told me that"
	line "I don't love and"

	para "trust my #MON"
	line "enough."

	para "I'm furious that I"
	line "lost to a bleeding"
	cont "heart like him."

	para "…Humph! I don't"
	line "have the time for"
	cont "the likes of you!"
	done

UnknownText_0x6e400:
	text "What? Who are you?"
	line "This is the office"

	para "of our leader,"
	line "GIOVANNI."

	para "Since disbanding"
	line "TEAM ROCKET three"

	para "years ago, he has"
	line "been in training."

	para "But we're certain"
	line "he will be back"

	para "some day to assume"
	line "command again."

	para "That's why we're"
	line "standing guard."

	para "I won't let any-"
	line "one disturb this"
	cont "place!"
	done

UnknownText_0x6e511:
	text "I… I couldn't do a"
	line "thing…"

	para "GIOVANNI, please"
	line "forgive me…"
	done

UnknownText_0x6e548:
	text "No, I can't let"
	line "this affect me."

	para "I have to inform"
	line "the others…"
	done

RocketBaseMurkrowText:
	text "MURKROW: The"
	line "password is…"

	para "HAIL GIOVANNI."
	done

GruntF5SeenText:
	text "Ever been bitten"
	line "by a snake?"
	
	para "I'm sure you"
	line "wouldn't like it."
	
	para "So why are you"
	line "here?"
	done

GruntF5BeatenText:
	text "Oh man does it"
	line "sting!"
	done

UnknownText_0x6e611:
	text "My #MON don't"
	line "need this kind of"
	
	para "treatment from"
	line "wimps like you!"
	done

GruntM28SeenText:
	text "Hey, you shouldn't"
	line "be in here."
	
	para "All new recruits"
	line "should head to the"
	cont "bottom floor!"
	done

GruntM28BeatenText:
	text "Great test battle!"
	done

UnknownText_0x6e737:
	text "I think you'll do"
	line "well here as a"
	
	para "member of TEAM"
	line "ROCKET."
	cont "Carry on!"
	done

ScientistRossSeenText:
	text "How did you find"
	line "our secret hide-"
	cont "out?"
	
	para "Our security was"
	line "surely top notch!"
	done

ScientistRossBeatenText:
	text "Merely a design"
	line "flaw."
	done

UnknownText_0x6e822:
	text "We couldn't design"
	line "a place like this"
	
	para "hidden in such"
	line "plain sight as"
	
	para "a local park"
	line "without great"
	cont "minds like mine!"
	done

ScientistMitchSeenText:
	text "Who even cares"
	line "about #MON?"
	
	para "Watch my genetic-"
	line "ally superior"
	
	para "#MON thrash"
	line "yours!"
	done

ScientistMitchBeatenText:
	text "I over thought"
	line "this."
	done

UnknownText_0x6e90a:
	text "So many kids in"
	line "the region were"
	
	para "fooled by our"
	line "little stunt."
	
	para "I masterminded it!"
	done

UnknownText_0x6e970:
	text "The door's closed…"

	para "It needs two"
	line "passwords to open."
	done

UnknownText_0x6e9a3:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the two passwords."

	para "The door opened!"
	done

TeamRocketBaseB3F_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 11, 21, 6, TEAM_ROCKET_BASE_B3F
	warp_def 4, 31, 3, TEAM_ROCKET_BASE_B2F
	warp_def 4, 7, 2, TEAM_ROCKET_BASE_B2F
	warp_def 16, 31, 5, TEAM_ROCKET_BASE_B2F
	warp_def 5, 19, 4, TEAM_ROCKET_BASE_B2F
	warp_def 3, 23, 1, TEAM_ROCKET_BASE_B3F

.CoordEvents: db 3
	xy_trigger 2, -1, 12, 0, UnknownScript_0x6e04b, 0, 0
	xy_trigger 2, -1, 13, 0, UnknownScript_0x6e052, 0, 0
	xy_trigger 1, -2, 4, 0, RocketBaseRival, 0, 0

.BGEvents: db 10
	signpost 0, 15, SIGNPOST_IFNOTSET, BossDoor
	signpost 0, 16, SIGNPOST_IFNOTSET, BossDoor
	signpost -1, 18, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost -1, 19, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost -1, 20, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost -1, 21, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 26, 8, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 26, 9, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 26, 10, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 26, 11, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script

.ObjectEvents: db 12
	person_event SPRITE_SILVER, -7, -7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, (1 << 3) | PAL_OW_RED, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	person_event SPRITE_ROCKET, -4, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	person_event SPRITE_ROCKET_GIRL, 17, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 5, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 4, 26, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_YOUNGSTER, 15, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x6e048, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SILVER, -4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	person_event SPRITE_POKE_BALL, 10, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	person_event SPRITE_POKE_BALL, 8, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	person_event SPRITE_POKE_BALL, 1, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	person_event SPRITE_POKE_BALL, 21, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
