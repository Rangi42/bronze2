const_value set 2
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_FISHER
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER

CherrygrovePokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x19696d:
	jumpstd pokecenternurse

FisherScript_0x196970:
	jumptextfaceplayer UnknownText_0x19698a

GentlemanScript_0x196973:
	jumptextfaceplayer UnknownText_0x1969c8

TeacherScript_0x196976:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196984
	writetext UnknownText_0x1969f1
	waitbutton
	closetext
	end

UnknownScript_0x196984:
	writetext UnknownText_0x196a46
	waitbutton
	closetext
	end

UnknownText_0x19698a:
	text "#MON CENTERS"
	line "are amazing!"
	
	para "All their serv-"
	line "ices are free!"
	done

UnknownText_0x1969c8:
	text "See that PC in"
	line "the corner?"
	
	para "any trainer is"
	line "free to use it!"
	
	para "You can store"
	line "ITEMS and #MON!"
	done

UnknownText_0x1969f1:
	text "There's a"
	line "COMMUNICATION"
	cont "CENTER upstairs."

	para "But they're still"
	line "finishing it up."
	done

UnknownText_0x196a46:
	text "The COMMUNICATION"
	line "CENTER is up-"
	cont "stairs."

	para "I battled #MON"
	line "there earlier!"
	done

CherrygrovePokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 2, CHERRYGROVE_CITY
	warp_def $7, $4, 2, CHERRYGROVE_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x19696d, -1
	person_event SPRITE_FISHER, 3, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x196970, -1
	person_event SPRITE_GENTLEMAN, 6, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x196973, -1
	person_event SPRITE_TEACHER, 6, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x196976, -1
