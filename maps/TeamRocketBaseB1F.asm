const_value set 2
	const TEAMROCKETBASEB1F_ROCKET1
	const TEAMROCKETBASEB1F_ROCKET2
	const TEAMROCKETBASEB1F_SCIENTIST
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_ROCKET3
	const TEAMROCKETBASEB1F_R1
	const TEAMROCKETBASEB1F_R3
	const TEAMROCKETBASEB1F_RIVAL

TeamRocketBaseB1F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback1

.Trigger0:
	end
	
.Trigger1:
	end
	
.Trigger2:
	end

.Callback1:
	disappear TEAMROCKETBASEB1F_ROCKET1
	return
;
; OVER HERE
SecurityCamera1a:
	spriteface PLAYER, LEFT
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_R1, 15
	opentext
	writetext HideoutRocketBeforeBattle1
	waitbutton
	closetext
	winlosstext CameraGrunt1BeatenText, 0
;	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, 20
	startbattle
	reloadmapafterbattle
	spriteface PLAYER, RIGHT
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_R3, 15
	applymovement TEAMROCKETBASEB1F_R3, DoubleRocketMoveLeft
	opentext
	writetext HideoutRocketBothOfUs
	waitbutton
	closetext
	winlosstext CameraGrunt2BeatenText, 0
;	setlasttalked TEAMROCKETBASEB1F_ROCKET2
	loadtrainer GRUNTM, 20
	startbattle
	reloadmapafterbattle
	dotrigger $2
	opentext
	writetext HideoutRocketsLeaveText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_R3, DoubleRocketLeaveRight1
	applymovement TEAMROCKETBASEB1F_R1, DoubleRocketLeaveLeft1
	setevent EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	disappear TEAMROCKETBASEB1F_R1
	disappear TEAMROCKETBASEB1F_R3
	end

SecurityCamera1b:
	spriteface PLAYER, RIGHT
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_R3, 15
	opentext
	writetext HideoutRocketBeforeBattle1
	waitbutton
	closetext
	winlosstext CameraGrunt1BeatenText, 0
;	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, 20
	startbattle
	reloadmapafterbattle
	spriteface PLAYER, LEFT
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_R1, 15
	applymovement TEAMROCKETBASEB1F_R1, DoubleRocketMoveRight
	opentext
	writetext HideoutRocketBothOfUs
	waitbutton
	closetext
	winlosstext CameraGrunt2BeatenText, 0
;	setlasttalked TEAMROCKETBASEB1F_ROCKET2
	loadtrainer GRUNTM, 20
	startbattle
	reloadmapafterbattle
	dotrigger $2
	opentext
	writetext HideoutRocketsLeaveText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_R1, DoubleRocketLeaveLeft2
	applymovement TEAMROCKETBASEB1F_R3, DoubleRocketLeaveRight2
	setevent EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	disappear TEAMROCKETBASEB1F_R1
	disappear TEAMROCKETBASEB1F_R3
	end

NoSecurityCamera:
	end

TrainerCameraGrunt1:
	opentext
	writetext CameraGrunt1SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt1BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, 20
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

TrainerCameraGrunt2:
	opentext
	writetext CameraGrunt2SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt2BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, 21
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

PlaySecurityCameraSounds:
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	end

VoltorbExplodingTrap:
	special FadeOutPalettes
	cry VOLTORB
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VOLTORB, 23
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 21
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 21
	startbattle
	end

NoExplodingTrap:
	end

TrainerScientistJed:
	trainer EVENT_BEAT_SCIENTIST_JED, SCIENTIST, JED, ScientistJedSeenText, ScientistJedBeatenText, 0, ScientistJedScript

ScientistJedScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6cc16
	waitbutton
	closetext
	end

TrainerGruntM16:
	trainer EVENT_BEAT_ROCKET_GRUNTM_16, GRUNTM, 16, GruntM16SeenText, GruntM16BeatenText, 0, GruntM16Script

GruntM16Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6cd1b
	waitbutton
	closetext
	end

MapTeamRocketBaseB1FSignpost5Script:
	jumptext HideoutRivalWelcomeText

MapTeamRocketBaseB1FSignpost7Script:
	jumpstd teamrocketoath

MapTeamRocketBaseB1FSignpost0Script:
	opentext
	checkevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	iftrue UnknownScript_0x6cabe
	writetext UnknownText_0x6cdad
	playsound SFX_TALLY
	waitbutton
	closetext
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

UnknownScript_0x6cabe:
	writetext UnknownText_0x6cdd0
	waitbutton
	closetext
	end

TeamRocketBaseB1FHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB1FNugget:
	itemball NUGGET

TeamRocketBaseB1FGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB1FHiddenRevive:
	dwb EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE, REVIVE

HideoutRival1:
	wait 5
	dotrigger $1
	spriteface PLAYER, RIGHT
	applymovement TEAMROCKETBASEB1F_RIVAL, HideoutRivalMovement1
	opentext
	writetext HideoutRivalWelcomeText
	waitbutton
	closetext 
	spriteface PLAYER, DOWN
	applymovement TEAMROCKETBASEB1F_RIVAL, HideoutRivalLeaveMovement1
	setevent EVENT_SECURITY_CAMERA_1
	disappear TEAMROCKETBASEB1F_RIVAL
	end
	
HideoutRival2:
	wait 5
	dotrigger $1
	applymovement TEAMROCKETBASEB1F_RIVAL, HideoutRivalMovement2
	opentext
	writetext HideoutRivalWelcomeText
	waitbutton
	closetext 
	applymovement TEAMROCKETBASEB1F_RIVAL, HideoutRivalLeaveMovement2
	setevent EVENT_SECURITY_CAMERA_1
	disappear TEAMROCKETBASEB1F_RIVAL
	end

HideoutRivalMovement1:
	step_up
	step_up
	turn_head_left
	step_end
	
HideoutRivalMovement2:
	step_up
	step_end
	
HideoutRivalLeaveMovement1:
	step_down
	step_down
	step_right
	step_right
	step_down
	step_right
	step_right
	step_down
	step_down
	step_down
	step_end
	
HideoutRivalLeaveMovement2:
	step_down
	step_right
	step_right
	step_down
	step_right
	step_right
	step_down
	step_down
	step_down
	step_end
	
DoubleRocketLeaveLeft1:
	step_down
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
DoubleRocketLeaveRight1:
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
DoubleRocketLeaveLeft2:
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
DoubleRocketLeaveRight2:
	step_down
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
	
DoubleRocketMoveRight:
	step_right
	step_end
	
DoubleRocketMoveLeft:
	step_left
	step_end
	
SecurityCameraMovement1:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

SecurityCameraMovement2:
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	turn_head_right
	step_end

SecurityCameraMovement3:
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end

SecurityCameraMovement4:
; he jumps over a trap
	jump_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	turn_head_right
	step_end

SecurityCameraMovement5:
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end

SecurityCameraMovement6:
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	step_end

SecurityCameraMovement7:
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_left
	step_end

SecurityCameraMovement8:
	big_step_down
	big_step_down
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	step_end

SecurityCameraMovement9:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

HideoutRocketBeforeBattle1:
	text "Hey check it out,"
	line "it's the new guy!"
	
	para "Yeah the leader is"
	line "on the bottom"
	cont "floor."
	
	para "That's where you"
	line "need to go for"
	cont "training."
	
	para "…Wait, you're not"
	line "with us?"
	cont "Take us down?"
	
	para "Hah! You've got to"
	line "be joking."
	
	para "Let's dispose of"
	line "this little twerp!"
	
	done

HideoutRocketsLeaveText:
	text "Oh no, oh no!"
	line "This kid isn't"
	cont "messing around."
	
	para "Let's get out of"
	line "here!"
	done
	
HideoutRocketBothOfUs:
	text "You'll have to"
	line "beat us both if"
	
	para "you expect us to"
	line "let you pass!"
	done
	
CameraGrunt1SeenText:
	text "Hey!"
	line "Intruder alert!"
	done

CameraGrunt1BeatenText:
	text "Drats…"
	done

CameraGrunt2SeenText:
	text "It's my turn!"
	line "There's no escape!"
	done

CameraGrunt2BeatenText:
	text "Holy smokes!"
	line "I can't take a"
	cont "beating like this!"
	done

ScientistJedSeenText:
	text "The real trainers"
	line "here are us"
	cont "SCIENTISTS!"
	
	para "We'll outsmart all"
	line "of you!"
	done

ScientistJedBeatenText:
	text "Forgot to carry"
	line "the 1…"
	done

UnknownText_0x6cc16:
	text "I'm not paid enough"
	line "to have to work on"
	
	para "the computers and"
	line "try to fight off"
	
	para "annoying little"
	line "troublemakers like"
	cont "you."
	done

GruntM16SeenText:
	text "I knew you were"
	line "coming."
	
	para "Don't worry, I'm"
	line "prepared!"
	done

GruntM16BeatenText:
	text "Kablamo!"
	done

UnknownText_0x6cd1b:
	text "Good luck getting"
	line "to the leader."
	
	para "The deeper you go"
	line "the harder it'll"
	cont "get."
	done

HideoutRivalWelcomeText:
	text "Welcome to our"
	line "hideout!"
	
	para "I've got some"
	line "work to do,"
	
	para "meanwhile you"
	line "should come in and"
	
	para "meet my new"
	line "friends!"
	done

UnknownText_0x6cdad:
	text "A secret switch!"
	line "Better press it."
	done

UnknownText_0x6cdd0:
	text "The switch is"
	line "turned off."
	done

TeamRocketBaseB1F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 2, 19, 5, NATIONAL_PARK
	warp_def 16, 3, 1, TEAM_ROCKET_BASE_B2F
	warp_def -2, 16, 4, TEAM_ROCKET_BASE_B1F
	warp_def -2, 17, 3, TEAM_ROCKET_BASE_B1F

.CoordEvents: db 4
	xy_trigger 0, 3, 18, 0, HideoutRival1, 0, 0
	xy_trigger 0, 3, 19, 0, HideoutRival2, 0, 0
	xy_trigger 1, 13, 29, 0, SecurityCamera1a, 0, 0
	xy_trigger 1, 13, 30, 0, SecurityCamera1b, 0, 0

.BGEvents: db 9
	signpost -2, 22, SIGNPOST_READ, MapTeamRocketBaseB1FSignpost0Script
	signpost -5, 28, SIGNPOST_UP, MapTeamRocketBaseB1FSignpost5Script
	signpost -5, 10, SIGNPOST_UP, MapTeamRocketBaseB1FSignpost5Script
	signpost 20, 12, SIGNPOST_UP, MapTeamRocketBaseB1FSignpost5Script
	signpost 20, 26, SIGNPOST_UP, MapTeamRocketBaseB1FSignpost5Script
	signpost -6, 28, SIGNPOST_UP, MapTeamRocketBaseB1FSignpost5Script
	signpost -2, 23, SIGNPOST_READ, MapTeamRocketBaseB1FSignpost7Script
	signpost -2, 24, SIGNPOST_READ, MapTeamRocketBaseB1FSignpost7Script
	signpost 1, 5, SIGNPOST_ITEM, TeamRocketBaseB1FHiddenRevive

.ObjectEvents: db 9
	person_event SPRITE_YOUNGSTER, -5, -1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ROCKET, 10, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerGruntM16, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 10, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerScientistJed, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_POKE_BALL, 1, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB1FHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	person_event SPRITE_POKE_BALL, 1, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB1FNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	person_event SPRITE_YOUNGSTER, -5, 0, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ROCKET, 13, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ParkLostBoyScript, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	person_event SPRITE_ROCKET, 13, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ParkLostBoyScript, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	person_event SPRITE_SILVER, 5, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SECURITY_CAMERA_1
