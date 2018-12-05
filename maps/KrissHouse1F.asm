const_value set 2
	const KRISSHOUSE1F_MOM1
	const KRISSHOUSE1F_MOM2
	const KRISSHOUSE1F_MOM3
	const KRISSHOUSE1F_MOM4
	const KRISSHOUSE1F_POKEFAN_F

KrissHouse1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	maptrigger .Trigger0
;	dw UnknownScript_0x7a4d7, 0

.MapCallbacks:
	db 0

.Trigger0
	end

UnknownScript_0x7a4d7:
	end

UnknownScript_0x7a4d8:
	setevent EVENT_GAVE_KURT_APRICORNS

HomeMomScriptBegin:
;	applymovement PLAYER, HomePlayerStepsDown
	spriteface KRISSHOUSE1F_MOM1, UP
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, KRISSHOUSE1F_MOM1, 15
;	spriteface PLAYER, LEFT
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x7a4f2
	applymovement KRISSHOUSE1F_MOM1, MomWalksToStairs
	jump UnknownScript_0x7a4f6

UnknownScript_0x7a4f2:
	applymovement KRISSHOUSE1F_MOM1, MomWalksToStairs
UnknownScript_0x7a4f6:
	opentext
	writetext UnknownText_0x7a604
	buttonsound
	stringtotext GearName, $1
	scall UnknownScript_0x7a57e
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
;	setflag ENGINE_PHONE_CARD
	clearevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_OLIVINE_GYM_JASMINE
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	clearevent EVENT_CERULEAN_GYM_ROCKET
;	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
;	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	setevent EVENT_SWITCH_13 ;Alder Doesn't Mention Rocks
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	setevent EVENT_SWITCH_9
	setevent EVENT_SWITCH_10
	setevent EVENT_SWITCH_5
	setevent EVENT_SWITCH_1
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_RED_STONE_PLACED_ON_ROCK
	setevent EVENT_BLUE_STONE_PLACED_ON_ROCK
	setevent EVENT_BROWN_STONE_PLACED_ON_ROCK
	setevent EVENT_GREEN_STONE_PLACED_ON_ROCK
	setevent EVENT_MT_MOON_RIVAL
	setevent EVENT_CELADON_LEADER_OFF
	setevent EVENT_CELADON_TEMPORARY_LEADER
	special Special_UnlockMysteryGift
	addcellnum PHONE_MOM
	dotrigger $1
	setevent EVENT_KRISS_HOUSE_MOM_1
	clearevent EVENT_KRISS_HOUSE_MOM_2
	writetext UnknownText_0x7a6bd
	buttonsound
	special Special_SetDayOfWeek
UnknownScript_0x7a519:
	writetext UnknownText_0x7a742
	yesorno
	iffalse UnknownScript_0x7a52a
	special Special_InitialSetDSTFlag
	yesorno
	iffalse UnknownScript_0x7a519
	jump SkippedPhoneScript

UnknownScript_0x7a52a:
	special Special_InitialClearDSTFlag
	yesorno
	iffalse UnknownScript_0x7a519
UnknownScript_0x7a531:
;	writetext UnknownText_0x7a763
;	yesorno
;	iffalse UnknownScript_0x7a542
;	jump UnknownScript_0x7a53b

UnknownScript_0x7a53b:
;	writetext UnknownText_0x7a7cb
;	buttonsound
	jump SkippedPhoneScript

UnknownScript_0x7a542:
	writetext UnknownText_0x7a807
	buttonsound
	jump SkippedPhoneScript

SkippedPhoneScript:
	writetext UnknownText_0x7a850
	waitbutton
	closetext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7a55d
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iffalse UnknownScript_0x7a564
	jump UnknownScript_0x7a56b

UnknownScript_0x7a55d:
;	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a600
	jump UnknownScript_0x7a56b

UnknownScript_0x7a564:
;	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a602
	jump UnknownScript_0x7a56b

UnknownScript_0x7a56b:
	applymovement KRISSHOUSE1F_MOM1, MomWalksToTable
	special RestartMapMusic
;	spriteface KRISSHOUSE1F_MOM1, LEFT
	end

UnknownScript_0x7a572:
	playmusic MUSIC_MOM
	jump UnknownScript_0x7a4f6

GearName:
	db "MAPGEAR@"

UnknownScript_0x7a57e:
	jumpstd receiveitem
	end

MomScript_0x7a582:
	faceplayer
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	checktriggers
	iffalse UnknownScript_0x7a572
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue UnknownScript_0x7a5af
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x7a5b8
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x7a5b5
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x7a5a9
	writetext UnknownText_0x7a8b5
	waitbutton
	closetext
	end

UnknownScript_0x7a5a9:
	writetext UnknownText_0x7a8e5
	waitbutton
	closetext
	end

UnknownScript_0x7a5af:
	writetext UnknownText_0x7a957
	waitbutton
	closetext
	end

UnknownScript_0x7a5b5:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
UnknownScript_0x7a5b8:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Special_BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checkmorn
	iftrue .MornScript
	checkday
	iftrue .DayScript
	checknite
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	spriteface KRISSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomWalksToStairs:
	slow_step_right
	slow_step_right
	slow_step_up
	step_end

MovementData_0x7a5fe:
	slow_step_right
	step_end

MovementData_0x7a600:
	turn_head_left
	step_end

MovementData_0x7a602:
	slow_step_left
	step_end
	
HomePlayerStepsDown:
	step_down
	step_end

MomWalksToTable:
	slow_step_down
	slow_step_left
	slow_step_left
	step_end
	
UnknownText_0x7a604:
	text "Oh, <PLAYER>…!"
	line "You're up!"
	
	para "PROF.ALDER has"
	line "been waiting for"
	
	para "you to visit his"
	line "LAB!"
	
	para "Oh yes, and"
	line "I bought you a"
	cont "MAPGEAR!"
	done

UnknownText_0x7a6bd:
	text "You can use it"
	line "when traveling,"
	
	para "the MAPGEAR is a"
	line "digital map and a"
	cont "clock!"
	
	para "Oh, I almost"
	line "forgot."
	
	para "The day of the"
	line "week isn't set"
	cont "yet."
	done

UnknownText_0x7a742:
	text "Is it Daylight"
	line "Saving Time now?"
	done

UnknownText_0x7a763:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

UnknownText_0x7a7cb:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

UnknownText_0x7a807:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

UnknownText_0x7a850:
	text "I won't keep you"
	line "any longer."
	
	para "All kids need to"
	line "leave home some"
	cont "day."
	
	para "I'm so proud of"
	line "you!"
	done

UnknownText_0x7a8b5:
	text "PROF.ALDER is"
	line "waiting for you."

	para "Get going dear!"
	done

UnknownText_0x7a8e5:
	text "Is that your #-"
	line "MON?"
	
	para "It's sooo"
	line "adorable!"
	
	para "But not as"
	line "adorable as you,"
	cont "pumpkin!"
	done

UnknownText_0x7a957:
	text "<PLAYER>, go for"
	line "it!"

	para "I'm always rooting"
	line "for you!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

StoveText:
	text "MOM always keeps"
	line "the stove clean."
	done

SinkText:
	text "A couple of dishes"
	line "are sitting in the"
	cont "sink."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "It's all my SODA"
	line "POP!"
	done

TVText:
	text "There's a movie on"
	line "TV: Some kids are"
	
	para "exploring a cave"
	line "with a treasure"
	cont "map."
	
	para "I better get going"
	line "too!"
	done

KrissHouse1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $6, 2, NEW_BARK_TOWN
	warp_def $7, $7, 2, NEW_BARK_TOWN
	warp_def $0, $9, 1, KRISS_HOUSE_2F

.XYTriggers:
	db 1
	xy_trigger 0, 1, 9, $0, HomeMomScriptBegin, $0, $0
;	xy_trigger 0, $4, $9, $0, HomeMomScriptBegin, $0, $0

.Signposts:
	db 4
	signpost 1, 0, SIGNPOST_READ, StoveScript
	signpost 1, 1, SIGNPOST_READ, SinkScript
	signpost 1, 2, SIGNPOST_READ, FridgeScript
	signpost 1, 4, SIGNPOST_READ, TVScript

.PersonEvents:
	db 5
	person_event SPRITE_MOM, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_1
	person_event SPRITE_MOM, 2, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 1, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_MOM, 4, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 2, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_MOM, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 4, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_POKEFAN_F, -5, -5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NeighborScript, EVENT_KRISS_HOUSE_1F_NEIGHBOR
