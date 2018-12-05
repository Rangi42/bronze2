const_value set 2
	const LAVENDERNAMERATER_NAME_RATER

LavenderNameRater_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x7eaf1, 0

.MapCallbacks:
	db 0

UnknownScript_0x7eaf1:
	end

LavenderNameRater:
	faceplayer
	opentext
	special SpecialNameRater
	waitbutton
	closetext
	end

LavenderNameRaterBookshelf:
; unused
	jumpstd difficultbookshelf

LavenderNameRater_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 8, PEWTER_CITY
	warp_def 7, 3, 8, PEWTER_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LavenderNameRater, -1
