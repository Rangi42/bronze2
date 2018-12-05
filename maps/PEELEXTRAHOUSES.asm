const_value set 2
	const PEELHOUSE_GIRL
	const PEELHOUSE_BOY

PEELEXTRAHOUSES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

PeelHouseGirl
	jumptextfaceplayer PeelHouseGirlText
	
PeelHouseBoy
	jumptextfaceplayer PeelHouseBoyText
	
.Text:

PeelHouseGirlText:
	text "I got robbed once."
	line "A clumsy burglar"
	
	para "broke my TV, my"
	line "table, and knocked"
	cont "over my plants."
	done
	
PeelHouseBoyText:
	text "I'd like to help"
	line "you with finding"
	
	para "secret items, but"
	line "it looks like"
	cont "you're capable."
	done

PEELEXTRAHOUSES_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 7, 2, 17, SAFFRON_CITY
	warp_def 7, 3, 17, SAFFRON_CITY
	warp_def 7, 16, 18, SAFFRON_CITY
	warp_def 7, 17, 18, SAFFRON_CITY
	warp_def 7, 30, 1, SAFFRON_CITY
	warp_def 7, 31, 1, SAFFRON_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PeelHouseGirl, -1
	person_event SPRITE_COOLTRAINER_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PeelHouseBoy, -1
