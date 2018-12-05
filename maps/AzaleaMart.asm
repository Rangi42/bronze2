const_value set 2
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER
	const AZALEAMART_POKEDOLL

AzaleaMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18e040:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzMartPokeDoll:
	jumptext AzMartPokeDollText
	
CooltrainerMScript_0x18e047:
	jumptextfaceplayer UnknownText_0x18e04d

BugCatcherScript_0x18e04a:
	jumptextfaceplayer UnknownText_0x18e0b6

AzMartPokeDollText:
	text "A CLEFAIRY!"
	line "How cute!"
	para "Oh, it's just a"
	line "# DOLL…"
	done

UnknownText_0x18e04d:
	text "Once you've come"
	line "this far in your"
	
	para "journey, is it"
	line "wrong to go back"
	
	para "if you don't think"
	line "you can succeed?"
	done

UnknownText_0x18e0b6:
	text "I brought my"
	line "#MON with me"
	
	para "to the #MART"
	line "to get some items."
	
	para "Only when I got"
	line "here did I realise"
	
	para "I had brought"
	line "my # DOLL"
	cont "instead…"
	done

AzaleaMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, AZALEA_TOWN
	warp_def $7, $3, 3, AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x18e040, -1
	person_event SPRITE_COOLTRAINER_F, 5, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x18e047, -1
	person_event SPRITE_BUG_CATCHER, 2, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x18e04a, -1
	person_event SPRITE_CLEFAIRY, 2, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AzMartPokeDoll, -1
