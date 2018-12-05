const_value set 2
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeladonMansionManager:
	jumptextfaceplayer CeladonMansionManagerText

CeladonMansion1FMeowth:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FClefairy:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CeladonMansion1FNidoranF:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansionCounter:
	jumptext CeladonMansionManagerText

CeladonMansionManagerText:
	text "Welcome to"
	line "GAME FREAKO's"
	cont "HEAD OFFICE."
	
	para "People are"
	line "working upstairs!"
	done

CeladonMansion1FMeowthText:
	text "MEOWTH: Meow!"
	done

CeladonMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

CeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "GAME FREAKO"
	line "HEAD OFFICE"
	cont "FRONT DESK"
	done

CeladonMansion1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 9, 4, 7, SAFFRON_CITY
	warp_def 9, 5, 7, SAFFRON_CITY
	warp_def -2, 3, 3, CELADON_CITY
	warp_def -2, 0, 1, CELADON_MANSION_2F
	warp_def 0, 7, 4, CELADON_MANSION_2F

.CoordEvents: db 0

.BGEvents: db 3
	signpost 6, 5, SIGNPOST_UP, CeladonMansionManagersSuiteSign
	signpost 6, 2, SIGNPOST_READ, CeladonMansionCounter
	signpost 1, 2, SIGNPOST_READ, CeladonMansionCounter

.ObjectEvents: db 4
	person_event SPRITE_RECEPTIONIST, 5, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonMansionManager, -1
	person_event SPRITE_GROWLITHE, -6, -5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	person_event SPRITE_CLEFAIRY, -5, -5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	person_event SPRITE_GROWLITHE, -5, -5, SPRITEMOVEDATA_POKEMON, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
