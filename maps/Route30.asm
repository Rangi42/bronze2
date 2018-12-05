const_value set 2
	const ROUTE30_YOUNGSTER1
	const ROUTE30_YOUNGSTER2
	const ROUTE30_YOUNGSTER3
	const ROUTE30_BUG_CATCHER
	const ROUTE30_YOUNGSTER4
	const ROUTE30_MONSTER1
	const ROUTE30_MONSTER2
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FRUIT_TREE2
	const ROUTE30_COOLTRAINER_F
	const ROUTE30_POKE_BALL
	const ROUTE30_BOULDER1
	const ROUTE30_BOULDER2
	const ROUTE30_BOULDER3

Route30_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

YoungsterJoey_ImportantBattleScript:
;	waitsfx
;	playmusic MUSIC_JOHTO_TRAINER_BATTLE
;	opentext
;	writetext Text_UseTackle
;	pause 30
;	closetext
;	playsound SFX_TACKLE
;	applymovement ROUTE30_MONSTER2, Route30_JoeysRattataAttacksMovement
	faceplayer
	opentext
	writetext Text_ThisIsABigBattle
	waitbutton
	spriteface ROUTE30_YOUNGSTER1, UP
	closetext
;	playsound SFX_TACKLE
;	applymovement ROUTE30_MONSTER1, Route30_MikeysRattataAttacksMovement
;	special RestartMapMusic
	end

TrainerYoungsterJoey:
	trainer EVENT_BEAT_YOUNGSTER_JOEY, YOUNGSTER, JOEY1, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_YOUNGSTER_JOEY
	end_if_just_battled
	opentext
	checkflag ENGINE_JOEY
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	buttonsound
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext YOUNGSTER, JOEY1, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	copybytetovar wJoeyFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	loadvar wJoeyFightCount, 1
	clearflag ENGINE_JOEY
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	loadvar wJoeyFightCount, 2
	clearflag ENGINE_JOEY
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	loadvar wJoeyFightCount, 3
	clearflag ENGINE_JOEY
	end

.LoadFight3:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	reloadmapafterbattle
	loadvar wJoeyFightCount, 4
	clearflag ENGINE_JOEY
	end

.LoadFight4:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY
	checkevent EVENT_JOEY_HP_UP
	iftrue .GiveHPUp
	checkevent EVENT_GOT_HP_UP_FROM_JOEY
	iftrue .done
	scall .RematchGift
	verbosegiveitem HP_UP
	iffalse .PackFull
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jump .NumberAccepted

.done
	end

.GiveHPUp:
	opentext
	writetext YoungsterJoeyText_GiveHPUpAfterBattle
	waitbutton
	verbosegiveitem HP_UP
	iffalse .PackFull
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jump .NumberAccepted

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

.PackFull:
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm
	end

.RematchGift:
	jumpstd rematchgiftm
	end

TrainerYoungsterMikey:
	trainer EVENT_BEAT_YOUNGSTER_MIKEY, YOUNGSTER, MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherDon:
	trainer EVENT_BEAT_BUG_CATCHER_DON, BUG_CATCHER, DON, Bug_catcherDonSeenText, Bug_catcherDonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bug_catcherDonAfterText
	waitbutton
	closetext
	end

Route30YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CompletedEggQuest
	writetext Route30YoungsterText_DirectionsToMrPokemonsHouse
	waitbutton
	closetext
	end

.CompletedEggQuest:
	writetext Route30YoungsterText_EveryoneIsBattling
	waitbutton
	closetext
	end

Route30CooltrainerFScript:
	jumptextfaceplayer Route30CooltrainerFText

Route30Sign:
	jumptext Route30SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route30TrainerTips:
	jumptext Route30TrainerTipsText

Route30Antidote:
	itemball ANTIDOTE

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	dwb EVENT_ROUTE_30_HIDDEN_POTION, POTION

Route30Boulder:
	jumpstd strengthboulder
	
Route30MonsterTalk
	faceplayer
	opentext 
	writetext Route30MonsterTalkText
	cry BLASTOISE
	waitbutton
	closetext
	opentext
	writetext Route30MonsterTalkText2	
	waitbutton
	spriteface ROUTE30_MONSTER2, UP
	closetext
	end

FishingGuruScript_0x69b55:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue UnknownScript_0x69b7a
	writetext UnknownText_0x69b83
	yesorno
	iffalse UnknownScript_0x69b74
	writetext UnknownText_0x69be8
	buttonsound
	verbosegiveitem OLD_ROD
	writetext UnknownText_0x69c1b
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

UnknownScript_0x69b74:
	writetext UnknownText_0x69c6c
	waitbutton
	closetext
	end
	
UnknownScript_0x69b7a:
	writetext UnknownText_0x69c8d
	waitbutton
	closetext
	end
	
Route30_JoeysRattataAttacksMovement:
	fix_facing
	big_step_up
	big_step_down
	step_end

Route30_MikeysRattataAttacksMovement:
	fix_facing
	big_step_down
	big_step_up
	step_end

UnknownText_0x69b83:
	text "This is a nice"
	line "place to fish."
	
	para "But it's a little"
	line "boring alone."
	
	para "Would you like"
	line "one of my RODS?"
	done

UnknownText_0x69be8:
	text "Neat!"
	
	para "Now you're an"
	line "angler."
	done

UnknownText_0x69c1b:
	text "You can fish"
	line "wherever there is"
	cont "water."
	
	para "Try it out!"
	done

UnknownText_0x69c6c:
	text "Oh. I see."
	done

UnknownText_0x69c8d:
	text "Hey, kid."
	line "How are the #-"
	cont "MON biting?"
	done
	
Text_UseTackle:
	text "Go, RATTATA!"

	para "TACKLE!"
	done

Text_ThisIsABigBattle:
	text "Oh hey, kid."
	
	para "Sorry but these"
	line "huge rocks fell"
	cont "onto the path!"
	
	para "I'm trying to"
	line "move them with my"
	cont "#MON."
	
	para "It could take a"
	line "while."
	done

YoungsterJoey1SeenText:
	text "I just lost, so"
	line "I'm trying to find"
	cont "more #MON."

	para "Wait! You look"
	line "weak! Come on,"
	cont "let's battle!"
	done

YoungsterJoey1BeatenText:
	text "Ack! I lost again!"
	line "Doggone it!"
	done

YoungsterJoey1AfterText:
	text "Do I have to have"
	line "more #MON in"

	para "order to battle"
	line "better?"

	para "No! I'm sticking"
	line "with this one no"
	cont "matter what!"
	done

YoungsterMikeySeenText:
	text "Woah there!"
	line "I can tell you're"
	cont "new!"
	
	para "You should battle"
	line "me before you head"	
	cont "into this cave."
	
	para "It might be too"
	line "scary for ya!"
	done

YoungsterMikeyBeatenText:
	text "Boy was I wrong."
	done

YoungsterMikeyAfterText:
	text "I think you'll do"
	line "well with #MON,"
	cont "my friend!"
	
	para "This cave won't"
	line "be a problem."
	done

Bug_catcherDonSeenText:
	text "I bet you didn't"
	line "see me in this"
	cont "tall grass!"
	done

Bug_catcherDonBeatenText:
	text "Oh man, that was"
	line "bad!"
	done

Bug_catcherDonAfterText:
	text "I should try hid-"
	line "ing somewhere"
	cont "safer."
	
	para "Away from strong"
	line "trainers!"
	done

Route30YoungsterText_DirectionsToMrPokemonsHouse:
	text "MR.#MON's"
	line "house? It's a bit"
	cont "farther ahead."
	done

Route30YoungsterText_EveryoneIsBattling:
	text "Everyone's having"
	line "fun battling!"
	cont "You should too!"
	done

Route30CooltrainerFText:
	text "I'm not a trainer."

	para "But if you look"
	line "one in the eyes,"
	cont "prepare to battle."
	done

Route30SignText:
	text "ROUTE 2"

	para "WILLOWBRUSH TOWN -"
	line "SILVERLEAF TOWN"
	done

MrPokemonsHouseDirectionsSignText:
	text "MR.#MON'S HOUSE"
	line "STRAIGHT AHEAD!"
	done

MrPokemonsHouseSignText:
	text "Shortcut to"
	line "CHERRYGROVE CITY"
	done

Route30TrainerTipsText:
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "I lost again…"
	line "Gee, you're tough!"

	para "Oh yeah, I almost"
	line "forgot that I had"
	cont "to give you this."

	para "Use it to get even"
	line "tougher, OK?"

	para "I'm going to get"
	line "tougher too."
	done

Route30MonsterTalkText:
	text "BLASTOISE: BLAAST!"
	done
	
Route30MonsterTalkText2:	
	text "BLASTOISE is using"
	line "STRENGTH to move"
	cont "boulders."
	done
	
Route30_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 19, 7, 1, ROUTE_30_BERRY_SPEECH_HOUSE
	warp_def 25, 11, 1, MR_POKEMONS_HOUSE
	warp_def 9, 6, 4, UNION_CAVE_1F
	warp_def 39, 8, 3, UNION_CAVE_1F

.CoordEvents: db 0

.BGEvents: db 5
	signpost 45, 15, SIGNPOST_READ, Route30Sign
	signpost 24, 11, SIGNPOST_READ, MrPokemonsHouseDirectionsSign
	signpost 17, 19, SIGNPOST_READ, MrPokemonsHouseSign
	signpost 43, 11, SIGNPOST_READ, Route30TrainerTips
	signpost 5, 15, SIGNPOST_ITEM, Route30HiddenPotion

.ObjectEvents: db 15
	person_event SPRITE_FISHER, 49, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterJoey_ImportantBattleScript, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_YOUNGSTER, 19, 20, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterJoey, EVENT_ROUTE_30_YOUNGSTER_JOEY
	person_event SPRITE_YOUNGSTER, 40, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterMikey, -1
	person_event SPRITE_BUG_CATCHER, 7, 1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerBug_catcherDon, -1
	person_event SPRITE_YOUNGSTER, 53, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route30YoungsterScript, -1
	person_event SPRITE_MONSTER, 52, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_MONSTER, 48, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route30MonsterTalk, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_FRUIT_TREE, 40, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30FruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 5, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30FruitTree2, -1
	person_event SPRITE_COOLTRAINER_F, 53, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30CooltrainerFScript, -1
	person_event SPRITE_POKE_BALL, 33, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route30Antidote, EVENT_ROUTE_30_ANTIDOTE
	person_event SPRITE_BOULDER, 47, 19, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30Boulder, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_BOULDER, 46, 18, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30Boulder, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_BOULDER, 47, 18, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30Boulder, EVENT_ROUTE_30_BATTLE
	person_event SPRITE_FISHER, 41, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x69b55, -1
