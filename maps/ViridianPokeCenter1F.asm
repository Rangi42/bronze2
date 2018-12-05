const_value set 2
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x9b690:
	jumpstd pokecenternurse

CooltrainerMScript_0x9b693:
	faceplayer
	opentext
;	checkevent EVENT_BLUE_IN_CINNABAR
;	iftrue .BlueReturned
	writetext UnknownText_0x9b6ad
	waitbutton
	closetext
	end

.BlueReturned:
	writetext UnknownText_0x9b6f5
	waitbutton
	closetext
	end

CooltrainerFScript_0x9b6a7:
	jumptextfaceplayer UnknownText_0x9b76b

BugCatcherScript_0x9b6aa:
	jumptextfaceplayer UnknownText_0x9b7c8

UnknownText_0x9b6ad:
	text "I'm interested in"
	line "new and undis-"
	cont "covered #MON."
	done

UnknownText_0x9b6f5:
	text "There are no GYM"
	line "TRAINERS at the"
	cont "VIRIDIAN GYM."

	para "The LEADER claims"
	line "his policy is to"

	para "win without having"
	line "any underlings."
	done

UnknownText_0x9b76b:
	text "I heard that"
	line "TEAM ROCKET tried"
	cont "come back again."
	
	para "Oh, you stopped"
	line "them?"
	
	para "You must be"
	line "famous!"
	done

UnknownText_0x9b7c8:
	text "I've tried to"
	line "beat a GYM leader,"
	
	para "but so far I've had"
	line "no luck."
	done

ViridianPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, VIRIDIAN_CITY
	warp_def $7, $4, 5, VIRIDIAN_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x9b690, -1
	person_event SPRITE_SUPER_NERD, 4, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x9b693, -1
	person_event SPRITE_COOLTRAINER_F, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x9b6a7, -1
	person_event SPRITE_GENTLEMAN, 6, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x9b6aa, -1
