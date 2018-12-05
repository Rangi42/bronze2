const_value set 2
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CharcoalKilnBoss:
	faceplayer
	opentext
;	checkevent EVENT_GOT_HM01_CUT
;	iftrue .GotCut
;	checkevent EVENT_CLEARED_SLOWPOKE_WELL
;	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
;	iftrue .YoureTheCoolest
;	checkevent EVENT_GOT_HM01_CUT
	iffalse .CharcoalGive
	writetext CharcoalKilnApprenticeText1Half
	waitbutton
	closetext
	end

.CharcoalGive
	writetext CharcoalKilnApprenticeText2
	buttonsound
	verbosegiveitem STICK
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnRadio:
	jumpstd radio2

CharcoalKilnBossText1:
	text "My boyfriend is"
	line "not very good"
	cont "at giving gifts."
	done

CharcoalKilnBossText2:
	text "The SLOWPOKE have"
	line "returned…"

	para "But my APPRENTICE"
	line "hasn't come back"
	cont "from ILEX FOREST."

	para "Where in the world"
	line "is that lazy guy?"
	done

CharcoalKilnBossText3:
	text "You chased off"
	line "TEAM ROCKET and"

	para "went to ILEX"
	line "FOREST alone?"

	para "That takes guts!"
	line "I like that. Come"
	cont "train with us."
	done

CharcoalKilnApprenticeText1:
	text "Sorry, it's all I"
	line "had."
	done
	
CharcoalKilnApprenticeText1Half:
	text "We're not very"
	line "fancy here in"
	cont "FIGBRANCH TOWN."
	done

CharcoalKilnApprenticeText2:
	text "Hey, welcome to"
	line "FIGBRANCH TOWN!"
	
	para "I uh… don't have"
	line "much for a uh…"
	
	para "Welcoming gift…"
	line "But uh…"
	cont "Oh!"
	cont "This'll do!"
	done

CharcoalKilnApprenticeText3:
	text "The SLOWPOKE came"
	line "back, and you even"
	cont "found FARFETCH'D."

	para "You're the cool-"
	line "est, man!"
	done

FarfetchdText:
	text "FARFETCH'D: Kwaa!"
	done

CharcoalKiln_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 2, AZALEA_TOWN
	warp_def 7, 3, 2, AZALEA_TOWN

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 0, SIGNPOST_READ, CharcoalKilnBookshelf
	signpost 1, 1, SIGNPOST_READ, CharcoalKilnBookshelf
	signpost 1, 9, SIGNPOST_READ, CharcoalKilnRadio

.ObjectEvents: db 3
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalKilnBoss, -1
	person_event SPRITE_YOUNGSTER, 3, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalKilnApprentice, -1
	person_event SPRITE_MOLTRES, -6, -6, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, -1
