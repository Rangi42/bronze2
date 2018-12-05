const_value set 2
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacLarry:
	trainer EVENT_BEAT_POKEMANIAC_LARRY, POKEMANIAC, LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, PokemaniacLarryScript

PokemaniacLarryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59d31
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer EVENT_BEAT_HIKER_RUSSELL, HIKER, RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, HikerRussellScript

HikerRussellScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59c6c
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer EVENT_BEAT_HIKER_DANIEL, HIKER, DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, HikerDanielScript

HikerDanielScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59dc9
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer EVENT_BEAT_FIREBREATHER_BILL, FIREBREATHER, BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, FirebreatherBillScript

FirebreatherBillScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59e6f
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer EVENT_BEAT_FIREBREATHER_RAY, FIREBREATHER, RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, FirebreatherRayScript

FirebreatherRayScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59efc
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnknownScript_0x59c08:
	jumptext UnknownText_0x59f29

HikerRussellSeenText:
	text "Great!"
	line "Another challenge!"
	cont "Heheheh!"
	done

HikerRussellBeatenText:
	text "Heh… heh?"
	done

UnknownText_0x59c6c:
	text "I expected that."
	line "I can't even beat"

	para "my children in a"
	line "battle."
	done

PokemaniacLarrySeenText:
	text "The more #MON"
	line "I collect, the"
	
	para "more friends I"
	line "have!"
	done

PokemaniacLarryBeatenText:
	text "Aw, darn!"
	done

UnknownText_0x59d31:
	text "I must continue"
	line "looking for new"
	cont "friends!"
	done

HikerDanielSeenText:
	text "Holy moly!"
	
	para "Sorry, I was"
	line "looking for"
	cont "DIGLETT."
	done

HikerDanielBeatenText:
	text "I just want to"
	line "dig myself a hole."
	done

UnknownText_0x59dc9:
	text "I wonder what"
	line "DIGLETT's feet"
	cont "look like."
	done

FirebreatherBillSeenText:
	text "Woah, I almost"
	line "burnt you to a"
	cont "crisp!"
	done

FirebreatherBillBeatenText:
	text "Ouch, I'm singed."
	done

UnknownText_0x59e6f:
	text "If I had a job"
	line "I wouldn't mind"	
	cont "getting fired!"
	done

FirebreatherRaySeenText:
	text "If it's light, a"
	line "cave isn't scary."

	para "If you're strong,"
	line "#MON aren't"
	cont "scary."
	done

FirebreatherRayBeatenText:
	text "FLASH!"
	done

UnknownText_0x59efc:
	text "It's my #MON's"
	line "fire that lights"
	cont "up this cave."
	done

UnknownText_0x59f29:
	text "UNION CAVE"
	done

UnionCave1F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 23, 3, 4, UNION_CAVE_B1F
	warp_def 23, 13, 5, UNION_CAVE_B1F
	warp_def 33, 7, 4, ROUTE_30
	warp_def 3, 7, 3, ROUTE_30

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 9
	person_event SPRITE_POKEFAN_M, 25, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	person_event SPRITE_SUPER_NERD, 15, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPokemaniacLarry, -1
	person_event SPRITE_POKEFAN_M, 7, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerHikerRussell, -1
	person_event SPRITE_FISHER, 0, 0, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	person_event SPRITE_FISHER, 19, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	person_event SPRITE_POKE_BALL, 11, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	person_event SPRITE_POKE_BALL, 2, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	person_event SPRITE_POKE_BALL, 11, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	person_event SPRITE_POKE_BALL, 18, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
