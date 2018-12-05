const_value set 2
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperHank:
	trainer EVENT_BEAT_BIRD_KEEPER_HANK, BIRD_KEEPER, HANK, Bird_keeperHankSeenText, Bird_keeperHankBeatenText, 0, Bird_keeperHankScript

Bird_keeperHankScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae258
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer EVENT_BEAT_PICNICKER_HOPE, PICNICKER, HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, PicnickerHopeScript

PicnickerHopeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae320
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer EVENT_BEAT_PICNICKER_SHARON, PICNICKER, SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, PicnickerSharonScript

PicnickerSharonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae369
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	dwb EVENT_ROUTE_4_HIDDEN_ULTRA_BALL, ULTRA_BALL


Bird_keeperHankSeenText:
	text "My #MON are"
	line "pumped!"
	
	para "I'm ready for"
	line "battle."
	done

Bird_keeperHankBeatenText:
	text "I think I just"
	line "lost."
	done

UnknownText_0x1ae258:
	text "I always get so"
	line "pumped up before"
	cont "a battle."
	
	para "I get let down a"
	line "lot."
	done

PicnickerHopeSeenText:
	text "I'm not afriad to"
	line "get dirty."
	done

PicnickerHopeBeatenText:
	text "Yeah, that was"
	line "neat!"
	done

UnknownText_0x1ae320:
	text "Are you collecting"
	line "strange stones?"
	
	para "What are they for?"
	done

PicnickerSharonSeenText:
	text "Hey uh…"
	
	para "Would you like to"
	line "battle?"
	done

PicnickerSharonBeatenText:
	text "Oooh!"
	done

UnknownText_0x1ae369:
	text "I think you're"
	line "kinda cute."
	
	para "I mean-"
	
	para "Your #MON are"
	line "kinda cute."
	done

MtMoonSquareSignText:
	text "ROUTE 10"
	
	para "BRANDIES CITY"
	line "AHEAD"
	done

Route4_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 29, 2, 2, MOUNT_MOON
	warp_def 45, 3, 5, ROUTE8GATES
	warp_def 45, 4, 6, ROUTE8GATES
	warp_def 1, 3, 3, CELADONCITYGATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 41, 7, SIGNPOST_READ, MtMoonSquareSign
	signpost 10, 9, SIGNPOST_ITEM, Route4HiddenUltraBall

.ObjectEvents: db 4
	person_event SPRITE_YOUNGSTER, 10, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBird_keeperHank, -1
	person_event SPRITE_LASS, 29, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	person_event SPRITE_LASS, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	person_event SPRITE_POKE_BALL, 16, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
