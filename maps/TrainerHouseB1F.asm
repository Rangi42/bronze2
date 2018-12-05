const_value set 2
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_CHRIS

TrainerHouseB1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw Trigger0, 0

.MapCallbacks:
	db 0

Trigger0:
	end

TrainerHouseReceptionistScript:
	spriteface PLAYER, UP
	opentext
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .FoughtTooManyTimes
	writetext TrainerHouseB1FIntroText
	buttonsound
	special SpecialTrainerHouse
	iffalse .GetCal3Name
	trainertotext CAL, CAL2, $0
	jump .GotName

.GetCal3Name:
	trainertotext CAL, CAL3, $0
.GotName:
	writetext TrainerHouseB1FYourOpponentIsText
	buttonsound
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	special SpecialTrainerHouse
	iffalse .NoSpecialBattle
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL2
	startbattle
	reloadmapafterbattle
	iffalse .End
.NoSpecialBattle:
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL3
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.FoughtTooManyTimes:
	writetext TrainerHouseB1FSecondChallengeDeniedText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

LookoutReception:
	jumptextfaceplayer LookoutReceptionText
	
LookoutPerson1:
	jumptextfaceplayer LookoutPerson1Text
	
LookoutPerson2:
	jumptextfaceplayer LookoutPerson2Text
	
LookoutPerson3:
	jumptextfaceplayer LookoutPerson3Text
	
LookoutPerson4:
	jumptextfaceplayer LookoutPerson4Text
	
LookoutPerson5:
	jumptextfaceplayer LookoutPerson5Text
	
LookoutPerson6:
	jumptextfaceplayer LookoutPerson6Text
	
Movement_EnterTrainerHouseBattleRoom:
	step_left
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step_up
	step_end

Movement_TrainerHouseTurnBack:
	step_right
	step_end

LookoutUp:
	spriteface TRAINERHOUSEB1F_RECEPTIONIST, UP
	opentext
	writetext LookoutReceptionText
	waitbutton
	closetext
	end
	
LookoutLeft:
	spriteface TRAINERHOUSEB1F_RECEPTIONIST, LEFT
	opentext
	writetext LookoutReceptionText
	waitbutton
	closetext
	end
	
BinocularsSprite1:
	checkcode VAR_FACING
	if_equal LEFT, BinocularsSpriteItem
	if_equal RIGHT, BinocularsSpriteItem
	jumptext BinocularsSprite1Text
	
BinocularsSprite2:
	checkcode VAR_FACING
	if_equal LEFT, BinocularsSpriteItem
	if_equal RIGHT, BinocularsSpriteItem
	jumptext BinocularsSprite2Text
	
BinocularsSprite3:
	checkcode VAR_FACING
	if_equal LEFT, BinocularsSpriteItem
	if_equal RIGHT, BinocularsSpriteItem
	jumptext BinocularsSprite3Text
	
BinocularsSprite4:
	checkcode VAR_FACING
	if_equal LEFT, BinocularsSpriteItem
	if_equal RIGHT, BinocularsSpriteItem
	jumptext BinocularsSprite4Text
	
BinocularsSpriteItem:
	jumptext BinocularsSpriteItemText

BinocularsSprite1Text:
	text "Looked into the"
	line "binoculars…"
	
	para "It's KANTO!"
	done
	
BinocularsSprite2Text:
	text "Looked into the"
	line "binoculars…"
	
	para "A girl is swim-"
	line "ming in the ocean!"
	done
	
BinocularsSprite3Text:
	text "Looked into the"
	line "binoculars…"
	
	para "#MON are riding"
	line "on the sea!"
	done
	
BinocularsSprite4Text:
	text "Looked into the"
	line "binoculars…"
	
	para "CINNABAR ISLAND"
	line "has been fully"
	cont "rebuilt!"
	done
	
BinocularsSpriteItemText:
	text "It's a set of"
	line "binoculars!"
	done
	
LookoutPerson1Text:
	text "I'm going to"
	line "include this"
	
	para "place in my"
	line "must see guide"
	cont "book!"
	done
	
LookoutPerson2Text:
	text "Aw man, I was"
	line "looking for a"
	cont "battle up here."
	done

LookoutPerson3Text:
	text "Hmm… I can't see"
	line "much but water"
	cont "from down here."
	
	para "I'd better go"
	line "upstairs."
	done
	
LookoutPerson4Text:
	text "I love the view!"
	line "mommy likes to"
	cont "bring me here."
	done
	
LookoutPerson5Text:
	text "I think I saw"
	line "some rare flying"
	cont "#MON."
	done
	
LookoutPerson6Text:
	text "Oh I need a"
	line "rest."
	done
	
LookoutReceptionText:
	text "Welcome to ORCHID"
	line "CITY LOOKOUT."
	
	para "Take a gander over"
	line "the ocean from the"
	cont "top floor!"
	done
	
TrainerHouseB1FIntroText:
	text "Hi. Welcome to our"
	line "TRAINING HALL."

	para "You may battle a"
	line "trainer once per"
	cont "day."
	done

TrainerHouseB1FYourOpponentIsText:
	text_from_ram StringBuffer3
	text " is your"
	line "opponent today."
	done

TrainerHouseB1FAskWantToBattleText:
	text "Would you like to"
	line "battle?"
	done

TrainerHouseB1FGoRightInText:
	text "Please go right"
	line "through."

	para "You may begin"
	line "right away."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Sorry. Only those"
	line "trainers who will"

	para "be battling are"
	line "allowed to go in."
	done

TrainerHouseB1FSecondChallengeDeniedText:
	text "I'm sorry."
	line "This would be your"

	para "second time today."
	line "You're permitted"

	para "to enter just once"
	line "a day."
	done

TrainerHouseB1FCalBeatenText:
	text "I lost…"
	line "Darn…"
	done

TrainerHouseB1FCalBeforeText:
	text "I traveled out"
	line "here just so I"
	cont "could battle you."
	done

TrainerHouseB1F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 11, 4, 11, VIRIDIAN_CITY
	warp_def 6, 15, 3, TRAINER_HOUSE_B1F
	warp_def 22, 15, 2, TRAINER_HOUSE_B1F
	warp_def 11, 5, 11, VIRIDIAN_CITY

.CoordEvents: db 1
	xy_trigger 0, -3, 4, 0, TrainerHouseReceptionistScript, 0, 0

.BGEvents: db 2
	signpost 10, 9, SIGNPOST_READ, LookoutUp
	signpost 11, 8, SIGNPOST_READ, LookoutLeft

.ObjectEvents: db 12
	person_event SPRITE_OFFICER, 11, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LookoutReception, -1
	person_event SPRITE_CHRIS, -3, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_TEACHER, 5, 3, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LookoutPerson1, -1
	person_event SPRITE_YOUNGSTER, 21, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LookoutPerson2, -1
	person_event SPRITE_POKEFAN_M, 3, 10, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LookoutPerson3, -1
	person_event SPRITE_TWIN, 19, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LookoutPerson4, -1
	person_event SPRITE_LASS, 8, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LookoutPerson5, -1
	person_event SPRITE_TEACHER, 25, 7, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LookoutPerson6, -1
	person_event SPRITE_OLD_LINK_RECEPTIONIST, 19, 9, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BinocularsSprite1, -1
	person_event SPRITE_OLD_LINK_RECEPTIONIST, 3, 9, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BinocularsSprite2, -1
	person_event SPRITE_OLD_LINK_RECEPTIONIST, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BinocularsSprite3, -1
	person_event SPRITE_OLD_LINK_RECEPTIONIST, 19, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BinocularsSprite4, -1
