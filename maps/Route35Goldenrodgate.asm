const_value set 2
	const ROUTE35GOLDENRODGATE_OFFICER
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35Goldenrodgate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x69d37:
	faceplayer
;	checkevent EVENT_GOT_HP_UP_FROM_RANDY
;	iftrue .gothpup
;	checkevent EVENT_GAVE_KENYA
;	iftrue .questcomplete
;	checkevent EVENT_GOT_KENYA
;	iftrue .alreadyhavekenya
	checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	iftrue .BeatRocketGateGuard
	opentext
	writetext UnknownText_0x69ddd
;	yesorno
;	iffalse .refused
;	writetext UnknownText_0x69e48
;	buttonsound
;	waitsfx
;	checkcode VAR_PARTYCOUNT
;	if_equal PARTY_LENGTH, .partyfull
;	writetext UnknownText_0x69eb8
;	playsound SFX_KEY_ITEM
;	waitsfx
;	givepoke SPEAROW, 10, NO_ITEM, 1, GiftSpearowName, GiftSpearowOTName
;	givepokeitem GiftSpearowMail
;	setevent EVENT_GOT_KENYA
;.alreadyhavekenya
;	writetext UnknownText_0x69ed6
	waitbutton
	closetext
	end
	
.BeatRocketGateGuard
	opentext
	writetext UnknownText_0x69ddd2
	waitbutton
	closetext
	end

.partyfull
	writetext UnknownText_0x69f56
	waitbutton
	closetext
	end

.refused
	writetext UnknownText_0x69f74
	waitbutton
	closetext
	end

.questcomplete
	writetext UnknownText_0x69f8b
	buttonsound
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext UnknownText_0x69fd9
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db   FLOWER_MAIL
	db   "DARK CAVE leads"
	next "to another road@"
GiftSpearowName:
	db "KENYA@"
GiftSpearowOTName:
	db "RANDY@"

	db 0

PokefanFScript_0x69dc6:
	faceplayer
	opentext
	writetext UnknownText_0x6a00a
	waitbutton
	closetext
	end

.aftersudowoodo
	writetext UnknownText_0x6a09a
	waitbutton
	closetext
	end

FisherScript_0x69dda:
	jumptextfaceplayer UnknownText_0x6a0cb

UnknownText_0x69ddd2:
	text "Wow kid, you beat"
	line "TEAM ROCKET?"
	
	para "Well now I feel"
	line "foolish."
	
	para "If I had known,"
	line "I'd have given them"

	para "A piece of my"
	line "mind!"
	done
	
UnknownText_0x69ddd:
	text "Something's wrong"
	line "in town?"
	
	para "Well I can't do"
	line "anything about it."
	
	para "I just watch this"
	line "gate."
	done

UnknownText_0x69e48:
	text "You will? Perfect!"
	line "Thanks, kid!"

	para "My pal's a chubby"
	line "guy who snoozes"
	cont "all the time."

	para "You'll recognize"
	line "him right away!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> received a"
	line "#MON with MAIL."
	done

UnknownText_0x69ed6:
	text "You can read it,"
	line "but don't lose it!"
	cont "ROUTE 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

UnknownText_0x69f56:
	text "You can't carry"
	line "another #MON…"
	done

UnknownText_0x69f74:
	text "Oh… Never mind,"
	line "then…"
	done

UnknownText_0x69f8b:
	text "Thanks, kid! You"
	line "made the delivery"
	cont "for me!"

	para "Here's something"
	line "for your trouble!"
	done

UnknownText_0x69fd9:
	text "My pal was snooz-"
	line "ing, right? Heh,"
	cont "what'd I say?"
	done

UnknownText_0x6a00a:
	text "I'm going to spend"
	line "some time at the"
	cont "DEPT. STORE."
	
	para "Every region has"
	line "their own massive"
	cont "mall!"
	done

UnknownText_0x6a09a:
	text "I like the #MON"
	line "Lullaby they play"
	cont "on the radio."
	done

UnknownText_0x6a0cb:
	text "Have you ever"
	line "visited a region"
	cont "named KOHTO?"
	
	para "My brother lives"
	line "there, and I hope"
	cont "to see him soon."
	done

Route35Goldenrodgate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 1, ROUTE_35
	warp_def 0, 5, 2, ROUTE_35
	warp_def 7, 4, 18, GOLDENROD_CITY
	warp_def 7, 5, 18, GOLDENROD_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x69d37, -1
	person_event SPRITE_LASS, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x69dc6, -1
	person_event SPRITE_FISHER, 6, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x69dda, -1
