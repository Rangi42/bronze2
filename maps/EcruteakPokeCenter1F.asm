const_value set 2
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

	; triggers
;	maptrigger .Trigger0
;	maptrigger .Trigger1

.MapCallbacks:
	db 0

;.Trigger0:
;	priorityjump .BillActivatesTimeCapsule
;	end

;.Trigger1:
;	end

;.BillActivatesTimeCapsule:
;	pause 30
;	playsound SFX_EXIT_BUILDING
;	appear ECRUTEAKPOKECENTER1F_BILL
;	waitsfx
;	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokeCenter1FBillMovement1
;	applymovement PLAYER, EcruteakPokeCenter1FPlayerMovement1
;	spriteface ECRUTEAKPOKECENTER1F_NURSE, UP
;	pause 10
;	spriteface ECRUTEAKPOKECENTER1F_NURSE, DOWN
;	pause 30
;	spriteface ECRUTEAKPOKECENTER1F_NURSE, UP
;	pause 10
;	spriteface ECRUTEAKPOKECENTER1F_NURSE, DOWN
;	pause 20
;	spriteface ECRUTEAKPOKECENTER1F_BILL, DOWN
;	pause 10
;	opentext
;	writetext EcruteakPokeCenter1F_BillText1
;	waitbutton
;	closetext
;	spriteface PLAYER, DOWN
;	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokeCenter1FBillMovement2
;	playsound SFX_EXIT_BUILDING
;	disappear ECRUTEAKPOKECENTER1F_BILL
;	clearevent EVENT_MET_BILL
;	setflag ENGINE_TIME_CAPSULE
;	dotrigger $1
;	waitsfx
;	end

EcruteakPokeCenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokeCenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokeCenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokeCenter1FPokefanMTextMobile

EcruteakPokeCenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokeCenter1FCooltrainerFText

EcruteakPokeCenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokeCenter1FGymGuyText

EcruteakPokeCenter1FBillMovement1:
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	turn_head_up
	step_end

EcruteakPokeCenter1FBillMovement2:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end

EcruteakPokeCenter1FPlayerMovement1:
	step_up
	step_up
	step_up
	step_end

EcruteakPokeCenter1F_BillText1:
	text "………"
	line "………"
	done

EcruteakPokeCenter1FPokefanMText:
	text "Do you prefer boy"
	line "or girl #MON?"
	
	para "I find a lot of"
	line "the girl ones"
	cont "adorable!"
	cont "So very cute!"
	done

EcruteakPokeCenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

EcruteakPokeCenter1FCooltrainerFText:
	text "Have you met PROF."
	line "ALDER?"
	
	para "I started my"
	line "#MON journey"
	cont "thanks to him!"
	done

EcruteakPokeCenter1FGymGuyText:
	text "I don't know if"
	line "you know this or"
	
	para "not but word is"
	line "you can evolve"
	
	para "some #MON using"
	line "elemental stones."
	
	para "But hey, you didn't"
	line "hear that from me!"
	done

EcruteakPokeCenter1F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 3, 6, ECRUTEAK_CITY
	warp_def 7, 4, 6, ECRUTEAK_CITY
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FNurseScript, -1
	person_event SPRITE_SUPER_NERD, 7, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	person_event SPRITE_COOLTRAINER_F, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FCooltrainerFScript, -1
	person_event SPRITE_POKEFAN_M, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FGymGuyScript, -1
	person_event SPRITE_BILL, -4, -4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
