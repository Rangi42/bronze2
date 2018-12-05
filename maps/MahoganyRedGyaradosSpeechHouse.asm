const_value set 2
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER

MahoganyRedGyaradosSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BlackBeltScript_0x19997f:
	jumptextfaceplayer UnknownText_0x19999c

TeacherScript_0x199982:
	faceplayer
	opentext
;	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	iftrue UnknownScript_0x199990
	writetext UnknownText_0x199a0e
	waitbutton
	closetext
	end

UnknownScript_0x199990:
	writetext UnknownText_0x199a3d
	waitbutton
	closetext
	end

UnknownScript_0x195996:
	jumpstd picturebookshelf

UnknownScript_0x195999:
	jumpstd magazinebookshelf

UnknownText_0x19999c:
	text "Do you ever watch"
	line "the TV?"
	
	para "There's a beauti-"
	line "ful woman on there"
	
	para "on my favorite"
	line "show. SCARLET,"
	cont "her name is!"
	
	para "Just don't tell"
	line "my wife!"
	done

UnknownText_0x199a0e:
	text "My my, what is"
	line "that posture?"
	
	para "You should stand"
	line "up straight."
	
	para "It's good for your"
	line "back!"
	done

UnknownText_0x199a3d:
	text "I've been hearing"
	line "laughter on the"

	para "radio…"
	line "It's creepy."
	done

MahoganyRedGyaradosSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 3, 2, MAHOGANY_TOWN
	warp_def 7, 4, 2, MAHOGANY_TOWN

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x19997f, -1
	person_event SPRITE_TEACHER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x199982, -1
