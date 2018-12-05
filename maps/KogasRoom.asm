const_value set 2
	const KOGASROOM_KOGA

KogasRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180728, 0
	dw UnknownScript_0x18072c, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x18072d

UnknownScript_0x180728:
	priorityjump UnknownScript_0x180742
	end

UnknownScript_0x18072c:
	end

UnknownScript_0x18072d:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180737
	changeblock $4, $e, $2a
UnknownScript_0x180737:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180741
	changeblock $4, $2, $16
UnknownScript_0x180741:
	return

UnknownScript_0x180742:
	applymovement PLAYER, MovementData_0x18078e
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_0x18075a:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue UnknownScript_0x180788
	writetext UnknownText_0x180793
	waitbutton
	closetext
	winlosstext UnknownText_0x1808a9, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

UnknownScript_0x180788:
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	end

MovementData_0x18078e:
	step_up
	step_up
	step_up
	step_up
	step_end

UnknownText_0x180793:
	text "Welcome, <PLAYER>."
	
	para "I am CHRIS of the"
	line "ELITE FOUR."
	
	para "I'm surprised you"
	line "are able to face"
	
	para "me head to head"
	line "without breaking"
	cont "a sweat."
	
	para "I am fearless and"
	line "powerful."
	
	para "Just the very"
	line "mention of my name"
	
	para "sends people"
	line "running."
	
	para "But that's all"
	line "talk."
	
	para "I'll show you."
	done

UnknownText_0x1808a9:
	text "Gah wah!?"
	done

UnknownText_0x1808ca:
	text "You're something"
	line "else."
	
	para "But can you make"
	line "it past the third"
	cont "in line?"
	
	para "I'll be watching,"
	line "<PLAYER>."
	
	para "Now move on."
	done

KogasRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 2, WILLS_ROOM
	warp_def $11, $5, 3, WILLS_ROOM
	warp_def $2, $4, 1, BRUNOS_ROOM
	warp_def $2, $5, 2, BRUNOS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_KOGA, 7, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KogaScript_0x18075a, -1
