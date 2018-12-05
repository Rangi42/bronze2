const_value set 2
	const SAFARIZONEWARDENSHOME_LASS
	const SAFARIZONEWARDENSHOME_GRAMPS
	const SAFARIZONEWARDENSHOME_TOUNGSTER

SafariZoneWardensHome_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WardensGranddaughter:
	faceplayer
	opentext
;	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
;	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	spriteface SAFARIZONEWARDENSHOME_LASS, UP
;	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

SafariYoungsterScript:
	jumptextfaceplayer SafariYoungsterText
	
SafariGrampsScript:
	jumptextfaceplayer SafariGrampsText
	
SafariYoungsterText:
	text "Gramps doesn't"
	line "live here anymore."
	
	para "Maybe now my"
	line "girlfriend could"
	cont "move in!"
	done
	
SafariGrampsText:
	text "Oh kids and"
	line "their television."
	
	para "Can't ever get them"
	line "away from that"
	cont "screen."
	done
	
WardensGranddaughterText1:
	text "Shhh!"
	line "This is the best"
	cont "part of the show!"
	
	para "SCARLET is about"
	line "to reveal her"
	cont "big secret!"
	done

WardensGranddaughterText2:
	text "Many people were"
	line "disappointed that"

	para "SAFARI ZONE closed"
	line "down, but Grandpa"
	cont "is so stubborn…"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"

	para "who's surrounded"
	line "by #MON."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"

	para "with rare #MON"
	line "frolicking in it."
	done

SafariZoneWardensHome_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 2, 10, FUCHSIA_CITY
	warp_def 7, 3, 10, FUCHSIA_CITY
	warp_def 7, 18, 6, FUCHSIA_CITY
	warp_def 7, 19, 6, FUCHSIA_CITY

.CoordEvents: db 0

.BGEvents: db 4
	signpost -4, 0, SIGNPOST_READ, WardensHomeBookshelf
	signpost -4, 1, SIGNPOST_READ, WardensHomeBookshelf
	signpost -2, 7, SIGNPOST_READ, WardenPhoto
	signpost -3, 9, SIGNPOST_READ, SafariZonePhoto

.ObjectEvents: db 3
	person_event SPRITE_LASS, 2, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, WardensGranddaughter, -1
	person_event SPRITE_GRAMPS, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SafariGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 3, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SafariYoungsterScript, -1
