const_value set 2
	const GUIDEGENTSHOUSE_GRAMPS

GuideGentsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseBookshelf:
	jumpstd magazinebookshelf

GuideGentsHouseGuideGentText:
	text "#MON have been"
	line "companions to"
	
	para "humans for a"
	line "very long time."
	
	para "The first #MON"
	line "I ever caught"
	
	para "will forever"
	line "remain in my"
	cont "heart."
	done

GuideGentsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, CHERRYGROVE_CITY
	warp_def $7, $3, 4, CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, GuideGentsHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, GuideGentsHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, -1
