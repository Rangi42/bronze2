SilverCaveOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

	; callbacks

MtSilverPokeCenterSign:
	jumpstd pokecentersign

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	dwb EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE, FULL_RESTORE

MtSilverSignText:
	text "MT. ENDER"
	done

SilverCaveOutside_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 11, 23, 1, SILVER_CAVE_POKECENTER_1F
	warp_def 7, 16, 1, SILVER_CAVE_ROOM_1
	warp_def 18, 0, 6, ROUTE12GATES
	warp_def 19, 0, 7, ROUTE12GATES

.CoordEvents: db 0

.BGEvents: db 3
	signpost 11, 24, SIGNPOST_READ, MtSilverPokeCenterSign
	signpost 9, 19, SIGNPOST_READ, MtSilverSign
	signpost 6, 6, SIGNPOST_ITEM, SilverCaveOutsideHiddenFullRestore

.ObjectEvents: db 0
