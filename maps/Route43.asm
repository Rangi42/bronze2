const_value set 2
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x19d051

UnknownScript_0x19d051:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19d05c
	domaptrigger ROUTE_43_GATE, $0
	return

UnknownScript_0x19d05c:
	domaptrigger ROUTE_43_GATE, $1
	return

TrainerCamperSpencer:
	trainer EVENT_BEAT_CAMPER_SPENCER, CAMPER, SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, CamperSpencerScript

CamperSpencerScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d57e
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer EVENT_BEAT_POKEMANIAC_BEN, POKEMANIAC, BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, PokemaniacBenScript

PokemaniacBenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d2d2
	waitbutton
	closetext
	end

TrainerPokemaniacBrent1:
	trainer EVENT_BEAT_POKEMANIAC_BRENT, POKEMANIAC, BRENT1, PokemaniacBrent1SeenText, PokemaniacBrent1BeatenText, 0, PokemaniacBrent1Script

PokemaniacBrent1Script:
;	writecode VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	end_if_just_battled
	opentext
;	checkflag ENGINE_BRENT
;	iftrue UnknownScript_0x19d0cf
;	checkcellnum PHONE_POKEMANIAC_BRENT
;	iftrue UnknownScript_0x19d138
;	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x19d0b8
	writetext UnknownText_0x19d359
;	buttonsound
;	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x19d12c
;	jump UnknownScript_0x19d0bb
	waitbutton
	closetext
	end

UnknownScript_0x19d0b8:
	scall UnknownScript_0x19d130
UnknownScript_0x19d0bb:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	if_equal $1, UnknownScript_0x19d140
	if_equal $2, UnknownScript_0x19d13c
	trainertotext POKEMANIAC, BRENT1, $0
	scall UnknownScript_0x19d134
	jump UnknownScript_0x19d138

UnknownScript_0x19d0cf:
	scall UnknownScript_0x19d144
	winlosstext PokemaniacBrent1BeatenText, 0
	copybytetovar wBrentFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 1
	clearflag ENGINE_BRENT
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 2
	clearflag ENGINE_BRENT
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 3
	clearflag ENGINE_BRENT
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT
	end

UnknownScript_0x19d12c:
	jumpstd asknumber1m
	end

UnknownScript_0x19d130:
	jumpstd asknumber2m
	end

UnknownScript_0x19d134:
	jumpstd registerednumberm
	end

UnknownScript_0x19d138:
	jumpstd numberacceptedm
	end

UnknownScript_0x19d13c:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19d140:
	jumpstd phonefullm
	end

UnknownScript_0x19d144:
	jumpstd rematchm
	end

TrainerPokemaniacRon:
	trainer EVENT_BEAT_POKEMANIAC_RON, POKEMANIAC, RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, PokemaniacRonScript

PokemaniacRonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d3f8
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer EVENT_BEAT_FISHER_MARVIN, FISHER, MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, FisherMarvinScript

FisherMarvinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d4d3
	waitbutton
	closetext
	end

TrainerPicnickerTiffany3:
	trainer EVENT_BEAT_PICNICKER_TIFFANY, PICNICKER, TIFFANY3, PicnickerTiffany3SeenText, PicnickerTiffany3BeatenText, 0, PicnickerTiffany3Script

PicnickerTiffany3Script:
;	writecode VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	end_if_just_battled
	opentext
;	checkflag ENGINE_TIFFANY
;	iftrue UnknownScript_0x19d1c1
;	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
;	iftrue UnknownScript_0x19d21e
;	checkcellnum PHONE_PICNICKER_TIFFANY
;	iftrue UnknownScript_0x19d245
;	checkpoke CLEFAIRY
;	iffalse UnknownScript_0x19d233
;	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x19d1aa
	writetext UnknownText_0x19d618
;	buttonsound
;	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x19d239
;	jump UnknownScript_0x19d1ad
	waitbutton
	closetext
	end

UnknownScript_0x19d1aa:
	scall UnknownScript_0x19d23d
UnknownScript_0x19d1ad:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	if_equal $1, UnknownScript_0x19d24d
	if_equal $2, UnknownScript_0x19d249
	trainertotext PICNICKER, TIFFANY3, $0
	scall UnknownScript_0x19d241
	jump UnknownScript_0x19d245

UnknownScript_0x19d1c1:
	scall UnknownScript_0x19d251
	winlosstext PicnickerTiffany3BeatenText, 0
	copybytetovar wTiffanyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY
	end

UnknownScript_0x19d21e:
	scall UnknownScript_0x19d255
	verbosegiveitem PINK_BOW
	iffalse UnknownScript_0x19d230
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	jump UnknownScript_0x19d245

UnknownScript_0x19d230:
	jump UnknownScript_0x19d259

UnknownScript_0x19d233:
	writetext UnknownText_0x19d64b
	waitbutton
	closetext
	end

UnknownScript_0x19d239:
	jumpstd asknumber1f
	end

UnknownScript_0x19d23d:
	jumpstd asknumber2f
	end

UnknownScript_0x19d241:
	jumpstd registerednumberf
	end

UnknownScript_0x19d245:
	jumpstd numberacceptedf
	end

UnknownScript_0x19d249:
	jumpstd numberdeclinedf
	end

UnknownScript_0x19d24d:
	jumpstd phonefullf
	end

UnknownScript_0x19d251:
	jumpstd rematchf
	end

UnknownScript_0x19d255:
	jumpstd giftf
	end

UnknownScript_0x19d259:
	jumpstd packfullf
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

FruitTreeScript_0x19d266:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "Pee-yew!"

	para "Can you smell"
	line "that?"
	done

PokemaniacBenBeatenText:
	text "The smell of"
	line "failure."
	done

UnknownText_0x19d2d2:
	text "This cave abso-"
	line "lutely reeks!"
	
	para "I wouldn't go in"
	line "there, even if you"
	cont "paid me!"
	done

PokemaniacBrent1SeenText:
	text "Hey! Let's trade"
	line "#MON facts!"
	done

PokemaniacBrent1BeatenText:
	text "I have lost."
	line "That is a fact."
	done

UnknownText_0x19d359:
	text "I heard that the"
	line "only HM move"
	
	para "MACHOP can learn"
	line "is STRENGTH?."
	cont "It's a fact!"
	done

PokemaniacRonSeenText:
	text "Would you be upset"
	line "if my #MON"
	cont "beat yours?"
	done

PokemaniacRonBeatenText:
	text "I can't believe"
	line "it!"
	done

UnknownText_0x19d3f8:
	text "I was sure I'd"
	line "win one this time."
	done

FisherMarvinSeenText:
	text "I just got back"
	line "from fishing!"
	
	para "Let's have a"
	line "battle!"
	done

FisherMarvinBeatenText:
	text "I will strive to"
	line "do better!"
	done

UnknownText_0x19d4d3:
	text "Water types are"
	line "my favourite."
	
	para "You should join"
	line "me in fishing"
	cont "sometime!"
	done

CamperSpencerSeenText:
	text "I just love the"
	line "smooth skin"
	cont "of an ARBOK!"
	done

CamperSpencerBeatenText:
	text "I don't like the"
	line "feeling of losing…"
	done

UnknownText_0x19d57e:
	text "I always love to"
	line "cuddle up with my"
	cont "ARBOK!"
	done

PicnickerTiffany3SeenText:
	text "Fancy seeing you"
	line "here, <PLAYER>!"
	done

PicnickerTiffany3BeatenText:
	text "I was beaten by"
	line "<PLAYER>!"
	done

UnknownText_0x19d618:
	text "I heard about you!"
	line "You saved the TV"
	cont "STATION!"
	
	para "I love TV!"
	done

UnknownText_0x19d64b:
	text "I heard about you!"
	line "You saved the TV"
	cont "STATION!"
	
	para "I love TV!"
	done

Route43Sign1Text:
	text "ROUTE 15"

	para "HARDROOT TOWN -"
	line "MAUVEWOOD TOWN"
	done

Route43Sign2Text:
	text "SLUDGE CAVE"
	
	para "Please Beware"
	done

Route43TrainerTipsText:
	text "TRAINER TIPS"

	para "All #MON have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #MON may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#MON's type."
	done

Route43_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 1, 7, 3, ROUTE_43_MAHOGANY_GATE
	warp_def 5, 56, 1, ICE_PATH_1F
	warp_def -2, 22, 3, ROUTE_43_GATE
	warp_def -2, 23, 1, ROUTE_43_GATE
	warp_def -2, 24, 2, ROUTE_43_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 6, 8, SIGNPOST_READ, Route43Sign1
	signpost 9, 55, SIGNPOST_READ, Route43Sign2
	signpost 9, 17, SIGNPOST_READ, Route43TrainerTips

.ObjectEvents: db 8
	person_event SPRITE_SUPER_NERD, 7, 58, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	person_event SPRITE_SUPER_NERD, 1, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPokemaniacBrent1, -1
	person_event SPRITE_SUPER_NERD, 13, 45, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerPokemaniacRon, -1
	person_event SPRITE_FISHER, 4, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	person_event SPRITE_LASS, 13, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerPicnickerTiffany3, -1
	person_event SPRITE_YOUNGSTER, 5, 44, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	person_event SPRITE_FRUIT_TREE, 1, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x19d266, -1
	person_event SPRITE_POKE_BALL, 8, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
