const_value set 2
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCamperDean:
	trainer EVENT_BEAT_CAMPER_DEAN, CAMPER, DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, CamperDeanScript

CamperDeanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aafd9
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer EVENT_BEAT_PICNICKER_HEIDI, PICNICKER, HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, PicnickerHeidiScript

PicnickerHeidiScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ab07c
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer EVENT_BEAT_CAMPER_SID, CAMPER, SID, CamperSidSeenText, CamperSidBeatenText, 0, CamperSidScript

CamperSidScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ab0f6
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer EVENT_BEAT_PICNICKER_EDNA, PICNICKER, EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, PicnickerEdnaScript

PicnickerEdnaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ab15f
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer EVENT_BEAT_HIKER_TIM, HIKER, TIM, HikerTimSeenText, HikerTimBeatenText, 0, HikerTimScript

HikerTimScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ab210
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer EVENT_BEAT_HIKER_SIDNEY, HIKER, SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, HikerSidneyScript

HikerSidneyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ab278
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	dwb EVENT_ROUTE_9_HIDDEN_ETHER, ETHER


CamperDeanSeenText:
	text "I'm going to visit"
	line "GAMBOGE TOWN!"
	done

CamperDeanBeatenText:
	text "I should have"
	line "hurried up."
	done

UnknownText_0x1aafd9:
	text "My #MON and I"
	line "love to visit"
	cont "new places."
	done

PicnickerHeidiSeenText:
	text "Have you ever"
	line "dressed up your"
	cont "#MON?"
	
	para "Mine are really"
	line "pretty!"
	done

PicnickerHeidiBeatenText:
	text "Torn!"
	done

UnknownText_0x1ab07c:
	text "I like to enter my"
	line "#MON into"
	
	para "beauty competit-"
	line "ions."
	done

CamperSidSeenText:
	text "Let's see what"
	line "you've got!"
	done

CamperSidBeatenText:
	text "Yow!"
	done

UnknownText_0x1ab0f6:
	text "Losing makes my"
	line "skin crawl."
	done

PicnickerEdnaSeenText:
	text "Let's dig in deep!"
	done

PicnickerEdnaBeatenText:
	text "I'm stuck in a"
	line "hole, now."
	done

UnknownText_0x1ab15f:
	text "You really showed"
	line "me somethin'!"
	
	para "You've gotta teach"
	line "me some things."
	done

HikerTimSeenText:
	text "KOHTO is my one"
	line "true home."
	
	para "Can you beat my"
	line "pride?"
	done

HikerTimBeatenText:
	text "I'm rocked!"
	done

UnknownText_0x1ab210:
	text "Maybe I should"
	line "visit JANTO some"
	cont "day."
	
	para "Can you reccomend"
	line "a town?"
	done

HikerSidneySeenText:
	text "Hey you, I don't"
	line "have much of a"
	cont "way with words…"
	
	para "So let's battle!"
	done

HikerSidneyBeatenText:
	text "I'm speechless."
	done

UnknownText_0x1ab278:
	text "…………"
	line "…………"
	
	para "Augh, you're so"
	line "much better than"
	cont "me!"
	done

Route9SignText:
	text "ROUTE 7"
	done

Route9_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 43, 13, 1, ROUTE_7_SAFFRON_GATE
	warp_def 40, 21, 1, ROUTE_7_SAFFRON_GATE
	warp_def 41, 21, 2, ROUTE_7_SAFFRON_GATE
	warp_def 3, 15, 11, ROUTE8GATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 39, 19, SIGNPOST_READ, Route9Sign
	signpost 23, 15, SIGNPOST_ITEM, Route9HiddenEther

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 34, 14, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperDean, -1
	person_event SPRITE_LASS, 22, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerHeidi, -1
	person_event SPRITE_YOUNGSTER, 38, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 5, TrainerCamperSid, -1
	person_event SPRITE_LASS, 29, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerEdna, -1
	person_event SPRITE_POKEFAN_M, 19, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerHikerTim, -1
	person_event SPRITE_POKEFAN_M, 26, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerHikerSidney, -1
