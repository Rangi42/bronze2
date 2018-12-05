const_value set 2
	const ROUTE30BERRYSPEECHHOUSE_POKEFAN_M

Route30BerrySpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x196d64:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue UnknownScript_0x196d79
	writetext UnknownText_0x196d82
	buttonsound
	verbosegiveitem HM_STRENGTH
	iffalse UnknownScript_0x196d7d
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
UnknownScript_0x196d79:
	writetext UnknownText_0x196dec
	waitbutton
UnknownScript_0x196d7d:
	closetext
	end

Route30BerrySpeechHouseBookshelf:
	jumpstd magazinebookshelf

UnknownText_0x196d82:
	text "Oh hello!"
	line "I feel like we've"
	cont "met before."
	
	para "I was clearing"
	line "the path to this"
	
	para "route by having my"
	line "#MON use"
	cont "STRENGTH!"
	
	para "Here, I think you"
	line "could use this"
	cont "too!"
	done

UnknownText_0x196dec:
	text "STRENGTH can help"
	line "your #MON move"
	cont "large boulders!"
	
	para "Use that HM well!"
	done

Route30BerrySpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, ROUTE_30
	warp_def 7, 3, 1, ROUTE_30

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, Route30BerrySpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route30BerrySpeechHouseBookshelf

.ObjectEvents: db 1
	person_event SPRITE_FISHER, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x196d64, -1
