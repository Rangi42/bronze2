const_value set 2
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
	text "This 'ol FISHING"
	line "GURU has seen"
	cont "better days."
	
	para "I've been wanting"
	line "to pass my ROD"
	
	para "down to a worthy"
	line "adversary."
	
	para "Hey, you look"
	line "pretty strong!"
	cont "How about it, kid?"
	done

GiveGoodRodText:
	text "Hoho! It fills"
	line "my heart with joy!"
	done

GaveGoodRodText:
	text "Fish can be found"
	line "wherever there is"
	cont "water."
	
	para "Just throw that"
	line "line into the sea!"
	done

DontWantGoodRodText:
	text "That is really"
	line "disappointing…"
	done

HaveGoodRodText:
	text "Fishing up a"
	line "storm, kid?"
	done

OlivineGoodRodHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, OLIVINE_CITY
	warp_def $7, $3, 6, OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GoodRodGuru, -1
