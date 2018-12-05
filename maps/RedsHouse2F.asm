RedsHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapRedsHouse2FSignpost0Script:
	jumptext UnknownText_0x19b050

MapRedsHouse2FSignpost1Script:
	jumptext UnknownText_0x19b087

MapRedsHouse2FSignpost2Script:
	jumptext RedRadioText
	
RedRadioText:
	text "It's a radio."
	done
	
UnknownText_0x19b050:
	text "A lot of strange"
	line "books I've never"
	cont "seen before."
	done

UnknownText_0x19b087:
	text "This PC looks"
	line "quite dusty."
	done

RedsHouse2F_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 0, 7, 3, REDS_HOUSE_1F

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 3, SIGNPOST_READ, MapRedsHouse2FSignpost0Script
	signpost 1, 4, SIGNPOST_READ, MapRedsHouse2FSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRedsHouse2FSignpost2Script

.ObjectEvents: db 0
