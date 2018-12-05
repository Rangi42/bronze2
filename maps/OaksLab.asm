const_value set 2
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3
	const OAKSLAB_BALL1
	const OAKSLAB_BALL2
	const OAKSLAB_BALL3

OaksLab_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

.DummyTrigger:
	end

OakBall1: ;Squirtle
	checkevent EVENT_KOA_POKEMON_TAKEN
	iftrue KoaBallTaken
	checkevent EVENT_KOA_PICKING_POKEMON_ACVIATED
	iftrue KoaPickingTotodile
	opentext
	writetext OakBallsText
	waitbutton
	closetext
	end
	
KoaPickingTotodile
	spriteface OAKSLAB_OAK, DOWN
	refreshscreen $0
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodile2Text
	yesorno
	iffalse DidntChoose2ndStarterScript
	checkcode VAR_PARTYCOUNT
	if_greater_than 5, OakPartyFull
	givepoke TOTODILE, 18
	disappear OAKSLAB_BALL1
	writetext KoaGotTotodileText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	setevent EVENT_KOA_POKEMON_TAKEN
	setevent EVENT_TOOK_TOTODILE
	end
	
OakBall2: ;Charmander
	checkevent EVENT_KOA_POKEMON_TAKEN
	iftrue KoaBallTaken
	checkevent EVENT_KOA_PICKING_POKEMON_ACVIATED
	iftrue KoaPickingCYNDAQUIL
	opentext
	writetext OakBallsText
	waitbutton
	closetext
	end
	
KoaPickingCYNDAQUIL
	spriteface OAKSLAB_OAK, DOWN
	refreshscreen $0
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCYNDAQUIL2Text
	yesorno
	iffalse DidntChoose2ndStarterScript
	checkcode VAR_PARTYCOUNT
	if_greater_than 5, OakPartyFull
	givepoke CYNDAQUIL, 18
	disappear OAKSLAB_BALL2
	writetext KoaGotCyndaquilText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	setevent EVENT_KOA_POKEMON_TAKEN
	setevent EVENT_TOOK_CYNDAQUIL
	end
	
OakBall3: ;Bulbasaur
	checkevent EVENT_KOA_POKEMON_TAKEN
	iftrue KoaBallTaken
	checkevent EVENT_KOA_PICKING_POKEMON_ACVIATED
	iftrue KoaPickingCHIKORITA
	opentext
	writetext OakBallsText
	waitbutton
	closetext
	end
	
KoaPickingCHIKORITA
	spriteface OAKSLAB_OAK, DOWN
	refreshscreen $0
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikorita2Text
	yesorno
	iffalse DidntChoose2ndStarterScript
	checkcode VAR_PARTYCOUNT
	if_greater_than 5, OakPartyFull
	givepoke CHIKORITA, 18
	disappear OAKSLAB_BALL3
	writetext KoaGotChikoritaText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	setevent EVENT_KOA_POKEMON_TAKEN
	setevent EVENT_TOOK_CHIKORITA
	end

KoaBallTaken:
	opentext
	writetext KoaCantGetGreedyText
	waitbutton
	closetext
	end

DidntChoose2ndStarterScript:
	writetext KoaMakeCarefulChoice
	waitbutton
	closetext
	end

OakPartyFull:
	writetext OakPartyFullText
	waitbutton
	closetext
	end
	
Oak:
	faceplayer
	opentext
	checkevent EVENT_KOA_POKEMON_TAKEN
	iftrue KoaNoMoreEvents
	checkevent EVENT_KOA_PICKING_POKEMON_ACVIATED
	iftrue KoaGoOnPickPoke
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .AlreadyGotHMTakeAPokemon
;	checkevent EVENT_OPENED_MT_SILVER
;	iftrue .CheckPokedex
;	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
;	iftrue .CheckBadges
;	writetext OakWelcomeKantoText
;	buttonsound
;	setevent EVENT_TALKED_TO_OAK_IN_KANTO
;.CheckBadges:
;	checkcode VAR_BADGES
;	if_equal 16, .OpenMtSilver
;	if_equal  8, .Complain
;	jump .AhGood
; Things were added here
	writetext MeetingKoa
	buttonsound
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	writetext MeetingKoa2
	waitbutton
	closetext
	end

.AlreadyGotHMTakeAPokemon
	writetext OakOhTheseBallsText ;AlreadyGotHMText
	setevent EVENT_KOA_PICKING_POKEMON_ACVIATED
	waitbutton
	closetext
	end
	
.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	buttonsound
	setevent EVENT_OPENED_MT_SILVER
	jump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	buttonsound
	jump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	buttonsound
	jump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

KoaGoOnPickPoke:
	writetext KoaGoOnPickPokeText
	waitbutton 
	closetext
	end

KoaNoMoreEvents:
	writetext KoaNoMoreEventsText
	waitbutton
	closetext
	end

OakPartyFullText:
	text "KOA: Oh no, your"
	line "party appears to"
	cont "be full!"
	done
	
KoaGotChikoritaText:
	text "<PLAYER> received"
	line "CHIKORITA!"
	done
	
KoaGotTotodileText:
	text "<PLAYER> received"
	line "TOTODILE!"
	done
	
KoaGotCyndaquilText:
	text "<PLAYER> received"
	line "CYNDAQUIL!"
	done
	
TakeTotodile2Text:
	text "KOA: Do you want"
	line "TOTODILE, the"
	
	para "water-type #-"
	line "MON?"
	done
	
TakeCYNDAQUIL2Text:
	text "KOA: Do you want"
	line "CYNDAQUIL, the"
	
	para "fire-type #-"
	line "MON?"
	done
	
TakeChikorita2Text:
	text "KOA: Do you want"
	line "CHIKORITA, the"
	
	para "grass-type #-"
	line "MON?"
	done
	
KoaMakeCarefulChoice:
	text "KOA: That's okay."
	line "choose carefully!"
	done
	
KoaGoOnPickPokeText:
	text "KOA: Go on, pick a"
	line "#MON!"
	done
	
OakBallsText:
	text "It's a #-"
	line "BALL with a #-"
	cont "MON inside."
	done
	
KoaCantGetGreedyText:
	text "Oh! I can't get"
	line "greedy!"
	done
	
OakOhTheseBallsText:
	text "KOA: Oh, these"
	line "# BALLS?"
	
	para "They have rare"
	line "#MON inside"
	cont "them."
	
	para "………"
	
	para "Oh, you would like"
	line "one?"
	
	para "Well, I guess…"
	
	para "I do think you"
	line "deserve some"
	
	para "rare #MON with"
	line "all you've done."
	
	para "I've been keeping"
	line "up with the news."
	
	para "Go ahead, pick"
	line "one!"
	done
	
MeetingKoa:
	text "KOA: Oh, who might"
	line "you be?"

	para "<PLAYER> from"
	line "JANTO?"
	
	para "Ah yes, my assos-"
	line "iate PROF.ALDER"
	cont "mentioned you."
	
	para "Ah, I have a gift"
	line "for you!"
	done	
	
MeetingKoa2:
	text "That HM teaches"
	line "WHIRLPOOL."
	
	para "It's a strategic"
	line "attack that can"
	cont "trap your foe."
	
	para "It can also be"
	line "used to pass"
	
	para "WHIRLPOOLS you"
	line "come across"
	cont "in the ocean."
	done
	
KoaNoMoreEventsText:
	text "KOA: Keep up the"
	line "good work,"
	cont "<PLAYER>!"
	done
	
OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "We're always very"
	line "busy here."
	
	para "Much research to"
	line "be done!"
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "I've made some"
	line "great advances in"
	
	para "#MON research"
	line "over the past"
	
	para "week that I'll be"
	line "sure to share with"
	cont "you soon."
	
	para "Oh, did you happen"
	line "to meet <PLAYER>?"
	
	para "They might be ar-"
	line "ound to see you"
	cont "soon!"

	para "PROF.ALDER in OLD"
	line "OAK TOWN 8-D"
	done

OaksLab_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 11, 4, 3, PALLET_TOWN
	warp_def 11, 5, 3, PALLET_TOWN

.CoordEvents: db 0

.BGEvents: db 16
	signpost 1, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 0, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 1, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 2, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 3, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 0, 4, SIGNPOST_READ, OaksLabPoster1
	signpost 0, 5, SIGNPOST_READ, OaksLabPoster2
	signpost 3, 9, SIGNPOST_READ, OaksLabTrashcan
	signpost 1, 2, SIGNPOST_READ, OaksLabPC

.ObjectEvents: db 7
	person_event SPRITE_OAK, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Oak, -1
	person_event SPRITE_SCIENTIST, -5, -3, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	person_event SPRITE_SCIENTIST, 8, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	person_event SPRITE_SCIENTIST, -6, -6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OakBall1, EVENT_TOOK_TOTODILE
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OakBall2, EVENT_TOOK_CYNDAQUIL
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OakBall3, EVENT_TOOK_CHIKORITA
