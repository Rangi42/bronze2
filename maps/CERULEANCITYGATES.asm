const_value set 2
	const CERULEANCITYGATES_OFFICER
	const CERULEANCITYGATES_TEACHER
	const CERULEANCITYGATES_YOUNGSTER

CERULEANCITYGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

CharcoalGuard1:
	jumptextfaceplayer CharcoalGuard1Text
	
CharcoalPathTeacher:
	jumptextfaceplayer CharcoalPathTeacherText

CharcoalPathYoungster:
	jumptextfaceplayer CharcoalPathYoungsterText
	
.Text:

CharcoalPathYoungsterText:
	text "The next town is"
	line "through here."
	
	para "That's me, always"
	line "giving helpful"
	cont "tips!"
	done

CharcoalGuard1Text:
	text "I'm really satis-"
	line "fied with my job."
	
	para "I'm confident that"
	line "I'm doing well!"
	done

CharcoalPathTeacherText:
	text "It looks like I"
	line "can't get to"
	
	para "CELESTE CITY"
	line "without a special"
	cont "#MON move."
	done
	
CERULEANCITYGATES_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 7, 4, 7, CERULEAN_CITY
	warp_def 7, 5, 7, CERULEAN_CITY
	warp_def 3, 4, 4, CERULEANCITYGATES
	warp_def 2, 19, 3, CERULEANCITYGATES
	warp_def 2, 45, 3, ROUTE12GATES
	warp_def 12, 20, 8, CERULEAN_CITY
	warp_def 12, 21, 9, CERULEAN_CITY
	warp_def 19, 20, 1, ROUTE_18
	warp_def 19, 21, 1, ROUTE_18

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_OFFICER, 15, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CharcoalGuard1, -1
	person_event SPRITE_TEACHER, 3, 28, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 3, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CharcoalPathTeacher, -1
	person_event SPRITE_YOUNGSTER, 4, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 3, 3, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CharcoalPathYoungster, -1
