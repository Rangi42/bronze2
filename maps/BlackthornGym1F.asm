const_value set 2
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

	; callbacks
;	dbw MAPCALLBACK_TILES, .Boulders

;.Boulders:
;	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
;	iffalse .skip1
;	changeblock $8, $2, $3b
;.skip1
;	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
;	iffalse .skip2
;	changeblock $2, $4, $3a
;.skip2
;	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
;	iffalse .skip3
;	changeblock $8, $6, $3b
;.skip3
;	return

BlackthornGymClairScript:
	faceplayer
	opentext
	checkcode VAR_BADGES
	if_less_than 7, .YouAreNotReady
;	checkflag ENGINE_RISINGBADGE
;	checkevent EVENT_BEAT_CLAIR
;	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext RecievedRisingBadge
	playsound SFX_GET_BADGE
	specialphonecall SPECIALCALL_ROBBED
	waitsfx
	setflag ENGINE_RISINGBADGE
	waitbutton
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_CERULEAN_GYM_ROCKET
	jump .AlreadyGotBadge
;	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
;	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.YouAreNotReady
	writetext FinalGymNotReadyText
	waitbutton
	closetext
	end
		
.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	buttonsound
	giveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	itemtotext TM_DRAGONBREATH, $0
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	buttonsound
	jump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer EVENT_BEAT_COOLTRAINERM_PAUL, BLACKBELT_T, WAN, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, CooltrainermPaulScript

CooltrainermPaulScript:
	end_if_just_battled
	opentext
	writetext CooltrainermPaulAfterText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer EVENT_BEAT_COOLTRAINERM_MIKE, BLACKBELT_T, HAMATO, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, CooltrainermMikeScript

CooltrainermMikeScript:
	end_if_just_battled
	opentext
	writetext CooltrainermMikeAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer EVENT_BEAT_COOLTRAINERF_LOLA, BLACKBELT_T, LENI, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, CooltrainerfLolaScript

CooltrainerfLolaScript:
	end_if_just_battled
	opentext
	writetext CooltrainerfLolaAfterText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CLAIR, 1, $1
	jumpstd gymstatue2

RecievedRisingBadge:
	text "<PLAYER> received"
	line "BREAKBADGE."
	done

FinalGymNotReadyText:
	text "You've come to"
	line "challenge me?"
	
	para "Well it seems"
	line "like you haven't"
	
	para "collected all"
	line "the previous"
	cont "BADGES."
	
	para "Come back when"
	line "you have them"
	
	para "all, and then"
	line "maybe I'll battle"
	cont "you."
	done
	
ClairIntroText:
	text "I am HARKEN."
	
	para "One of the"
	line "strongest trainers"
	cont "in JANTO."
	cont "If not--the world."
	
	para "You'd have to be"
	line "joking if you"
	
	para "think a mere child"
	line "like yourself"
	
	para "could ever defeat"
	line "me."
	
	para "……"
	
	para "Huh… you don't"
	line "seem even the"
	cont "least bit scared."
	
	para "Pfft. Probably"
	line "just an act."
	
	para "Don't worry, I"
	line "will dispose of"
	cont "you quickly."
	
	para "You'll never see"
	line "the ELITE FOUR."
	done

ClairWinText:
	text "Wuh-huh-buh-what!?"
	
	para "Preposterous!"
	
	para "Inconceivable!"
	
	para "……………"
	line "……………"	
	cont "…Sigh…"
	
	para "You have earned"
	line "this BADGE."
	done

ClairText_GoToDragonsDen:
	text "I won't admit"
	line "this."

	para "I may have lost,"
	line "but you're still"

	para "not ready for the"
	line "#MON LEAGUE."

	para "I know. You should"
	line "take the dragon"
	cont "user challenge."

	para "Behind this GYM is"
	line "a place called"
	cont "DRAGON'S DEN."

	para "There is a small"
	line "shrine at its"

	para "center."
	line "Go there."

	para "If you can prove"
	line "that you've lost"

	para "your lazy ideals,"
	line "I will recognize"

	para "you as a trainer"
	line "worthy of a GYM"
	cont "BADGE!"
	done

ClairText_TooMuchToExpect:
	text "Don't you dare"
	line "fail."
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "With the BREAK-"
	line "BADGE, all #MON"
	
	para "will obey you"
	line "without question."
	
	para "Nothing is off"
	line "limits for you."
	
	para "You may also have"
	line "this."
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> received"
	line "TM01."
	done

BlackthornGymClairText_DescribeTM24:
	text "TM01 is DYNAMIC-"
	line "PUNCH."

	para "A powerful punch"
	line "that hits so hard"
	
	para "it may make the"
	line "foe confused."
	cont "What a wallop!"
	done

BlackthornGymClairText_BagFull:
	text "What is this? You"
	line "don't have room?"
	done

BlackthornGymClairText_League:
	text "Well, <PLAYER>."
	
	para "the only place for"
	line "you to go now is"
	cont "the ELITE FOUR."
	
	para "If you beat them,"
	line "you can take on"
	cont "the CHAMPION."
	
	para "If you don't know"
	line "where it is, you"
	
	para "just have to take"
	line "the route west of"
	cont "SILVERLEAF TOWN."

	para "Give it your all,"
	line "or I'll be furious"
	
	para "about losing to"
	line "you."
	done

CooltrainermPaulSeenText:
	text "Hoo-ah!"
	line "I am so pumped"
	cont "to pummel!"
	done

CooltrainermPaulBeatenText:
	text "Arugh! Cramps!"
	done

CooltrainermPaulAfterText:
	text "I can't believe"
	line "I lost to you."
	done

CooltrainermMikeSeenText:
	text "You're not in a"
	line "safe place right"
	cont "now, kiddo."
	done

CooltrainermMikeBeatenText:
	text "Guh-what!?"
	done

CooltrainermMikeAfterText:
	text "You really showed"
	line "me up, kid."
	
	para "I shouldn't judge"
	line "people by their"
	cont "cover."
	done

CooltrainerfLolaSeenText:
	text "Here comes the"
	line "quadruple-kick!"
	
	para "You'll be crying"
	line "for your mama!"
	done

CooltrainerfLolaBeatenText:
	text "Ouch, man!"
	done

CooltrainerfLolaAfterText:
	text "I'm just, really"
	line "hurt right now."
	done

BlackthornGymGuyText:
	text "Yo! CHAMP to"
	line "be!"

	para "You've been through"
	line "a lot of GYMs,"
	
	para "and you're almost"
	line "to the top!"
	
	para "If you want a"
	line "fighting chance"
	
	para "against these"
	line "fighting-type"
	
	para "#MON, you'll"
	line "need fists of rock"
	cont "and steel!"
	done

BlackthornGymGuyWinText:
	text "I'm so impressed"
	line "that you beat"
	cont "HARKEN!" 

	para "All that's left to"
	line "do is the #MON"
	cont "LEAGUE challenge."

	para "I can't believe I'm"
	line "witnessing the"

	para "birth of a new"
	line "CHAMPION!"
	done

BlackthornGym1F_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 17, 4, 1, BLACKTHORN_CITY
	warp_def 17, 5, 1, BLACKTHORN_CITY
	warp_def 2, 7, 1, BLACKTHORN_GYM_2F
	warp_def 3, 13, 4, BLACKTHORN_GYM_2F
	warp_def 18, 17, 3, BLACKTHORN_GYM_2F
	warp_def 18, 14, 4, BLACKTHORN_GYM_2F
	warp_def 18, 18, 5, BLACKTHORN_GYM_2F

.CoordEvents: db 0

.BGEvents: db 2
	signpost 15, 3, SIGNPOST_READ, BlackthornGymStatue
	signpost 15, 6, SIGNPOST_READ, BlackthornGymStatue

.ObjectEvents: db 5
	person_event SPRITE_CLAIR, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	person_event SPRITE_BLACK_BELT, 7, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	person_event SPRITE_BLACK_BELT, 10, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	person_event SPRITE_BLACK_BELT, 5, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
