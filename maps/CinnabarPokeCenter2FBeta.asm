CinnabarPokeCenter2FBeta_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CinnabarPokeCenter2FBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $7, $0, 3, ROUTE_40

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
