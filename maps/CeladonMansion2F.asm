CeladonMansion2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FSign:
	jumptext CeladonMansion2FSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> turned on"
	line "the PC."

	para "…"

	para "There's a text"
	line "file open…"
	
	para "…Development plans"
	line "for #MON BRONZE"
	cont "3…"
	
	para "…"
	
	para "I'd better not read"
	line "that!"
	done

CeladonMansion2FSignText:
	text "GAME FREAKO"
	line "MEETING ROOM"
	done

CeladonMansion2F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def -2, 0, 4, CELADON_MANSION_1F
	warp_def -2, 1, 2, CELADON_MANSION_3F
	warp_def 0, 6, 3, CELADON_MANSION_3F
	warp_def 0, 7, 5, CELADON_MANSION_1F

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 0, SIGNPOST_READ, CeladonMansion2FComputer
	signpost 8, 5, SIGNPOST_UP, CeladonMansion2FSign
	signpost 1, 2, SIGNPOST_READ, CeladonMansion2FBookshelf

.ObjectEvents: db 0
