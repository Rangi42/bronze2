const_value set 2
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

OlivineLighthouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SailorScript_0x5ae67:
	jumptext UnknownText_0x5ae6d

PokefanFScript_0x5ae6a:
	jumptextfaceplayer UnknownText_0x5aec2

UnknownText_0x5ae6d:
	text "It appears this"
	line "guy is sleeping."
	
	para "I better not wake"
	line "him."
	done

UnknownText_0x5aec2:
	text "Upstairs you"
	line "will face a"
	
	para "tough initiation"
	line "challenge."
	
	para "If you are"
	line "successful, you"
	
	para "will gain the"
	line "the power to enter"
	
	para "the MAUVEWOOD TOWN"
	line "GYM."
	
	para "Good luck."
	
	para "…Man I'm thirsty."
	done

OlivineLighthouse1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 17, 6, 8, CIANWOOD_CITY
	warp_def 17, 7, 8, CIANWOOD_CITY
	warp_def 9, 3, 1, OLIVINE_LIGHTHOUSE_2F
	warp_def 13, 14, 3, OLIVINE_LIGHTHOUSE_2F
	warp_def 13, 15, 4, OLIVINE_LIGHTHOUSE_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SUPER_NERD, 8, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript_0x5ae67, -1
	person_event SPRITE_SUPER_NERD, 13, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x5ae6a, EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
