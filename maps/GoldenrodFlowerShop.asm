const_value set 2
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FlowerShopTeacherScript:
;	checkevent EVENT_FOUGHT_SUDOWOODO
;	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
;	checkevent EVENT_MET_FLORIA
;	iffalse .HaventMetFloria
;	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
;	iffalse .Lalala
;	checkflag ENGINE_PLAINBADGE
;	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext UnknownText_0x554c2
	buttonsound
;	verbosegiveitem PP_UP, 2
	verbosegiveitem SCOPE_LENS
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
;	setevent EVENT_FLORIA_AT_SUDOWOODO
;	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	spriteface GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext UnknownText_0x5552e
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer UnknownText_0x5550d

.NoPlainBadge:
	jumptextfaceplayer UnknownText_0x55463

.HaventMetFloria:
	jumptextfaceplayer UnknownText_0x553d4

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext UnknownText_0x55561
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext UnknownText_0x555e6
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext UnknownText_0x55604
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

UnknownText_0x553d4:
	text "Have you seen that"
	line "wiggly tree that's"

	para "growing on ROUTE"
	line "36?"

	para "My little sister"
	line "got all excited"

	para "and went to see"
	line "it…"

	para "I'm worried… Isn't"
	line "it dangerous?"
	done

UnknownText_0x55463:
	text "Do you want to"
	line "borrow the water"

	para "bottle too?"
	line "I don't want you"

	para "doing anything"
	line "dangerous with it."
	done

UnknownText_0x554c2:
	text "Oh, dear."
	line "You've found me."

	para "I thought I could"
	line "hide out here."

	para "Please, if you"
	line "don't let anybody"
	
	para "know where I live"
	line "I'll give you"
	cont "this."
	done

UnknownText_0x5550d:
	text "Thank you for"
	line "keeping my secret."
	done

UnknownText_0x5552e:
	text "Lalala lalalala."
	line "Have plenty of"
	cont "water, my lovely!"
	done

UnknownText_0x55561:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she told me"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

UnknownText_0x555e6:
	text "Wow, you beat"
	line "WHITNEY? Cool!"
	done

UnknownText_0x55604:
	text "So it really was a"
	line "#MON!"
	done

;	person_event SPRITE_LASS, 6, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	
GoldenrodFlowerShop_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 6, GOLDENROD_CITY
	warp_def 7, 3, 6, GOLDENROD_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
