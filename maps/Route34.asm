const_value set 2
	const ROUTE34_YOUNGSTER1
	const ROUTE34_YOUNGSTER2
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAYCARE_MON_1
	const ROUTE34_DAYCARE_MON_2
	const ROUTE34_COOLTRAINER_F1
	const ROUTE34_COOLTRAINER_F2
	const ROUTE34_COOLTRAINER_F3
	const ROUTE34_POKE_BALL

Route34_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDaycareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.PutDaycareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAYCARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAYCARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAYCARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAYCARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAYCARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAYCARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special Special_DayCareManOutside
	waitbutton
	closetext
	if_equal $1, .end_fail
	clearflag ENGINE_DAYCARE_MAN_HAS_EGG
	checkcode VAR_FACING
	if_equal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DaycareMon1Script:
	opentext
	special Special_DayCareMon1
	closetext
	end

DaycareMon2Script:
	opentext
	special Special_DayCareMon2
	closetext
	end

HelpfulAdviceGuy1:
	jumptextfaceplayer HelpfulAdviceGuy1text	
	
TrainerCamperTodd1:
	trainer EVENT_BEAT_CAMPER_TODD, CAMPER, TODD1, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperTodd1AfterText
	waitbutton
	closetext
	end

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext CAMPER, TODD1, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext CamperTodd1BeatenText, 0
	copybytetovar wToddFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 1
	clearflag ENGINE_TODD
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 2
	clearflag ENGINE_TODD
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 3
	clearflag ENGINE_TODD
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 4
	clearflag ENGINE_TODD
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD
	end

.SaleIsOn:
	writetext CamperToddSaleText
	waitbutton
	closetext
	end

.AskNumber:
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

TrainerPicnickerGina1:
	trainer EVENT_BEAT_PICNICKER_GINA, PICNICKER, GINA1, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PicnickerGina1AfterText
	waitbutton
	closetext
	end

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext PICNICKER, GINA1, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	copybytetovar wGinaFightCount
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
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 1
	clearflag ENGINE_GINA
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 2
	clearflag ENGINE_GINA
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 3
	clearflag ENGINE_GINA
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 4
	clearflag ENGINE_GINA
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA
	end

.LeafStone:
	scall .Gift
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	jump .NumberAccepted

.BagFull:
	jump .PackFull

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

OfficerKeithScript:
	faceplayer
	opentext
	checknite
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerYoungsterSamuel:
	trainer EVENT_BEAT_YOUNGSTER_SAMUEL, YOUNGSTER, SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer EVENT_BEAT_YOUNGSTER_IAN, YOUNGSTER, IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer EVENT_BEAT_POKEFANM_BRANDON, POKEFANM, BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer EVENT_BEAT_COOLTRAINERF_IRENE, COOLTRAINERF, IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer EVENT_BEAT_COOLTRAINERF_JENN, COOLTRAINERF, JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer EVENT_BEAT_COOLTRAINERF_KATE, COOLTRAINERF, KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	buttonsound
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

; unused
	jumptext MapRoute34UnusedSignpostText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	dwb EVENT_ROUTE_34_HIDDEN_RARE_CANDY, RARE_CANDY


Route34HiddenSuperPotion:
	dwb EVENT_ROUTE_34_HIDDEN_SUPER_POTION, SUPER_POTION


Route34MovementData_DayCareManWalksBackInside:
	slow_step_left
	slow_step_left
	slow_step_up
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_up
	slow_step_up
	step_end

YoungsterSamuelSeenText:
	text "I'm heading for the"
	line "big city to test"
	cont "my #MON!"
	done

YoungsterSamuelBeatenText:
	text "This is awful!"
	done

YoungsterSamuelMobileText:
	text "Have you been to"
	line "GOLDENROD CITY?"

	para "Weren't you amazed"
	line "by how they've"

	para "changed the"
	line "#MON CENTER?"
	done

YoungsterSamuelAfterText:
	text "Looks like it's"
	line "back to the #-"
	cont "MON CENTRE for me."
	done

YoungsterIanSeenText:
	text "I'm hip and young!"
	line "Nobody can stand"
	cont "in my way!"
	done

YoungsterIanBeatenText:
	text "I'm so confused…"
	done

YoungsterIanAfterText:
	text "Being hip means"
	line "wearing your cap"
	cont "backwards!"
	
	para "Or at least part"
	line "of being hip."
	done

CamperTodd1SeenText:
	text "I've learned from"
	line "the best!"
	done

CamperTodd1BeatenText:
	text "I've let myself"
	line "down, hard."
	done

CamperTodd1AfterText:
	text "Training #MON"
	line "can be a labor of"
	cont "love."
	done

CamperToddSaleText:
	text "Shopping under the"
	line "sky!"

	para "It feels so nice"
	line "up on a rooftop."
	done

PicnickerGina1SeenText:
	text "Eeek! Did you look"
	line "at me?"
	done

PicnickerGina1BeatenText:
	text "Dear me."
	done

PicnickerGina1AfterText:
	text "I'll never forget"
	line "this."
	done

OfficerKeithSeenText:
	text "Who goes there?"
	line "What are you up"
	cont "to?"
	done

OfficerKeithWinText:
	text "You're a tough"
	line "little kid."
	done

OfficerKeithAfterText:
	text "Yep, I see nothing"
	line "wrong today. You"

	para "be good and stay"
	line "out of trouble."
	done

OfficerKeithDaytimeText:
	text "I'm on patrol for"
	line "suspicious indi-"
	cont "viduals."
	done

PokefanmBrandonSeenText:
	text "My #MON is"
	line "truly fighting"
	cont "fit!"
	
	para "Let's try them"
	line "out!"
	done

PokefanmBrandonBeatenText:
	text "My poor PIKACHU!"
	done

PokefanmBrandonAfterText:
	text "I heard there was"
	line "a #MON DAY-CARE"
	cont "on this route."

	para "They could make my"
	line "PIKACHU stronger!"
	done

CooltrainerfIreneSeenText:
	text "IRENE: Kyaaah!"
	line "Someone found us!"
	done

CooltrainerfIreneBeatenText:
	text "IRENE: Ohhh!"
	line "Too strong!"
	done

CooltrainerfIreneAfterText1:
	text "IRENE: My sister"
	line "KATE will get you"
	cont "for this!"
	done

CooltrainerfIreneAfterText2:
	text "IRENE: Isn't this"
	line "beach great?"

	para "It's our secret"
	line "little getaway!"
	done

CooltrainerfJennSeenText:
	text "JENN: You can't"
	line "beat IRENE and go"
	cont "unpunished!"
	done

CooltrainerfJennBeatenText:
	text "JENN: So sorry,"
	line "IRENE! Sis!"
	done

CooltrainerfJennAfterText1:
	text "JENN: Don't get"
	line "cocky! My sister"
	cont "KATE is tough!"
	done

CooltrainerfJennAfterText2:
	text "JENN: Sunlight"
	line "makes your body"
	cont "stronger."
	done

CooltrainerfKateSeenText:
	text "KATE: You sure"
	line "were mean to my"
	cont "little sisters!"
	done

CooltrainerfKateBeatenText:
	text "KATE: No! I can't"
	line "believe I lost."
	done

CooltrainerfKateOfferSoftSandText:
	text "KATE: You're too"
	line "strong. I didn't"
	cont "stand a chance."

	para "Here. You deserve"
	line "this."
	done

CooltrainerfKateAfterText:
	text "KATE: I'm sorry we"
	line "jumped you."

	para "We never expected"
	line "anyone to find us"

	para "here. You sure"
	line "startled us."
	done

MapRoute34UnusedSignpostText:
	text "ILEX FOREST"
	line "THROUGH THE GATE"
	done

Route34SignText:
	text "ROUTE 5"

	para "East - ROSEGLEN"
	line "CITY"

	para "West - CALLOW"
	line "FOREST"
	done

Route34TrainerTipsText:
	text "TRAINER TIPS"

	para "BERRY trees grow"
	line "new BERRIES"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which BERRIES."
	done

DayCareSignText:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done
	
HelpfulAdviceGuy1text
	text "Hi fellow trainer!"
	para "Some advice!"
	
	para "If you're a bit"
	line "tired you should"
	
	para "probably go into"
	line "the next town"
	
	para "before tackling"
	line "the forest."
	
	done

Route34_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 37, 17, 5, ROUTE36_UNDERGROUND_PATH
	warp_def 37, 18, 6, ROUTE36_UNDERGROUND_PATH
	warp_def 10, 16, 1, DAYCARE
	warp_def 11, 16, 2, DAYCARE
	warp_def 51, 7, 3, DAYCARE
	warp_def 7, 21, 2, GOLDENRODCITYGATES
	warp_def 6, 21, 1, GOLDENRODCITYGATES
	warp_def 6, 4, 3, ILEX_FOREST_AZALEA_GATE
	warp_def 7, 4, 4, ILEX_FOREST_AZALEA_GATE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 10, 14, SIGNPOST_READ, Route34Sign
	signpost 32, 16, SIGNPOST_READ, Route34TrainerTips
	signpost 51, 5, SIGNPOST_READ, DayCareSign
	signpost 26, 6, SIGNPOST_ITEM, Route34HiddenSuperPotion
	signpost 49, 11, SIGNPOST_ITEM, Route34HiddenRareCandy

.ObjectEvents: db 14
	person_event SPRITE_YOUNGSTER, 16, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperTodd1, -1
	person_event SPRITE_YOUNGSTER, 32, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterSamuel, -1
	person_event SPRITE_YOUNGSTER, 17, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterIan, -1
	person_event SPRITE_LASS, 24, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerGina1, -1
	person_event SPRITE_OFFICER, 51, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerKeithScript, -1
	person_event SPRITE_POKEFAN_M, 38, 7, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	person_event SPRITE_POKEFAN_M, 52, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAYCARE_MAN_ON_ROUTE_34
	person_event SPRITE_DAYCARE_MON_1, 46, 8, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaycareMon1Script, EVENT_DAYCARE_MON_1
	person_event SPRITE_DAYCARE_MON_2, 47, 10, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaycareMon2Script, EVENT_DAYCARE_MON_2
	person_event SPRITE_COOLTRAINER_F, 51, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	person_event SPRITE_COOLTRAINER_F, 51, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	person_event SPRITE_COOLTRAINER_F, 52, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	person_event SPRITE_POKE_BALL, 41, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route34Nugget, EVENT_ROUTE_34_NUGGET
	person_event SPRITE_YOUNGSTER, 6, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HelpfulAdviceGuy1, -1
