const_value set 2
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19ee9e, 0
	dw UnknownScript_0x19ee9f, 0

.MapCallbacks:
	db 0

UnknownScript_0x19ee9e:
	end

UnknownScript_0x19ee9f:
	end

UnknownScript_0x19eea0:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	spriteface ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efe8
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19efed
	opentext
	writetext UnknownText_0x19f006
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement ROUTE25_MISTY, MovementData_0x19effa
	spriteface PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	dotrigger $0
	special RestartMapMusic
	end

UnknownScript_0x19eee0:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	spriteface ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efea
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19eff4
	opentext
	writetext UnknownText_0x19f006
	waitbutton
	closetext
	spriteface PLAYER, UP
	applymovement ROUTE25_MISTY, MovementData_0x19effd
	spriteface PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	dotrigger $0
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer EVENT_BEAT_SCHOOLBOY_DUDLEY, SCHOOLBOY, DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, SchoolboyDudleyScript

SchoolboyDudleyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f1b5
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer EVENT_BEAT_LASS_ELLEN, LASS, ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, LassEllenScript

LassEllenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f208
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer EVENT_BEAT_SCHOOLBOY_JOE, SCHOOLBOY, JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, SchoolboyJoeScript

SchoolboyJoeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f25c
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer EVENT_BEAT_LASS_LAURA, LASS, LAURA, LassLauraSeenText, LassLauraBeatenText, 0, LassLauraScript

LassLauraScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f2a6
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer EVENT_BEAT_CAMPER_LLOYD, CAMPER, LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, CamperLloydScript

CamperLloydScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f2f8
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer EVENT_BEAT_LASS_SHANNON, LASS, SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, LassShannonScript

LassShannonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f35b
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer EVENT_BEAT_SUPER_NERD_PAT, SUPER_NERD, PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, SupernerdPatScript

SupernerdPatScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f41a
	waitbutton
	closetext
	end

CooltrainerMScript_0x19efac:
	trainer EVENT_BEAT_COOLTRAINERM_KEVIN, COOLTRAINERM, KEVIN, JuncKevinText, JuncKevinTextBeat, 0, CooltrainerMScript2
	
CooltrainerMScript2:
	end_if_just_battled
	opentext
	writetext JuncKevinTextAfter
	waitbutton
	closetext
	end
;	faceplayer
;	opentext
;	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
;	iftrue UnknownScript_0x19efda
;	checkevent EVENT_CLEARED_NUGGET_BRIDGE
;	iftrue UnknownScript_0x19efc7
;	writetext UnknownText_0x19f43b
;	buttonsound
;	verbosegiveitem NUGGET
;	iffalse UnknownScript_0x19efde
;	setevent EVENT_CLEARED_NUGGET_BRIDGE
;UnknownScript_0x19efc7:
;	writetext UnknownText_0x19f49d
;	waitbutton
;	closetext
;	winlosstext UnknownText_0x19f4fd, 0
;	loadtrainer COOLTRAINERM, KEVIN
;	startbattle
;	reloadmapafterbattle
;	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
;	opentext
;UnknownScript_0x19efda:
;	writetext UnknownText_0x19f520
;	waitbutton
;UnknownScript_0x19efde:
;	closetext
;	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	dwb EVENT_ROUTE_25_HIDDEN_POTION, POTION

Route25BlockerGuy:
	jumptextfaceplayer Route25BlockerGuyText

JunctionSecretSwitch1:
	checkevent EVENT_SECRET_SWITCH1
	iftrue SecretSwitchAlreadyPressed
	setevent EVENT_SECRET_SWITCH1
	opentext
	writetext JunctionSecretTemp
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	end
	
JunctionSecretSwitch2:
	checkevent EVENT_SECRET_SWITCH2
	iftrue SecretSwitchAlreadyPressed
	setevent EVENT_SECRET_SWITCH2
	opentext
	writetext JunctionSecretTemp
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	end
	
JunctionSecretSwitch3:
	checkevent EVENT_SECRET_SWITCH3
	iftrue SecretSwitchAlreadyPressed
	setevent EVENT_SECRET_SWITCH3
	opentext
	writetext JunctionSecretTemp
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	end
	
JunctionSecretSwitch4:
	checkevent EVENT_SECRET_SWITCH4
	iftrue SecretSwitchAlreadyPressed
	setevent EVENT_SECRET_SWITCH4
	opentext
	writetext JunctionSecretTemp
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	end

SecretSwitchAlreadyPressed
	opentext
	writetext JunctionAlreadyPressedText
	waitbutton
	closetext
	end
	
MovementData_0x19efe8:
	big_step_down
	step_end

MovementData_0x19efea:
	big_step_down
	big_step_down
	step_end

MovementData_0x19efed:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

MovementData_0x19eff4:
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

MovementData_0x19effa:
	step_down
	step_left
	step_end

MovementData_0x19effd:
	step_up
	step_left
	step_end

MovementData_0x19f000:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

JunctionSecretTemp:
	text "Oh! It's a hidden"
	line "switch!"
	
	para "Looks important."
	line "Let's press it!"
	done
	
JunctionAlreadyPressedText:
	text "Hmm, this secret"
	line "switch is already"
	cont "pressed."
	done
	
Route25BlockerGuyText:
	text "Someone made an"
	line "awful mess in"
	cont "here."

	para "They're still"
	line "cleaning it up."
	done
	
UnknownText_0x19f006:
	text "MISTY: Aww! Why"
	line "did you have to"

	para "show up and bug us"
	line "now?"

	para "Do you know what"
	line "they call people"
	cont "like you?"

	para "Pests! You heard"
	line "me right, pest!"

	para "…"

	para "…Oh? Those BADGES"
	line "you have… Are they"
	cont "JOHTO GYM BADGES?"

	para "If you have eight,"
	line "you must be good."

	para "OK, then. Come to"
	line "CERULEAN GYM."

	para "I'll be happy to"
	line "take you on."

	para "I'm MISTY, the"
	line "GYM LEADER in"
	cont "CERULEAN."
	done

SchoolboyDudleySeenText:
	text "I'm a psychic in"
	line "training."
	
	para "I'll show you"
	line "what I've got!"
	done

SchoolboyDudleyBeatenText:
	text "Woah! No good!"
	done

UnknownText_0x19f1b5:
	text "I'll just keep"
	line "at it if I want"
	
	para "to be a great"
	line "psychic."
	done

LassEllenSeenText:
	text "My #MON are"
	line "very caring."
	
	para "But they will"
	line "fight hard!"
	done

LassEllenBeatenText:
	text "My poor #MON!"
	done

UnknownText_0x19f208:
	text "Remember when"
	line "there was a town"
	cont "in JUNCTION PARK?"
	
	para "It got destroyed"
	line "and was just"
	cont "removed."
	done

SchoolboyJoeSeenText:
	text "Hey, you're in"
	line "my path!"

	para "Am I going the"
	line "wrong way?"
	done

SchoolboyJoeBeatenText:
	text "Stopped short."
	done

UnknownText_0x19f25c:
	text "I tried my best."
	
	para "That's all I can"
	line "muster."
	done

LassLauraSeenText:
	text "Oh, cool!"
	line "A lone trianer!"
	done

LassLauraBeatenText:
	text "I can't believe"
	line "I lost."
	done

UnknownText_0x19f2a6:
	text "I'm going to stay"
	line "here and train."
	done

CamperLloydSeenText:
	text "Can you make it"
	line "through the"
	
	para "JUNCTION PARK"
	line "maze?"
	done

CamperLloydBeatenText:
	text "Woah, you're good!"
	done

UnknownText_0x19f2f8:
	text "This place is a"
	line "lot cleaner than"
	cont "it used to be."
	done

LassShannonSeenText:
	text "JUNCTION PARK"
	line "is such a lovely"
	cont "place to battle!"
	done

LassShannonBeatenText:
	text "You're joking!"
	done

UnknownText_0x19f35b:
	text "I'm still having"
	line "fun, regardless."
	done

SupernerdPatSeenText:
	text "Eugh, I'm lost."
	
	para "Maybe I need to"
	line "battle a bit."
	done

SupernerdPatBeatenText:
	text "Arugh, that's no"
	line "good."
	done

UnknownText_0x19f41a:
	text "I should have"
	line "left a trail."
	done

UnknownText_0x19f43b:
	text "You took on one"
	line "more battle than"

	para "you expected, but"
	line "you won anyway."

	para "As promised, you"
	line "win a prize."
	done

JuncKevinText:
	text "I love to test my"
	line "#MON against"
	cont "others."
	
	para "You look strong,"
	line "let's go!"
	done

JuncKevinTextBeat:
	text "Those moves…"
	line "Incredible!"
	done

JuncKevinTextAfter:
	text "Your #MON are"
	line "really outstand-"
	cont "ing!"
	done

BillsHouseSignText:
	text "JUNCTION PARK"
	done

; unused
	text "BILL'S HOUSE"
	done

Route25_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 2, 18, 1, BILLS_HOUSE
	warp_def 16, 0, 7, ROUTE25GATES
	warp_def 17, 0, 8, ROUTE25GATES
	warp_def 14, 31, 9, ROUTE25GATES
	warp_def 15, 31, 10, ROUTE25GATES
	warp_def 3, 17, 1, ROUTE25GATES
	warp_def 41, 15, 13, ROUTE25GATES
	warp_def 41, 16, 14, ROUTE25GATES

.CoordEvents: db 2
	xy_trigger 1, 14, 25, 0, UnknownScript_0x19eea0, 0, 0
	xy_trigger 1, 15, 25, 0, UnknownScript_0x19eee0, 0, 0

.BGEvents: db 6
	signpost 3, 15, SIGNPOST_READ, BillsHouseSign
	signpost 9, 15, SIGNPOST_ITEM, Route25HiddenPotion
	signpost 29, 33, SIGNPOST_READ, JunctionSecretSwitch1
	signpost 36, 23, SIGNPOST_READ, JunctionSecretSwitch2
	signpost 23, 5, SIGNPOST_READ, JunctionSecretSwitch3
	signpost 37, 8, SIGNPOST_READ, JunctionSecretSwitch4

.ObjectEvents: db 11
	person_event SPRITE_MISTY, 0, 32, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	person_event SPRITE_COOLTRAINER_M, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route25BlockerGuy, EVENT_BEAT_BLUE
	person_event SPRITE_YOUNGSTER, 27, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	person_event SPRITE_LASS, 29, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassEllen, -1
	person_event SPRITE_YOUNGSTER, 35, 33, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyJoe, -1
	person_event SPRITE_LASS, 28, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassLaura, -1
	person_event SPRITE_YOUNGSTER, 30, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	person_event SPRITE_LASS, 35, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassShannon, -1
	person_event SPRITE_SUPER_NERD, 20, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	person_event SPRITE_COOLTRAINER_M, 43, 33, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, CooltrainerMScript_0x19efac, -1
	person_event SPRITE_POKE_BALL, 4, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
