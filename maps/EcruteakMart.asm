const_value set 2
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x99c3b:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

SuperNerdScript_0x99c42:
	jumptextfaceplayer UnknownText_0x99c48

GrannyScript_0x99c45:
	jumptextfaceplayer UnknownText_0x99cd5

UnknownText_0x99c48:
	text "Did you know"
	line "there's a #MON"
	
	para "that can evolve"
	line "into several"
	
	para "different types of"
	line "#MON?"
	
	para "EEVEE I think it"
	line "was called."
	done

UnknownText_0x99cd5:
	text "Make sure you take"
	line "good care of your"
	
	para "#MON and they"
	line "will care for you"
	cont "in return."
	done

EcruteakMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 9, ECRUTEAK_CITY
	warp_def $7, $3, 9, ECRUTEAK_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x99c3b, -1
	person_event SPRITE_YOUNGSTER, 2, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x99c42, -1
	person_event SPRITE_FISHER, 6, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x99c45, -1
