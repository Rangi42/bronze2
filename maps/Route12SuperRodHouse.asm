const_value set 2
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FishingGuruScript_0x7f484:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue UnknownScript_0x7f4a0
	writetext UnknownText_0x7f4af
	yesorno
	iffalse UnknownScript_0x7f4a6
	writetext UnknownText_0x7f52f
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse UnknownScript_0x7f4aa
	setevent EVENT_GOT_SUPER_ROD
UnknownScript_0x7f4a0:
	writetext UnknownText_0x7f57c
	waitbutton
	closetext
	end

UnknownScript_0x7f4a6:
	writetext UnknownText_0x7f5ec
	waitbutton
UnknownScript_0x7f4aa:
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

UnknownText_0x7f4af:
	text "Hey, kid!"
	
	para "I can see you're"
	line "into fishin'."
	
	para "But you're not"
	line "getting the big"
	cont "catches, right?"
	
	para "I've got just the"
	line "thing for ya."
	
	para "Interested?"
	done

UnknownText_0x7f52f:
	text "Aha! Of course"
	line "you'd want the"
	cont "SUPER ROD!"
	done

UnknownText_0x7f57c:
	text "You can fish"
	line "wherever there is"
	cont "water."
	
	para "Different RODS"
	line "hook different"
	cont "#MON!"
	done

UnknownText_0x7f5ec:
	text "Huh? Why not?"
	done

Route12SuperRodHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, ROUTE_12
	warp_def 7, 3, 1, ROUTE_12

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_FISHING_GURU, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x7f484, -1
