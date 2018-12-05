const_value set 2
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperBoris:
	trainer EVENT_BEAT_BIRD_KEEPER_BORIS, BIRD_KEEPER, BORIS, Bird_keeperBorisSeenText, Bird_keeperBorisBeatenText, 0, Bird_keeperBorisScript

Bird_keeperBorisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1acfa5
	waitbutton
	closetext
	end

TrainerBird_keeperBob:
	trainer EVENT_BEAT_BIRD_KEEPER_BOB, BIRD_KEEPER, BOB, Bird_keeperBobSeenText, Bird_keeperBobBeatenText, 0, Bird_keeperBobScript

Bird_keeperBobScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad00d
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

Bird_keeperBorisSeenText:
	text "Are you a seasoned"
	line "trainer?"
	
	para "Let's battle it"
	line "out!"
	done

Bird_keeperBorisBeatenText:
	text "Aw no, man!"
	done

UnknownText_0x1acfa5:
	text "I probably wouldn't"
	line "have battled you"
	
	para "if I knew you were"
	line "this strong."
	done

Bird_keeperBobSeenText:
	text "I'm an award"
	line "winning trainer!"
	done

Bird_keeperBobBeatenText:
	text "…Wow!"
	done

UnknownText_0x1ad00d:
	text "You should get a"
	line "trophy!"
	done

Route18SignText:
	text "ROUTE 13"

	para "ACRE FOREST -"
	line "CHARCOAL TOWN"
	done

Route18_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 1, 9, 8, CERULEANCITYGATES
	warp_def 1, 12, 4, ROUTE_17_18_GATE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 17, 11, SIGNPOST_READ, Route18Sign

.ObjectEvents: db 2
	person_event SPRITE_YOUNGSTER, 12, 8, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperBoris, -1
	person_event SPRITE_YOUNGSTER, 10, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperBob, -1
