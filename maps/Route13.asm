const_value set 2
	const ROUTE13_YOUNGSTER1
	const ROUTE13_POKEFAN_M3

Route13_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokefanmAlex:
	trainer EVENT_BEAT_POKEFANM_ALEX, POKEFANM, ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, PokefanmAlexScript

PokefanmAlexScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a24e3
	waitbutton
	closetext
	end

;TrainerPokefanmJoshua:
;	trainer EVENT_BEAT_POKEFANM_JOSHUA, POKEFANM, JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, PokefanmJoshuaScript

;PokefanmJoshuaScript:
;	end_if_just_battled
;	opentext
;	writetext UnknownText_0x1a254f
;	waitbutton
;	closetext
;	end

TrainerBird_keeperPerry:
	trainer EVENT_BEAT_BIRD_KEEPER_PERRY, BIRD_KEEPER, PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText, 0, Bird_keeperPerryScript

Bird_keeperPerryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a25db
	waitbutton
	closetext
	end

;TrainerBird_keeperBret:
;	trainer EVENT_BEAT_BIRD_KEEPER_BRET, BIRD_KEEPER, BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText, 0, Bird_keeperBretScript

;Bird_keeperBretScript:
;	end_if_just_battled
;	opentext
;	writetext UnknownText_0x1a2662
;	waitbutton
;	closetext
;	end

;TrainerHikerKenny:
;	trainer EVENT_BEAT_HIKER_KENNY, HIKER, KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, HikerKennyScript
;
;HikerKennyScript:
;	end_if_just_battled
;	opentext
;	writetext UnknownText_0x1a26c2
;	waitbutton
;	closetext
;	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	dwb EVENT_ROUTE_13_HIDDEN_CALCIUM, CALCIUM

Route13AcreForestSign
	jumptext Route13AcreForestSignText

Route13AcreForestSignText:
	text "ACRE FOREST"
	done
	
PokefanmAlexSeenText:
	text "Can you beat the"
	line "king and the"
	cont "queen?"
	done

PokefanmAlexBeatenText:
	text "How… How is this"
	line "possible?"
	done

UnknownText_0x1a24e3:
	text "I am royally"
	line "bummed."
	done

;PokefanmJoshuaSeenText:
;	text "Nihihi! Would you"
;	line "like to battle my"
;	cont "PIKACHU gang?"
;	done

;PokefanmJoshuaBeatenText:
;	text "PI-PIKACHU!"
;	done

;UnknownText_0x1a254f:
;	text "You look like you"
;	line "have many #MON,"
;
;	para "but PIKACHU is"
;	line "still the best."
;	done

Bird_keeperPerrySeenText:
	text "Confidence is"
	line "my greatest asset!"
	done

Bird_keeperPerryBeatenText:
	text "Shot down…"
	done

UnknownText_0x1a25db:
	text "It's remarkable"
	line "how well your"
	
	para "#MON are"
	line "trained."
	done

;Bird_keeperBretSeenText:
;	text "Check out my #-"
;	line "MON. Just look at"
;
;	para "their coloring and"
;	line "their plumage."
;	done

;Bird_keeperBretBeatenText:
;	text "Shoot!"
;	line "Not good enough!"
;	done

;UnknownText_0x1a2662:
;	text "If you groom them,"
;	line "#MON get happy."
;	done

;HikerKennySeenText:
;	text "I should go to"
;	line "ROCK TUNNEL to get"
;	cont "myself an ONIX."
;	done

;HikerKennyBeatenText:
;	text "I lost…"
;	done

;UnknownText_0x1a26c2:
;	text "Geological fea-"
;	line "tures don't appear"
;	cont "to change."

;	para "But they actually"
;	line "change, little by"
;	cont "little."
;	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13SignText:
	text "ROUTE 12"

	para "ACRE FOREST AHEAD"
	done

Route13DirectionsSignText:
	text "NORTH TO LAVENDER"
	line "TOWN"

	para "WEST TO FUCHSIA"
	line "CITY"
	done

Route13_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 3, 1, ROUTE13FORESTGATES
	warp_def 5, 3, 2, ROUTE13FORESTGATES
	warp_def 4, 32, 7, ROUTE13FORESTGATES
	warp_def 5, 32, 8, ROUTE13FORESTGATES

.CoordEvents: db 0

.BGEvents: db 5
	signpost 13, 11, SIGNPOST_READ, Route13TrainerTips
	signpost 11, 41, SIGNPOST_READ, Route13Sign
	signpost 3, 1, SIGNPOST_READ, Route13DirectionsSign
	signpost 10, 30, SIGNPOST_ITEM, Route13HiddenCalcium
	signpost 3, 33, SIGNPOST_READ, Route13AcreForestSign

.ObjectEvents: db 2
	person_event SPRITE_YOUNGSTER, 5, 52, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBird_keeperPerry, -1
	person_event SPRITE_POKEFAN_M, 8, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerPokefanmAlex, -1
