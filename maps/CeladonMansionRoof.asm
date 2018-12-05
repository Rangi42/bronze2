const_value set 2
	const CELADONMANSIONROOF_OFFICER
	const ROOF_CAMERA
	const ROOF_CAMERA2
	const ROOF_CAMERA_MAN
	const ROOF_SCARLET
	const ROOF_ROCKET
	const ROOF_ROCKET2
	const ROOF_ROCKET_GIRL

CeladonMansionRoof_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger0, 0


.MapCallbacks:
	db 0

.Trigger0:
	end
	
FisherScript_0x71a39:
	jumptextfaceplayer UnknownText_0x71a3f

MapCeladonMansionRoofSignpost0Script:
	jumptext UnknownText_0x71aa1

TVCameraRoof:
	jumptext TVCameraRoofText

RoofCameraMan:
	faceplayer
	opentext
	checkevent EVENT_STUDIO_GAVE_STONE
	iftrue .AlreadyGotStone
	writetext RoofAskForStone
	waitbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_STUDIO_GAVE_STONE
	writetext RoofAskForStone2
	waitbutton 
	closetext
	spriteface ROOF_CAMERA_MAN, RIGHT
	end
	
.AlreadyGotStone
	writetext RoofAskForStone2
	waitbutton
	closetext
	end
	
RoofScarlet:
	jumptextfaceplayer RoofScarletText1

RoofActor:
	jumptextfaceplayer RoofActor1

RoofBeginScene:
	applymovement PLAYER, PlayerMovesToStage
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, ROOF_SCARLET, 20
	applymovement ROOF_SCARLET, ScarletMovesToPlayer
	opentext
	writetext RoofScarletIntro
	waitbutton
	closetext
	follow ROOF_SCARLET, PLAYER
	applymovement ROOF_SCARLET, ScarletMovesToStage
	stopfollow
	opentext
	writetext ScarletExplainsActors
	waitbutton
	closetext
	spriteface PLAYER, UP
	opentext
	writetext RoofActorGreeting
	waitbutton
	closetext
	spriteface ROOF_SCARLET, DOWN
	spriteface PLAYER, RIGHT
	opentext
	writetext ScarletsSaysGetIntoPos
	waitbutton
	closetext
	applymovement ROOF_ROCKET, RocketMovesToStagePos1
	applymovement ROOF_SCARLET, ScarPlayerMovesDown
	applymovement PLAYER, ScarPlayerMovesDown
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext DirectorStartsScene
	waitbutton
	closetext
	;1st Battle
	winlosstext RocketActorWinText, RocketActorLoseText
	loadtrainer GRUNTM, 32
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RoofSecondRocketIntro
	waitbutton
	closetext
	;2nd Battle
	winlosstext RocketActor2WinText, RocketActorLoseText
	loadtrainer GRUNTM, 33
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RocketActorHereComesTheBoss
	waitbutton
	closetext
	appear ROOF_ROCKET_GIRL
	applymovement ROOF_ROCKET_GIRL, TheBossWalksIn
	setevent EVENT_STUDIO_ROCKETS_WALK_IN
	opentext
	writetext RocketActorTheBoss1
	waitbutton
	closetext
	;3rd Battle
	winlosstext RocketActor3WinText, RocketActorLoseText
	loadtrainer EXECUTIVEF, 3
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RocketActorTheBoss2
	waitbutton
	closetext
	applymovement ROOF_ROCKET_GIRL, RocketBossLeaves
	disappear ROOF_ROCKET_GIRL
	spriteface ROOF_ROCKET, LEFT
	spriteface ROOF_ROCKET2, RIGHT
	opentext
	writetext RocketLetsBail
	waitbutton
	closetext
	follow ROOF_ROCKET2, ROOF_ROCKET
	applymovement ROOF_ROCKET2, RoofRocketsLeave
	disappear ROOF_ROCKET
	disappear ROOF_ROCKET2
	special RestartMapMusic
	spriteface PLAYER, RIGHT
	spriteface ROOF_SCARLET, LEFT
	opentext
	writetext RoofScarletEnd
	waitbutton 
	closetext
	applymovement ROOF_SCARLET, ScarletLeavesSet
	disappear ROOF_SCARLET
	dotrigger $1
	end
	
PlayerMovesToStage:
	step_right
	step_down
	step_down
	step_right
	step_end
	
ScarletMovesToPlayer:
	step_left
	step_left
	step_left
	step_left
	step_end
	
ScarletMovesToStage:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

RocketMovesToStagePos1:
	step_right
	step_up
	step_up
	step_left
	turn_head_down
	step_end
	
ScarPlayerMovesDown:
	step_down
	turn_head_up
	step_end

TheBossWalksIn:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_down
	step_end

RocketBossLeaves:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RoofRocketsLeave:
	step_left
	step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

ScarletLeavesSet:
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RoofAskForStone:
	text "I'm the DIRECTOR."
	
	para "What's that?"
	
	para "You want payment"
	line "for the scene?"
	
	para "Ugh, okay."
	
	para "Look, this is all"
	line "I have on me."
	
	para "Take it or leave"
	line "it, I guess."
	done
	
RoofAskForStone2:
	text "I'm the DIRECTOR."
	
	para "And I'm a very"
	line "busy man."
	done
	
RocketLetsBail:
	text "ROCKET GRUNT:"
	line "Uh oh!"
	done
	
RocketActorHereComesTheBoss:
	text "ROCKET GRUNT:"
	line "Looks like I'm"
	
	para "going to have to"
	line "call in…"
	cont "THE BOSS!"
	done
	
RocketActor3WinText:
	text "I can't believe"
	line "this!"
	
	para "How dare you"
	line "destroy our plans!"
	done
	
RocketActorTheBoss1:
	text "ROCKET BOSS: Well"
	line "If it isn't the"
	
	para "famous SCARLET and"
	line "her little lackey."
	
	para "Your days of star-"
	line "dom will be over"
	
	para "Once I wipe the"
	line "floor with you"
	cont "both!"
	done
	
RocketActorTheBoss2:
	text "ROCKET BOSS: We"
	line "can't do it!"
	
	para "SCARLET is just"
	line "too strong and"
	cont "powerful!"
	
	para "Our plans lay"
	line "in ruin because"
	
	para "of this spectacu-"
	line "lar woman!"
	
	para "TEAM ROCKET, let's"
	line "bail."
	done
	
RocketActor2WinText:
	text "This is not the"
	line "end!"
	done
	
RoofSecondRocketIntro:
	text "ROCKET GRUNT: I'm"
	line "going to grind"
	
	para "both of you into"
	line "dust!"
	done
	
DirectorStartsScene:
	text "DIRECTOR: And"
	line "ready…"
	
	para "3… 2… 1…"
	line "ACTION!"
	done

RocketActorWinText:
	text "You won't beat"
	line "my associates!"
	done

RocketActorLoseText:
	text "DIRECTOR: it was"
	line "supposed to be"
	cont "one take!"
	
	para "Okay people,"
	line "take five and"
	cont "we'll start again."
	done
	
RoofScarletIntro:
	text "SCARLET: Oh, you're"
	line "here!"
	
	para "We're filming a"
	line "TV special."
	
	para "We're recreating"
	line "the moment I…"
	cont "We! Defeated"
	cont "TEAM ROCKET!"
	
	para "I could not have"
	line "done this scene"
	
	para "without the hero"
	line "themselves!"
	
	para "You'll do most"
	line "of the fighting."
	
	para "I want the battles"
	line "to look as real"
	cont "as possible."
	
	para "So we've got to get"
	line "this in one take"
	
	para "for the ultimate"
	line "battle scene!"
	
	para "Follow me,"
	line "<PLAYER>."
	done

ScarletExplainsActors:
	text "SCARLET: You'll be"
	line "fighting these"
	
	para "fine actors dres-"
	line "sed as members of"
	cont "TEAM ROCKET."
	done

ScarletsSaysGetIntoPos:
	text "SCARET: Okay boys,"
	line "positions, please!"
	done
	
RoofActorGreeting:
	text "ROCKET GRUNT: How"
	line "you doin'?"
	done
	
RoofActor1:
	text "Oh, me?"
	
	para "I'm just an actor."
	done

RoofScarletEnd:
	text "SCARLET: Well done"
	line "darling!"
	
	para "I'm sure you're"
	line "going places!"
	
	para "Well, I've got to"
	line "get to another"
	cont "shoot."
	
	para "Very busy indeed!"
	
	para "Talk to the"
	line "DIRECTOR to get"
	
	para "payment for your"
	line "trouble!"
	
	para "Farewell,"
	line "<PLAYER>."
	
	para "We shall meet"
	line "again!"
	done
	
RoofScarletText1:
	text "Ohoho! You're going"
	line "to be a star!"
	done
	
RoofCameraManText:
	text "I'm the DIRECTOR."
	
	para "Please don't bother"
	line "me."
	done
	
UnknownText_0x71a3f:
	text "I'm just standing"
	line "here because this"
	cont "staircase is fake."
	
	para "Wouldn't want any"
	line "actors to fall"
	cont "down."
	done

UnknownText_0x71aa1:
	text "Please be quiet"
	line "while taping is"
	cont "in progress."
	done

TVCameraRoofText:
	text "It's a TV camera."
	done
	
CeladonMansionRoof_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 9, 2, 12, SAFFRON_CITY
	warp_def 9, 3, 12, SAFFRON_CITY
	warp_def 1, -3, 1, CELADON_MANSION_ROOF_HOUSE

.CoordEvents: db 1
	xy_trigger 0, 5, 6, 0, RoofBeginScene, 0, 0

.BGEvents: db 1
	signpost 2, 1, SIGNPOST_READ, MapCeladonMansionRoofSignpost0Script

.ObjectEvents: db 8
	person_event SPRITE_OFFICER, 1, 13, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FisherScript_0x71a39, -1
	person_event SPRITE_UNUSED_GUY, 8, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TVCameraRoof, -1
	person_event SPRITE_UNUSED_GUY, 6, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TVCameraRoof, -1
	person_event SPRITE_PHARMACIST, 6, 8, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RoofCameraMan, -1
	person_event SPRITE_MORTY, 7, 13, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RoofScarlet, EVENT_STUDIO_SCARLET
	person_event SPRITE_ROCKET, 8, 13, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RoofActor, EVENT_STUDIO_ROCKETS
	person_event SPRITE_ROCKET, 6, 12, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RoofActor, EVENT_STUDIO_ROCKETS
	person_event SPRITE_ROCKET_GIRL, 7, 7, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RoofActor, EVENT_STUDIO_ROCKETS_WALK_IN