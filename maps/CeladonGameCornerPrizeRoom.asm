const_value set 2
	const CELADONGAMECORNERPRIZEROOM_GENTLEMAN
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST

CeladonGameCornerPrizeRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeladonGameCornerPrizeRoomYoungster:
	jumptextfaceplayer CeladonGameCornerPrizeRoomYoungsterText
	
CeladonGameCornerPrizeRoomGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_CELADON_FAKE_LEADER_TALKED_TO
	iftrue GoBackToGymNo
	writetext CeladonGameCornerPrizeRoomGentlemanText
	waitbutton
	closetext
	end
	
GoBackToGymNo:
	writetext LeaderNotComingBackText
	waitbutton
	setevent EVENT_TALKED_TO_CELADON_LEADER
	closetext
	end
	
CeladonGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPharmacistText

CeladonGameCornerPrizeRoomPokefan:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPokefanText
	
GoldenrodGameCornerTMVendor:
;	faceplayer
;	opentext
;	writetext CeladonPrizeRoom_PrizeVendorIntroText
;	waitbutton
;	checkitem COIN_CASE
;	iffalse CeladonPrizeRoom_NoCoinCase
;	writetext CeladonPrizeRoom_AskWhichPrizeText
CeladonPrizeRoom_tmcounterloop:
;	special Special_DisplayCoinCaseBalance
;	loadmenudata CeladonPrizeRoom_TMMenuDataHeader
;	verticalmenu
;	closewindow
;	if_equal $1, .doubleteam
;	if_equal $2, .psychic
;	if_equal $3, .hyperbeam
;	jump CeladonPrizeRoom_cancel

.doubleteam
;	checkcoins 1500
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	itemtotext TM_DOUBLE_TEAM, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	giveitem TM_DOUBLE_TEAM
;	iffalse CeladonPrizeRoom_notenoughroom
;	takecoins 1500
;	jump CeladonPrizeRoom_purchased

.psychic
;	checkcoins 3500
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	itemtotext TM_PSYCHIC, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	giveitem TM_PSYCHIC
;	iffalse CeladonPrizeRoom_notenoughroom
;	takecoins 3500
;	jump CeladonPrizeRoom_purchased

.hyperbeam
;	checkcoins 7500
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	itemtotext TM_HYPER_BEAM, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	giveitem TM_HYPER_BEAM
;	iffalse CeladonPrizeRoom_notenoughroom
;	takecoins 7500
;	jump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	jump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_cancel:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end


CeladonPrizeRoom_TMMenuDataHeader:
;	db $40 ; flags
;	db 02, 00 ; start coords
;	db 11, 15 ; end coords
;	dw .MenuData2
;	db 1 ; default option

.MenuData2:
;	db $80 ; flags
;	db 4 ; items
;	db "TM32    1500@"
;	db "TM29    3500@"
;	db "TM15    7500@"
;	db "CANCEL@"


GoldenrodGameCornerPokemonVendor:
;	faceplayer
;	opentext
;	writetext CeladonPrizeRoom_PrizeVendorIntroText
;	waitbutton
;	checkitem COIN_CASE
;	iffalse CeladonPrizeRoom_NoCoinCase
.loop
;	writetext CeladonPrizeRoom_AskWhichPrizeText
;	special Special_DisplayCoinCaseBalance
;	loadmenudata .MenuDataHeader
;	verticalmenu
;	closewindow
;	if_equal $1, .pikachu
;	if_equal $2, .porygon
;	if_equal $3, .larvitar
;	jump CeladonPrizeRoom_cancel

.pikachu
;	checkcoins 2222
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	checkcode VAR_PARTYCOUNT
;	if_equal $6, CeladonPrizeRoom_notenoughroom
;	pokenamemem PIKACHU, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	waitsfx
;	playsound SFX_TRANSACTION
;	writetext CeladonPrizeRoom_HereYouGoText
;	waitbutton
;	writebyte PIKACHU
;	special Special_GameCornerPrizeMonCheckDex
;	givepoke PIKACHU, 25
;	takecoins 2222
;	jump .loop

.porygon
;	checkcoins 5555
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	checkcode VAR_PARTYCOUNT
;	if_equal $6, CeladonPrizeRoom_notenoughroom
;	pokenamemem PORYGON, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	waitsfx
;	playsound SFX_TRANSACTION
;	writetext CeladonPrizeRoom_HereYouGoText
;	waitbutton
;	writebyte PORYGON
;	special Special_GameCornerPrizeMonCheckDex
;	givepoke PORYGON, 15
;	takecoins 5555
;	jump .loop

.larvitar
;	checkcoins 8888
;	if_equal $2, CeladonPrizeRoom_notenoughcoins
;	checkcode VAR_PARTYCOUNT
;	if_equal $6, CeladonPrizeRoom_notenoughroom
;	pokenamemem LARVITAR, $0
;	scall CeladonPrizeRoom_askbuy
;	iffalse CeladonPrizeRoom_cancel
;	waitsfx
;	playsound SFX_TRANSACTION
;	writetext CeladonPrizeRoom_HereYouGoText
;	waitbutton
;	writebyte LARVITAR
;	special Special_GameCornerPrizeMonCheckDex
;	givepoke LARVITAR, 40
;	takecoins 8888
;	jump .loop


.MenuDataHeader:
;	db $40 ; flags
;	db 02, 00 ; start coords
;	db 11, 17 ; end coords
;	dw .MenuData2
;	db 1 ; default option

.MenuData2:
;	db $80 ; flags
;	db 4 ; items
;	db "PIKACHU    2222@"
;	db "PORYGON    5555@"
;	db "LARVITAR   8888@"
;	db "CANCEL@"


LeaderNotComingBackText:
	text "CALVIN: What's"
	line "that?"
	
	para "You need a BADGE?"
	
	para "Look kid, I'm not"
	line "feeling up for"
	cont "battling."
	
	para "It just isn't in"
	line "me to be a GYM"
	cont "LEADER."
	
	para "Just go back there"
	line "talk to someone"
	
	para "and let them know"
	line "I said you could"
	cont "have a BADGE."
	done
	
CeladonGameCornerPrizeRoomGentlemanText:
	text "CALVIN: I some-"
	line "times feel too"
	
	para "nervous to"
	line "function."
	
	para "I just can't bring"
	line "myself to go to"
	cont "work today."
	done

CeladonGameCornerPrizeRoomPharmacistText:
	text "I'm tending to my"
	line "flowers!"
	
	para "I hope this is"
	line "enough sunlight"
	cont "for them."
	done

CeladonGameCornerPrizeRoomYoungsterText:
	text "My sister is such"
	line "a botanist!"
	
	para "That's the right"
	line "word, right?"
	cont "Botanist?"
	done
	
CeladonPrizeRoom_PrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text "OK, so you wanted"
	line "a @"
	text_from_ram StringBuffer3
	text "?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "Here you go!"
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "You have no room"
	line "for it."
	done

CeladonPrizeRoom_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

CeladonGameCornerPrizeRoomPokefanText:
	text "Oh… I'm worried"
	line "about my son…"
	
	para "He started his own"
	line "#MON adventure"
	
	para "not too long"
	line "ago…"
	
	para "But, every boy"
	line "needs to grow up"
	cont "eventually."
	done
	
CeladonGameCornerPrizeRoom_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 7, 2, 7, CELADON_CITY
	warp_def 7, 3, 7, CELADON_CITY
	warp_def 19, 2, 6, CELADON_CITY
	warp_def 19, 3, 6, CELADON_CITY
	warp_def 7, 14, 4, CELADON_CITY
	warp_def 7, 15, 4, CELADON_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost -2, 2, SIGNPOST_READ, GoldenrodGameCornerTMVendor
	signpost -2, 4, SIGNPOST_READ, GoldenrodGameCornerPokemonVendor

.ObjectEvents: db 4
	person_event SPRITE_ERIKA, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomGentlemanScript, EVENT_LEADER_IN_HOUSE_OFF
	person_event SPRITE_LASS, 14, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPharmacistScript, -1
	person_event SPRITE_YOUNGSTER, 15, 2, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomYoungster, -1
	person_event SPRITE_POKEFAN_F, 1, 16, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 3, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPokefan, -1
