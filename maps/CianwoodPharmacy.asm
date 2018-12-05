const_value set 2
	const CIANWOODPHARMACY_PHARMACIST
	const CIANWOODPHARMACY_PERSON1
	const CIANWOODPHARMACY_PERSON2

CianwoodPharmacy_MapScriptHeader:
.MapTriggers:
	db 0

	; triggers

.MapCallbacks:
	db 0

CianwoodPharmacyPerson1:
	jumptextfaceplayer CianwoodPharmacyPerson1Text

CianwoodPharmacyPerson2:
	jumptextfaceplayer CianwoodPharmacyPerson2Text
	
CianwoodPharmacist:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CIANWOOD
	closetext
	end

.Mart:
	pokemart MARTTYPE_STANDARD, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd difficultbookshelf

CianwoodPharmacyPerson1Text:
	text "I'm hanging out"
	line "here for some"
	cont "bargains!"
	
	para "Once something"
	line "goes on sale,"
	cont "I'm on it like"
	
	para "a JIGGLYPUFF at"
	line "a karaoke party!"
	done

CianwoodPharmacyPerson2Text:
	text "I always use ITEMS"
	line "to get the edge in"
	cont "battle."
	
	para "You'd be silly"
	line "not to!"
	done
	
PharmacistGiveSecretpotionText:
	text "Your #MON ap-"
	line "pear to be fine."

	para "Is something wor- "
	line "rying you?"

	para "…"

	para "The LIGHTHOUSE"
	line "#MON is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> received"
	line "SECRETPOTION."
	done

PharmacistDescribeSecretpotionText:
	text "My SECRETPOTION is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done

CianwoodPharmacy_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, CIANWOOD_CITY
	warp_def 7, 3, 4, CIANWOOD_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, CianwoodPharmacyBookshelf
	signpost 1, 1, SIGNPOST_READ, CianwoodPharmacyBookshelf

.ObjectEvents: db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianwoodPharmacist, -1
	person_event SPRITE_COOLTRAINER_M, 6, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianwoodPharmacyPerson1, -1
	person_event SPRITE_COOLTRAINER_F, 2, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CianwoodPharmacyPerson2, -1
