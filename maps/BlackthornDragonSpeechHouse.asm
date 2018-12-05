const_value set 2
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_EKANS

BlackthornDragonSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrannyScript_0x195949:
	faceplayer
	opentext
	writetext UnknownText_0x19595c
	yesorno
	iffalse .BlackSpeechNo
	writetext BlackSpeechYesText
	waitbutton
	closetext
	end
	
.BlackSpeechNo
	writetext BlackSpeechNoText
	waitbutton
	closetext
	end
	
Dratini:
	opentext
	writetext DratiniText
	cry DRATINI
	waitbutton
	closetext
	end

; unused
	jumpstd picturebookshelf

; unused
	jumpstd magazinebookshelf

UnknownText_0x19595c:
	text "So many secrets"
	line "in this world."
	
	para "I've yet to begin"
	line "uncovering the"
	cont "real stuff."
	
	para "Do you also seek"
	line "the unknown?"
	done

BlackSpeechNoText:
	text "That's…"
	line "disappointing."
	
	para "It's okay to be"
	line "curious."
	done
	
BlackSpeechYesText:
	text "It's good to know"
	line "there are more"
	cont "of us out there."
	done
	
DratiniText:
	text "DRATINI: Draa!"
	done

BlackthornDragonSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, BLACKTHORN_CITY
	warp_def $7, $3, 2, BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x195949, -1
	person_event SPRITE_EKANS, -5, -5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Dratini, -1
