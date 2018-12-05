; This file is too big

const_value set 2
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2
	const VIOLETCITY_STOP_YOU_GUY
	const VIOLETCITY_TRAIN_KID

VioletCity_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	maptrigger .Trigger0
	
.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return
	
.Trigger0:
	end

VioletCityTrainSignScript
	jumptext VioletCityTrainSignText
	
VioletCityEarlScript:
;	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
;	yesorno
;	iffalse .FollowEarl
;	jump .PointlessJump
	waitbutton
	closetext
	end

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	spriteface PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	special RestartMapMusic
	opentext
	writetext Text_HereTeacherIAm
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applymovement VIOLETCITY_EARL, VioletCityFinishFollowEarl_MovementData
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

VioletCitySignpostDEVScript:
	jumptext VioletCitySignpostDEVText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokeCenterSign:
	jumpstd pokecentersign

VioletCityMartSign:
	jumpstd martsign

VioletCityPPUp:
	itemball PP_UP

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTreeScript:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityRock:
	jumpstd smashrock
	
VioletCityHiddenHyperPotion:
	dwb EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION, HYPER_POTION

; Script transfer start

VioletCityBoyScript:
	faceplayer
VioletCityBoyTrigger:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
;	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
;	writetext VioletCityBoyText_AideIsWaiting
	waitbutton
	closetext
	end

.Unused:
	writetext VioletCityBoyText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext VioletCityBoyText_HaveThisSeed
	buttonsound
	verbosegiveitem QUICK_CLAW
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	dotrigger $1
	jump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext VioletCityBoyText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext VioletCityBoyText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

VioletCityBoyStopsYou:
	spriteface VIOLETCITY_STOP_YOU_GUY, DOWN
	spriteface PLAYER, UP
	opentext
	writetext VioletCityBoyText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, VIOLETCITY_STOP_YOU_GUY
	applymovement PLAYER, Movement_VioletCityBoyPushesYouBackToViolet
	stopfollow
	spriteface PLAYER, LEFT
	spriteface VIOLETCITY_STOP_YOU_GUY, RIGHT
	scall VioletCityBoyTrigger
	applymovement VIOLETCITY_STOP_YOU_GUY, Movement_VioletCityBoyReset1
	end

VioletCityTrainKidScript:
	faceplayer
	opentext
	writetext VioletCityTrainKidText
	waitbutton
	closetext
	end

VioletCityTrainSignScript2:
	jumptext VioletCityTrainSignText2
	
VioletCityFollowEarl_MovementData:
	big_step_down
	step_end

VioletCityFinishFollowEarl_MovementData:
	step_up
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head_down
	step_end

;start of step transfer	

Movement_VioletCityBoyPushesYouBackToViolet:
	step_right
	step_end

Movement_VioletCityBoyReset1:
	step_up
	turn_head_down
	step_end

VioletCityTrainSignText2:
	text "WILLOWBRUSH TRAIN"
	line "STATION"
	
	para "Through Here"
	done
	
VioletCityTrainSignText:
	text "MAGNET TRAIN"
	line "STATION"
	done
	
VioletCityTrainKidText:
	text "I always wanted"
	line "to ride on a"
	cont "MAGNET TRAIN!"
	
	para "But I have no"
	line "PASS…"
	done
	
Text_EarlAsksIfYouBeatFalkner:
	text "Ah, the air is"
	line "fresh!"
	
	para "That perfect small"
	line "town breeze!"
	done

Text_VeryNiceIndeed:
	text "Ooh, la la!"
	line "Very indeed nice!"
	done

Text_FollowEarl:
	text "Is that so? Then"
	line "study shall you!"
	cont "Follow me!"
	done

Text_HereTeacherIAm:
	text "Here, teacher I"
	line "am. Good it is"
	cont "you study here!"
	done

VioletCityLassText:
	text "I always wanted to"
	line "do something great"
	cont "for the world."
	
	para "I wouldn't be able"
	line "to do it without"
	cont "#MON."
	done

VioletCitySuperNerdText:
	text "It's best to train"
	line "many types of"
	cont "#MON."
	
	para "Relying on just"
	line "one type won't"
	cont "get you very far."
	done

VioletCityGrampsText:
	text "Some areas are"
	line "out of reach until"
	
	para "you learn new"
	line "moves."
	
	para "I've never gone"
	line "past that big"
	cont "rock before."
	done

VioletCityYoungsterText:
	text "Over there is a"
	line "#MON GYM."
	
	para "You can test your"
	line "skills there for a"
	cont "BADGE!"
	done

VioletCitySignText:
	text "WILLOWBRUSH TOWN"

	para "The Branch of"
	line "JANTO"
	done

VioletGymSignText:
	text "WILLOWBRUSH TOWN"
	line "#MON GYM"
	cont "LEADER: MACK"

	para "Grounds Enemies"
	line "Into Dust"
	done

VioletCitySignpostDEVText:
	text "Dev Diary 3"
	para "The 9th of JULY"
	line "2016"
	
	para "I've almost fin-"
	line "nished all the"
	
	para "story events for"
	line "the first region"
	cont "in the game!"
	cont "Hoorah!"
	
	para "And by now some of"
	line "you may be"
	
	para "realizing that"
	line "this first part of"
	
	para "the game is basic-"
	line "ally the same as"
	
	para "my APRIL FOOLS"
	line "ROM HACK--"
	
	para "#MON DARK GRAY"
	line "STONE."
	
	para "In fact when I"
	line "made that game,"
	
	para "I was actaully"
	line "secretly making"
	
	para "#MON BRONZE 2"
	line "but decided to"
	
	para "change what I had"
	line "done so far, into"
	
	para "a fun joke for"
	line "the let's players."
	
	para "I GOT YOU GUYS SO"
	line "GOOOOOD!"
	
	para "Also this town is"
	line "based on a GOLD &"
	cont "SILVER beta map."
	
	para "Just thought you'd"
	line "like to know!"
	
	para "-FREAKO out."
	done

EarlsPokemonAcademySignText:
	text "WILLBOWBRUSH TOWN"
	line "WEDDING CHAPEL"
	done
; Start of event text transfer
	
VioletCityBoyText_WhatsTheHurry:
	text "Hey there, you!"
	done

VioletCityBoyText_AideIsWaiting:
	text "<PLAYER>, right?"
	line "Some guy wearing"

	para "glasses was look-"
	line "ing for you."

	para "See for yourself."
	line "He's waiting for"

	para "you at the #MON"
	line "CENTER."
	done

; might not be referenced anywhere
VioletCityBoyText_UnusedSproutTower:
	text "Have you gone to"
	line "SPROUT TOWER?"

	para "If you ever visit"
	line "VIOLET CITY, "

	para "they'll expect you"
	line "to train there."

	para "That's basic for"
	line "trainers. Go to"
	cont "SPROUT TOWER!"
	done

VioletCityBoyText_VioletGym:
	text "Have you taken on"
	line "MACK yet?"
	
	para "He's this town's"
	line "GYM LEADER!"
	
	para "You should totally"
	line "challenge him and"
	
	para "win before you"
	line "move on!"
	done

VioletCityBoyText_HaveThisSeed:
	text "you should beat--"
	
	para "Oh, you've got"
	line "WILLOWBRUSH TOWN's"
	cont "GYM BADGE?"
	
	para "Woah"
	line "I'm impressed!"
	
	para "Here, have a token"
	line "of our appre-"
	cont "ciation."
	done

VioletCityBoyText_ExperiencesShouldBeUseful:
	text "A QUICK CLAW"
	line "can help attack"
	
	para "first in battle"
	line "if it is given"
	
	para "to a #MON"
	line "to hold!"
	done
	
VioletCity_MapEventHeader:: db 0, 0

.Warps: db 10
	warp_def 23, 17, 2, VIOLET_MART
	warp_def 13, 2, 1, VIOLET_GYM
	warp_def 9, 28, 2, EARLS_POKEMON_ACADEMY
	warp_def 11, 15, 1, VIOLET_NICKNAME_SPEECH_HOUSE
	warp_def 25, 27, 1, VIOLET_POKECENTER_1F
	warp_def 17, 15, 1, VIOLET_ONIX_TRADE_HOUSE
	warp_def 9, 27, 1, EARLS_POKEMON_ACADEMY
	warp_def 28, 39, 1, ROUTE_31_VIOLET_GATE
	warp_def 29, 39, 2, ROUTE_31_VIOLET_GATE
	warp_def 41, 22, 2, SAFFRON_TRAIN_STATION

.CoordEvents: db 1
	xy_trigger 0, 8, 6, 0, VioletCityBoyStopsYou, 0, 0

.BGEvents: db 9
	signpost 26, 20, SIGNPOST_READ, VioletCitySign
	signpost 15, 5, SIGNPOST_READ, VioletGymSign
	signpost 24, 26, SIGNPOST_READ, VioletCitySignpostDEVScript
	signpost 9, 25, SIGNPOST_READ, EarlsPokemonAcademySign
	signpost 25, 28, SIGNPOST_READ, VioletCityPokeCenterSign
	signpost 23, 18, SIGNPOST_READ, VioletCityMartSign
	signpost 31, 39, SIGNPOST_ITEM, VioletCityHiddenHyperPotion
	signpost 41, 26, SIGNPOST_READ, VioletCityTrainSignScript
	signpost 31, 17, SIGNPOST_READ, VioletCityTrainSignScript2

.ObjectEvents: db 12
	person_event SPRITE_FISHER, 10, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VioletCityEarlScript, -1
	person_event SPRITE_LASS, 28, 28, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VioletCityLassScript, -1
	person_event SPRITE_SUPER_NERD, 25, 13, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	person_event SPRITE_GRAMPS, 19, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 17, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	person_event SPRITE_FRUIT_TREE, 20, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityFruitTreeScript, -1
	person_event SPRITE_POKE_BALL, 35, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VioletCityPPUp, EVENT_VIOLET_CITY_PP_UP
	person_event SPRITE_POKE_BALL, 12, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY
	person_event SPRITE_YOUNGSTER, 7, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityBoyScript, -1
	person_event SPRITE_YOUNGSTER, 37, 13, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityTrainKidScript, -1
	person_event SPRITE_ROCK, 38, 27, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityRock, -1
	person_event SPRITE_ROCK, 14, 25, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityRock, -1
