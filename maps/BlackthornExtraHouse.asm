const_value set 2
	const BLACKTHORNEXTRAHOUSE_GUY
	const BLACKTHORNEXTRAHOUSE_GIRL
	const BLACKTHORNEXTRAHOUSE_BLOCKAGE

BlackthornExtraHouse_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

BlackthornExtraHouseGuy:
	faceplayer
	opentext
	checkevent EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	iftrue BlackFoundFlash
	checkevent EVENT_SWITCH_12
	iftrue BlackthornExtraHouseGuyAlreadyOpenScript
	writetext BlackthornExtraHouseGuyText
	buttonsound
	writetext BlackthornExtraHouseGuyMoveBoulderText
	waitbutton
	closetext
	disappear BLACKTHORNEXTRAHOUSE_BLOCKAGE
	playsound SFX_ENTER_DOOR
	setevent EVENT_SWITCH_12
	end

BlackFoundFlash:
	writetext BlackFoundFlashText
	waitbutton
	closetext
	end
	
BlackthornExtraHouseGuyAlreadyOpenScript:
	writetext BlackthornExtraHouseGuyText
	waitbutton
	closetext
	end
	
BlackthornExtraHouseBlockageScript:
	jumptext BlackthornExtraHouseBlockageText
	
BlackthornExtraHouseGirl:
	jumptextfaceplayer BlackthornExtraHouseGirlText

.Text:

BlackthornExtraHouseGuyMoveBoulderText:
	text "Here, let me open"
	line "this."
	done

BlackthornExtraHouseBlockageText:
	text "It's some kind"
	line "gate."
	done

BlackFoundFlashText:
	text "Wow, I'm"
	line "impressed!"
	
	para "You actaully found"
	line "it!"
	
	para "FLASH can help you"
	line "see in really dark"
	cont "areas."
	
	para "But you probably"
	line "already know that."
	done

BlackthornExtraHouseGuyText:
	text "Man, my basement"
	line "is such a mess."
	
	para "I lost my FLASH"
	line "HM down there"
	
	para "somewhere but"
	line "it's too dark"
	cont "to get it."
	
	para "If you find it,"
	line "you can have it."
	
	para "Heck, it might"
	line "even help you"
	cont "get back out!"
	
	para "But please don't"
	line "take anything"
	cont "else."
	done

BlackthornExtraHouseGirlText:
	text "I just wish my"
	line "husband would"
	
	para "clean something up"
	line "every now and"
	cont "then."
	done

BlackthornExtraHouse_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 3, 8, BLACKTHORN_CITY
	warp_def 7, 4, 8, BLACKTHORN_CITY
	warp_def 3, 9, 1, BLACKTHORNEXTRAHOUSEBASEMENT

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKEFAN_M, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BlackthornExtraHouseGuy, -1
	person_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackthornExtraHouseGirl, -1
	person_event SPRITE_VIRTUAL_BOY, 3, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BlackthornExtraHouseBlockageScript, EVENT_SWITCH_12
