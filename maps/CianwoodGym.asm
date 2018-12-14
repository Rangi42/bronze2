const_value set 2
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ChuckScript_0x9d60f:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
;	spriteface CIANWOODGYM_CHUCK, RIGHT
;	opentext
;	writetext ChuckIntroText2
;	waitbutton
;	closetext
;	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
;	playsound SFX_STRENGTH
;	earthquake 80
;	disappear CIANWOODGYM_BOULDER1
;	pause 30
;	faceplayer
;	opentext
;	writetext ChuckIntroText3
;	waitbutton
;	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	checkcode VAR_BADGES
	scall CianwoodGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_RAIN_DANCE
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer EVENT_BEAT_BLACKBELT_YOSHI, SAILOR, EUSTICE, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer EVENT_BEAT_BLACKBELT_LAO, SAILOR, DONNIE, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer EVENT_BEAT_BLACKBELT_NOB, SAILOR, FERNANDO, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer EVENT_BEAT_BLACKBELT_LUNG, SAILOR, JACKSON, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CHUCK, 1, $1
	jumpstd gymstatue2

CianwoodGymGuy2:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript2
	opentext
	writetext CianwoodGymGuyText2
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript2:
	opentext
	writetext CianwoodGymGuyWinText2
	waitbutton
	closetext
	end
	
CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step_left
	big_step_up
	fast_jump_step_right
	remove_sliding
	step_end

CianwoodGymGuyText2:
	text "Hi <PLAYER>!"
	line "CORALINE here"
	
	para "doesn't splash"
	line "about!"
	
	para "She's a strong"
	line "swimmer with a"
	cont "heart of ice."
	
	para "Some grass-type"
	line "#MON 'aught"
	cont "to help you out."
	done
	
CianwoodGymGuyWinText2:
	text "A true clash"
	line "of the titans!"
	
	para "I loved watching"
	line "you two battle."
	done
	
ChuckIntroText1:
	text "Pleasure to meet"
	line "you, my dear."
	
	para "I am CORALINE,"
	line "and the ocean is"
	cont "my specialty."
	
	para "If you dare to"
	line "swim with me,"
	
	para "I'd be delighted"
	line "to show you some"
	cont "new moves."
	
	para "Ahoho. Let the"
	line "battle begin!"
	done

ChuckIntroText2:
	text "CHUCK: Urggh!"
	line "…"

	para "Oooarrgh!"
	done

ChuckIntroText3:
	text "There! Scared now,"
	line "are you?"

	para "What?"
	line "It has nothing to"

	para "do with #MON?"
	line "That's true!"

	para "Come on. We shall"
	line "do battle!"
	done

ChuckLossText:
	text "Ahoho, dear me."
	line "looks like some-"
	
	para "body is worthy of"
	line "the WAVEBADGE."
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "WAVEBADGE."
	done

ChuckExplainBadgeText:
	text "WAVEBADGE makes"
	line "every #MON"

	para "up to L70 obey,"
	line "even traded ones."

	para "Here, you can also"
	line "have this."
	done

ChuckExplainTMText:
	text "That is RAIN"
	line "DANCE."
	
	para "A move that powers"
	line "up water-type"
	cont "moves."
	cont "Delightful!"
	done

ChuckAfterText:
	text "It was a pleasure"
	line "to battle with"
	cont "you, child."
	
	para "We shall meet"
	line "again. Ahoho!"
	done

BlackbeltYoshiSeenText:
	text "It's a cool day"
	line "for swimming."
	cont "Come get wet!"
	done

BlackbeltYoshiBeatenText:
	text "Lifeguard!"
	done

BlackbeltYoshiAfterText:
	text "The way your #-"
	line "MOM fought… it's"
	cont "enchanting."
	done

BlackbeltLaoSeenText:
	text "There's nothing"
	line "cool about losing."
	done

BlackbeltLaoBeatenText:
	text "I've been stung!"
	done

BlackbeltLaoAfterText:
	text "You're hot"
	line "stuff!"
	done

BlackbeltNobSeenText:
	text "You better tread"
	line "lightly around"
	cont "these parts."
	done

BlackbeltNobBeatenText:
	text "I'm all washed"
	line "up!"
	done

BlackbeltNobAfterText:
	text "I'm speechless."
	line "I lost!"
	done

BlackbeltLungSeenText:
	text "My raging waters"
	line "will drown you at"
	cont "sea."
	done

BlackbeltLungBeatenText:
	text "Gargle!"
	done

BlackbeltLungAfterText:
	text "My #MON tried"
	line "their best."
	cont "I'll keep swimming."
	done

CianwoodGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 4, 2, OLIVINE_CITY
	warp_def 19, 5, 2, OLIVINE_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 17, 3, SIGNPOST_READ, CianwoodGymStatue
	signpost 17, 6, SIGNPOST_READ, CianwoodGymStatue

.ObjectEvents: db 7
	person_event SPRITE_CHUCK, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ChuckScript_0x9d60f, -1
	person_event SPRITE_SAILOR, 9, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBlackbeltYoshi, -1
	person_event SPRITE_SAILOR, 14, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBlackbeltLao, -1
	person_event SPRITE_SAILOR, 6, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	person_event SPRITE_SAILOR, 8, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	person_event SPRITE_GYM_GUY, 17, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianwoodGymGuy2, -1
;	person_event SPRITE_BOULDER, -4, -5, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
;	person_event SPRITE_BOULDER, -4, -3, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
;	person_event SPRITE_BOULDER, -4, -6, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
