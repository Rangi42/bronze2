const_value set 2
	const CERULEANGYMBADGESPEECHHOUSE_POKEFAN_M

CeruleanGymBadgeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GiveShoppingItems:
	giveitem SUPER_POTION
	giveitem SUPER_REPEL
	giveitem FLOWER_MAIL
	giveitem LOVELY_MAIL
	end
	
PokefanMScript_0x188002:
	faceplayer
	opentext
	checkevent EVENT_SHOPPING_COMPLETE
	iftrue EndShoppingEvent
	checkevent EVENT_SHOPPING_STARTED
	iftrue ShoppingReminderScript
	writetext WomanAsksForShopping1
	waitbutton
	closetext
	setevent EVENT_SHOPPING_STARTED
	end
	
ShoppingReminderScript:
	checkitem SUPER_POTION
	iftrue ShopItemTree
	writetext WomanRemindsShopping
	waitbutton
	closetext
	end
	
WomanRemindsShopping2:
	opentext
	writetext WomanRemindsShopping
	waitbutton
	closetext
	end
	
ShopItemTree:
	checkitem SUPER_REPEL
	iffalse WomanRemindsShopping2
	checkitem LOVELY_MAIL
	iffalse WomanRemindsShopping2
	checkitem FLOWER_MAIL
	iffalse WomanRemindsShopping2
	jump ShoppingFinishedScript
	
ShoppingFinishedScript
	setevent EVENT_SHOPPING_COMPLETE
	takeitem LOVELY_MAIL
	takeitem FLOWER_MAIL
	takeitem SUPER_POTION
	takeitem SUPER_REPEL
	writetext ShoppingFinishedText
	buttonsound
	verbosegiveitem PASS
;	waitbutton
	writetext ShoppingFinishedText2
	waitbutton
	closetext
	end
	
EndShoppingEvent
	writetext UnknownText_0x188005
	waitbutton
	closetext
	end

ShoppingFinishedText:
	text "Oh, you have"
	line "all the items"
	cont "I need!"
	
	para "Thank you."
	
	para "As promised, here"
	line "is your rail PASS."
	done
	
ShoppingFinishedText2:
	text "Enjoy your train"
	line "rides!"
	done
	
WomanAsksForShopping1:
	text "I'm glad they"
	line "reopened the"
	cont "TRAIN STATION."
	
	para "Some of my fondest"
	line "memories are of"
	
	para "riding the train"
	line "as a child!"
	
	para "Oh, your PASS"
	line "expired?"
	
	para "Well that's no"
	line "good…"
	
	para "Say, I'm getting"
	line "a bit old in my"
	
	para "years and I need"
	line "some shopping"
	cont "done."
	
	para "If you could buy"
	line "some items for"
	
	para "me and bring them"
	line "back, I'd gladly"
	
	para "give you my spare"
	line "rail PASS."
	
	para "I need the"
	line "following items:"
	
	para "LOVELY MAIL,"
	line "FLOWER MAIL,"
	
	para "SUPER POTION and"
	line "SUPER REPEL."
	
	para "Get them all and"
	line "I'll give you my"
	cont "spare rail PASS."
	done
	
WomanRemindsShopping:
	text "I need the"
	line "following items:"
	
	para "LOVELY MAIL,"
	line "FLOWER MAIL,"
	
	para "SUPER POTION and"
	line "SUPER REPEL."
	
	para "Get them all and"
	line "I'll give you my"
	cont "spare rail PASS."
	done
	
UnknownText_0x188005:
	text "I'm glad they"
	line "reopened the"
	cont "TRAIN STATION."
	
	para "Some of my fondest"
	line "memories are of"
	
	para "riding the train"
	line "as a child!"
	done

CeruleanGymBadgeSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, CERULEAN_CITY
	warp_def 7, 3, 1, CERULEAN_CITY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 0, 0, SIGNPOST_READ, GiveShoppingItems

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x188002, -1
