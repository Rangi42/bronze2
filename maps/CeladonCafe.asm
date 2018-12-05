const_value set 2
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SuperNerdScript_0x73049:
	faceplayer
	opentext
	writetext UnknownText_0x730de
	yesorno
	iffalse .BranLiarNo
	writetext BranLiarYesText
	waitbutton
	closetext
	end

.BranLiarNo
	writetext BranLiarNoText
	waitbutton
	closetext
	end
	
FisherScript_0x73051:
;	opentext
;	writetext UnknownText_0x73129
;	waitbutton
;	closetext
	faceplayer
	opentext
	writetext UnknownText_0x7313a
	waitbutton
	closetext
	spriteface CELADONCAFE_FISHER1, LEFT
	end

FisherScript_0x73062:
;	opentext
;	writetext UnknownText_0x7316a
;	waitbutton
;	closetext
;	faceplayer
	opentext
	writetext UnknownText_0x73178
	waitbutton
	closetext
;	spriteface CELADONCAFE_FISHER2, RIGHT
	end

FisherScript_0x73073:
;	opentext
	jumptextfaceplayer UnknownText_0x731ae
;	waitbutton
;	closetext
;	faceplayer
;	opentext
;	writetext UnknownText_0x731bd
;	waitbutton
;	closetext
;	spriteface CELADONCAFE_FISHER3, RIGHT
	end

TeacherScript_0x73084:
;	checkitem COIN_CASE
;	iftrue UnknownScript_0x7309a
;	opentext
	jumptextfaceplayer UnknownText_0x73201
;	waitbutton
;	closetext
;	faceplayer
;	opentext
;	writetext UnknownText_0x73212
;	waitbutton
;	closetext
;	spriteface CELADONCAFE_TEACHER, LEFT
	end

UnknownScript_0x7309a:
;	opentext
	jumptextfaceplayer UnknownText_0x73254
;	waitbutton
;	closetext
;	spriteface CELADONCAFE_TEACHER, RIGHT
;	opentext
;	writetext UnknownText_0x73278
;	waitbutton
;	closetext
;	spriteface CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	buttonsound
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan
	
UnknownText_0x730de:
	text "Hey!"
	line "I found a really"
	
	para "rare #MON in"
	line "the wild that"
	
	para "nobody has ever"
	line "heard of."
	
	para "Wanna see?"
	done

BranLiarYesText:
	text "Nah, you wouldn't"
	line "believe me anyway."
	done

BranLiarNoText:
	text "Well I didn't want"
	line "to show you"
	cont "anyway!"
	done
	
UnknownText_0x73129:
	text "…Snarfle, chew…"
	done

UnknownText_0x7313a:
	text "Shh. We're having"
	line "a staring contest."
	
	para "Augh! You just"
	line "made me lose."
	done

UnknownText_0x7316a:
	text "…Gulp… Chew…"
	done

UnknownText_0x73178:
	text "There's no way"
	line "I am going to face"
	cont "you right now."
	done

UnknownText_0x731ae:
	text "My older brothers"
	line "are always in"
	
	para "competition with"
	line "each other."
	done

UnknownText_0x731bd:
	text "The food is good"
	line "here, but GOLDEN-"
	cont "ROD has the best"
	cont "food anywhere."
	done

UnknownText_0x73201:
	text "Honesty is the"
	line "best value in"
	cont "life."
	
	para "I wish my son"
	line "could learn some"
	cont "honesty."
	done

UnknownText_0x73212:
	text "Nobody here will"
	line "give you a COIN"

	para "CASE. You should"
	line "look in JOHTO."
	done

UnknownText_0x73254:
	text "Crunch… Crunch…"

	para "I can keep eating!"
	done

UnknownText_0x73278:
	text "More, CHEF!"
	done

EatathonContestPosterText:
	text "Eatathon Contest!"
	line "No time limit!"

	para "A battle without"
	line "end! The biggest"

	para "muncher gets it"
	line "all for free!"
	done

FoundLeftoversText:
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

NoRoomForLeftoversText:
	text "But <PLAYER> can't"
	line "hold another item…"
	done

CeladonCafe_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 2, 9, CELADON_CITY
	warp_def 7, 3, 9, CELADON_CITY
	warp_def 7, 16, 3, CELADON_CITY
	warp_def 7, 17, 3, CELADON_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost -3, 5, SIGNPOST_READ, EatathonContestPoster
	signpost -3, 7, SIGNPOST_READ, CeladonCafeTrashcan

.ObjectEvents: db 5
	person_event SPRITE_SUPER_NERD, 3, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x73049, -1
	person_event SPRITE_COOLTRAINER_M, 1, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FisherScript_0x73051, -1
	person_event SPRITE_COOLTRAINER_M, 1, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x73062, -1
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FisherScript_0x73073, -1
	person_event SPRITE_TEACHER, 3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x73084, -1
