const_value set 2
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x73518:
	faceplayer
	opentext
;	checkevent EVENT_RETURNED_MACHINE_PART
;	iftrue UnknownScript_0x73526
	writetext UnknownText_0x7352c
	waitbutton
	closetext
	end

UnknownScript_0x73526:
	writetext UnknownText_0x73592
	waitbutton
	closetext
	end

UnknownText_0x7352c:
	text "You're working on"
	line "a #DEX are ya?"
	cont "I'm impressed."
	done

UnknownText_0x73592:
	text "I take my GUARD"
	line "job seriously."

	para "Hey! You have a"
	line "#DEX."

	para "OK. You can go"
	line "through."
	done

Route7SaffronGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 2, ROUTE_9
	warp_def 5, 0, 3, ROUTE_9
	warp_def 4, 9, 10, SAFFRON_CITY
	warp_def 5, 9, 11, SAFFRON_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x73518, -1
