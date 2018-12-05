const_value set 2
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_LASS

OlivinePunishmentSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OlivinePunishmentSpeechHouseDad:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue OlivineAlreadyGotItem
	checkevent EVENT_SECURITY_CAMERA_2
	iffalse OlivinePunishmentSonFound
	checkevent EVENT_NATIONAL_PARK_TM_DIG
	iftrue OlivinePunishmentTellWomanSawSon
	writetext OlivinePunishmentSpeechHouseDadText
	waitbutton
	closetext
	end
	
OlivinePunishmentTellWomanSawSon:
	writetext OlivinePunishmentMotherSawSonText
	waitbutton
	closetext
	end
	
OlivinePunishmentSonFound:
	writetext OlivinePunishmentSonFoundText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse OlivineBagFull
	setevent EVENT_GOT_QUICK_CLAW
	writetext OlivinePunishmentItemGotText
	waitbutton
	closetext
	end
	
OlivineAlreadyGotItem:
	writetext OlivinePunishmentItemGotText
	waitbutton
	closetext
	end

OlivineBagFull:
	writetext OlivinePunishmentBagFullText
	waitbutton
	closetext
	end
	
OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

OlivinePunishmentSpeechHouseDadText:
	text "Waaaaaah!"
	line "…Snivel, hic…"
	
	para "Where is my son?"
	line "…Snivel, hic…"
	done
	
OlivinePunishmentMotherSawSonText:
	text "Waaaaaah!"
	line "…Snivel, hic…"
	
	para "What's that? You"
	line "saw my son?"
	
	para "Oh thank goodness"
	line "he's okay."
	
	para "He… he's not com-"
	line "ing home?"
	
	para "Please, you have"
	line "to find a way to"
	
	para "get him back to"
	line "me."
	
	para "Please help if"
	line "you can."

	para "…Snivel, hic…"	
	done

OlivinePunishmentSonFoundText:
	text "Thank you so much"
	line "for bringing my"
	cont "son back home."
	
	para "Please take this!"
	done
	
OlivinePunishmentSpeechHouseDaughterText:
	text "MOM is really"
	line "upset with me."
	
	para "I was grounded,"
	line "but I understand…"
	
	para "I had no idea how"
	line "bad those people"
	cont "really were."
	done

OlivinePunishmentItemGotText:
	text "A LUCKY EGG can"
	line "help your #MON"
	
	para "gain more EXP in"
	line "battle."
	done

OlivinePunishmentBagFullText:
	text "Oh I'm sorry but"
	line "your bag is too"
	
	para "full to carry this"
	line "item."
	done
	
OlivinePunishmentSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 5, OLIVINE_CITY
	warp_def 7, 3, 5, OLIVINE_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, OlivinePunishmentSpeechHouseBookshelf1
	signpost 1, 1, SIGNPOST_READ, OlivinePunishmentSpeechHouseBookshelf2

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDad, -1
	person_event SPRITE_YOUNGSTER, 5, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, EVENT_SECURITY_CAMERA_2
