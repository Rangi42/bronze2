const_value set 2
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x191603:
	jumpstd pokecenternurse

FishingGuruScript_0x191606:
	faceplayer
	opentext
;	checkevent EVENT_FOUGHT_SNORLAX
;	iftrue UnknownScript_0x191614
	writetext UnknownText_0x191620
	waitbutton
	closetext
	end

UnknownScript_0x191614:
	writetext UnknownText_0x191698
	waitbutton
	closetext
	end

SailorScript_0x19161a:
	jumptextfaceplayer UnknownText_0x1916fe

BugCatcherScript_0x19161d:
	jumptextfaceplayer UnknownText_0x19173b

UnknownText_0x191620:
	text "I think I want to"
	line "be an interior"
	
	para "designer for"
	line "#MON CENTERS."
	done

UnknownText_0x191698:
	text "There used to be a"
	line "sleeping #MON"

	para "lying in front of"
	line "DIGLETT'S CAVE."

	para "But it seems to"
	line "have disappeared."
	done

UnknownText_0x1916fe:
	text "Ah, I can't wait"
	line "to go sailing"
	cont "on the seas again."
	done

UnknownText_0x19173b:
	text "Have you talked"
	line "the FISHING GURU"
	cont "next to the GYM?"
	
	para "He has some crazy"
	line "ideas about color-"
	cont "ed #MON."
	done

VermilionPokeCenter1F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 3, 2, VERMILION_CITY
	warp_def 7, 4, 2, VERMILION_CITY
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x191603, -1
	person_event SPRITE_TEACHER, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x191606, -1
	person_event SPRITE_SAILOR, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript_0x19161a, -1
	person_event SPRITE_FISHER, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x19161d, -1
