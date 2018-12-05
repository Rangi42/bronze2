const_value set 2
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BUENA1
	const ROUTE38_SAILOR
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2
	const ROUTE38_BLOCKMAN
	const ROUTE38_BEAUTYTALK

Route38_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route38BeautyTalk
	jumptextfaceplayer Route38BeautyTalkText
	
TrainerBird_keeperToby:
	trainer EVENT_BEAT_BIRD_KEEPER_TOBY, BIRD_KEEPER, TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText, 0, .script

.script
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a1f86
	waitbutton
	closetext
	end

TrainerSailorHarry:
	trainer EVENT_BEAT_SAILOR_HARRY, SAILOR, HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .script

.script
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a220c
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer EVENT_BEAT_LASS_DANA, LASS, DANA1, LassDana1SeenText, LassDana1BeatenText, 0, .script

.script
;	writecode VAR_CALLERID, PHONE_LASS_DANA
	end_if_just_battled
	opentext
;	checkflag ENGINE_DANA
;	iftrue .DanaRematch
;	checkflag ENGINE_DANA_HAS_THUNDERSTONE
;	iftrue .TryGiveThunderstone
;	checkcellnum PHONE_LASS_DANA
;	iftrue .NumberAccepted
;	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
;	iftrue .SecondTimeAsking
	writetext UnknownText_0x1a20ec
	waitbutton
	closetext
;	buttonsound
;	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
;	scall .AskNumber1F
;	jump .AskForPhoneNumber
	end
	
.SecondTimeAsking:
	scall .AskNumber2F
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	if_equal $1, .PhoneFull
	if_equal $2, .DeclinedPhoneNumber
	trainertotext LASS, DANA1, $0
	scall .RegisteredPhoneNumber
	jump .NumberAccepted

.DanaRematch:
	scall .Rematch
	winlosstext LassDana1BeatenText, 0
	copybytetovar wDanaFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 1
	clearflag ENGINE_DANA
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 2
	clearflag ENGINE_DANA
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 3
	clearflag ENGINE_DANA
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadvar wDanaFightCount, 4
	clearflag ENGINE_DANA
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA
	end

.TryGiveThunderstone:
	scall .Gift
	verbosegiveitem THUNDERSTONE
	iffalse .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jump .NumberAccepted

.NoRoomForThunderstone:
	jump .PackFull

.AskNumber1F:
	jumpstd asknumber1f
	end

.AskNumber2F:
	jumpstd asknumber2f
	end

.RegisteredPhoneNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

TrainerSchoolboyChad1:
	trainer EVENT_BEAT_SCHOOLBOY_CHAD, SCHOOLBOY, CHAD1, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .script

.script
;	writecode VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	end_if_just_battled
	opentext
;	checkflag ENGINE_CHAD
;	iftrue .ChadRematch
;	checkcellnum PHONE_SCHOOLBOY_CHAD
;	iftrue .HaveChadsNumber
;	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
;	iftrue .SecondTimeAsking
	writetext UnknownText_0x1a200e
	waitbutton
	closetext
;	buttonsound
;	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
;	scall .AskPhoneNumber1
;	jump .AskToRegisterNumber
	end
	
.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	if_equal $1, .PhoneFull
	if_equal $2, .SaidNo
	trainertotext SCHOOLBOY, CHAD1, $0
	scall .RegisteredChad
	jump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	copybytetovar wChadFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadvar wChadFightCount, 1
	clearflag ENGINE_CHAD
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadvar wChadFightCount, 2
	clearflag ENGINE_CHAD
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadvar wChadFightCount, 3
	clearflag ENGINE_CHAD
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadvar wChadFightCount, 4
	clearflag ENGINE_CHAD
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD
	end

.AskPhoneNumber1:
	jumpstd asknumber1m
	end

.AskPhoneNumber2:
	jumpstd asknumber2m
	end

.RegisteredChad:
	jumpstd registerednumberm
	end

.HaveChadsNumber:
	jumpstd numberacceptedm
	end

.SaidNo:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

TrainerBeautyValerie:
	trainer EVENT_BEAT_BEAUTY_VALERIE, BEAUTY, VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .script

.script
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a2185
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer EVENT_BEAT_BEAUTY_OLIVIA, BEAUTY, OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .script

.script
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a229a
	waitbutton
	closetext
	end

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

FruitTreeScript_0x1a1f33:
	fruittree FRUITTREE_ROUTE_38

Route38Blockman:
	faceplayer
	checkflag ENGINE_STORMBADGE
	iftrue .Route38BlockmanHaveBadge
	opentext
	writetext Route38BlockmanNoBeatText
	waitbutton
	closetext
	end
.Route38BlockmanHaveBadge
	faceplayer
	opentext
	writetext Route38BlockmanHaveBadgeText
	setevent EVENT_SECURITY_CAMERA_3
	waitbutton
	closetext
	applymovement ROUTE38_BLOCKMAN, Route38BlockmanLeave
	disappear ROUTE38_BLOCKMAN
	end

Route38BlockmanLeave:
	step_right
	step_right
	step_up
	step_up
	step_right
	step_right
	step_right
	step_end

Route38BeautyTalkText
	text "Boy is this girl"
	line "tired from all"
	
	para "the battles in the"
	line "the park."
	
	para "Parks are supposed"
	line "to be relaxing!"
	done
	
Route38BlockmanHaveBadgeText:
	text "Wow, kid!"
	line "You beat CORALINE?"
	
	para "You must be hot"
	line "stuff!"
	
	para "Sure you can pass"
	line "through here if"
	
	para "you managed to"
	line "beat her!"
	
	para "Seeya 'round, kid!"
	done

Route38BlockmanNoBeatText:
	text "Hey, have you"
	line "been to the GYM"
	cont "in NEWPORT CITY?"
	
	para "My friend is the"
	line "leader there!"
	
	para "I bet you can't"
	line "beat her."
	
	para "Tell you what."
	
	para "If you can beat"
	line "her, I'll let you"
	cont "pass!"
	
	para "You better get"
	line "going, kid!"
	done
	
Bird_keeperTobySeenText:
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #MON!"
	done

Bird_keeperTobyBeatenText:
	text "I feel like just"
	line "flying away now."
	done

UnknownText_0x1a1f86:
	text "I plan to train in"
	line "CIANWOOD CITY to"

	para "teach my #MON"
	line "how to FLY."
	done

SchoolboyChad1SeenText:
	text "Another chance"
	line "for education!"
	done

SchoolboyChad1BeatenText:
	text "I didn't learn"
	line "a thing today…"
	done

UnknownText_0x1a200e:
	text "If I spent more"
	line "time studying,"
	
	para "I'd probably be"
	line "a better trainer."
	done

LassDana1SeenText:
	text "Could you show me"
	line "how to be a better"
	cont "trainer?"
	done

LassDana1BeatenText:
	text "I guess this is"
	line "a tough love"
	cont "thing."
	done

UnknownText_0x1a20ec:
	text "Do you often use"
	line "ITEMS during"
	cont "battle?"
	
	para "Perhaps I should"
	line "try that."
	done

BeautyValerieSeenText:
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#MON?"
	done

BeautyValerieBeatenText:
	text "I'm glad I got to"
	line "see your #MON!"
	done

UnknownText_0x1a2185:
	text "When I see #-"
	line "MON, it seems to"
	cont "soothe my nerves."
	done

SailorHarrySeenText:
	text "I've been over-"
	line "seas, so I know"

	para "about all sorts of"
	line "#MON!"
	done

SailorHarryBeatenText:
	text "Your skill is"
	line "world class!"
	done

UnknownText_0x1a220c:
	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #MON."
	done

BeautyOliviaSeenText:
	text "Don't you think my"
	line "#MON and I are"
	cont "beautiful?"
	done

BeautyOliviaBeatenText:
	text "We drink MOOMOO"
	line "MILK every day."
	done

UnknownText_0x1a229a:
	text "MOOMOO MILK is"
	line "good for beauty"

	para "and health, but"
	line "inconveniently,"

	para "they only sell a"
	line "bottle at a time."
	done

Route38SignText:
	text "ROUTE 11"

	para "NEWPORT CITY -"
	line "FIGBRANCH TOWN"
	done

Route38TrainerTipsText:
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done

Route38_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 8, 37, 1, ROUTE33_GATES
	warp_def 9, 37, 2, ROUTE33_GATES
	warp_def 10, 0, 3, ROUTE_36_NATIONAL_PARK_GATE
	warp_def 11, 0, 4, ROUTE_36_NATIONAL_PARK_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 33, SIGNPOST_READ, Route38Sign
	signpost 7, 15, SIGNPOST_READ, Route38TrainerTips

.ObjectEvents: db 9
	person_event SPRITE_STANDING_YOUNGSTER, 8, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	person_event SPRITE_LASS, 14, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassDana1, -1
	person_event SPRITE_STANDING_YOUNGSTER, -2, 36, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBird_keeperToby, -1
	person_event SPRITE_BUENA, -2, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBeautyValerie, -1
	person_event SPRITE_SAILOR, -2, 37, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, TrainerSailorHarry, -1
	person_event SPRITE_FRUIT_TREE, 12, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a1f33, -1
	person_event SPRITE_BUENA, -2, 38, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
	person_event SPRITE_SAILOR, 11, 30, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route38Blockman, EVENT_SECURITY_CAMERA_3
	person_event SPRITE_BUENA, 10, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 3, Route38BeautyTalk, -1
