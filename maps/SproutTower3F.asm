const_value set 2
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x184945, 0
	dw UnknownScript_0x184946, 0

.MapCallbacks:
	db 0

UnknownScript_0x184945:
	end

UnknownScript_0x184946:
	end

UnknownScript_0x184947:
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement1
	playsound SFX_JUMP_OVER_LEDGE 
	spriteface PLAYER, LEFT
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement2
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement3
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue UnknownScript_0x1849d1
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer BLACKBELT_T, KYARA
	startbattle
	reloadmapafterbattle
	disappear SPROUTTOWER3F_SILVER
	setevent EVENT_SPROUT_TOWER_3F_POTION
	opentext
	writetext UnknownText_0x184cc2
	buttonsound
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	dotrigger $1
	writetext UnknownText_0x184d13
	waitbutton
	closetext
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement4
	playsound SFX_JUMP_OVER_LEDGE 
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement5
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	applymovement SPROUTTOWER3F_SAGE3, SageLiMovement6
	setevent EVENT_GOT_HM05_FLASH
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue StartTVStationScriptResturaunt
	end
	
StartTVStationScriptResturaunt
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	specialphonecall SPECIALCALL_ASSISTANT
	end

SageLiScript:
	end

UnknownScript_0x1849d1:
	writetext UnknownText_0x184d88
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer EVENT_BEAT_SAGE_JIN, SAGE, JIN, SageJinSeenText, SageJinBeatenText, 0, SageJinScript

SageJinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184dfa
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer EVENT_BEAT_SAGE_TROY, BLACKBELT_T, WAYN, SageTroySeenText, SageTroyBeatenText, 0, SageTroyScript

SageTroyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184ea4
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer EVENT_BEAT_SAGE_NEAL, BLACKBELT_T, OHAN, SageNealSeenText, SageNealBeatenText, 0, SageNealScript

SageNealScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184f12
	waitbutton
	closetext
	end

MapSproutTower3FSignpost3Script:
	jumptext UnknownText_0x184f37

MapSproutTower3FSignpost5Script:
	jumptext UnknownText_0x184f61

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball LEFTOVERS

MachopResturauntScript:
	opentext 
	writetext MachopResturauntText1
	cry MACHOP
	waitbutton
	closetext
	end
	
MovementData_0x184a1d:
	step_up
	step_up
	step_up
	step_up
	step_end

SageLiMovement1:
	big_step_down
	step_down
	step_end

SageLiMovement2:
	jump_step_down
	step_end

SageLiMovement3:
	step_down
	step_right
	step_end
	
SageLiMovement4:
	step_left
	step_up
	step_end
	
SageLiMovement5:
	jump_step_up
	step_end

SageLiMovement6:	
	step_up
	step_up
	step_up
	step_end
	
MovementData_0x184a24:
	step_right
	step_down
	step_end

MachopResturauntText1:
	text "MACHOP: MAAAAAH!"
	done

MachopResturauntText2:
	text "<RIVAL> used an"
	line "ESCAPE ROPE!"
	done
	
UnknownText_0x184bc8:
	text "<RIVAL> used an"
	line "ESCAPE ROPE!"
	done
	
SageLiSeenText:
	text "How dare you barge"
	line "into my kitchen,"
	
	para "disrupt my employ-"
	line "ees and my #-"
	cont "MON."
	
	para "You're after my"
	line "CUT HM, aren't you?"
	
	para "Tell you what."
	line "If you can beat me"
	cont "in a battle,"
	
	para "I'll share it with"
	line "you."
	
	para "But I'm afraid my"
	line "cullinary expert"
	
	para "#MON will be"
	line "too much for you!"
	
	para "Bon appetit!"
	
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

UnknownText_0x184cc2:
	text "You and your #-"
	line "MON must be true"
	cont "culinary masters!"
	
	para "I would be happy"
	line "to share with you"
	cont "this HM move!"
	done

UnknownText_0x184d13:
	text "CUT, does what the"
	line "name implies."
	
	para "A powerful slice"
	line "that will damage"
	cont "your enemies!"
	
	para "It can even be"
	line "used outside of"
	
	para "battle if you have"
	line "the GYM BADGE from"
	cont "WILDBARK VILLAGE."
	
	para "It can be used to"
	line "cut down small"
	cont "trees!"
	
	para "Farewell, I have"
	line "a broth to boil!"
	done

UnknownText_0x184d88:
	text "I hope you learn"
	line "and grow from your"
	cont "journey."
	done

SageJinSeenText:
	text "I train to find"
	line "enlightenment in"
	cont "#MON!"
	done

SageJinBeatenText:
	text "My training is"
	line "incomplete…"
	done

UnknownText_0x184dfa:
	text "As #MON grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #MON."
	done

SageTroySeenText:
	text "I can't allow a"
	line "kid to come into"
	cont "the kitchen!"
	
	para "what would the"
	line "boss think?"
	done

SageTroyBeatenText:
	text "You may just have"
	line "what it takes."
	done

UnknownText_0x184ea4:
	text "Keep going, and"
	line "you might get what"
	cont "you want."
	done

SageNealSeenText:
	text "This is a restr-"
	line "icted area."
	
	para "You shoulnd't be"
	line "be playing 'round"
	cont "these parts!"
	done

SageNealBeatenText:
	text "Cut down in my"
	line "prime."
	done

UnknownText_0x184f12:
	text "Keep going, but be"
	line "warned."
	
	para "The head chef does"
	line "not go lightly."
	
	para "But if he is"
	line "beaten, he will"
	cont "share his HM!"
	done

UnknownText_0x184f37:
	text "It's a powerful"
	line "painting of a"
	cont "BELLSPROUT."
	done

UnknownText_0x184f61:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower3F_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 11, 4, 4, SPROUT_TOWER_2F

.CoordEvents: db 1
	xy_trigger 0, 9, 16, 0, UnknownScript_0x184947, 0, 0

.BGEvents: db 6
	signpost 1, 8, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 1, 11, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 0, 9, SIGNPOST_READ, MapSproutTower3FSignpost3Script
	signpost 0, 10, SIGNPOST_READ, MapSproutTower3FSignpost3Script
	signpost 2, 1, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 15, 14, SIGNPOST_READ, MapSproutTower3FSignpost5Script

.ObjectEvents: db 7
	person_event SPRITE_BLACK_BELT, -3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSageJin, -1
	person_event SPRITE_BLACK_BELT, 8, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSageTroy, -1
	person_event SPRITE_BLACK_BELT, 4, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SageLiScript, EVENT_RIVAL_SPROUT_TOWER
	person_event SPRITE_BLACK_BELT, 11, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSageNeal, -1
	person_event SPRITE_POKE_BALL, -3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	person_event SPRITE_POKE_BALL, 8, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	person_event SPRITE_MACHOP, 8, 15, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MachopResturauntScript, EVENT_SPROUT_TOWER_3F_POTION
