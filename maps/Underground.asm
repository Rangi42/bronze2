Underground_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UndergroundHiddenFullRestore:
	dwb EVENT_UNDERGROUND_HIDDEN_FULL_RESTORE, FULL_RESTORE


UndergroundHiddenXSpecial:
	dwb EVENT_UNDERGROUND_HIDDEN_X_SPECIAL, X_SPECIAL


Underground_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 0, 3, 5, LAVENDERTOWNGATES
	warp_def 24, 3, 19, ROUTE25GATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 6, 0, SIGNPOST_ITEM, UndergroundHiddenFullRestore
	signpost 14, 5, SIGNPOST_ITEM, UndergroundHiddenXSpecial

.ObjectEvents: db 0
