const_value set 2
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER

OlivinePokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x9c002:
	jumpstd pokecenternurse

FishingGuruScript_0x9c005:
	jumpstd happinesschecknpc

FisherScript_0x9c008:
	jumptextfaceplayer UnknownText_0x9c00e

TeacherScript_0x9c00b:
	jumptextfaceplayer UnknownText_0x9c086

UnknownText_0x9c00e:
	text "Boy let me tell"
	line "you, these waters"
	
	para "here are pristine"
	line "and pure beyond"
	
	para "your wildest"
	line "imagination."
	
	para "Where do you think"
	line "they get FRESH"
	cont "WATER from?"
	done

UnknownText_0x9c086:
	text "I release the"
	line "#MON I can't"
	
	para "care for anymore"
	line "into the wild by"
	cont "using the PC."
	
	para "Sometimes it's for"
	line "the best."
	done

OlivinePokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, OLIVINE_CITY
	warp_def $7, $4, 1, OLIVINE_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x9c002, -1
	person_event SPRITE_FISHING_GURU, 4, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x9c005, -1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x9c008, -1
	person_event SPRITE_POKEFAN_M, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x9c00b, -1
