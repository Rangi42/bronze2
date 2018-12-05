const_value set 2
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BUENA

VermilionMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x191f7e:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end
	;

SuperNerdScript_0x191f85:
	jumptextfaceplayer UnknownText_0x191f8b

BuenaScript_0x191f88:
	jumptextfaceplayer UnknownText_0x191fca

UnknownText_0x191f8b:
	text "I buy items for"
	line "friends."
	
	para "I don't need them,"
	line "I'm much too"
	cont "strong!"
	done

UnknownText_0x191fca:
	text "Do you think I"
	line "look pretty enough"
	cont "To catch #MON?"
	
	para "I have to look"
	line "my best for them!"
	done

VermilionMart_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 5, VERMILION_CITY
	warp_def 7, 3, 5, VERMILION_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x191f7e, -1
	person_event SPRITE_BLACK_BELT, 2, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x191f85, -1
	person_event SPRITE_BUENA, 6, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BuenaScript_0x191f88, -1
