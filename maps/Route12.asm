const_value set 2
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2
	const ROUTE12_SILVER_CAVE_BLOCKER_GUY

Route12_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerFisherKyle:
	trainer EVENT_BEAT_FISHER_KYLE, FISHER, KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, FisherKyleScript

FisherKyleScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a7238
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer EVENT_BEAT_FISHER_MARTIN, FISHER, MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, FisherMartinScript

FisherMartinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a704c
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer EVENT_BEAT_FISHER_STEPHEN, FISHER, STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, FisherStephenScript

FisherStephenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a70d4
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer EVENT_BEAT_FISHER_BARNEY, FISHER, BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, FisherBarneyScript

FisherBarneyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a716d
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	dwb EVENT_ROUTE_12_HIDDEN_ELIXER, ELIXER
	
Route12HiddenCalcium:
	dwb EVENT_ROUTE_12_CALCIUM, CALCIUM
	
Route12HiddenNugget:
	dwb EVENT_ROUTE_12_NUGGET, NUGGET

Route12MtSilverSign:
	jumptext Route12MtSilverSignText

SilverCaveBlockerGuy:
	end
	
Route12MtSilverSignText:
	text "MT. ENDER"
	
	para "Through Here"
	done

FisherMartinSeenText:
	text "I hooked a"
	line "trainer!"
	done

FisherMartinBeatenText:
	text "You can do no"
	line "wrong."
	done

UnknownText_0x1a704c:
	text "When I fish,"
	line "nothing else"
	cont "matters."
	done

FisherStephenSeenText:
	text "I just got back"
	line "from fishing."
	
	para "I'll use my best"
	line "catches!"
	done

FisherStephenBeatenText:
	text "I got distracted."
	done

UnknownText_0x1a70d4:
	text "CELESTE CITY is"
	line "pretty neat place"
	cont "to catch #MON."
	done

FisherBarneySeenText:
	text "Hey, I'm fishin'"
	line "here!"
	done

FisherBarneyBeatenText:
	text "This is no good."
	
	para "No good at all."
	done

UnknownText_0x1a716d:
	text "It's super"
	line "important that I"
	cont "concentrate."
	done

FisherKyleSeenText:
	text "Fancy a battle?"
	
	para "I'll let you in"
	line "on a secret!"
	done

FisherKyleBeatenText:
	text "Here's what I"
	line "know…"
	done

UnknownText_0x1a7238:
	text "There's a whole"
	line "bunch of hidden"
	
	para "items on this"
	line "route."
	
	para "Can you find them"
	line "all?"
	done

Route12SignText:
	text "ROUTE 14"
	
	para "CELESTE CITY -"
	line "CHARCOAL TOWN"
	done

FishingSpotSignText:
	text "FISHING SPOT"
	done

Route12_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 5, 27, 1, ROUTE_12_SUPER_ROD_HOUSE
	warp_def 5, 17, 1, ROUTE12GATES
	warp_def 8, 33, 4, ROUTE12GATES
	warp_def 9, 33, 5, ROUTE12GATES

.CoordEvents: db 0

.BGEvents: db 6
	signpost 7, 15, SIGNPOST_READ, Route12Sign
	signpost 3, 5, SIGNPOST_READ, FishingSpotSign
	signpost 10, 6, SIGNPOST_ITEM, Route12HiddenElixer
	signpost 7, 31, SIGNPOST_READ, Route12MtSilverSign
	signpost 19, 21, SIGNPOST_ITEM, Route12HiddenCalcium
	signpost 41, 21, SIGNPOST_ITEM, Route12HiddenNugget

.ObjectEvents: db 4
	person_event SPRITE_FISHER, 40, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherMartin, -1
	person_event SPRITE_FISHER, 34, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherStephen, -1
	person_event SPRITE_FISHER, 24, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherBarney, -1
	person_event SPRITE_FISHER, 9, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherKyle, -1
