const_value set 2
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger0, 0
	dw .Trigger1, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .BrunosRoomDoors

.Trigger0:
	priorityjump UnknownScript_0x1809ad
	end

.Trigger1:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepDoorClosed
	changeblock $4, $e, $2a
.KeepDoorClosed:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .OpenDoor
	changeblock $4, $2, $16
.OpenDoor:
	return

UnknownScript_0x1809ad:
	applymovement PLAYER, MovementData_0x1809f9
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_0x1809c5:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue UnknownScript_0x1809f3
	writetext UnknownText_0x1809fe
	waitbutton
	closetext
	winlosstext UnknownText_0x180b23, 0
	loadtrainer BRUNO, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext UnknownText_0x180b3c
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

UnknownScript_0x1809f3:
	writetext UnknownText_0x180b3c
	waitbutton
	closetext
	end

MovementData_0x1809f9:
	step_up
	step_up
	step_up
	step_up
	step_end

UnknownText_0x1809fe:
	text "I am HAYDEN of"
	line "the ELITE FOUR."

	para "I travel every day"
	line "from a far away"
	
	para "farm town so I"
	line "can challenge"
	
	para "some of the"
	line "strongest trainers"
	cont "in JANTO."
	
	para "You're welcome"
	line "to give it a shot."
	done

UnknownText_0x180b23:
	text "I am humbled."
	done

UnknownText_0x180b3c:
	text "It's been a long"
	line "time since I've"
	cont "seen such power."
	
	para "You may move on"
	line "to the next"
	cont "challenge."
	done

BrunosRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 3, KOGAS_ROOM
	warp_def $11, $5, 4, KOGAS_ROOM
	warp_def $2, $4, 1, KARENS_ROOM
	warp_def $2, $5, 2, KARENS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_BRUNO, 7, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrunoScript_0x1809c5, -1
