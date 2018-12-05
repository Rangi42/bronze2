const_value set 2
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
;	const VIOLETPOKECENTER1F_SCIENTIST

VioletPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

VioletPokeCenterNurse:
	jumpstd pokecenternurse

;VioletPokeCenter1F_ElmsAideScript:
;	faceplayer
;	opentext
;	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
;	iftrue .SecondTimeAsking
;	writetext UnknownText_0x69555
;.AskTakeEgg:
;	yesorno
;	iffalse .RefusedEgg
;	checkcode VAR_PARTYCOUNT
;	if_equal PARTY_LENGTH, .PartyFull
;	giveegg TOGEPI, 5
;	stringtotext .eggname, $1
;	scall .AideGivesEgg
;	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
;	clearevent EVENT_ELMS_AIDE_IN_LAB
;	clearevent EVENT_TOGEPI_HATCHED
;	domaptrigger ROUTE_32, $1
;	writetext UnknownText_0x695c5
;	waitbutton
;	closetext
;	checkcode VAR_FACING
;	if_equal UP, .AideWalksAroundPlayer
;	spriteface PLAYER, DOWN
;	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
;	playsound SFX_EXIT_BUILDING
;	disappear VIOLETPOKECENTER1F_SCIENTIST
;	waitsfx
;	end

;.AideWalksAroundPlayer:
;	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
;	spriteface PLAYER, DOWN
;	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
;	playsound SFX_EXIT_BUILDING
;	disappear VIOLETPOKECENTER1F_SCIENTIST
;	waitsfx
;	end
;
;.eggname
;	db "EGG@"
;
;.AideGivesEgg:
;	jumpstd receivetogepiegg
;	end
;
;.PartyFull:
;	writetext UnknownText_0x69693
;	waitbutton
;	closetext
;	end

;.RefusedEgg:
;	writetext UnknownText_0x696f2
;	waitbutton
;	closetext
;	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
;	end

;.SecondTimeAsking:
;	writetext UnknownText_0x69712
;	jump .AskTakeEgg

GameboyKidScript_0x69540:
	faceplayer
	opentext
	writetext UnknownText_0x69809
	waitbutton
	closetext
	spriteface VIOLETPOKECENTER1F_GAMEBOY_KID, DOWN
	end

GentlemanScript_0x69543:
	jumptextfaceplayer UnknownText_0x6983c

YoungsterScript_0x69546:
	jumptextfaceplayer UnknownText_0x698b8

;MovementData_AideWalksStraightOutOfPokecenter:
;	step_down
;	step_down
;	step_down
;	step_down
;	step_end

;MovementData_AideWalksLeftToExitPokecenter:
;	step_left
;	step_down
;	step_end

;MovementData_AideFinishesLeavingPokecenter:
;	step_down
;	step_down
;	step_down
;	step_end

UnknownText_0x69555:
	text "<PLAY_G>, long"
	line "time, no see."

	para "PROF.ELM asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take the"
	line "#MON EGG?"
	done

UnknownText_0x695c5:
	text "We discovered that"
	line "a #MON will not"

	para "hatch until it"
	line "grows in the EGG."

	para "It also has to be"
	line "with other active"
	cont "#MON to hatch."

	para "<PLAY_G>, you're"
	line "the only person"
	cont "we can rely on."

	para "Please call PROF."
	line "ELM when that EGG"
	cont "hatches!"
	done

UnknownText_0x69693:
	text "Oh, no. You can't"
	line "carry any more"
	cont "#MON with you."

	para "I'll wait here"
	line "while you make"
	cont "room for the EGG."
	done

UnknownText_0x696f2:
	text "B-but… PROF.ELM"
	line "asked for you…"
	done

UnknownText_0x69712:
	text "<PLAY_G>, will you"
	line "take the EGG?"
	done

UnknownText_0x6972d:
	text "I've been thinking"
	line "it'd be great to"

	para "be able to link up"
	line "and battle with my"

	para "friends who live"
	line "far away."
	done

UnknownText_0x69791:
	text "I just battled a"
	line "friend in CIANWOOD"
	cont "over a link."

	para "If you connect a"
	line "MOBILE ADAPTER,"

	para "you can link with"
	line "a friend far away."
	done

UnknownText_0x69809:
	text "I battled with my"
	line "friend VIA LINK"
	cont "CABLE upstairs."
	
	para "It's fun to"
	line "play together!"
	done

UnknownText_0x6983c:
	text "It has been a long"
	line "time since TEAM"

	para "ROCKET caused"	
	line "chaos in KANTO and"
	cont "JOHTO."
	
	para "Where are they now"
	line "I wonder?"
	
	para "I've heard some"
	line "rumours."
	done

UnknownText_0x698b8:
	text "Did you know if"
	line "you catch another"
	
	para "#MON if you"
	line "already six in"
	cont "your party,"
	
	para "they transfer to a"
	line "BOX on BILL's PC?"
	cont "It's quite handy!"
	done

VioletPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, VIOLET_CITY
	warp_def $7, $4, 5, VIOLET_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletPokeCenterNurse, -1
	person_event SPRITE_GAMEBOY_KID, 6, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x69540, -1
	person_event SPRITE_FISHER, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x69543, -1
	person_event SPRITE_YOUNGSTER, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x69546, -1
;	person_event SPRITE_SCIENTIST, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, VioletPokeCenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
