const_value set 2
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerFirebreatherOtis:
	trainer EVENT_BEAT_FIREBREATHER_OTIS, FISHER, CARSON, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, FirebreatherOtisScript

FirebreatherOtisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1adff7
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer EVENT_BEAT_YOUNGSTER_WARREN, YOUNGSTER, WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, YoungsterWarrenScript

YoungsterWarrenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae051
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer EVENT_BEAT_YOUNGSTER_JIMMY, YOUNGSTER, JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, YoungsterJimmyScript

YoungsterJimmyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae0a9
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer EVENT_BEAT_FIREBREATHER_BURT, FISHER, EBERT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, FirebreatherBurtScript

FirebreatherBurtScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae118
	waitbutton
	closetext
	end

BrownCaveSignScript:
	jumptext BrownCaveSignText
	
MapRoute3Signpost0Script:
	jumptext UnknownText_0x1ae163

FirebreatherOtisSeenText:
	text "My #MON are"
	line "fresh!"
	done

FirebreatherOtisBeatenText:
	text "Cooked!"
	done

UnknownText_0x1adff7:
	text "I love when it"
	line "rains."
	
	para "Many of my"
	line "favorite #-"
	cont "MON come out."
	done

YoungsterWarrenSeenText:
	text "Should we battle?"
	
	para "I'm a little tired."
	done

YoungsterWarrenBeatenText:
	text "Yawn…"
	done

UnknownText_0x1ae051:
	text "I think I'll just"
	line "rest for now."
	done

YoungsterJimmySeenText:
	text "Watch out, you"
	line "might get bit!"
	done

YoungsterJimmyBeatenText:
	text "Ouch, dude!"
	done

UnknownText_0x1ae0a9:
	text "My ARBOK loves it"
	line "when I stroke its"
	cont "scales."
	done

FirebreatherBurtSeenText:
	text "Woah, a bite!"
	done

FirebreatherBurtBeatenText:
	text "Yow! That's no"
	line "catch!"
	done

UnknownText_0x1ae118:
	text "I seem to lure"
	line "the strongest"
	cont "trainers."
	done

UnknownText_0x1ae163:
	text "ROUTE 4"
	
	para "RUSSET TOWN -"
	line "ORCHID CITY"
	done
	
BrownCaveSignText:
	text "BROWN CAVE"
	done

Route3_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 59, 14, 1, MOUNT_MOON
	warp_def 1, 7, 7, VIRIDIANCITYGATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 5, 5, SIGNPOST_READ, MapRoute3Signpost0Script
	signpost 61, 9, SIGNPOST_READ, BrownCaveSignScript

.ObjectEvents: db 4
	person_event SPRITE_FISHER, 24, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerFirebreatherOtis, -1
	person_event SPRITE_YOUNGSTER, 34, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterWarren, -1
	person_event SPRITE_YOUNGSTER, 2, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterJimmy, -1
	person_event SPRITE_FISHER, 46, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerFirebreatherBurt, -1
