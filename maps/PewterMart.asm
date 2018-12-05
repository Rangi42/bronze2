const_value set 2
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x1a2dcb:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PEWTER
	closetext
	end

YoungsterScript_0x1a2dd2:
	jumptextfaceplayer UnknownText_0x1a2dd8

SuperNerdScript_0x1a2dd5:
	jumptextfaceplayer UnknownText_0x1a2e3a

UnknownText_0x1a2dd8:
	text "I wonder if"
	line "anyone constructed"
	
	para "my idea for a new"
	line "MART yet."
	done

UnknownText_0x1a2e3a:
	text "I've got so"
	line "many HM moves!"
	
	para "I earned them"
	line "by helping people!"
	done

PewterMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, PEWTER_CITY
	warp_def $7, $3, 3, PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x1a2dcb, -1
	person_event SPRITE_SUPER_NERD, 2, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a2dd2, -1
	person_event SPRITE_TWIN, 6, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x1a2dd5, -1
