const_value set 2
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "Hello <PLAY_G>!"
	line "On another adven-"
	cont "ture?"
	
	para "I wish I could"
	line "train #MON"
	cont "more often."
	
	para "But being a"
	line "mother is an"
	cont "adventure too!"
	done

ElmsSonText:
	text "I think my favo-"
	line "rite #MON would"
	cont "be an electric"
	cont "type."
	
	para "What about you,"
	line "big kid?"
	done

ElmsHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "#MON. Where do"
	line "they come from?"

	para "Where do they go?"
	line "Where do they come"
	cont "from, #MON JOE."
	done

ElmsHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, NEW_BARK_TOWN
	warp_def 7, 3, 4, NEW_BARK_TOWN

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 0, SIGNPOST_READ, ElmsHousePC
	signpost 1, 6, SIGNPOST_READ, ElmsHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, ElmsHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_TEACHER, 3, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ElmsWife, -1
	person_event SPRITE_BUG_CATCHER, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ElmsSon, -1
