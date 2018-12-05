const_value set 2
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_POKEFAN_M3
	const GOLDENRODGAMECORNER_DRINKER

GoldenrodGameCorner_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .move_tutor_outside
	if_equal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNER_POKEFAN_M3
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNER_POKEFAN_M3
.finish
	return

GoldenrodGameCornerPokefanM3Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM3Text
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M3, RIGHT
	end

GoldenrodGmeCornerCoinVendorScript:
	jumpstd gamecornercoinvendor

GoldenrodGmeCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGmeCornerTMVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenudata GoldenrodGameCornerTMVendorMenuData
	verticalmenu
	closewindow
	if_equal $1, .Thunder
	if_equal $2, .Blizzard
	if_equal $3, .FireBlast
	jump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_THUNDER, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

.Blizzard:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_BLIZZARD, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

.FireBlast:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_FIRE_BLAST, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGmeCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump GoldenrodGmeCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end


GoldenrodGameCornerTMVendorMenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"


GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special Special_DisplayCoinCaseBalance
	loadmenudata .MenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, .abra
	if_equal $2, .cubone
	if_equal $3, .wobbuffet
	jump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special Special_GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special Special_GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.wobbuffet
	checkcoins 1500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem WOBBUFFET, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte WOBBUFFET
	special Special_GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins 1500
	jump .loop


.MenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "WOBBUFFET  1500@"
	db "CANCEL@"


GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldRocketDrinkHint:
	faceplayer
	opentext
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .PickedUpKey
	writetext GoldRocketDrinkHintText
	waitbutton
	closetext
	end
	
.PickedUpKey
	writetext GoldRocketKeyFoundText
	waitbutton
	closetext
	end

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerLeftTheirDrinkScript:
	opentext
	writetext GoldenrodGameCornerLeftTheirDrinkText
	waitbutton
	closetext
	special Special_FadeOutMusic
	showemote EMOTE_SHOCK, PLAYER, 20
	playsound SFX_WARP_TO
	applymovement PLAYER, GoldPlayerStartsToFall
;	playsound SFX_KINESIS
	special FadeOutPalettes
	warp RADIO_TOWER_2F, 45, 19
	end

GoldenrodGameCornerSlotsMachineScript:
	random 6
	if_equal 0, GoldenrodGameCornerLuckySlotsMachineScript
	refreshscreen $0
	writebyte FALSE
	special Special_SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	refreshscreen $0
	writebyte TRUE
	special Special_SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	refreshscreen $0
	special Special_CardFlip
	closetext
	end

GoldDrinkingGuy:
	faceplayer
	opentext
	writetext GoldDrinkingGuyText
	waitbutton
	closetext 
	spriteface GOLDENRODGAMECORNER_DRINKER, LEFT
	end

GoldenrodGameCornerLeftTheirDrink2Script:
	jumptext GoldenrodGameCornerLeftTheirDrink2Text
	
GoldPlayerStartsToFall:
;	skyfall_top
;	teleport_from
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left	
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
	
GoldRocketKeyFoundText:
	text "Oh no…"
	
	para "This kid found"
	line "the key!"
	done
	
GoldDrinkingGuyText:
	text "Somebody left"
	line "their drink here."
	
	para "It tastes abso-"
	line "lutely awful!"
	done
	
GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_from_ram StringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText:
	text "Hey man, you're"
	line "messing up my"
	cont "flow!"
	done

GoldenrodGameCornerPokefanM1Text:
	text "I'm saving up my"
	line "coins so I can"
	
	para "exchange them for"
	line "a #MON move as"
	cont "a prize!"
	done

GoldenrodGameCornerCooltrainerMText:
	text "The card flip is"
	line "my game!"
	
	para "You'd think I"
	line "invented it, I'm"
	cont "that good!"
	done

GoldenrodGameCornerPokefanFText:
	text "I'm gonna flip"
	line "'till I quit!"
	done

GoldRocketDrinkHintText:
	text "I am so thirsty."
	
	para "I should pick up a"
	line "drink!"
	done

GoldenrodGameCornerGentlemanText:
	text "This is my lucky"
	line "slot machine."
	
	para "I always play on"
	line "it!"
	done

GoldenrodGameCornerPokefanM2Text:
	text "Once a week I come"
	line "and place ten"
	
	para "coins in the slot"
	line "machine."
	
	para "I've not been"
	line "lucky yet, but"
	
	para "one day I'm sure"
	line "it'll pay off."
	done

GoldenrodGameCornerPokefanM3Text:
	text "Everything in life"
	line "is a gamble."
	
	para "So let's get a nice"
	line "payout for once!"
	done
	done

GoldenrodGameCornerLeftTheirDrinkText:
	text "Somebody left"
	line "their drink here."
	
	para "<PLAYER> tries to"
	line "pick it up."
	done

GoldenrodGameCornerLeftTheirDrink2Text:
	text "Just some empty"
	line "glasses."
	done
	
GoldenrodGameCorner_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 13, 2, 10, GOLDENROD_CITY
	warp_def 13, 3, 10, GOLDENROD_CITY
	warp_def 1, 13, 1, RADIO_TOWER_2F

.CoordEvents: db 0

.BGEvents: db 32
	signpost 6, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 8, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 6, SIGNPOST_RIGHT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 7, SIGNPOST_READ, GoldenrodGameCornerLuckySlotsMachineScript
	signpost 8, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 7, SIGNPOST_LEFT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 8, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 12, SIGNPOST_RIGHT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 7, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 8, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 9, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 10, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 11, 13, SIGNPOST_LEFT, GoldenrodGameCornerCardFlipMachineScript
	signpost 6, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 7, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 8, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 9, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 10, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 11, 18, SIGNPOST_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	signpost 1, 12, SIGNPOST_LEFT, GoldenrodGameCornerLeftTheirDrinkScript
	signpost 1, 11, SIGNPOST_RIGHT, GoldenrodGameCornerLeftTheirDrink2Script

.ObjectEvents: db 13
	person_event SPRITE_CLERK, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGmeCornerCoinVendorScript, -1
	person_event SPRITE_RECEPTIONIST, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGmeCornerTMVendorScript, -1
	person_event SPRITE_RECEPTIONIST, 2, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	person_event SPRITE_PHARMACIST, 9, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << DAY), (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	person_event SPRITE_PHARMACIST, 9, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << NITE), (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	person_event SPRITE_POKEFAN_F, 10, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	person_event SPRITE_COOLTRAINER_F, 8, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	person_event SPRITE_POKEFAN_M, 6, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	person_event SPRITE_ROCKET, 3, 10, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldRocketDrinkHint, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_GENTLEMAN, 7, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	person_event SPRITE_POKEFAN_F, 9, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	person_event SPRITE_FISHER, 10, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM3Script, -1
	person_event SPRITE_FISHER, 1, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldDrinkingGuy, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
