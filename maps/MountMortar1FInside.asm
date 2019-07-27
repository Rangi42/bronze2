const_value set 2
	const MOUNTMORTAR1FINSIDE_BOULDER
	const MOUNTMORTAR1FINSIDE_POKE_BALL1
	const MOUNTMORTAR1FINSIDE_POKE_BALL2
	const MOUNTMORTAR1FINSIDE_POKE_BALL3
	const MOUNTMORTAR1FINSIDE_POKE_BALL4
	const MOUNTMORTAR1FINSIDE_POKE_BALL5
	const MOUNTMORTAR1FINSIDE_SUPER_NERD1
	const MOUNTMORTAR1FINSIDE_SUPER_NERD2
	const MOUNTMORTAR1FINSIDE_POKE_BALL6
	const MOUNTMORTAR1FINSIDE_POKE_BALL7

MountMortar1FInside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacMiller:
	trainer EVENT_BEAT_POKEMANIAC_MILLER, POKEMANIAC, MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, 0, PokemaniacMillerScript

PokemaniacMillerScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7debd
	waitbutton
	closetext
	end

TrainerSupernerdMarkus:
	trainer EVENT_BEAT_SUPER_NERD_MARKUS, SUPER_NERD, MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, SupernerdMarkusScript

SupernerdMarkusScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7df97
	waitbutton
	closetext
	end

MountMortar1FBoulder:
	jumpstd strengthboulder

MountMortar1FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar1FInsideMaxRevive:
	itemball MAX_REVIVE

MountMortar1FInsideHyperPotion:
	itemball HYPER_POTION

MountMortar1FInsideMaxPotion:
	itemball MAX_POTION

MountMortar1FInsideNugget:
	itemball NUGGET

MountMortar1FInsideIron:
	itemball IRON

MountMortar1FInsideUltraBall:
	itemball ULTRA_BALL

MountMortar1FInsideHiddenMaxRepel:
	dwb EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL, MAX_REPEL


PokemaniacMillerSeenText:
	text "This place is like"
	line "a maze!"
	
	para "I should have"
	line "brought an ESCAPE"
	cont "ROPE."
	done

PokemaniacMillerBeatenText:
	text "Now I'm lost, and"
	line "I lost."
	
	para "I'm in double"
	line "trouble."
	done

UnknownText_0x7debd:
	text "I should catch a"
	line "RATTATA to cut"
	cont "down my enemies."
	done

SupernerdMarkusSeenText:
	text "Man is it hard to"
	line "see in here."
	cont "Is someone there?"
	done

SupernerdMarkusBeatenText:
	text "Huh? Did I just"
	line "get in a fight?"
	done

UnknownText_0x7df97:
	text "Oh, there you are!"
	line "I thought it was"
	
	para "just a horde of"
	line "wild #MON."
	done

MountMortar1FInside_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 33, 11, 5, MOUNT_MORTAR_1F_OUTSIDE
	warp_def 47, 29, 6, MOUNT_MORTAR_1F_OUTSIDE
	warp_def 33, 25, 8, MOUNT_MORTAR_1F_OUTSIDE
	warp_def 29, 29, 9, MOUNT_MORTAR_1F_OUTSIDE
	warp_def 33, 37, 4, MOUNT_MORTAR_1F_OUTSIDE
	warp_def 17, 27, 7, MOUNT_MORTAR_1F_OUTSIDE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 39, 16, SIGNPOST_ITEM, MountMortar1FInsideHiddenMaxRepel

.ObjectEvents: db 10
	person_event SPRITE_BOULDER, 43, 21, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MountMortar1FBoulder, -1
	person_event SPRITE_POKE_BALL, 38, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideEscapeRope, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	person_event SPRITE_POKE_BALL, 7, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideMaxRevive, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 0, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideHyperPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	person_event SPRITE_POKE_BALL, 20, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideMaxPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 29, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideNugget, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	person_event SPRITE_SUPER_NERD, 43, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerPokemaniacMiller, -1
	person_event SPRITE_SUPER_NERD, 8, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	person_event SPRITE_POKE_BALL, 22, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideIron, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	person_event SPRITE_POKE_BALL, 17, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FInsideUltraBall, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL
