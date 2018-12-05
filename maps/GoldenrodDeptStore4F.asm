const_value set 2
	const GOLDENRODDEPTSTORE4F_CLERK
	const GOLDENRODDEPTSTORE4F_COOLTRAINER_M
	const GOLDENRODDEPTSTORE4F_BUG_CATCHER
	const GOLDENRODDEPTSTORE4F_GAMEBOY_KID

GoldenrodDeptStore4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x55ee9:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

CooltrainerMScript_0x55ef1:
	jumptextfaceplayer UnknownText_0x55f08

BugCatcherScript_0x55ef4:
	jumptextfaceplayer UnknownText_0x55f52

GameboyKidScript_0x55ef7:
	faceplayer
	opentext
	writetext UnknownText_0x55f74
	waitbutton
	closetext
	spriteface GOLDENRODDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

GoldenrodDeptStore4FDirectory:
	jumptext GoldenrodDeptStore4FDirectoryText

GoldenrodDeptStore4FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x55f08:
	text "IRON, PROTEIN and"
	line "such can really"
	
	para "beef up your #-"
	line "MON for good."
	
	para "They're expensive,"
	line "but worth it!"
	done

UnknownText_0x55f52:
	text "#MON like it"
	line "when you use some"
	cont "items on them!"
	done

UnknownText_0x55f74:
	text "I like battling"
	line "with my friends"
	cont "VIA LINK CABLE."
	
	para "You can do it"
	line "at #MON CENTERS!"
	done

GoldenrodDeptStore4FDirectoryText:
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F MEDICINE BOX"
	done

GoldenrodDeptStore4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, GOLDENROD_DEPT_STORE_5F
	warp_def $0, $f, 2, GOLDENROD_DEPT_STORE_3F
	warp_def $0, $2, 1, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore4FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore4FElevatorButton

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x55ee9, -1
	person_event SPRITE_COOLTRAINER_F, 7, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x55ef1, -1
	person_event SPRITE_BUG_CATCHER, 2, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x55ef4, -1
	person_event SPRITE_GAMEBOY_KID, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x55ef7, -1
