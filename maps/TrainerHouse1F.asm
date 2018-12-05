const_value set 2
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x9af67:
	jumptext UnknownText_0x9af7f

TrainerHouseTrade:
	faceplayer
	opentext
;	writetext UnknownText_0x9b025
	trade $4
	waitbutton
	closetext
	end

CooltrainerFScript_0x9af6d:
	faceplayer
	opentext
	writetext UnknownText_0x9b0b5
	waitbutton
	closetext
	spriteface TRAINERHOUSE1F_COOLTRAINER_F, RIGHT
	end

YoungsterScript_0x9af70:
	jumptextfaceplayer UnknownText_0x9b11d

GentlemanScript_0x9af73:
	faceplayer
	opentext
	writetext UnknownText_0x9b1c9
	waitbutton
	closetext
	spriteface TRAINERHOUSE1F_GENTLEMAN, RIGHT
	end

MapTrainerHouse1FSignpost0Script:
	jumptext UnknownText_0x9b1f4

MapTrainerHouse1FSignpost1Script:
	jumptext UnknownText_0x9b25d

MapTrainerHouse1FSignpost2Script:
	jumptext UnknownText_0x9b2c1

UnknownText_0x9af7f:
	text "THE LONELIEST"
	line "#MON"
	
	para "A Story by MR. &"
	line "MS. MILLER."
	
	para "Once upon a time…"
	
	para "…There's nothing"
	line "else written"
	cont "here."
	done

UnknownText_0x9b025:
	text "Piss"
	done

UnknownText_0x9b0b5:
	text "My husband and I"
	line "are writing a"
	
	para "children's book"
	line "about a #MON."
	done

UnknownText_0x9b11d:
	text "My son hasn't kept"
	line "a single #MON"
	
	para "for more than"
	line "a month."
	done

UnknownText_0x9b1c9:
	text "Whew… I'm taking a"
	line "break after all"
	
	para "that brain-"
	line "storming."
	done

UnknownText_0x9b1f4:
	text "Practice battles"
	line "are held in the"

	para "TRAINING HALL"
	line "downstairs."

	para "Skilled trainers"
	line "are invited to"
	cont "participate."
	done

UnknownText_0x9b25d:
	text "There are no rules"
	line "or regulations for"

	para "practice matches."
	line "Just like in field"

	para "battles, anything"
	line "goes!"
	done

UnknownText_0x9b2c1:
	text "…What's this?"
	line "A strategy memo?"

	para "This writing looks"
	line "like ONIX tracks…"

	para "It's completely"
	line "illegible…"
	done

TrainerHouse1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 7, 2, 3, VIRIDIAN_CITY
	warp_def 7, 3, 3, VIRIDIAN_CITY
	warp_def 2, 8, 1, TRAINER_HOUSE_B1F
	warp_def 7, 16, 10, VIRIDIAN_CITY
	warp_def 7, 17, 10, VIRIDIAN_CITY

.CoordEvents: db 0

.BGEvents: db 3
	signpost -2, 5, SIGNPOST_READ, MapTrainerHouse1FSignpost0Script
	signpost -3, 7, SIGNPOST_READ, MapTrainerHouse1FSignpost1Script
	signpost 10, 7, SIGNPOST_READ, MapTrainerHouse1FSignpost2Script

.ObjectEvents: db 5
	person_event SPRITE_PAPER, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x9af67, -1
	person_event SPRITE_POKEFAN_M, 3, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x9af70, -1
	person_event SPRITE_TEACHER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x9af6d, -1
	person_event SPRITE_YOUNGSTER, 4, 20, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainerHouseTrade, -1
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x9af73, -1
