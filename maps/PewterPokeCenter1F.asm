const_value set 2
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_TEACHER
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_CHRIS

PewterPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x1a2ee7:
	jumpstd pokecenternurse

TeacherScript_0x1a2eea:
	jumptextfaceplayer UnknownText_0x1a2f01

PewterJigglypuff:
	opentext
	writetext PewterJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

BugCatcherScript_0x1a2ef7:
	jumptextfaceplayer UnknownText_0x1a2f75

Chris:
	faceplayer
	opentext
	writetext PewterChrisText
;	trade $4
	waitbutton
	closetext
	spriteface PEWTERPOKECENTER1F_CHRIS, LEFT
	end

PewterChrisText:
	text "NURSE JOY…"
	line "…Sigh…"
	done
	
UnknownText_0x1a2f01:
	text "It's a real"
	line "STRUGGLE when"
	
	para "you have no more"
	line "POWER POINTS."
	done

PewterJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

UnknownText_0x1a2f75:
	text "I was in a sticky"
	line "situation with my"
	
	para "#MON, so I"
	line "used a HM move"
	
	para "so I could cont-"
	line "inue exploring!"
	done

PewterPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 4, PEWTER_CITY
	warp_def $7, $4, 4, PEWTER_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x1a2ee7, -1
	person_event SPRITE_TEACHER, 6, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1a2eea, -1
	person_event SPRITE_JIGGLYPUFF, -5, -5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PewterJigglypuff, -1
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x1a2ef7, -1
	person_event SPRITE_POKEFAN_M, 1, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Chris, -1
