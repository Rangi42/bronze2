const_value set 2
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_GRANNY
	const SPROUTTOWER1F_TEACHER
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_POKE_BALL

SproutTower1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SageScript_0x1844fe:
	jumptextfaceplayer UnknownText_0x1845d8

SageScript_0x184501:
	jumptextfaceplayer UnknownText_0x18460a

GrannyScript_0x184504:
	jumptextfaceplayer UnknownText_0x184649

TeacherScript_0x184507:
	jumptextfaceplayer UnknownText_0x18469d

TrainerSageChow:
	trainer EVENT_BEAT_SAGE_CHOW, BLACKBELT_T, KYO, SageChowSeenText, SageChowBeatenText, 0, SageChowScript

SageChowScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184583
	waitbutton
	closetext
	end

SproutTower1FParlyzHeal:
	itemball PARLYZ_HEAL

MapSproutTower1FSignpost1Script:
	jumptext UnknownText_0x1846d6

SageChowSeenText:
	text "Greetings. Have"
	line "you been served?"
	
	para "Oh, you're not"
	line "here to eat?"
	
	para "Is it something"
	line "else you seek?"
	done

SageChowBeatenText:
	text "Sliced."
	done

UnknownText_0x184583:
	text "You may have heard"
	line "the head chef and"
	
	para "his #MON, are"
	line "very skilled in"
	cont "the CUT technique."
	done

UnknownText_0x1845d8:
	text "How nice of him"
	line "to take me out on"
	cont "a lovely dinner."
	
	para "The greatest, best"
	line "friend I could"
	cont "ever ask for!"
	
	para "He's like a brother"
	line "to me!"
	done

UnknownText_0x18460a:
	text "Shhh!"
	line "I'm on a secret"
	cont "date!"
	
	para "Don't mess this up"
	line "for me!"
	done

UnknownText_0x184649:
	text "This vindaloo"
	line "curry really hits"
	cont "the spot!"
	done

UnknownText_0x18469d:
	text "…Chew…chew…"
	line "I can't get enough"
	
	para "of the steak"
	line "tartare!"
	
	para "Oh excuse me,"
	line "where are my mann-"
	cont "ers?"
	
	para "Talking with my"
	line "mouth full, shame"
	cont "on me!"
	done

UnknownText_0x1846d6:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 15, 8, 5, MAHOGANY_TOWN
	warp_def 15, 9, 5, MAHOGANY_TOWN
	warp_def 15, 19, 2, SPROUT_TOWER_2F
	warp_def 16, 22, 2, SPROUT_TOWER_2F
	warp_def 4, 1, 3, SPROUT_TOWER_2F

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 0, SIGNPOST_READ, MapSproutTower1FSignpost1Script
	signpost 15, 12, SIGNPOST_READ, MapSproutTower1FSignpost1Script

.ObjectEvents: db 6
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SageScript_0x1844fe, -1
	person_event SPRITE_COOLTRAINER_M, 6, 10, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SageScript_0x184501, -1
	person_event SPRITE_GRANNY, 11, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x184504, -1
	person_event SPRITE_TEACHER, 12, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x184507, -1
	person_event SPRITE_BLACK_BELT, 12, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSageChow, -1
	person_event SPRITE_POKE_BALL, 5, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower1FParlyzHeal, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
