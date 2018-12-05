const_value set 2
	const ONE

Ecruteak_Bonus_House_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

EcruBonusHouse1:
	jumptextfaceplayer EcruBonusHouseText1
	
EcruBonusHouse2:
	jumptextfaceplayer EcruBonusHouseText2
	
EcruBonusHouse3:
	jumptextfaceplayer EcruBonusHouseText3
	
EcruBonusHousePok1:
	faceplayer
	opentext
	writetext EcruBonusHousePokText1
	cry MURKROW
	waitbutton
	closetext
	end
	
EcruBonusHousePok2:
	faceplayer
	opentext
	writetext EcruBonusHousePokText2
	cry TYRANITAR
	waitbutton
	closetext
	end
	
.Text:

EcruBonusHouseText1:
	text "Hello!"
	
	para "Welcome to our"
	line "#MON CLUB."
	
	para "Feel free to talk"
	line "with #MON"
	
	para "lovers as long"
	line "as you want!"
	done

EcruBonusHouseText2:
	text "My MURKROW loves"
	line "to sit next to me"
	cont "everywhere we go!"
	done
	
EcruBonusHouseText3:
	text "If I could be any"
	line "#MON, it would"
	cont "be a SNORLAX."
	
	para "I could rest all"
	line "day and get away"
	cont "with it."
	done

EcruBonusHousePokText1:
	text "MURKROW: MROOOH!"
	done
	
EcruBonusHousePokText2:
	text "TYRANITAR:"
	line "TARRRRUGH!"
	done
	
Ecruteak_Bonus_House_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 17, ECRUTEAK_CITY
	warp_def 7, 3, 17, ECRUTEAK_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_POKEFAN_M, 2, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruBonusHouse1, -1
	person_event SPRITE_TEACHER, 4, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EcruBonusHouse2, -1
	person_event SPRITE_FISHER, 4, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EcruBonusHouse3, -1
	person_event SPRITE_BIRD, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EcruBonusHousePok1, -1
	person_event SPRITE_MONSTER, 3, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EcruBonusHousePok2, -1
