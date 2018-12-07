const_value set 2
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x62d2d

UnknownScript_0x62d2d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d38
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	return

UnknownScript_0x62d38:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	return

UnknownScript_0x62d3d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d62
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	spriteface ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	spriteface PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, MovementData_0x62d97
	stopfollow
	spriteface PLAYER, DOWN
	opentext
	writetext UnknownText_0x62e41
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, MovementData_0x62d9a
UnknownScript_0x62d62:
	end

TeacherScript_0x62d63:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x62d84
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue UnknownScript_0x62d7e
	writetext UnknownText_0x62d9d
	buttonsound
	verbosegiveitem TM_PSYCH_UP
	iffalse UnknownScript_0x62d82
	setevent EVENT_GOT_TM12_SWEET_SCENT
UnknownScript_0x62d7e:
	writetext UnknownText_0x62df6
	waitbutton
UnknownScript_0x62d82:
	closetext
	end

UnknownScript_0x62d84:
	writetext UnknownText_0x62e41
	buttonsound
	closetext
	end

IlexGateButterfree:
	opentext
	writetext UnknownText_0x62e83
	cry BUTTERFREE
	waitbutton
	closetext
	end

LassScript_0x62d94:
	jumptextfaceplayer UnknownText_0x62e97

MovementData_0x62d97:
	step_up
	step_up
	step_end

MovementData_0x62d9a:
	step_down
	step_right
	step_end

UnknownText_0x62d9d:
	text "Heh, if you want"
	line "to mess with your"
	
	para "enemies, this'll do"
	line "you good."
	done

UnknownText_0x62df6:
	text "It's PSYCH UP."
	line "A move that can"
	
	para "copy your foe's"
	line "stats in battle."
	done

UnknownText_0x62e41:
	text "Something's wrong"
	line "in ILEX FOREST…"

	para "You should stay"
	line "away right now."
	done

UnknownText_0x62e83:
	text "BUTTERFREE: Freeh!"
	done

UnknownText_0x62e97:
	text "Haha!"
	
	para "No hard feelings"
	line "about my little"
	cont "test, heh?"
	
	para "It can be a lot"
	line "of fun!"
	
	para "Haha!"
	done

Route34IlexForestGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 5, ROUTE_32
	warp_def 0, 5, 7, ROUTE_32
	warp_def 7, 4, 1, ILEX_FOREST
	warp_def 7, 5, 4, ILEX_FOREST

.CoordEvents: db 1
	xy_trigger 0, 9, 4, 0, UnknownScript_0x62d3d, 0, 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x62d63, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	person_event SPRITE_BUTTERFREE, -3, 15, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlexGateButterfree, -1
	person_event SPRITE_BUG_CATCHER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x62d94, EVENT_FOREST_QUIZ_MASTER_IN_GATE
	person_event SPRITE_TEACHER, 12, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x62d63, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
