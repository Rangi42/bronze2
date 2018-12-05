const_value set 2
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

VioletNicknameSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x693e9:
	jumptextfaceplayer UnknownText_0x693fa

LassScript_0x693ec:
	jumptextfaceplayer UnknownText_0x6945e

BirdScript_0x693ef:
	faceplayer
	opentext
	writetext UnknownText_0x6947c
	cry PIDGEY
	waitbutton
	closetext
	end

UnknownText_0x693fa:
	text "Make sure you"
	line "train all your"
	cont "#MON!"
	
	para "You can't rely"
	line "on just one"
	
	para "#MON to win all"
	line "your battles for"
	cont "you."
	done

UnknownText_0x6945e:
	text "Daddy is very"
	line "strict."
	
	para "He makes me play"
	line "with all of my"	
	cont "#MON equally."
	done

UnknownText_0x6947c:
	text "STRAWBERRY: Pijji!"
	done

VioletNicknameSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, VIOLET_CITY
	warp_def 7, 3, 4, VIOLET_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKEFAN_M, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x693e9, -1
	person_event SPRITE_TWIN, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x693ec, -1
	person_event SPRITE_BIRD, -7, -7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BirdScript_0x693ef, -1
