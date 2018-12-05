const_value set 2
	const CELADONDEPTSTORE2F_CLERK1
	const CELADONDEPTSTORE2F_CLERK2
	const CELADONDEPTSTORE2F_POKEFAN_M
	const CELADONDEPTSTORE2F_YOUNGSTER

CeladonDeptStore2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x70bad:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_1
	closetext
	end

ClerkScript_0x70bb5:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_2
	closetext
	end

PokefanMScript_0x70bbd:
	jumptextfaceplayer UnknownText_0x70bc9

YoungsterScript_0x70bc0:
	jumptextfaceplayer UnknownText_0x70c3e

CeladonDeptStore2FDirectory:
	jumptext CeladonDeptStore2FDirectoryText

CeladonDeptStore2FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x70bc9:
	text "I'm a hot shot"
	line "trainer."
	
	para "But even I need"
	line "some outside help"
	cont "for my battles."
	done

UnknownText_0x70c3e:
	text "Hmm… what to"
	line "choose…"
	
	para "My #MON could"
	line "benefit from any"
	cont "of these."
	done

CeladonDeptStore2FDirectoryText:
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: TRAINER'S"
	line "    MARKET"
	done

CeladonDeptStore2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_3F
	warp_def $0, $f, 3, CELADON_DEPT_STORE_1F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore2FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore2FElevatorButton

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x70bad, -1
	person_event SPRITE_CLERK, 5, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x70bb5, -1
	person_event SPRITE_COOLTRAINER_F, 6, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x70bbd, -1
	person_event SPRITE_YOUNGSTER, 2, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x70bc0, -1
