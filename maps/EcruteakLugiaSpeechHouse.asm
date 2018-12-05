const_value set 2
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x99334:
	jumptextfaceplayer UnknownText_0x9933d

YoungsterScript_0x99337:
	opentext 
	writetext UnknownText_0x993ec
	cry VOLTORB
	waitbutton
	closetext
	end

LugiaSpeechHouseRadio:
	jumpstd radio2

UnknownText_0x9933d:
	text "Nicknames you give"
	line "your #MON form"
	
	para "an even stronger"
	line "bond with them."
	
	para "So much so, that"
	line "a traded #MON's"
	
	para "nickname cannot"
	line "be changed."
	
	para "I gave my VOLTORB"
	line "a nickname!"
	done

UnknownText_0x993ec:
	text "SHOCKY: GZZZZRT!"
	done

EcruteakLugiaSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 7, ECRUTEAK_CITY
	warp_def 7, 3, 7, ECRUTEAK_CITY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 1, 2, SIGNPOST_READ, LugiaSpeechHouseRadio

.ObjectEvents: db 2
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x99334, -1
	person_event SPRITE_VOLTORB, 3, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x99337, -1
