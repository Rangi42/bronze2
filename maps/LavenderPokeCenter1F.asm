const_value set 2
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x7e6a0:
	jumpstd pokecenternurse

GentlemanScript_0x7e6a3:
	jumptextfaceplayer UnknownText_0x7e6bd

TeacherScript_0x7e6a6:
	jumptextfaceplayer UnknownText_0x7e710

YoungsterScript_0x7e6a9:
	faceplayer
	opentext
;	checkevent EVENT_RETURNED_MACHINE_PART
;	iftrue UnknownScript_0x7e6b7
	writetext UnknownText_0x7e779
	waitbutton
	closetext
	end

UnknownScript_0x7e6b7:
	writetext UnknownText_0x7e7ed
	waitbutton
	closetext
	end

UnknownText_0x7e6bd:
	text "I'm very pleased"
	line "with the #MON"
	cont "CENTER's services."
	done

UnknownText_0x7e710:
	text "I traded #MON"
	line "with my friends"
	cont "upstairs!"
	done

UnknownText_0x7e779:
	text "NURSE JOY is so"
	line "pretty!"
	
	para "Oh, if only I were"
	line "older…"
	done

UnknownText_0x7e7ed:
	text "The DIRECTOR of"
	line "the RADIO STATION"
	cont "sure was happy."

	para "He said they're"
	line "back on the air"

	para "because the POWER"
	line "PLANT is running"
	cont "smoothly again."
	done

LavenderPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, LAVENDER_TOWN
	warp_def $7, $4, 1, LAVENDER_TOWN
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x7e6a0, -1
	person_event SPRITE_GENTLEMAN, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x7e6a3, -1
	person_event SPRITE_TEACHER, 3, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7e6a6, -1
	person_event SPRITE_YOUNGSTER, 5, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x7e6a9, -1
