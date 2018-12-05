const_value set 2
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER

CeladonDeptStore5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x71004:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

ClerkScript_0x7100c:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

GentlemanScript_0x71014:
	jumptextfaceplayer UnknownText_0x71023

SailorScript_0x71017:
	jumptextfaceplayer UnknownText_0x71072

TeacherScript_0x7101a:
	jumptextfaceplayer UnknownText_0x710b6

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x71023:
	text "Ahoy!"
	line "My #MON need"
	
	para "bulking up, so"
	line "I bought some"
	
	para "STAT boosting"
	line "items here!"
	done

UnknownText_0x71072:
	text "I found a rare"
	line "item."
	
	para "PP UP. You heard"
	line "of it?"
	done

UnknownText_0x710b6:
	text "Gee golly am I"
	line "exhausted from"
	cont "shopping today."
	done

CeladonDeptStore5FDirectoryText:
	text "5F: DRUG STORE"
	done

CeladonDeptStore5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_4F
	warp_def $0, $f, 1, CELADON_DEPT_STORE_6F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore5FElevatorButton

.PersonEvents:
	db 5
	person_event SPRITE_CLERK, 5, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x71004, -1
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x7100c, -1
	person_event SPRITE_SAILOR, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x71014, -1
	person_event SPRITE_YOUNGSTER, 4, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript_0x71017, -1
	person_event SPRITE_TEACHER, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7101a, -1
