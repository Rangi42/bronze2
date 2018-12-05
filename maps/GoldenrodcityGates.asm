const_value set 2
	const GOLDENRODGATE_OFFICER1
	const GOLDENRODGATE_OFFICER2
	const GOLDENRODGATE_PERSON1
	const GOLDENRODGATE_PERSON2
	const GOLDENRODGATE_ROCKET1
	const GOLDENRODGATE_ROCKET2


GoldenrodcityGates_MapScriptHeader:

.Triggers: db 0

.Callbacks: db 0

.Scripts:

GoldenrodGateGuardScript_1:
	jumptextfaceplayer GoldenrodGateGuardtext_1
	
GoldenrodGateGuardScript_2:
	jumptextfaceplayer GoldenrodGateGuardtext_2

GoldenrodGatePersonScript_1:
	jumptextfaceplayer GoldenrodGatePersontext_1
	
GoldenrodGatePersonScript_2:
	faceplayer
	opentext	
	writetext GoldenrodGatePersontext_2
	waitbutton
	closetext
	spriteface GOLDENRODGATE_PERSON2, DOWN
	end
	
GoldenrodGateRocketScript_1:
	jumptextfaceplayer GoldenrodGateRockettext_1
	
GoldenrodGateRocketScript_2:
	jumptextfaceplayer GoldenrodGateRockettext_2
	
.Text:

GoldenrodGateGuardtext_1:
	text "One of those lone"
	line "travelers, eh?"
	
	para "But I guess no one"
	line "is truly alone if"
	cont "they have #MON."
	done
	
GoldenrodGateGuardtext_2:
	text "So you're the hero"
	line "of ROSEGLEN CITY?"
	
	para "I expected someone"
	line "a litte…"
	cont "older."
	
	para "That's the new"
	line "generation for ya!"
	done
	
GoldenrodGatePersontext_1:
	text "Test7"
	line "Test8"
	cont "Test9"
	done
	
GoldenrodGatePersontext_2:
	text "I collect #MON"
	line "and trade them"
	cont "with friends."
	
	para "It's a great way"
	line "to catch them all!"
	done
	
GoldenrodGateRockettext_1:
	text "Get lost!"
	done
	
GoldenrodGateRockettext_2:
	text "Bite me!"
	done

GoldenrodcityGates_MapEventHeader:: db 0, 0

.Warps: db 12
	warp_def 4, 2, 7, ROUTE_34
	warp_def 5, 2, 6, ROUTE_34
	warp_def 4, 11, 16, GOLDENROD_CITY
	warp_def 5, 11, 17, GOLDENROD_CITY
	warp_def 14, 7, 1, GOLDENROD_CITY
	warp_def 17, 6, 1, GOLDENROD_CITY
	warp_def 21, 6, 12, GOLDENROD_CITY
	warp_def 21, 7, 12, GOLDENROD_CITY
	warp_def 4, 20, 19, GOLDENROD_CITY
	warp_def 5, 20, 20, GOLDENROD_CITY
	warp_def 4, 29, 2, ROUTE_44
	warp_def 5, 29, 3, ROUTE_44

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_OFFICER, 2, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGateGuardScript_1, -1
	person_event SPRITE_OFFICER, 2, 24, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGateGuardScript_2, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_COOLTRAINER_M, 18, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGatePersonScript_1, -1
	person_event SPRITE_GAMEBOY_KID, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GoldenrodGatePersonScript_2, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_ROCKET, 5, 24, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGateRocketScript_1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 4, 24, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGateRocketScript_2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
