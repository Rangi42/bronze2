const_value set 2
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x709e0:
	jumptextfaceplayer UnknownText_0x709ef

GentlemanScript_0x709e3:
	jumptextfaceplayer UnknownText_0x70a35

TeacherScript_0x709e6:
	jumptextfaceplayer UnknownText_0x70aa9

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x709ef:
	text "Hello! Welcome to"
	line "CASCADE DEPT."
	cont "STORE!"

	para "The directory is"
	line "on the wall."
	done

UnknownText_0x70a35:
	text "Back to shopping."
	line "Again."
	
	para "My poor wallet."
	line "Have mercy."
	
	para "At least she didn't"
	line "bring the kids."
	done

UnknownText_0x70aa9:
	text "I'll have that"
	line "And that."
	
	para "And one of these."
	line "Shopping is so"
	cont "much fun!"
	
	para "My husband is so"
	line "generous!"
	done

CeladonDeptStore1FDirectoryText:
	text "1F: SERVICE"
	line "    COUNTER"

	para "2F: TRAINER'S"
	line "    MARKET"

	para "3F: TM SHOP"

	para "4F: BALL BASKET"

	para "5F: DRUG STORE"

	para "6F: ROOFTOP"
	line "    SQUARE"
	done

CeladonDeptStore1F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 7, 16, SAFFRON_CITY
	warp_def 7, 8, 16, SAFFRON_CITY
	warp_def 0, 15, 2, CELADON_DEPT_STORE_2F
	warp_def 0, 2, 1, CELADON_DEPT_STORE_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore1FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore1FElevatorButton

.ObjectEvents: db 3
	person_event SPRITE_RECEPTIONIST, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x709e0, -1
	person_event SPRITE_GENTLEMAN, 4, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x709e3, -1
	person_event SPRITE_TEACHER, 3, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x709e6, -1
