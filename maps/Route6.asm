const_value set 2
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokefanmRex:
	trainer EVENT_BEAT_POKEFANM_REX, POKEFANM, REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, PokefanmRexScript

PokefanmRexScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad9ff
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer EVENT_BEAT_POKEFANM_ALLAN, POKEFANM, ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, PokefanmAllanScript

PokefanmAllanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ada88
	waitbutton
	closetext
	end

Route6Blocker:
	jumptextfaceplayer Route6BlockerText
	
PokefanMScript_0x1ad951:
	jumptextfaceplayer UnknownText_0x1ad957

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6BlockerText:
	text "Hey you should"
	line "check out ORCHID"
	cont "CITY's GYM."
	
	para "It's a real"
	line "challenge!"
	done
	
UnknownText_0x1ad957:
	text "I just decided"
	line "to be a trainer"
	cont "recently."
	
	para "I spent most of"
	line "my life working"
	cont "in a factory."
	
	para "I thought it was"
	line "time for excite-"
	cont "ment in my life."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "I'll show my boy"
	line "how to battle!"
	done

PokefanmRexBeatenText:
	text "Don't look,"
	line "my boy!"
	done

UnknownText_0x1ad9ff:
	text "You should have"
	line "let me win."
	
	para "For my boy's"
	line "sake."
	done

PokefanmAllanSeenText:
	text "I love me some"
	line "big 'ol bears!"
	done

PokefanmAllanBeatenText:
	text "My bears!"
	done

UnknownText_0x1ada88:
	text "You are too strong"
	line "for me, kid."
	
	para "My bears didn't"
	line "stand a chance."
	done

Route6_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 35, 7, 1, ROUTE1GATES
	warp_def 35, 8, 2, ROUTE1GATES
	warp_def 14, 17, 1, VIRIDIANCITYGATES
	warp_def 15, 17, 2, VIRIDIANCITYGATES

.CoordEvents: db 0

.BGEvents: db 1
	signpost 10, 19, SIGNPOST_READ, Route6UndergroundPathSign

.ObjectEvents: db 4
	person_event SPRITE_POKEFAN_M, 14, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 2, PokefanMScript_0x1ad951, -1
	person_event SPRITE_POKEFAN_M, 21, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerPokefanmRex, -1
	person_event SPRITE_POKEFAN_M, 32, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanmAllan, -1
	person_event SPRITE_YOUNGSTER, 18, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route6Blocker, EVENT_BEAT_BLUE
