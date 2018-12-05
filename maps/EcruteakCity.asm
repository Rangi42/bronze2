const_value set 2
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_ROCKET1
	const ECRUTEAKCITY_ROCKET2
	const ECRUTEAKCITY_ROCKET3
	const ECRUTEAKCITY_ROCKET4
	const ECRUTEAKCITY_ROCKETSURPRISE
	const ECRUTEAKCITY_ROCKETSURPRISE2
	const ECRUTEAKCITY_ROCKET5
	const ECRUTEAKCITY_ARTGUY

EcruteakCity_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	
.Trigger0:
	end
	
.Trigger1:
	end
	
.Trigger2:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruGallerySaved:
	dotrigger $3
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	applymovement PLAYER, EcruStepDown
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear ECRUTEAKCITY_ARTGUY
	applymovement ECRUTEAKCITY_ARTGUY, EcruStepDown	
	spriteface PLAYER, UP
	opentext
	writetext EcruGallerySavedText
	waitbutton
	verbosegiveitem TM_THIEF
	writetext EcruGallerySavedText2
	waitbutton
	closetext	
	applymovement ECRUTEAKCITY_ARTGUY, EcruStepUp	
	playsound SFX_ENTER_DOOR
	disappear ECRUTEAKCITY_ARTGUY
	end

GetOutOfTheWayMan:
	opentext
	writetext EcruSorryText
	waitbutton
	closetext
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	disappear ECRUTEAKCITY_ARTGUY
	end
	
GrampsScript_0x1a4009:
	jumptextfaceplayer UnknownText_0x1a4105

GrampsScript_0x1a400c:
	jumptextfaceplayer UnknownText_0x1a4147

GrampsScript_0x1a400f:
	jumptextfaceplayer UnknownText_0x1a43cb

LassScript_0x1a4012:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_GymOpen
	writetext UnknownText_0x1a41db
	waitbutton
	closetext
	end

UnknownScript_GymOpen
	writetext UnknownText_GymOpen
	waitbutton
	closetext
	end
	
LassScript_0x1a4015:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x1a4023
	writetext UnknownText_0x1a421a
	waitbutton
	closetext
	end

UnknownScript_0x1a4023:
	writetext UnknownText_0x1a4269
	waitbutton
	closetext
	end

FisherScript_0x1a4029:
	faceplayer
	opentext
;	checkevent EVENT_JASMINE_RETURNED_TO_GYM
;	iftrue UnknownScript_0x1a4037
	writetext UnknownText_0x1a42ac
	waitbutton
	closetext
	end

UnknownScript_0x1a4037:
	writetext UnknownText_0x1a4325
	waitbutton
	closetext
	end

YoungsterScript_0x1a403d:
	jumptextfaceplayer UnknownText_0x1a4386

EcruRocketScript1:
	jumptextfaceplayer EcruRocketText1
	
EcruRocketScript2:
	jumptextfaceplayer EcruRocketText2
	
EcruRocketScript3:
	jumptextfaceplayer EcruRocketText3
	
EcruRocketScript4:
	jumptextfaceplayer EcruRocketText4

EcruRocketScript5:
	jumptextfaceplayer EcruRocketText5
	
EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

FernworthPhotoStudioSign:
	jumptext FernworthPhotoStudioSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokeCenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	dwb EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION, HYPER_POTION

; Rocket Surprise Script
	
EcruSurpriseTrigger1:
	moveperson ECRUTEAKCITY_ROCKETSURPRISE, 1, 1
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
;	appear ECRUTEAKCITY_ROCKETSURPRISE
	opentext
	writetext EcruBeforeSurpriseText
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseTurn2Movement
	showemote EMOTE_SHOCK, ECRUTEAKCITY_ROCKETSURPRISE2, 15
	applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseTurnMovement
	showemote EMOTE_SHOCK, ECRUTEAKCITY_ROCKETSURPRISE, 15
    applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseTurnAgainMovement
    applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseTurnAgain2Movement
	opentext
	writetext EcruSurpriseText
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseExitMovement
	applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseExit2Movement
;	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKCITY_ROCKETSURPRISE
	disappear ECRUTEAKCITY_ROCKETSURPRISE2
	dotrigger $1
;	waitsfx
;	reloadmap
;	playmapmusic
	special RestartMapMusic
	end

EcruSurpriseTrigger2:
	moveperson ECRUTEAKCITY_ROCKETSURPRISE, 1, 1
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
;	appear ECRUTEAKCITY_ROCKETSURPRISE
	opentext
	writetext EcruBeforeSurpriseText
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseTurnMovement
	showemote EMOTE_SHOCK, ECRUTEAKCITY_ROCKETSURPRISE, 15
	applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseTurn2Movement
	showemote EMOTE_SHOCK, ECRUTEAKCITY_ROCKETSURPRISE2, 15
    applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseTurnAgainMovement
    applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseTurnAgain2Movement
	opentext
	writetext EcruSurpriseText
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_ROCKETSURPRISE2, EcruSurpriseExitMovement
	applymovement ECRUTEAKCITY_ROCKETSURPRISE, EcruSurpriseExit2Movement
;	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKCITY_ROCKETSURPRISE
	disappear ECRUTEAKCITY_ROCKETSURPRISE2
	dotrigger $1
;	playmusic MUSIC_RIVAL_AFTER
;	waitsfx
;	reloadmap
;	playmapmusic
	special RestartMapMusic
	end
	
EcruteakCitySignpostDEVScript:
	jumptext EcruteakCitySignpostDEVText
	
EcruSurpriseTurnMovement:
	turn_head_down
	step_end
	
EcruSurpriseTurn2Movement:
	turn_head_down
	step_end

EcruSurpriseTurnAgainMovement:
	turn_head_left
	step_end
	
EcruSurpriseTurnAgain2Movement:
	turn_head_right
	step_end
	
EcruSurpriseExitMovement:
	big_step_up
	big_step_up
	big_step_up
	step_end

EcruSurpriseExit2Movement:
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	step_end
	
EcruStepDown:
	step_down
	step_end
	
EcruStepUp:
	step_up
	step_end


UnusedMissingDaughterText:
; This text is neither used nor referenced in the final game.
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "BURNED TOWER."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

UnknownText_0x1a4105:
	text "Are you well"
	line "learned in"
	cont "history, my child?"
	
	para "Knowing where we"
	line "came from, and"
	
	para "knowing how we"
	line "came to be is"
	
	para "important for"
	line "the future!"
	done

UnknownText_0x1a4147:
	text "Ah, I remember"
	line "being young, like"
	cont "you."
	
	para "The world was at"
	line "my feet with"
	
	para "#MON by my"
	line "side."
	done

EcruteakCitySignpostDEVText
	text "Dev Diary 4"
	para "The 12th of NOV-"
	line "EMBER 2016"
	
	para "It has been a"
	line "while since I"

	para "wrote one of"
	line "these!"
	
	para "Well, right now"
	line "I'm about half way"
	
	para "through picking"
	line "trainer's teams"
	
	para "and the wild #-"
	line "MON."
	
	para "And I was talking"
	line "with AXMAN about"
	
	para "the future LET'S"
	line "PLAY."
	
	para "I'm really looking"
	line "forward to finish-"
	
	para "ing the game just"
	line "for that!"
	
	para "…If it ever"
	line "happens."
	
	para "AXMAN really pulls"
	line "through for some-"
	
	para "one so universally"
	line "terrible at"
	cont "everything!"
	
	para "ARCEUS speed to"
	line "that poor soul."
	
	para "-FREAKO out."
	done

EcruSorryText:
	text "Sorry. Please"
	line "report this bug"
	
	para "if you see it"
	line "and you didn't"
	
	para "use the warp"
	line "room."
	done
	
UnknownText_0x1a41db:
	text "That rude man won't"
	line "let me get in the"
	cont "GYM!"
	
	para "I hope he goes"
	line "away soon."
	done
	
UnknownText_GymOpen:
	text "While you were"
	line "gone I challenged"
	cont "the GYM leader!"
	
	para "…I didn't win, but"
	line "I tried and that's"
	cont "what matters."
	done

UnknownText_0x1a421a:
	text "Did you see those"
	line "silly men at the"
	cont "MUSEUM?"
	
	para "They must be"
	line "really into art!"
	
	para "Wearing all black"
	line "and all."
	done

UnknownText_0x1a4269:
	text "Those men wearing"
	line "black were members"
	cont "of TEAM ROCKET?"
	
	para "You never expect"
	line "something like"
	
	para "that in a small"
	line "town like this."
	done

UnknownText_0x1a42ac:
	text "You there, kid!"
	line "I see the spirit"
	cont "in your eyes!"
	
	para "Just the kind of"
	line "thing I like to"
	cont "see!"
	done

UnknownText_0x1a4325:
	text "The #MON at"
	line "OLIVINE LIGHTHOUSE"
	cont "has been cured."

	para "Boats can safely"
	line "sail out to sea at"
	cont "night again."
	done

UnknownText_0x1a4386:
	text "I hear some people"
	line "think #MON are"
	cont "tools for evil."
	
	para "But you don't"	
	line "believe that,"
	cont "right?"
	done

UnknownText_0x1a43cb:
	text "Wow. You must be"
	line "A pretty dedicated"
	
	para "rom hacker if you"
	line "managed to talk to"	
	cont "me in game."
	
	para "I'm not even mad,"
	line "I'm impressed."
	done

EcruteakCitySignText:
	text "FERNWORTH TOWN"
	
	para "Rich Culture,"
	line "Wealth and Beauty"
	done

TinTowerSignText:
	text "FERNWORTH"
	line "#MON CLUB"
	done

EcruteakGymSignText:
	text "FERNWORTH TOWN"
	line "#MON GYM"
	cont "LEADER: BLANCHE"

	para "Electrifying in"
	line "Personality"
	done

FernworthPhotoStudioSignText:
	text "FERNWORTH CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

BurnedTowerSignText:
	text "FERNWORTH ART"
	line "GALLERY"
	
	para "Come Feel The"
	line "Inspiration"
	done
	
EcruRocketText1:
	text "Keep out!"
	done

EcruRocketText2:
	text "Go away!"
	done
	
EcruRocketText3:
	text "Nevermind what"
	line "I'm doing here."
	
	para "What are you"
	line "doing here?"
	done

EcruRocketText4:
	text "Money."
	line "First we get the"
	cont "money."
	
	para "What? Go away!"
	done

EcruRocketText5:
	text "Get lost, kid!"
	line "If we let wimps"
	
	para "like you in here,"
	line "it would be a"
	
	para "waste of the"
	line "leader's time!"
	done
	
EcruSurpriseText:
	text "MYSTERIOUS MAN: We"
	line "better take this"
	cont "elsewhere."
	done

EcruBeforeSurpriseText:
	text "MYSTERIOUS MAN: I"
	line "hear they're extr-"
	cont "emely valuable!"
	
	para "It's ripe for our"
	line "picking!"
	done

EcruGallerySavedText:
	text "I almost forgot"
	line "to thank you for"
	
	para "getting rid of"
	line "those hooligans!"
	
	para "You've saved my"
	line "gallery and I'm"
	cont "very grateful."
	
	para "Here, one of those"
	line "thugs dropped"
	cont "this."
	cont "You can have it."
	done
	
EcruGallerySavedText2:
	text "I'm not sure what"
	line "it is, but maybe"
	
	para "you can make use"
	line "of it."
	
	para "Drop by the"
	line "gallery any time!"
	done
	
EcruteakCity_MapEventHeader:: db 0, 0

.Warps: db 17
	warp_def 20, 39, 1, ROUTE_42_ECRUTEAK_GATE
	warp_def 21, 39, 2, ROUTE_42_ECRUTEAK_GATE
	warp_def 11, 27, 1, GOLDENROD_BIKE_SHOP
	warp_def 0, 31, 1, WISE_TRIOS_ROOM
	warp_def 1, 31, 2, WISE_TRIOS_ROOM
	warp_def 27, 27, 1, ECRUTEAK_POKECENTER_1F
	warp_def 21, 15, 1, ECRUTEAK_LUGIA_SPEECH_HOUSE
	warp_def 21, 27, 1, CIANWOOD_CITY_PHOTO_STUDIO
	warp_def 11, 17, 2, ECRUTEAK_MART
	warp_def 27, 34, 1, AZALEA_GYM
	warp_def 29, 9, 1, ECRUTEAK_ITEMFINDER_HOUSE
	warp_def 1, 34, 1, TIN_TOWER_1F
	warp_def 1, 27, 1, BURNED_TOWER_1F
	warp_def 37, 21, 1, ECRUTEAKGATES
	warp_def 37, 22, 2, ECRUTEAKGATES
	warp_def 11, 12, 1, SLOWPOKE_WELL_B1F
	warp_def 21, 7, 1, ECRUTEAK_BONUS_HOUSE

.CoordEvents: db 3
	xy_trigger 0, 36, 21, 0, EcruSurpriseTrigger1, 0, 0
	xy_trigger 0, 36, 22, 0, EcruSurpriseTrigger2, 0, 0
	xy_trigger 2, 12, 12, 0, EcruGallerySaved, 0, 0

.BGEvents: db 9
	signpost 28, 22, SIGNPOST_READ, EcruteakCitySign
	signpost 23, 9, SIGNPOST_READ, TinTowerSign
	signpost 27, 31, SIGNPOST_READ, EcruteakGymSign
	signpost 21, 25, SIGNPOST_READ, FernworthPhotoStudioSign
	signpost 11, 9, SIGNPOST_READ, BurnedTowerSign
	signpost 27, 28, SIGNPOST_READ, EcruteakCityPokeCenterSign
	signpost 11, 18, SIGNPOST_READ, EcruteakCityMartSign
	signpost 10, 9, SIGNPOST_ITEM, EcruteakCityHiddenHyperPotion
	signpost 26, 26, SIGNPOST_READ, EcruteakCitySignpostDEVScript

.ObjectEvents: db 15
	person_event SPRITE_GRAMPS, 23, 21, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a4009, -1
	person_event SPRITE_GRAMPS, 16, 37, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a400c, -1
	person_event SPRITE_LASS, 30, 28, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x1a4012, -1
	person_event SPRITE_LASS, 12, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x1a4015, -1
	person_event SPRITE_FISHER, 24, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a4029, -1
	person_event SPRITE_YOUNGSTER, 31, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a403d, -1
	person_event SPRITE_FISHER, 41, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a400f, -1
	person_event SPRITE_ROCKET, 20, 39, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruRocketScript1, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 21, 39, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruRocketScript2, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 12, 14, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruRocketScript3, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 13, 11, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruRocketScript4, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 34, 22, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent
	person_event SPRITE_ROCKET, 34, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent
	person_event SPRITE_ROCKET, 28, 34, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EcruRocketScript5, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_FISHER, 11, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GetOutOfTheWayMan, EVENT_RIVAL_OLIVINE_CITY
