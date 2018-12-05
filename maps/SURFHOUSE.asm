const_value set 2
	const SURFHOUSE_MAN
	const SURFHOUSE_POKEBALL_1
	const SURFHOUSE_POKEBALL_2

SURFHOUSE_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

SurfHouseWindowScript
	jumptext SurfHouseWindowText
	
SurfHouseManScript
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iffalse .DidntBeatPryce
	checkevent EVENT_SECURITY_CAMERA_4
	iftrue SurfHousePokemonPicked1Script
	checkevent EVENT_SECURITY_CAMERA_5
	iftrue SurfHousePokemonPicked2Script
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue .GoOn
	writetext SurfHouseManText1
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	waitbutton
	closetext
	setevent EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	end

.DidntBeatPryce
	writetext SurfHouseComeBackLater
	waitbutton
	closetext
	end
	
.GoOn
	writetext SurfPickAPokemonGoOnText
	waitbutton
	closetext
	end
	
SurfHousePokemonPicked1Script
	writetext SurfHousePokemonPicked1Text
	waitbutton
	closetext
	end
	
SurfHousePokemonPicked2Script
	writetext SurfHousePokemonPicked2Text
	waitbutton
	closetext
	end	
	
SurfHouseBall1Script
	checkevent EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	iffalse SurfHouseCantGetBallScript
	checkevent EVENT_SECURITY_CAMERA_5
	iftrue SurfHouseCantGetBallScript
	refreshscreen $0
	pokepic LAPRAS
	cry LAPRAS
	waitbutton
	closepokepic
	opentext
	writetext SurfHousePokeBall1Text1
	yesorno
	iffalse SurfHouseRefusedPokemonScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, SurfHousePartyFullScript
	givepoke LAPRAS, 20, BERRY
	disappear SURFHOUSE_POKEBALL_1
	writetext SurfHouseGotMon1Text
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
;	applymovement SURFHOUSE_MAN, AfterLaprasMovement
	spriteface SURFHOUSE_MAN, RIGHT
	setevent EVENT_SECURITY_CAMERA_4
	jump SurfHouseGotPokemon
	
SurfHouseBall2Script
	checkevent EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	iffalse SurfHouseCantGetBallScript
	checkevent EVENT_SECURITY_CAMERA_4
	iftrue SurfHouseCantGetBallScript
	refreshscreen $0
	pokepic MANTINE
	cry MANTINE
	waitbutton
	closepokepic
	opentext
	writetext SurfHousePokeBall2Text1
	yesorno
	iffalse SurfHouseRefusedPokemonScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, SurfHousePartyFullScript
	givepoke MANTINE, 20, BERRY
	disappear SURFHOUSE_POKEBALL_2
	writetext SurfHouseGotMon2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
;	applymovement SURFHOUSE_MAN, AfterMantineMovement
	spriteface SURFHOUSE_MAN, RIGHT
	setevent EVENT_SECURITY_CAMERA_5
	jump SurfHouseGotPokemon

SurfHouseGotPokemon:
	spriteface PLAYER, LEFT
	opentext
	writetext SurfHouseManText2
;	waitbutton
;	verbosegiveitem HM_SURF
;	opentext	
;	writetext SurfHouseManText3
	waitbutton
	closetext
;	applymovement SURFHOUSE_MAN, AfterLaprasMovement2
	spriteface SURFHOUSE_MAN, DOWN
	end
	
SurfHousePartyFullScript
	writetext SurfHousePartyFullText
	waitbutton
	closetext
	end
	
SurfHouseCantGetBallScript
	jumptext SurfHousePokeBallCantGetText

SurfHouseRefusedPokemonScript
	jumptext SurfHouseRefusedPokemonText

AfterLaprasMovement:
	step_right
	step_right
	step_end

AfterMantineMovement:
	step_right
	step_right
	step_right
	step_end
	
AfterLaprasMovement2:
	step_left
	step_left
	step_end

AfterMantineMovement2:
	step_left
	step_left
	step_left
	step_end
	
.Text:

SurfPickAPokemonGoOnText:
	text "Go on, pick a"
	line "#MON!"
	done

SurfHouseComeBackLater:
	text "Ah! Nice to meet"
	line "you."
	
	para "It's your lucky"
	line "day!"
	
	para "I'm giving away"
	line "some of my prized"
	
	para "water-type #-"
	line "MON to trainers"
	
	para "That beat the"
	line "FIGBRANCH GYM's"
	cont "leader, CARVER."
	
	para "Come back when you"
	line "have his badge and"
	
	para "I'll have a reward"
	line "for you!"
	done

SurfHousePartyFullText:
	text "MAN: Oh, it looks"
	line "like your party is"
	cont "full."
	
	para "Use the PC in the"
	line "corner to deposit"

	para "one of your"
	line "#MON first!"
	done

SurfHouseGotMon1Text:
	text "<PLAYER> received"
	line "LAPRAS!"
	done
	
SurfHouseGotMon2Text:
	text "<PLAYER> received"
	line "MANTINE!"
	done
	
SurfHouseWindowText:
	text "Looked into the"
	line "window."
	
	para "Boy we are really"
	line "high up!"
	done

SurfHouseManText1:
	text "Welcome!"
	
	para "It's your lucky"
	line "day!"
	
	para "I'm giving away"
	line "some of my prized"
	
	para "water-type #-"
	line "MON to trainers"
	
	para "That beat the"
	line "FIGBRANCH GYM's"
	cont "leader, CARVER."
	
	para "So I have a reward"
	line "for you!"
	
	para "Go on! But pick"
	line "carefully, as you"
	
	para "can only choose"
	line "one!"
	done
	
SurfHouseManText2:
	text "Great choice of"
	line "#MON!"
	
	para "May it help you"
	line "greatly on your"
	cont "adventures!"

	para "Farewell, friend!"
	done

SurfHouseManText3:
	text "That there is"
	line "SURF!"
	
	para "You can teach it"
	line "to water type"

	para "#MON so you can"
	line "ride over the"
	cont "ocean!"
	
	para "But you'll need"
	line "FIGBRANCH TOWN'S"
	
	para "GYM BADGE to use"
	line "it outside of"
	cont "battle."
	
	para "Farewell, friend!"
	done
	
SurfHousePokeBall1Text1:
	text "Will you choose"
	line "LAPRAS?"
	done
	
SurfHousePokeBall2Text1:
	text "Will you choose"
	line "MANTINE?"
	done
	
SurfHousePokeBallCantGetText:
	text "It's a # BALL"
	line "with a #MON"
	cont "inside!"
	done
	
SurfHouseRefusedPokemonText:
	text "MAN: Choose care-"
	line "fully!"
	done
	
SurfHousePokemonPicked1Text
	text "Hey there!"

	para "How has your"
	line "LAPRAS been"
	cont "treating you?"
	done

SurfHousePokemonPicked2Text	
	text "Hey there!"

	para "How has your"
	line "MANTINE been"
	cont "treating you?"
	done
	
SURFHOUSE_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 6, AZALEA_TOWN
	warp_def 7, 3, 6, AZALEA_TOWN

.CoordEvents: db 0

.BGEvents: db 1
	signpost 0, -5, SIGNPOST_READ, SurfHouseWindowScript

.ObjectEvents: db 3
	person_event SPRITE_SAILOR, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SurfHouseManScript, -1
	person_event SPRITE_POKE_BALL, 2, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SurfHouseBall1Script, EVENT_SECURITY_CAMERA_4
	person_event SPRITE_POKE_BALL, 2, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SurfHouseBall2Script, EVENT_SECURITY_CAMERA_5
