const_value set 2
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL

Route35_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperBryan:
	trainer EVENT_BEAT_BIRD_KEEPER_BRYAN, BIRD_KEEPER, BRYAN, Bird_keeperBryanSeenText, Bird_keeperBryanBeatenText, 0, Bird_keeperBryanScript

Bird_keeperBryanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cc87
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer EVENT_BEAT_JUGGLER_IRWIN, JUGGLER, IRWIN1, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, JugglerIrwin1Script

JugglerIrwin1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cd5a
	waitbutton
	closetext
	end

UnknownScript_0x19c8ec:
	scall UnknownScript_0x19c907
UnknownScript_0x19c8ef:
	askforphonenumber PHONE_JUGGLER_IRWIN
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext JUGGLER, IRWIN1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f

UnknownScript_0x19c903:
	jumpstd asknumber1m
	end

UnknownScript_0x19c907:
	jumpstd asknumber2m
	end

UnknownScript_0x19c90b:
	jumpstd registerednumberm
	end

UnknownScript_0x19c90f:
	jumpstd numberacceptedm
	end

UnknownScript_0x19c913:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19c917:
	jumpstd phonefullm
	end

UnknownScript_0x19c91b:
	jumpstd rematchm
	end

TrainerCamperIvan:
	trainer EVENT_BEAT_CAMPER_IVAN, CAMPER, IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, CamperIvanScript

CamperIvanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cac4
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer EVENT_BEAT_CAMPER_ELLIOT, CAMPER, ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, CamperElliotScript

CamperElliotScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cb47
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer EVENT_BEAT_PICNICKER_BROOKE, PICNICKER, BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, PicnickerBrookeScript

PicnickerBrookeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cbba
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer EVENT_BEAT_PICNICKER_KIM, PICNICKER, KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, PicnickerKimScript

PicnickerKimScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cc21
	waitbutton
	closetext
	end

TrainerBug_catcherArnie1:
	trainer EVENT_BEAT_BUG_CATCHER_ARNIE, BUG_CATCHER, ARNIE1, Bug_catcherArnie1SeenText, Bug_catcherArnie1BeatenText, 0, Bug_catcherArnie1Script

Bug_catcherArnie1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cdf6
	waitbutton
	closetext
	end

UnknownScript_0x19c9a4:
	scall UnknownScript_0x19c907
UnknownScript_0x19c9a7:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext BUG_CATCHER, ARNIE1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f

UnknownScript_0x19c9bb:
	scall UnknownScript_0x19c91b
	winlosstext Bug_catcherArnie1BeatenText, 0
	copybytetovar wArnieFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadvar wArnieFightCount, 1
	clearflag ENGINE_ARNIE
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadvar wArnieFightCount, 2
	clearflag ENGINE_ARNIE
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadvar wArnieFightCount, 3
	clearflag ENGINE_ARNIE
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadvar wArnieFightCount, 4
	clearflag ENGINE_ARNIE
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE
	end

UnknownScript_0x19ca2f:
	writetext UnknownText_0x19ce38
	waitbutton
	closetext
	end

TrainerFirebreatherWalt:
	trainer EVENT_BEAT_FIREBREATHER_WALT, FIREBREATHER, WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, FirebreatherWaltScript

FirebreatherWaltScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19cebc
	waitbutton
	closetext
	end

OfficerScript_0x19ca49:
	faceplayer
	opentext
;	checknite
;	iffalse UnknownScript_0x19ca73
;	checkevent EVENT_BEAT_OFFICER_DIRK
;	iftrue UnknownScript_0x19ca6d
;	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext UnknownText_0x19ceea
	waitbutton
	closetext
;	winlosstext UnknownText_0x19cf06, 0
;	loadtrainer OFFICER, DIRK
;	startbattle
;	reloadmapafterbattle
;	setevent EVENT_BEAT_OFFICER_DIRK
;	closetext
	end

UnknownScript_0x19ca6d:
	writetext UnknownText_0x19cf0f
	waitbutton
	closetext
	end

UnknownScript_0x19ca73:
	writetext UnknownText_0x19cf56
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_ROLLOUT

FruitTreeScript_0x19ca7e:
	fruittree FRUITTREE_ROUTE_35

CamperIvanSeenText:
	text "I've been getting"
	line "#MON data off"

	para "my radio. I think"
	line "I'm good."
	done

CamperIvanBeatenText:
	text "I give!"
	done

UnknownText_0x19cac4:
	text "Music on the radio"
	line "changes the moods"
	cont "of wild #MON."
	done

CamperElliotSeenText:
	text "I'm trying to find"
	line "the best camping"
	cont "spot!"
	done

CamperElliotBeatenText:
	text "I'll have to pull"
	line "down my tent."
	done

UnknownText_0x19cb47:
	text "Maybe we should"
	line "go camping toget-"
	cont "her sometime."
	
	para "We could catch"
	line "a lot of #MON!"
	done

PicnickerBrookeSeenText:
	text "My #MON are my"
	line "life."
	
	para "Let me show you"
	line "what my parters"
	cont "can do!"
	done

PicnickerBrookeBeatenText:
	text "I must strive to"
	line "be better!"
	done

UnknownText_0x19cbba:
	text "It's kind of good"
	line "to know I can be"
	
	para "stronger than I"
	line "am now."
	
	para "So there's more"
	line "adventure ahead!"
	done

PicnickerKimSeenText:
	text "You kicked my"
	line "picnic basket!"
	done

PicnickerKimBeatenText:
	text "Oh wait, it was"
	line "me!"
	done

UnknownText_0x19cc21:
	text "I like to leave"
	line "food out for #-"
	cont "MON, in hopes"
	
	para "that they come"
	line "eat with me!"
	done

Bird_keeperBryanSeenText:
	text "I don't like"
	line "being restricted"	
	cont "to the ground."
	done

Bird_keeperBryanBeatenText:
	text "Swoop!"
	done

UnknownText_0x19cc87:
	text "I like you. You"
	line "seek out opponents"
	
	para "off the beaten"
	line "path!"
	done

JugglerIrwin1SeenText:
	text "Prepare to juggle"
	line "with fate!"
	done

JugglerIrwin1BeatenText:
	text "That's just not"
	line "cool!"
	done

UnknownText_0x19cd5a:
	text "It's hard to keep"
	line "your eye on the"

	para "prize when so much"
	line "is at stake!"
	done

Bug_catcherArnie1SeenText:
	text "Are you strong?"
	line "I'd like to see!"
	done

Bug_catcherArnie1BeatenText:
	text "That's really"
	line "really troubling."
	done

UnknownText_0x19cdf6:
	text "Would you happen"
	line "to know how to"
	
	para "get rid of that"
	line "little tree?"
	
	para "My #MON aren't"
	line "strong enough"
	cont "to budge it."
	done

UnknownText_0x19ce38:
	text "Wow… Look at all"
	line "those YANMA!"

	para "I'm so blown away,"
	line "I can't move."
	done

FirebreatherWaltSeenText:
	text "I'm practicing my"
	line "fire breathing."
	done

FirebreatherWaltBeatenText:
	text "Ow! I scorched the"
	line "tip of my nose!"
	done

UnknownText_0x19cebc:
	text "The #MON March"
	line "on the radio lures"
	cont "wild #MON."
	done

UnknownText_0x19ceea:
	text "It can be"
	line "dangerous out here"
	cont "on your own."
	
	para "That's why I have"
	line "my #MON protect"
	cont "me."
	done

UnknownText_0x19cf06:
	text "Whoops!"
	done

UnknownText_0x19cf0f:
	text "You know, night-"
	line "time is fun in its"
	cont "own ways."

	para "But don't overdo"
	line "it, OK?"
	done

UnknownText_0x19cf56:
	text "Your #MON look"
	line "pretty tough."

	para "You could go any-"
	line "where safely."
	done

Route35SignText:
	text "ROUTE 8"
	
	para "ROSEGLEN CITY -"
	line "WILDBARK VILLAGE"
	done

Route35_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 47, 9, 1, ROUTE_35_GOLDENROD_GATE
	warp_def 47, 10, 2, ROUTE_35_GOLDENROD_GATE
	warp_def 5, 17, 16, MAHOGANYGATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 21, 13, SIGNPOST_READ, Route35Sign
	signpost 42, 8, SIGNPOST_READ, Route35Sign

.ObjectEvents: db 11
	person_event SPRITE_YOUNGSTER, -2, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperIvan, -1
	person_event SPRITE_YOUNGSTER, 29, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperElliot, -1
	person_event SPRITE_LASS, 30, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	person_event SPRITE_LASS, 37, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerPicnickerKim, -1
	person_event SPRITE_YOUNGSTER, 35, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBird_keeperBryan, -1
	person_event SPRITE_FISHER, -2, 2, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	person_event SPRITE_BUG_CATCHER, 18, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBug_catcherArnie1, -1
	person_event SPRITE_SUPER_NERD, 23, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	person_event SPRITE_LASS, 8, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19ca49, -1
	person_event SPRITE_FRUIT_TREE, 38, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x19ca7e, -1
	person_event SPRITE_POKE_BALL, 43, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
