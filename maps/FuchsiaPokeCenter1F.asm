const_value set 2
	const FUCHSIAPOKECENTER1F_NURSE
	const FUCHSIAPOKECENTER1F_COOLTRAINER_M
	const FUCHSIAPOKECENTER1F_COOLTRAINER_F
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

FuchsiaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x196458, 0

.MapCallbacks:
	db 0

UnknownScript_0x196458:
	end

NurseScript_0x196459:
	jumpstd pokecenternurse

CooltrainerMScript_0x19645c:
	jumptextfaceplayer UnknownText_0x196494

CooltrainerFScript_0x19645f:
	jumptextfaceplayer UnknownText_0x1964dc

JanineImpersonatorScript_0x196462:
	faceplayer
	opentext
	writetext UnknownText_0x19652e
	waitbutton
	closetext
;	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, MovementData_0x196486
;	faceplayer
;	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_JANINE
;	special RunCallback_04
;	opentext
;	writetext UnknownText_0x19654e
;	waitbutton
;	closetext
;	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, MovementData_0x196486
;	faceplayer
;	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
;	special RunCallback_04
	end

MovementData_0x196486:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

UnknownText_0x196494:
	text "Hey! You seem"
	line "pretty cool!"
	
	para "Not everyone"
	line "beats GYMs in"
	cont "multiple regions."
	done

UnknownText_0x1964dc:
	text "I remember there"
	line "used to be a"
	
	para "hidden laboratory"
	line "in this town."
	
	para "It has since"
	line "disappeared."
	done

UnknownText_0x19652e:
	text "I went into the"
	line "GYM here, and my"
	
	para "hair stood on its"
	line "end."
	
	para "So much"
	line "electricity!"
	done

UnknownText_0x19654e:
	text "See? I look just"
	line "like her now!"
	done

FuchsiaPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, FUCHSIA_CITY
	warp_def $7, $4, 5, FUCHSIA_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NurseScript_0x196459, -1
	person_event SPRITE_COOLTRAINER_M, 4, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x19645c, -1
	person_event SPRITE_LASS, 4, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x19645f, -1
	person_event SPRITE_YOUNGSTER, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, JanineImpersonatorScript_0x196462, -1
