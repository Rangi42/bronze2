const_value set 2
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SailorScript_0x9c8c1:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue UnknownScript_0x9c8d3
	writetext UnknownText_0x9c8df
	buttonsound
	verbosegiveitem MYSTERY_EGG
	setevent EVENT_GOT_HM04_STRENGTH
UnknownScript_0x9c8d3:
	writetext UnknownText_0x9c965
	waitbutton
	closetext
	end

FishingGuruScript_0x9c8d9:
	jumptextfaceplayer UnknownText_0x9c9c5

SailorScript_0x9c8dc:
	jumptextfaceplayer UnknownText_0x9ca09

OlivineHotelSignInside:
	jumptext OlivineHotelSignInsideText

OlivineHotelSignInsideText:
	text "Welcome To The"
	line "NEWPORT HOTEL"
	done
	
UnknownText_0x9c8df:
	text "Hey kid!"
	
	para "Have you seen"
	line "those weird crum-"
	cont "bly rocks around?"
	
	para "I created just the"
	line "thing to get past"
	cont "them."
	
	para "Here, I'll share it"
	line "with you!"
	done

UnknownText_0x9c965:
	text "Smashing rocks"
	line "with the ROCK"
	
	para "SMASHER is bundles"
	line "of fun!"
	done

UnknownText_0x9c9c5:
	text "#MON? No this"
	line "is a hotel for"
	cont "people."
	
	para "It's a bit too"
	line "fancy for you,"
	cont "kid."
	done

UnknownText_0x9ca09:
	text "This is where I"
	line "always stay when"
	
	para "I have business in"
	line "this town."
	
	para "It's very high"
	line "class."
	done

OlivineCafe_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 9, 4, 7, OLIVINE_CITY
	warp_def 9, 5, 7, OLIVINE_CITY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 2, 7, SIGNPOST_READ, OlivineHotelSignInside

.ObjectEvents: db 3
	person_event SPRITE_FISHER, 3, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript_0x9c8c1, -1
	person_event SPRITE_FISHING_GURU, 1, 11, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x9c8d9, -1
	person_event SPRITE_GENTLEMAN, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x9c8dc, -1
