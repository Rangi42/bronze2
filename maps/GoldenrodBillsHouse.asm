const_value set 2
	const GOLDENRODBILLSHOUSE_BILL
	const GOLDENRODBILLSHOUSE_POKEFAN_F
	const GOLDENRODBILLSHOUSE_TWIN

GoldenrodBillsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BillsHouseBill:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue UnknownScript_0x54c1f
	writetext GoldenrodPictureGirlText1
	yesorno
	iffalse .GoldenrodPictureGirlScriptNo
	refreshscreen $0
	pokepic TEDDIURSA
	waitbutton
	closepokepic
	opentext
	writetext GoldenrodPictureGirlTextYes
;	buttonsound
;	waitsfx
;	checkcode VAR_PARTYCOUNT
;	if_equal $6, UnknownScript_0x54c13
;	writetext UnknownText_0x54dae
;	playsound SFX_CAUGHT_MON
;	waitsfx
;	givepoke EEVEE, 20
;	setevent EVENT_GOT_EEVEE
	waitbutton
	closetext
	end

.GoldenrodPictureGirlScriptNo
	writetext GoldenrodPictureGirlTextNo
	waitbutton
	closetext
	end

UnknownScript_0x54c13:
	writetext UnknownText_0x54e02
	waitbutton
	closetext
	end

UnknownScript_0x54c19:
	writetext UnknownText_0x54e2d
	waitbutton
	closetext
	end

UnknownScript_0x54c1f:
	writetext UnknownText_0x54e42
	waitbutton
	closetext
	end

BillsMom:
	faceplayer
	opentext
;	checkevent EVENT_MET_BILL
;	iffalse UnknownScript_0x54c33
	writetext UnknownText_0x54ea8
	waitbutton
	closetext
	end

UnknownScript_0x54c33:
	writetext UnknownText_0x54f4e
	waitbutton
	closetext
	end

BillsSister:
	faceplayer
	opentext
;	checkcellnum PHONE_BILL
;	iftrue UnknownScript_0x54c58
;	writetext UnknownText_0x54f9e
;	askforphonenumber PHONE_BILL
;	if_equal $1, UnknownScript_0x54c64
;	if_equal $2, UnknownScript_0x54c5e
;	waitsfx
;	addcellnum PHONE_BILL
;	writetext UnknownText_0x54fd9
;	playsound SFX_REGISTER_PHONE_NUMBER
;	waitsfx
;	buttonsound
;UnknownScript_0x54c58: ;0x54c58
	writetext UnknownText_0x55069
	waitbutton
	closetext
	end

UnknownScript_0x54c5e:
	writetext UnknownText_0x54ff3
	waitbutton
	closetext
	end

UnknownScript_0x54c64:
	writetext UnknownText_0x55046
	buttonsound
	jump UnknownScript_0x54c5e

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

UnknownText_0x54c74:
	text "BILL: Hi, <PLAYER>!"
	line "Do us a favor and"
	cont "take this EEVEE."

	para "It came over when"
	line "I was adjusting"
	cont "the TIME CAPSULE."

	para "Someone has to"
	line "take care of it,"

	para "but I don't like"
	line "being outside."

	para "Can I count on you"
	line "to play with it,"
	cont "<PLAYER>?"
	done

UnknownText_0x54d3f:
	text "BILL: I knew you'd"
	line "come through!"

	para "Way to go! You're"
	line "the real deal!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done

UnknownText_0x54dae:
	text "<PLAYER> received"
	line "EEVEE!"
	done

GoldenrodPictureGirlText1:
	text "I love my daddy!"
	line "I drew him a"
	
	para "picture of a"
	line "TEDDIURSA."
	
	para "Want to see?"
	done
	
GoldenrodPictureGirlTextYes:
	text "I hope daddy"
	line "likes it!"
	done

GoldenrodPictureGirlTextNo:
	text "Oh… Okay…"
	done
	
UnknownText_0x54e02:
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #MON."
	done

UnknownText_0x54e2d:
	text "Oh… Now what to"
	line "do?"
	done

UnknownText_0x54e42:
	text "BILL: My pop, he"
	line "won't work. All he"

	para "does is goof off"
	line "all day long."

	para "He's getting to be"
	line "a real headache…"
	done

UnknownText_0x54ea8:
	text "Being a father of"
	line "twins is not an"
	cont "easy thing."
	
	para "I'd take #MON"
	line "training over that"
	cont "some days."
	
	para "But most days, I"
	line "do love my family."
	done

UnknownText_0x54f4e:
	text "My husband was"
	line "once known as a"

	para "#MANIAC."
	line "BILL must have"

	para "taken after his"
	line "father."
	done

UnknownText_0x54f9e:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

UnknownText_0x54fd9:
	text "<PLAYER> recorded"
	line "BILL's number."
	done

UnknownText_0x54ff3:
	text "My brother made"
	line "the PC #MON"
	cont "storage system."

	para "I was going to"
	line "give you BILL's"
	cont "number…"
	done

UnknownText_0x55046:
	text "You can't record"
	line "any more numbers."
	done

UnknownText_0x55069:
	text "My sis is a real"
	line "good artist!"
	done

GoldenrodBillsHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, GOLDENROD_CITY
	warp_def 7, 3, 4, GOLDENROD_CITY

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 0, SIGNPOST_READ, BillsHouseBookshelf2
	signpost 1, 1, SIGNPOST_READ, BillsHouseBookshelf1
	signpost 1, 9, SIGNPOST_READ, BillsHouseRadio

.ObjectEvents: db 3
	person_event SPRITE_TWIN, 3, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BillsHouseBill, -1
	person_event SPRITE_POKEFAN_M, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BillsMom, -1
	person_event SPRITE_TWIN, 4, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BillsSister, -1
