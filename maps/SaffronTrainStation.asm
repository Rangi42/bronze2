const_value set 2
	const SAFFRONTRAINSTATION_OFFICER
	const SAFFRONTRAINSTATION_GYM_GUY
	const SAFFRONTRAINSTATION_TEACHER
	const SAFFRONTRAINSTATION_LASS

SaffronTrainStation_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	maptrigger .Trigger0

.MapCallbacks:
	db 0

.Trigger0:
	end

OfficerScript_0x18a81e:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .MagnetTrainToGoldenrod
	writetext UnknownText_0x18a8a9
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext UnknownText_0x18a8dd
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x18a917
	waitbutton
	closetext
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a898
	writebyte $1
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait $14
	end

.MovementBoardTheTrain:
	turn_head_down
	step_end

.PassNotInBag:
	writetext UnknownText_0x18a956
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x18a978
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	playmusic MUSIC_CHERRYGROVE_CITY
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a8a1
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a894
	opentext
	writetext UnknownText_0x18a993
	waitbutton
	closetext
	end

GymGuyScript_0x18a875:
	faceplayer
	opentext
;	checkevent EVENT_RETURNED_MACHINE_PART
;	iftrue UnknownScript_0x18a883
	writetext UnknownText_0x18a9ca
	waitbutton
	closetext
	end

UnknownScript_0x18a883:
	writetext UnknownText_0x18aa61
	waitbutton
	closetext
	end

TeacherScript_0x18a889:
	jumptextfaceplayer UnknownText_0x18aaab

LassScript_0x18a88c:
	jumptextfaceplayer UnknownText_0x18ab20

Start2ndQuestPokemon:
	opentext
	givepoke CHARIZARD, 45 
	givepoke LAPRAS, 46
	givepoke PIKACHU, 46
	givepoke PIDGEOT, 44
	givepoke NINETALES, 46
	givepoke PERSIAN, 45
	giveitem HYPER_POTION, 5
	giveitem REVIVE, 4
	clearflag ENGINE_BOULDERBADGE
	clearflag ENGINE_CASCADEBADGE
	clearflag ENGINE_THUNDERBADGE
	clearflag ENGINE_RAINBOWBADGE
	clearflag ENGINE_SOULBADGE
	clearflag ENGINE_MARSHBADGE
	clearflag ENGINE_VOLCANOBADGE
	clearflag ENGINE_EARTHBADGE
	closetext
	end

MovementData_0x18a88f:
	step_up
	step_up
	step_right
	turn_head_left
;	ss
	step_end

MovementData_0x18a894:
	step_left
	step_down
	step_down
	step_end

MovementData_0x18a898:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x18a8a1:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

UnknownText_0x18a8a9:
	text "I'm sorry, but you"
	line "can't ride the"
	
	para "MAGNET TRAIN"
	line "without a PASS!"
	done

UnknownText_0x18a8dd:
	text "We'll soon depart"
	line "for CHARCOAL TOWN."

	para "Are you coming on"
	line "board?"
	done

UnknownText_0x18a917:
	text "May I see your"
	line "rail PASS, please?"

	para "OK. Right this"
	line "way, please."
	done

UnknownText_0x18a956:
	text "Sorry, but you"
	line "don't have a PASS."
	done

UnknownText_0x18a978:
	text "We hope to see you"
	line "again."
	done

UnknownText_0x18a993:
	text "We have arrived in"
	line "WILLOWBRUSH."

	para "We hope to see you"
	line "again."
	done

UnknownText_0x18a9ca:
	text "My friends are"
	line "taking the"
	
	para "train to meet"
	line "me here."
	
	para "I haven't seen"
	line "them in so long!"
	done

UnknownText_0x18aa61:
	text "Whew…"

	para "How many times"
	line "have I gone back"

	para "and forth between"
	line "KANTO and JOHTO?"
	done

UnknownText_0x18aaab:
	text "I would like to"
	line "travel to another"
	cont "region some day."

	para "It would be a long"
	line "train ride, I bet."
	done

UnknownText_0x18ab20:
	text "Have you ever"
	line "read about how"
	cont "a MAGNET TRAIN"
	cont "works?"
	
	para "It's facinating!"
	done

SaffronTrainStation_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 17, 8, 10, VIOLET_CITY
	warp_def 17, 9, 10, VIOLET_CITY
	warp_def 5, 6, 4, GOLDENROD_MAGNET_TRAIN_STATION
	warp_def 5, 11, 3, GOLDENROD_MAGNET_TRAIN_STATION

.CoordEvents: db 1
	xy_trigger 0, 6, 11, 0, Script_ArriveFromGoldenrod, 0, 0

.BGEvents: db 1
	signpost 8, 8, SIGNPOST_READ, Start2ndQuestPokemon

.ObjectEvents: db 4
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x18a81e, -1
	person_event SPRITE_LASS, 14, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x18a875, -1
	person_event SPRITE_TEACHER, 11, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x18a889, -1
	person_event SPRITE_FISHER, 10, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x18a88c, -1
