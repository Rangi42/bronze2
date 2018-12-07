Route23_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	return

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

IndigoPlateauSignText:
	text "PASTEL PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done

Route23_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 5, 9, 1, INDIGO_PLATEAU_POKECENTER_1F
	warp_def 5, 10, 2, INDIGO_PLATEAU_POKECENTER_1F
	warp_def 13, 9, 10, VICTORY_ROAD
	warp_def 13, 10, 10, VICTORY_ROAD

.CoordEvents: db 0

.BGEvents: db 1
	signpost 8, 12, SIGNPOST_READ, IndigoPlateauSign

.ObjectEvents: db 0
