const_value set 2
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER
	const CHERRYGROVECITY_SILVER2

CherrygroveCity_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

;CherrygroveCityGuideGent:
;	faceplayer
;	opentext
;	writetext GuideGentIntroText
;	yesorno
;	iffalse .No
;	jump .Yes
;.Yes:
;	writetext GuideGentTourText1
;	waitbutton
;	closetext
;	playmusic MUSIC_SHOW_ME_AROUND
;	follow CHERRYGROVECITY_GRAMPS, PLAYER
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
;	opentext
;	writetext GuideGentPokeCenterText
;	waitbutton
;	closetext
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
;	spriteface PLAYER, UP
;	opentext
;	writetext GuideGentMartText
;	waitbutton
;	closetext
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
;	spriteface PLAYER, UP
;	opentext
;	writetext GuideGentRoute30Text
;	waitbutton
;	closetext
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
;	spriteface PLAYER, LEFT
;	opentext
;	writetext GuideGentSeaText
;	waitbutton
;	closetext
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
;	spriteface PLAYER, UP
;	pause 60
;	spriteface CHERRYGROVECITY_GRAMPS, LEFT
;	spriteface PLAYER, RIGHT
;	opentext
;	writetext GuideGentGiftText
;	buttonsound
;	stringtotext .mapcardname, $1
;	scall .JumpstdReceiveItem
;	setflag ENGINE_MAP_CARD
;	writetext GotMapCardText
;	buttonsound
;	writetext GuideGentPokegearText
;	waitbutton
;	closetext
;	stopfollow
;	special RestartMapMusic
;	spriteface PLAYER, UP
;	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
;	playsound SFX_ENTER_DOOR
;	disappear CHERRYGROVECITY_GRAMPS
;	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
;	waitsfx
;	end

.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveSilverTriggerSouth:
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER2
	applymovement CHERRYGROVECITY_SILVER2, CherrygroveCity_RivalWalksToYou
	spriteface PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UnknownText_0x19c4e2
	waitbutton
	closetext
	special SpecialNameRival
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
;	spriteface PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER2, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER2
	dotrigger $0
;	reloadmap
;	playmapmusic
	special RestartMapMusic
	end
	
CherrygroveSilverTriggerNorth:
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	spriteface PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UnknownText_0x19c4e2
	waitbutton
	closetext
	special SpecialNameRival
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
;	spriteface PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	dotrigger $0
;	reloadmap
;	playmapmusic
	special RestartMapMusic
	end
;	checkevent EVENT_GOT_TOTODILE_FROM_ELM
;	iftrue .Totodile
;	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
;	iftrue .Chikorita
;	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
;	setlasttalked CHERRYGROVECITY_SILVER
;	loadtrainer RIVAL1, RIVAL1_3
;	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
;	startbattle
;	dontrestartmapmusic
;	reloadmap
;	iftrue .AfterVictorious
;	jump .AfterYourDefeat
;
;.Totodile:
;	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
;	setlasttalked CHERRYGROVECITY_SILVER
;	loadtrainer RIVAL1, RIVAL1_1
;	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
;	startbattle
;	dontrestartmapmusic
;	reloadmap
;	iftrue .AfterVictorious
;	jump .AfterYourDefeat

;.Chikorita:
;	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
;	setlasttalked CHERRYGROVECITY_SILVER
;	loadtrainer RIVAL1, RIVAL1_2
;	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
;	startbattle
;	dontrestartmapmusic
;	reloadmap
;	iftrue .AfterVictorious
;	jump .AfterYourDefeat

;.AfterVictorious:
;	playmusic MUSIC_RIVAL_AFTER
;	opentext
;	writetext CherrygroveRivalText_YouWon
;	waitbutton
;	closetext
;	jump .FinishRival

;.AfterYourDefeat:
;	playmusic MUSIC_RIVAL_AFTER
;	opentext
;	writetext CherrygroveRivalText_YouLost
;	waitbutton
;	closetext
;.FinishRival:
;	playsound SFX_TACKLE
;	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
;	spriteface PLAYER, LEFT
;	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
;	disappear CHERRYGROVECITY_SILVER
;	dotrigger $0
;	special HealParty
;	playmapmusic
;	end

CherrygroveTeacherScript:
;	faceplayer
;	opentext
;	checkflag ENGINE_MAP_CARD
;	iftrue .HaveMapCard
;	writetext CherrygroveTeacherText_NoMapCard
;	waitbutton
;	closetext
	jumptextfaceplayer CherrygroveTeacherText_HaveMapCard
	end

;.HaveMapCard:
;	writetext CherrygroveTeacherText_HaveMapCard
;	waitbutton
;	closetext
;	end

CherrygroveYoungsterScript:
;	faceplayer
;	opentext
;	checkflag ENGINE_POKEDEX
;	iftrue .HavePokedex
;	writetext CherrygroveYoungsterText_NoPokedex
;	waitbutton
;	closetext
	jumptextfaceplayer	CherrygroveYoungsterText_HavePokedex
	end

;.HavePokedex:
;	writetext CherrygroveYoungsterText_HavePokedex
;	waitbutton
;	closetext
;	end

MysticWaterGuy:
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
;	iftrue .After
;	writetext MysticWaterGuyTextBefore
;	buttonsound
;	verbosegiveitem MYSTIC_WATER
;	iffalse .Exit
;	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
;.After:
;	writetext MysticWaterGuyTextAfter
;	waitbutton
;.Exit:
;	closetext
	jumptextfaceplayer MysticWaterGuyTextBefore
	end

TeacherBlackboard:
	faceplayer
	opentext
	writetext TeacherBlackboardText
.Loop:
	loadmenudata .MenuHeader
	_2dmenu
	closewindow
	if_equal $1, .Poison
	if_equal $2, .Paralysis
	if_equal $3, .Sleep
	if_equal $4, .Burn
	if_equal $5, .Freeze
	closetext
	end

.Poison:
	writetext TeacherPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext TeacherParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext TeacherSleepText
	waitbutton
	jump .Loop

.Burn:
	writetext TeacherBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext TeacherFreezeText
	waitbutton
	jump .Loop

.MenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 11 ; end coords
	dw .Data
	db 1 ; default option

.Data:
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(TeacherBlackboard), 0

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"
	
CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokeCenterSign:
	jumpstd pokecentersign

CherrygroveCityMartSign:
	jumpstd martsign
	
CherrygroveCitySignpostDEVScript
	jumptext CherrygroveCitySignpostDEVText

GuideGentMovement1:
	step_left
	step_left
	step_up
	step_left
	turn_head_up
	step_end

GuideGentMovement2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

GuideGentMovement3:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

GuideGentMovement4:
	step_left
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_down
	turn_head_left
	step_end

GuideGentMovement5:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

GuideGentMovement6:
	step_up
	step_up
	step_end

CherrygroveCity_RivalWalksToYou:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step_down
	turn_head_up
	step_end

CherrygroveCity_UnusedMovementData:
	step_left
	turn_head_down
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

TeacherBlackboardText:
	text "Oh, hello!"
	line "I'm a TEACHER."
	
	para "I can tell you"
	line "all about status"
	
	para "effects if you"
	line "like!"
	done

TeacherBlackboardText2:
; unused
	text "Read which topic?"
	done

TeacherPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

TeacherParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

TeacherSleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

TeacherBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

TeacherFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done
	
GuideGentIntroText:
;	text "You're a rookie"
;	line "trainer, aren't"
;	cont "you? I can tell!"
;
;	para "That's OK! Every-"
;	line "one is a rookie"
;	cont "at some point!"
;
;	para "If you'd like, I"
;	line "can teach you a"
;	cont "few things."
;	done

GuideGentTourText1:
;	text "OK, then!"
;	line "Follow me!"
	done

GuideGentPokeCenterText:
;	text "This is a #MON"
;	line "CENTER. They heal"
;
;	para "your #MON in no"
;	line "time at all."
;
;	para "You'll be relying"
;	line "on them a lot, so"
;
;	para "you better learn"
;	line "about them."
	done

GuideGentMartText:
;	text "This is a #MON"
;	line "MART."
;
;	para "They sell BALLS"
;	line "for catching wild"
;
;	para "#MON and other"
;	line "useful items."
	done

GuideGentRoute30Text:
;	text "ROUTE 30 is out"
;	line "this way."
;
;	para "Trainers will be"
;	line "battling their"
;
;	para "prized #MON"
;	line "there."
	done

GuideGentSeaText:
;	text "This is the sea,"
;	line "as you can see."
;
;	para "Some #MON are"
;	line "found only in"
;	cont "water."
	done

GuideGentGiftText:
;	text "Here…"
;
;	para "It's my house!"
;	line "Thanks for your"
;	cont "company."
;
;	para "Let me give you a"
;	line "small gift."
	done

GotMapCardText:
;	text "<PLAYER>'s #GEAR"
;	line "now has a MAP!"
	done

GuideGentPokegearText:
;	text "#GEAR becomes"
;	line "more useful as you"
;	cont "add CARDS."
;
;	para "I wish you luck on"
;	line "your journey!"
;	done

GuideGentNoText:
;	text "Oh… It's something"
;	line "I enjoy doing…"
;
;	para "Fine. Come see me"
;	line "when you like."
;	done

UnknownText_0x19c4e2:
	text "Man are you slow."
	line "I hung back a bit"
	cont "to make you feel"
	cont "better."
	
	para "I'll let you know"
	line "a little secret."
	
	para "If you hold B you"
	line "can use RUNNING"
	cont "SHOES!"
	
	para "Aren't you glad I"
	line "told you that?"
	
	para "They don't call me"
	line "SPEEDY-"
	done

SilverCherrygroveWinText:
	text "Humph. Are you"
	line "happy you won?"
	done

CherrygroveRivalText_YouLost:
	done

SilverCherrygroveLossText:
	text "Humph. That was a"
	line "waste of time."
	done

CherrygroveRivalText_YouWon:
	text "They don't call me"
	line "SPEEDY <RIVAL>"
	cont "for nothing!"
	cont "Smell ya later!"
	done

CherrygroveTeacherText_NoMapCard:
	text "Did you talk to"
	line "the old man by the"
	cont "#MON CENTER?"

	para "He'll put a MAP of"
	line "JOHTO on your"
	cont "#GEAR."
	done

CherrygroveTeacherText_HaveMapCard:
	text "Well aren't you a"
	line "cute little"
	cont "trainer?"
	
	para "I was cute once,"
	line "too!"
	done

CherrygroveYoungsterText_NoPokedex:
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Whenever my"
	line "#MON get hurt,"
	
	para "I take them to a"
	line "#MON CENTER."
	
	para "They can heal them"
	line "to perfect health"
	cont "for free!"
	done

MysticWaterGuyTextBefore:
	text "I live to explore!"
	line "And I explore to"
	cont "live!"
	
	para "The beginning of a"
	line "journey,"
	
	para "ah, it fills me"
	line "joy!"
	done

MysticWaterGuyTextAfter:
	text "Back to fishing"
	line "for me, then."
	done

CherrygroveCitySignText:
	text "SILVERLEAF TOWN"

	para "As Delicate as"
	line "Nature"
	done

GuideGentsHouseSignText:
	text "<RIVAL>'S HOUSE"
	done
	
CherrygroveCitySignpostDEVText:
	text "Dev Diary 2"
	para "The 27th of JUNE"
	line "2016"
	
	para "I recently ann-"
	line "ounced that"
	
	para "#MON BRONZE 2"
	line "was in devel-"
	cont "opment."
	
	para "So far nobody has"
	line "asked me when a"
	
	para "beta version will"
	line "be released."
	
	para "Nobody has asked"
	line "for a .jar either,"	
	cont "but that'll come."
	
	para "I know it will."
	
	para "I also wonder how"
	line "many people will"
	
	para "find these dia-"
	line "ries."
	
	para "let me know if"
	line "you did!"
	
	para "-FREAKO out."
	done

CherrygroveCity_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 11, 11, 2, CHERRYGROVE_MART
	warp_def 3, 21, 1, CHERRYGROVE_POKECENTER_1F
	warp_def 7, 21, 1, CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def 17, 15, 1, GUIDE_GENTS_HOUSE
	warp_def 11, 35, 1, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	warp_def 3, 39, 1, MR_POKEMONS_HOUSE

.CoordEvents: db 2
	xy_trigger 1, 14, 38, 0, CherrygroveSilverTriggerNorth, 0, 0
	xy_trigger 1, 15, 38, 0, CherrygroveSilverTriggerSouth, 0, 0

.BGEvents: db 5
	signpost 12, 20, SIGNPOST_READ, CherrygroveCitySign
	signpost 5, 41, SIGNPOST_READ, GuideGentsHouseSign
	signpost 11, 12, SIGNPOST_READ, CherrygroveCityMartSign
	signpost 3, 22, SIGNPOST_READ, CherrygroveCityPokeCenterSign
	signpost 3, 20, SIGNPOST_READ, CherrygroveCitySignpostDEVScript

.ObjectEvents: db 6
	person_event SPRITE_SILVER, 14, 44, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	person_event SPRITE_TEACHER, 13, 33, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 5, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	person_event SPRITE_FISHER, 12, 24, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MysticWaterGuy, -1
	person_event SPRITE_SILVER, 15, 44, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	person_event SPRITE_TEACHER, 14, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherBlackboard, -1
