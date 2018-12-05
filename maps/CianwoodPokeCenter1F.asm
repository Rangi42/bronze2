const_value set 2
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x9dbcf:
	jumpstd pokecenternurse

LassScript_0x9dbd2:
	jumptextfaceplayer UnknownText_0x9dbed

CianwoodGymGuyScript:
	faceplayer
;	checkevent EVENT_BEAT_CHUCK
;	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

SuperNerdScript_0x9dbea:
	jumptextfaceplayer UnknownText_0x9ded7

UnknownText_0x9dbed:
	text "I met this girl"
	line "named <RIVAL>."
	
	para "I'd never met any-"
	line "body that rude."
	
	para "I swear they're"
	line "up to no good."
	done

CianwoodGymGuyText:
	text "I wish I could be"
	line "an adult."
	
	para "I could command"
	line "a team of #-"
	cont "MON to help rescue"
	
	para "people lost at"
	line "sea!"
	
	para "Mommy said helping"
	line "people is what"
	
	para "makes a good"
	line "person."
	done

CianwoodGymGuyWinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

UnknownText_0x9ddf2:
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

UnknownText_0x9de66:
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

UnknownText_0x9ded7:
	text "I love filming"
	line "#MON!"
	
	para "I'm working on"
	line "a documentary"
	
	para "about how EGGS"
	line "are made!"
	done

CianwoodPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 3, CIANWOOD_CITY
	warp_def $7, $4, 3, CIANWOOD_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x9dbcf, -1
	person_event SPRITE_LASS, 5, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x9dbd2, -1
	person_event SPRITE_TWIN, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	person_event SPRITE_ROCKER, 6, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x9dbea, -1
