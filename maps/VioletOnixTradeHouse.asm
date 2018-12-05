const_value set 2
	const VIOLETONIXTRADEHOUSE_POKEFAN_M
	const VIOLETONIXTRADEHOUSE_KYLE

VioletOnixTradeHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x6998d:
	faceplayer
	opentext
	writetext UnknownText_0x69997
	waitbutton
	closetext
	spriteface VIOLETONIXTRADEHOUSE_POKEFAN_M, UP
	end

Kyle:
	faceplayer
	opentext
	trade $1
	waitbutton
	closetext
	end

UnknownText_0x69997:
	text "Shh! My favorite"
	line "show is on!"
	
	para "Boy that SCARLET"
	line "is such a dear!"
	done

VioletOnixTradeHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 6, VIOLET_CITY
	warp_def 7, 3, 6, VIOLET_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_FISHER, 3, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x6998d, -1
	person_event SPRITE_YOUNGSTER, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Kyle, -1
