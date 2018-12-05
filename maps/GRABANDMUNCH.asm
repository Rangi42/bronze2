const_value set 2
	const EATERY_CHEF
	const EATERY_FOODER
	const EATERY_FOODER2

GRABANDMUNCH_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

EateryChefScript:
	jumptextfaceplayer EateryChefText
	
EateryFooder1Script:
	jumptextfaceplayer EateryFooder1Text
	
EateryFooder2Script:
	jumptextfaceplayer EateryFooder2Text

EateryHiddenLeftovers:
	dwb EVENT_BOULDER_IN_BLACKTHORN_GYM_2, LEFTOVERS
	
EateryChefText:
	text "I figured opening"
	line "a resturaunt to"
	
	para "feed all the town's"
	line "visitors was an"
	
	para "excellent business"
	line "decision."
	done
	
EateryFooder2Text:
	text "…Chew chew…"
	
	para "It's all you can"
	line "eat!"
	
	para "…Chew chew…"
	done
	
EateryFooder1Text:
	text "The fatter I"
	line "get, the jollier"
	cont "I become."
	
	para "I visit this town"
	line "often!"
	done
	
GRABANDMUNCH_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 2, FUCHSIA_CITY
	warp_def 7, 3, 2, FUCHSIA_CITY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 7, 7, SIGNPOST_ITEM, EateryHiddenLeftovers

.ObjectEvents: db 3
	person_event SPRITE_CLERK, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EateryChefScript, -1
	person_event SPRITE_FISHER, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EateryFooder1Script, -1
	person_event SPRITE_FISHER, 4, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EateryFooder2Script, -1
