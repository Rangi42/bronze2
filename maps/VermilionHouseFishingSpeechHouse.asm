const_value set 2
	const VERMILIONHOUSEFISHINGSPEECHHOUSE_FISHING_GURU

VermilionHouseFishingSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "Hey, I'm the"
	line "FISHING GURU!"
	
	para "Have you heard"
	line "the legend of the"
	cont "RED GYARADOS?"
	
	para "I heard about it"
	line "some years ago and"
	
	para "it never left my"
	line "mind."
	
	para "Some say it just"
	line "disappeared."
	
	para "Some say a myster-"
	line "ious trainer"
	cont "caught it."
	
	para "I can't help but"
	line "wonder."
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done

VermilionHouseFishingSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, VERMILION_CITY
	warp_def $7, $3, 1, VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost -5, -5, SIGNPOST_READ, FishingDudesHousePhoto

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingDude, -1
