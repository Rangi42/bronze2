const_value set 2
	const HALLOFFAME_LANCE

HallOfFame_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump HallOfFameScript
	end

.Trigger1:
	end

HallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	spriteface PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	spriteface HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	dotrigger $1
	pause 15
	writebyte 2 ; Machine is in the Hall of Fame
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
;	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
;	domaptrigger SPROUT_TOWER_3F, $1
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
	clearevent EVENT_SWITCH_13 ;Elm start to talk about rocks
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_left
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step_up
	step_end

HallOfFame_LanceText:
	text "Today we hereby"
	line "immortalize you"

	para "and your #MON"
	line "by registering you"
	cont "as CHAMPIONS!"
	
	para "I can tell you"
	line "fought hard for"
	cont "this."
	
	para "You couldn't have"
	line "done it without"
	
	para "passion and love"
	line "for your #MON."
	
	para "Soon, everybody"
	line "in JANTO will"
	
	para "know your name for"
	line "eons to come."
	
	para "congratulations,"
	line "<PLAYER>."

	para "Allow me to"
	line "register you"

	para "and your #MON"
	line "as CHAMPIONS!"
	done

HallOfFame_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $4, 3, LANCES_ROOM
	warp_def $d, $5, 4, LANCES_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_LANCE, 12, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
