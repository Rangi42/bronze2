const_value set 2
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_SILVER

NewBarkTown_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

NewBarkTown_TeacherStopsYouTrigger1:
	playmusic MUSIC_MOM	
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	applymovement PLAYER, Movement_TeacherBringsYouBack1_NBT
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouTrigger2:
	playmusic MUSIC_MOM	
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	applymovement PLAYER, Movement_TeacherBringsYouBack1_NBT
	special RestartMapMusic
	end

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

NewBarkTownFisherScript:
	jumptextfaceplayer Text_ElmDiscoveredNewMon
	
NewBarkTownTestMan:
	faceplayer
	opentext
	writetext Text_Testman
	waitbutton
	closetext
	wait 1
;	playsound Sfx_JumpOverLedge
;	applymovement NEWBARKTOWN_TESTMAN, Movement_Testman_NBT
;	wait 1
;	faceplayer
;	opentext
;	writetext Text_Testman2
;	waitbutton
;	closetext
;	credits
	setflag ENGINE_MAP_CARD
	end	

NewBarkTownSilverScript:
	opentext
	writetext NewBarkTownRivalText1
	waitbutton
	closetext
	spriteface NEWBARKTOWN_SILVER, LEFT
	opentext
	writetext NewBarkTownRivalText2
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_SILVER
	applymovement PLAYER, Movement_SilverPushesYouAway_NBT
	stopfollow
	pause 5
	spriteface NEWBARKTOWN_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, Movement_SilverShovesYouOut_NBT
	applymovement NEWBARKTOWN_SILVER, Movement_SilverReturnsToTheShadows_NBT
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

MapNewBarkTownSignpost1Script:
	jumptext PlayersHouseSignText

MapNewBarkTownSignpost2Script:
	jumptext ElmsLabSignText

MapNewBarkTownSignpost3Script:
	jumptext ElmsHouseSignText
	
Movement_TeacherRunsToYou1_NBT:
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_TeacherRunsToYou2_NBT:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

Movement_TeacherBringsYouBack1_NBT:
	step_right
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

Movement_SilverPushesYouAway_NBT:
	turn_head_up
	step_down
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

Movement_SilverReturnsToTheShadows_NBT:
	step_right
	step_end

MapNewBarkTownSignpostSPECIALScript:
	setflag ENGINE_MAP_CARD
	giveitem BICYCLE
	giveitem RARE_CANDY, 99
	giveitem MASTER_BALL, 99
	giveitem MAX_POTION, 99
	giveitem MAX_REVIVE, 99
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_FLASH
	giveitem HM_STRENGTH
	domaptrigger NEW_BARK_TOWN, $1
	opentext
	givepoke SQUIRTLE, 10, EXP_SHARE
	givepoke CHARMANDER, 10, EXP_SHARE
	givepoke BULBASAUR, 10, EXP_SHARE
	givepoke PIKACHU, 10, EXP_SHARE
	jumptext MapNewBarkTownSignpostSPECIALText
	end
	
MapNewBarkTownSignpostSPECIAL2Script:
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	specialphonecall SPECIALCALL_ASSISTANT
	jumptext MapNewBarkTownSignpostSPECIALText
	end
	
MapNewBarkTownSignpostSPECIAL3Script:
	clearevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	jumptext MapNewBarkTownSignpostSPECIALText
	end

MapNewBarkTownSignpostDEVScript
	jumptext MapNewBarkTownSignpostDEVText
	end
	
Text_GearIsImpressive:
	text "Life is wonderful"
	line "when you have a"
	cont "#MON!"
	
	para "Oh, you're going"
	line "to get one soon?"
	
	para "You should choose"
	line "a cute one!"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "Duck you,"
	line "you shunt."
	done

Text_ItsDangerousToGoAlone:
	text "I probably should-"
	line "n't go out without"
	cont "a #MON."

	para "Wild #MON"
	line "might attack."
	done

Text_YourMonIsAdorable:
	text "Your #MON!"
	line "It's the most"
	
	para "adorable thing"
	line "that I've ever"
	cont "seen!"
	
	para "I should get one"
	line "too!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Life is such an"
	line "adventure with"
	cont "#MON!"
	done

Text_ElmDiscoveredNewMon:
	text "I remember when I"
	line "was young."
	
	para "I had to catch my"
	line "first #MON with"
	cont "my bare hands!"
	
	para "Okay, maybe I'm"
	line "not that old."
	done

NewBarkTownRivalText1:
	text "<......>"

	para "So this is the"
	line "famous ELM #MON"
	cont "LAB…"
	done

NewBarkTownRivalText2:
	text "…What are you"
	line "staring at?"
	done

NewBarkTownSignText:
	text "OLD OAK TOWN"

	para "Old Roots Breathe"
	line "in the New"
	done

PlayersHouseSignText:
	text "<PLAYER>'S HOUSE"
	done

ElmsLabSignText:
	text "ALDER #MON LAB"
	done

ElmsHouseSignText:
	text "ELM'S HOUSE"
	done
	
Text_Testman:
	text "Hey. I'm just a"
	line "Test character."
	
	para "I even, work!"
	done

Text_Testman2:
	text "That was fun!"
	done

MapNewBarkTownSignpostSPECIALText:
	text "Here ya go!"
	done
	
MapNewBarkTownSignpostDEVText
	text "Dev Diary 1"
	para "The 2nd of JUNE"
	line "2016"
	
	para "I've just finished"
	line "watching back all"
	
	para "of AXMANAMV's"
	line "playthrough of"
	cont "#MON BRONZE."
	
	para "It made me realize"
	line "how many mistakes"
	
	para "I had made in the"
	line "game's design"
	
	para "and how I could do"
	line "much better this"
	cont "time around."
	
	para "AXMAN though,"
	line "he can never"
	cont "improve."
	
	para "All is lost."
	
	para "May ARCEUS have"
	line "mercy on his soul."
	
	para "-FREAKO out."
	
	done
	
NewBarkTown_MapEventHeader:: db 0, 0

.Warps: db 14
	warp_def 13, 10, 1, ELMS_LAB
	warp_def 3, 13, 1, KRISS_HOUSE_1F
	warp_def 3, 5, 1, KRISS_NEIGHBORS_HOUSE
	warp_def 7, 13, 1, ELMS_HOUSE
	warp_def 4, 19, 1, CHERRYGROVE_CITY
	warp_def 5, 19, 1, VIOLET_CITY
	warp_def 6, 19, 1, AZALEA_TOWN
	warp_def 7, 19, 3, GOLDENROD_CITY
	warp_def 8, 19, 6, ECRUTEAK_CITY
	warp_def 9, 19, 1, OLIVINE_CITY
	warp_def 10, 19, 1, MAHOGANY_TOWN
	warp_def 11, 19, 1, CIANWOOD_CITY
	warp_def 12, 19, 1, BLACKTHORN_CITY
	warp_def 13, 19, 1, PALLET_TOWN

.CoordEvents: db 2
	xy_trigger 0, 14, 1, 0, NewBarkTown_TeacherStopsYouTrigger1, 0, 0
	xy_trigger 0, 15, 1, 0, NewBarkTown_TeacherStopsYouTrigger2, 0, 0

.BGEvents: db 8
	signpost 12, 4, SIGNPOST_READ, NewBarkTownSign
	signpost 3, 11, SIGNPOST_READ, MapNewBarkTownSignpost1Script
	signpost 13, 7, SIGNPOST_READ, MapNewBarkTownSignpost2Script
	signpost -1, 2, SIGNPOST_READ, MapNewBarkTownSignpost3Script
	signpost 4, 20, SIGNPOST_READ, MapNewBarkTownSignpostSPECIALScript
	signpost 2, 12, SIGNPOST_READ, MapNewBarkTownSignpostDEVScript
	signpost 7, 20, SIGNPOST_READ, MapNewBarkTownSignpostSPECIAL2Script
	signpost -1, 3, SIGNPOST_READ, MapNewBarkTownSignpostSPECIAL3Script

.ObjectEvents: db 2
	person_event SPRITE_TEACHER, 9, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	person_event SPRITE_FISHER, 10, 16, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
