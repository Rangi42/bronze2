const_value set 2
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x18e154

UnknownScript_0x18e154:
	return

UnknownScript_0x18e16f:
UnknownScript_0x18e177:
	return

KurtScript_0x18e178:
	faceplayer
	opentext
	writetext UnknownText_0x18e473
	waitbutton
	closetext
	end

.RunAround:
	end

.ClearedSlowpokeWell:
.GotLureBall:
.NoGSBall:
.CheckApricorns:
	end

.IMakeBallsFromApricorns:
	end

.AskApricorn:
; .Red
.Blu:
.Ylw:

.Grn:

.Wht:

.Blk:

.Pnk:

.GaveKurtApricorns:
.WaitForApricorns:
	end

.Cancel:
	end

._ThatTurnedOutGreat:
.ThatTurnedOutGreat:
.NoRoomForBall:
	end

.GiveLevelBall:

.GiveLureBall:

.GiveMoonBall:

.GiveFriendBall:

.GiveFastBall:

.GiveHeavyBall:

.GiveLoveBall:

.CanGiveGSBallToKurt:
	end

.GaveGSBallToKurt:
	end

.NotMakingBalls:

.GSBallRunAround:
.KurtHasLeftTheBuilding:
	end

KurtScript_0x18e3bd:
	faceplayer
	opentext
	writetext UnknownText_0x18e7d8
	waitbutton
	closetext
	end

Script_FirstTimeBuggingKurt:
	end

KurtScript_ImCheckingItNow:
	end

KurtsGranddaughter1:
	faceplayer
	opentext
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue .SlowpokeBack
	writetext KurtsGranddaughterSlowpokeGoneText
	waitbutton
	closetext
	end

.SlowpokeBack:
	opentext
	writetext KurtsGranddaughterSavedText
	waitbutton
	closetext
	end

.Lonely:
	end

.Dad:
	end

KurtsGranddaughter2:
	faceplayer
	opentext
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	end

.GSBall:
	end

KurtsGranddaughterFunScript:
	opentext
	writetext KurtsGranddaughterFunText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	faceplayer
	opentext
	writetext KurtsHouseSlowpokeText
	cry CUBONE
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2

MovementData_0x18e466:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x18e46c:
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

UnknownText_0x18e473:
	text "Meditation is the"
	line "key to forming"
	cont "the best stratagy."
	done

UnknownText_0x18e615:
	text "KURT: Hi, <PLAYER>!"

	para "You handled your-"
	line "self like a real"
	cont "hero at the WELL."

	para "I like your style!"

	para "I would be honored"
	line "to make BALLS for"

	para "a trainer like"
	line "you."

	para "This is all I have"
	line "now, but take it."
	done

UnknownText_0x18e6c9:
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make BALLS"
	line "out of them."
	done

UnknownText_0x18e736:
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll turn it"
	line "into a BALL."
	done

UnknownText_0x18e779:
	text "KURT: It'll take a"
	line "day to make you a"

	para "BALL. Come back"
	line "for it later."
	done

UnknownText_0x18e7bc:
	text "KURT: Oh…"
	line "That's a letdown."
	done

UnknownText_0x18e7d8:
	text "Hey! You're inter-"
	line "upting our karate"
	cont "lesson!"
	
	para "I'm just getting"
	line "some books out for"
	cont "my pupil!"
	done

UnknownText_0x18e7fb:
	text "KURT: Ah, <PLAYER>!"
	line "I just finished"
	cont "your BALL. Here!"
	done

UnknownText_0x18e82a:
	text "KURT: That turned"
	line "out great."

	para "Try catching"
	line "#MON with it."
	done

UnknownText_0x18e863:
	text "KURT: Now that my"
	line "granddaughter is"

	para "helping me, I can"
	line "work much faster."
	done

UnknownText_0x18e8ab:
	text "Wh-what is that?"

	para "I've never seen"
	line "one before."

	para "It looks a lot"
	line "like a # BALL,"

	para "but it appears to"
	line "be something else."

	para "Let me check it"
	line "for you."
	done

UnknownText_0x18e934:
	text "I'm checking it"
	line "now."
	done

UnknownText_0x18e949:
	text "Ah-ha! I see!"
	line "So…"
	done

UnknownText_0x18e95c:
	text "<PLAYER>!"

	para "This BALL started"
	line "to shake while I"
	cont "was checking it."

	para "There must be"
	line "something to this!"
	done

KurtsGranddaughterSlowpokeGoneText:
	text "My mommy said"
	line "there were bad"
	
	para "people taking kids"
	line "away."
	
	para "She's keeping a"
	line "look out, outisde."
	done
	
KurtsGranddaughterSavedText:
	text "You stopped the"
	line "bad people my"
	
	para "mommy was talking"
	line "about?"
	cont "Wow, I like heros!"
	done

KurtsGranddaughterLonelyText:
	text "Grandpa's gone…"
	line "I'm so lonely…"
	done

KurtsGranddaughterSlowpokeBackText:
	text "The SLOWPOKE my"
	line "dad gave me came"

	para "back! Its TAIL is"
	line "growing back too!"
	done

KurtsGranddaughterDadText:
	text "Dad works at SILPH"
	line "where he studies"
	cont "# BALLS."

	para "I have to stay"
	line "home with Grandpa"
	cont "and SLOWPOKE."
	done

KurtsGranddaughterHelpText:
	text "All the dudes at"
	line "work are gonna see"
	
	para "my true power when"
	line "I become a BLACK-"
	cont "BELT!"
	done

KurtsGranddaughterFunText:
	text "It's fun to make"
	line "BALLS!"
	done

KurtsGranddaughterGSBallText:
	text "Grandpa's checking"
	line "a BALL right now."

	para "So I'm waiting"
	line "till he's done."
	done

KurtsHouseSlowpokeText:
	text "CUBONE: CUUUEE!"
	done

KurtsHouseOakPhotoText:
	text "…A young PROF."
	line "OAK?"
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done

KurtsHouse_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 7, 3, 4, AZALEA_TOWN
	warp_def 7, 4, 4, AZALEA_TOWN
	warp_def 7, 17, 13, AZALEA_TOWN
	warp_def 7, 18, 13, AZALEA_TOWN
	warp_def 23, 3, 14, AZALEA_TOWN
	warp_def 23, 4, 14, AZALEA_TOWN

.CoordEvents: db 0

.BGEvents: db 7
	signpost -4, 6, SIGNPOST_READ, KurtsHouseRadio
	signpost -4, 8, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost -4, 9, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost -4, 5, SIGNPOST_READ, KurtsHouseBookshelf
	signpost -4, 2, SIGNPOST_READ, KurtsHouseBookshelf
	signpost -4, 3, SIGNPOST_READ, KurtsHouseBookshelf
	signpost -4, 4, SIGNPOST_READ, KurtsHouseCelebiStatue

.ObjectEvents: db 5
	person_event SPRITE_SAGE, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KurtScript_0x18e178, -1
	person_event SPRITE_TWIN, 5, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtsGranddaughter1, -1
	person_event SPRITE_MONSTER, 5, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KurtsHouseSlowpoke, -1
	person_event SPRITE_BLACK_BELT, 16, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KurtScript_0x18e3bd, -1
	person_event SPRITE_COOLTRAINER_M, 17, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtsGranddaughter2, -1
