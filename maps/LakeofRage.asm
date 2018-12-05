; FIX TILE ON LEFT OF MOUNTAIN

const_value set 2
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeofRage_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	dbw MAPCALLBACK_OBJECTS, .Wesley

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley:
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return

LanceScript_0x70022:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue UnknownScript_0x70057
	opentext
	writetext UnknownText_0x70157
	buttonsound
	faceplayer
	writetext UnknownText_0x701b4
	yesorno
	iffalse UnknownScript_0x7004e
UnknownScript_0x70035:
	writetext UnknownText_0x702c6
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, MovementData_0x70155
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	domaptrigger MAHOGANY_MART_1F, $1
	end

UnknownScript_0x7004e:
	writetext UnknownText_0x70371
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

UnknownScript_0x70057:
	faceplayer
	opentext
	writetext UnknownText_0x703a5
	yesorno
	iffalse UnknownScript_0x7004e
	jump UnknownScript_0x70035

GyaradosScript_0x70063:
	opentext
	writetext UnknownText_0x703cb
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	if_equal $1, UnknownScript_0x7007a
	disappear LAKEOFRAGE_GYARADOS
UnknownScript_0x7007a:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	dotrigger $0
	appear LAKEOFRAGE_LANCE
	end

GrampsScript_0x7008e:
	faceplayer
	opentext
;	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
;	iftrue UnknownScript_0x7009c
	writetext LakeofRageOldMan1Text
	waitbutton
	closetext
	end

UnknownScript_0x7009c:
	writetext UnknownText_0x70421
	waitbutton
	closetext
	end

SuperNerdScript_0x700a2:
	jumptextfaceplayer UnknownText_0x70444

CooltrainerFScript_0x700a5:
	jumptextfaceplayer UnknownText_0x704bb

MapLakeofRageSignpost0Script:
	jumptext UnknownText_0x708d7

MapLakeofRageSignpost1Script:
	opentext
	writetext UnknownText_0x70903
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x700b8
	waitbutton
	closetext
	end

UnknownScript_0x700b8:
	buttonsound
	special Special_MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer EVENT_BEAT_FISHER_ANDRE, FISHER, ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, FisherAndreScript

FisherAndreScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7058f
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer EVENT_BEAT_FISHER_RAYMOND, FISHER, RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, FisherRaymondScript

FisherRaymondScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x70611
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer EVENT_BEAT_COOLTRAINERM_AARON, COOLTRAINERM, AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, CooltrainermAaronScript

CooltrainermAaronScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7069c
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer EVENT_BEAT_COOLTRAINERF_LOIS, COOLTRAINERF, LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, CooltrainerfLoisScript

CooltrainerfLoisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x70752
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeofRageElixer:
	itemball ELIXER

LakeofRageTMDetect:
	itemball TM_DETECT

LakeofRageHiddenFullRestore:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE, FULL_RESTORE


LakeofRageHiddenRareCandy:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY, RARE_CANDY


LakeofRageHiddenMaxPotion:
	dwb EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION, MAX_POTION

LakeGiveSurfGuy:
	faceplayer
	opentext
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue .AlreadyGotSurf
	writetext LakeGiveSurfGuyText1
	buttonsound
	verbosegiveitem HM_SURF
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	writetext LakeGiveSurfGuyText2
	waitbutton
	closetext
	end
	
.AlreadyGotSurf
	writetext LakeHappySurfingText
	waitbutton
	closetext
	end
	
MovementData_0x70155:
	teleport_from
	step_end

LakeGiveSurfGuyText1:
	text "Well done."
	
	para "you made it to the"
	line "top of the moun-"
	cont "tain!"
	
	para "I love to reward"
	line "strong trainers"
	
	para "like you with a"
	line "special HM move."
	
	para "Here you go!"
	done
	
LakeGiveSurfGuyText2:
	text "HM03 is SURF!"
	
	para "Teach it to a"
	line "water type #-"
	
	para "MON and you can"
	line "ride over the sea"
	cont "with ease."
	
	para "But only if you"
	line "have FIGBRANCH"
	cont "TOWN'S GYM BADGE."
	done
	
LakeHappySurfingText:
	text "Enjoy! Happy"
	line "surfing, trainer!"
	done
	
UnknownText_0x70157:
	text "This lake is full"
	line "of GYARADOS but"
	cont "nothing else…"

	para "So the MAGIKARP"
	line "are being forced"
	cont "to evolve…"
	done

UnknownText_0x701b4:
	text "Did you come here"
	line "because of the"
	cont "rumors?"

	para "You're <PLAYER>?"
	line "I'm LANCE, a"
	cont "trainer like you."

	para "I heard some ru-"
	line "mors, so I came to"
	cont "investigate…"

	para "I saw the way you"
	line "battled earlier,"
	cont "<PLAY_G>."

	para "I can tell that"
	line "you're a trainer"

	para "with considerable"
	line "skill."

	para "If you don't mind,"
	line "could you help me"
	cont "investigate?"
	done

UnknownText_0x702c6:
	text "LANCE: Excellent!"

	para "It seems that the"
	line "LAKE's MAGIKARP"

	para "are being forced"
	line "to evolve."

	para "A mysterious radio"
	line "broadcast coming"

	para "from MAHOGANY is"
	line "the cause."

	para "I'll be waiting"
	line "for you, <PLAY_G>."
	done

UnknownText_0x70371:
	text "Oh… Well, if you"
	line "change your mind,"
	cont "please help me."
	done

UnknownText_0x703a5:
	text "LANCE: Hm? Are you"
	line "going to help me?"
	done

UnknownText_0x703cb:
	text "GYARADOS: Gyashaa!"
	done

UnknownText_0x703df:
	text "<PLAYER> obtained a"
	line "RED SCALE."
	done

LakeofRageOldMan1Text:
	text "People say that"
	line "those who succ-"
	cont "essfully climb the"
	
	para "mountain and reach"
	line "the spring at the"
	
	para "top get a special"
	line "HM move!"
	done

UnknownText_0x70421:
	text "Hahah! The MAGI-"
	line "KARP are biting!"
	done

UnknownText_0x70444:
	text "I didn't realise"
	line "what I was in for"
	
	para "until I took my"
	line "first steps."
	cont "Got to keep going!"
	done

UnknownText_0x704bb:
	text "I tried to climb"
	line "the mountain but"
	
	para "heaps of trainers"
	line "wanted to fight."
	
	para "I guess I'll just"
	line "admire it from"
	cont "down here."
	done

FisherAndreSeenText:
	text "Cast your ROD,"
	line "the water's clear!"
	done

FisherAndreBeatenText:
	text "I think I caught"
	line "a boot."
	done

UnknownText_0x7058f:
	text "I thought I could"
	line "catch some fish in"
	cont "this spring."
	cont "Is that allowed?"
	done

FisherRaymondSeenText:
	text "No matter what I"
	line "do, all I catch"

	para "are the same #-"
	line "MON…"
	done

FisherRaymondBeatenText:
	text "My line's all"
	line "tangled up…"
	done

UnknownText_0x70611:
	text "Why can't I catch"
	line "any good #MON?"
	done

CooltrainermAaronSeenText:
	text "You know the"
	line "rules."
	
	para "If our eyes meet,"
	line "we have to battle!"
	done

CooltrainermAaronBeatenText:
	text "Woah, that's a"
	line "major mistake."
	done

UnknownText_0x7069c:
	text "I guess you're"
	line "gonna beat me"
	cont "to the top."
	
	para "I'll catch ya"
	line "later."
	done

CooltrainerfLoisSeenText:
	text "If you could be"
	line "any #MON what"
	cont "would you be?"
	done

CooltrainerfLoisBeatenText:
	text "Ah, so that's it."
	done

UnknownText_0x70752:
	text "Well of course"
	line "you'd want to"
	
	para "be a strong #-"
	line "MON."
	
	para "If I could shoot"
	line "water from my"
	
	para "mouth, I could do"
	line "a lot of party"
	cont "tricks!"
	done

MeetWesleyText:
	text "WESLEY: Well, how"
	line "do you do?"

	para "Seeing as how it's"
	line "Wednesday today,"

	para "I'm WESLEY of"
	line "Wednesday."
	done

WesleyGivesGiftText:
	text "Pleased to meet"
	line "you. Please take a"
	cont "souvenir."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "beefs up the power"
	cont "of fighting moves."
	done

WesleyWednesdayText:
	text "WESLEY: Since you"
	line "found me, you must"

	para "have met my broth-"
	line "ers and sisters."

	para "Or did you just"
	line "get lucky?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

UnknownText_0x708d7:
	text "MT. REDSTONE"
	
	para "A Wonder of"
	line "Nature"
	done

UnknownText_0x70903:
	text "FISHING GURU'S"
	line "HOUSE"
	done

LakeofRage_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 35, 28, 1, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	warp_def 35, 27, 1, LAKE_OF_RAGE_MAGIKARP_HOUSE
	warp_def 15, 4, 2, MOUNT_MORTAR_2F_INSIDE
	warp_def 11, 34, 1, MOUNT_MORTAR_2F_INSIDE
	warp_def 1, 27, 1, SURFHOUSE
	warp_def 25, 2, 2, MOUNTAINCAVEGATE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 27, 1, SIGNPOST_READ, MapLakeofRageSignpost0Script
	signpost 41, 19, SIGNPOST_READ, MapLakeofRageSignpost1Script
	signpost 0, 5, SIGNPOST_ITEM, LakeofRageHiddenFullRestore
	signpost 12, 10, SIGNPOST_ITEM, LakeofRageHiddenRareCandy
	signpost 16, 38, SIGNPOST_ITEM, LakeofRageHiddenMaxPotion

.ObjectEvents: db 13
	person_event SPRITE_LANCE, 39, 48, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LanceScript_0x70022, EVENT_LAKE_OF_RAGE_LANCE
	person_event SPRITE_GRAMPS, 29, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x7008e, -1
	person_event SPRITE_SUPER_NERD, 24, 36, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x700a2, -1
	person_event SPRITE_COOLTRAINER_F, 32, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x700a5, -1
	person_event SPRITE_FISHER, 5, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherAndre, -1
	person_event SPRITE_FISHER, 43, 49, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_COOLTRAINER_M, 15, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainermAaron, -1
	person_event SPRITE_COOLTRAINER_F, 19, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfLois, -1
	person_event SPRITE_GYARADOS, 38, 48, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GyaradosScript_0x70063, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	person_event SPRITE_SUPER_NERD, 39, 49, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	person_event SPRITE_POKE_BALL, 4, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LakeofRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	person_event SPRITE_POKE_BALL, 0, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LakeofRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
	person_event SPRITE_FISHER, 3, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeGiveSurfGuy, -1
