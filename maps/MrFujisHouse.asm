const_value set 2
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJISHOUSE_POKEFAN

MrFujisHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SuperNerdScript_0x7e8ca:
	jumptextfaceplayer UnknownText_0x7e8f1

LassScript_0x7e8cd:
	jumptextfaceplayer UnknownText_0x7e940

FujiPokeFan:
	faceplayer
	opentext
	writetext FujiPokeFanText
	waitbutton
	closetext
	spriteface MRFUJISHOUSE_POKEFAN, UP
	end
	
MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd difficultbookshelf

FujiPokeFanText:
	text "Oh, hello!"
	line "I'm trying to"
	
	para "choose a book"
	line "to read to my"
	cont "NIDORINO."
	
	para "#MON love to be"
	line "read to."
	cont "Did you know that?"
	done
	
UnknownText_0x7e8f1:
	text "I could talk about"
	line "#MON forever."
	
	para "The power, the"
	line "species, the"
	cont "partnership!"
	done

UnknownText_0x7e940:
	text "If I was a #MON"
	line "I'd be a DITTO."
	
	para "Then I could be"
	line "any #MON I"
	cont "wanted!"
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gu-guwa?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Gyun!"
	done

MrFujisPidgeyText:
	text "PIDGEY: Pijji!"
	done

MrFujisHouse_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 2, 2, LAVENDER_TOWN
	warp_def 7, 3, 2, LAVENDER_TOWN
	warp_def 7, 16, 4, LAVENDER_TOWN
	warp_def 7, 17, 4, LAVENDER_TOWN

.CoordEvents: db 0

.BGEvents: db 2
	signpost -4, 0, SIGNPOST_READ, MrFujisHouseBookshelf
	signpost -4, 1, SIGNPOST_READ, MrFujisHouseBookshelf

.ObjectEvents: db 6
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7e8ca, -1
	person_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x7e8cd, -1
	person_event SPRITE_RHYDON, -7, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	person_event SPRITE_GROWLITHE, 5, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MrFujisNidorino, -1
	person_event SPRITE_MOLTRES, -7, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MrFujisPidgey, -1
	person_event SPRITE_POKEFAN_F, 2, 21, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FujiPokeFan, -1
