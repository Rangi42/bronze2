;
;
;	ADD A HIDDEN ITEM TO PAST LAKE
;
;


const_value set 2
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_POKEFAN_M2

MahoganyTown_MapScriptHeader:
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
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyHeadbuttGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext MahoganyHeadbuttGuyText1
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
	writetext MahoganyHeadbuttGuyText2
	waitbutton
	closetext
	spriteface MAHOGANYTOWN_POKEFAN_M2, DOWN
	end
.AlreadyGotHeadbutt:
	writetext MahoganyHeadbuttGuyText2
	waitbutton
	closetext	
	spriteface MAHOGANYTOWN_POKEFAN_M2, DOWN
	end
.BagFull:
	closetext
	end
	
UnknownScript_0x190013:
;	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
;	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900a9
;	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
;	applymovement PLAYER, MovementData_0x1900a7
;	stopfollow
;	spriteface PLAYER, RIGHT
;	scall UnknownScript_0x19002f
;	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900ad
	end

PokefanMScript_0x19002e:
;	faceplayer
;UnknownScript_0x19002f:
;	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
;	iftrue UnknownScript_0x190039
;	scall UnknownScript_0x190040
	jumptextfaceplayer PokefanMahoganyText
	end

UnknownScript_0x190039:
	opentext
	writetext UnknownText_0x1901a6
	waitbutton
	closetext
	end

UnknownScript_0x190040:
	opentext
	writetext UnknownText_0x1900b0
	special PlaceMoneyTopRight
	yesorno
	iffalse UnknownScript_0x190072
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x19006c
	giveitem RAGECANDYBAR
	iffalse UnknownScript_0x190078
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 300
	special PlaceMoneyTopRight
	writetext UnknownText_0x19014a
	waitbutton
	closetext
	end

UnknownScript_0x19006c:
	writetext UnknownText_0x19015b
	waitbutton
	closetext
	end

UnknownScript_0x190072:
	writetext UnknownText_0x190178
	waitbutton
	closetext
	end

UnknownScript_0x190078:
	writetext UnknownText_0x190188
	waitbutton
	closetext
	end

GrampsScript_0x19007e:
	faceplayer
	opentext
	writetext OldManResturauntClue
	waitbutton
	closetext
	end

UnknownScript_0x19008c:
	writetext UnknownText_0x19021d
	waitbutton
	closetext
	end

FisherScript_0x190092:
	jumptextfaceplayer UnknownText_0x190276

LassScript_0x190095:
	jumptextfaceplayer UnknownText_0x1902f2

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokeCenterSign:
	jumpstd pokecentersign

MahoganyTownSignpostDEVScript:
	jumptext MahoganyTownSignpostDEVText

MahoganyTowneMartSign:
	jumpstd martsign
	
MovementData_0x1900a4:
	step_down
	big_step_up
	turn_head_down
MovementData_0x1900a7:
	step_left
	step_end

MovementData_0x1900a9:
	step_right
	step_down
	turn_head_left
	step_end

MovementData_0x1900ad:
	step_up
	turn_head_down
	step_end

MahoganyHeadbuttGuyText1:
	text "Wah! You found me."
	
	para "I've been headbutt-"
	line "ing trees for"

	para "#MON using"
	line "HEADBUTT!"
	done

MahoganyHeadbuttGuyText2:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	
	para "times, sleeping"
	line "#MON fall out."
	done
	
MahoganyTownSignpostDEVText:
	text "Dev Diary 5"
	para "The 13th of DEC-"
	line "EMBER 2016"

	para "Fun fact: This"
	line "town was orignally"
	
	para "called AXMEN"
	line "VILLAGE."
	
	para "In reference to"
	line "that guy who plays"

	para "#MON hacks"
	line "that we all know"
	cont "and love."
	
	para "Still, even though"
	line "nobody would ever"
	
	para "get it, I changed"
	line "it to something"
	cont "far more generic."
	
	para "Nobody would"
	line "really mind."
	cont "AXMAN who?"
	
	para "Game wise, I'm"
	line "More than half"
	
	para "done with the"
	line "game."
	
	para "I am so close to"
	line "finishing the main"
	
	para "quest, I can feel"
	line "it in my bones."
	
	para "They are very"
	line "thin, they're sen-"
	cont "setive."
	
	para "-FREAKO out."
	done
	
UnknownText_0x1900b0:
	text "Hiya, kid!"

	para "I see you're new"
	line "in MAHOGANY TOWN."

	para "Since you're new,"
	line "you should try a"

	para "yummy RAGECANDY-"
	line "BAR!"

	para "Right now, it can"
	line "be yours for just"
	cont "¥300! Want one?"
	done
	
PokefanMahoganyText
	text "Don't mind me,"
	line "I just went out-"
	
	para "doors for some"
	line "stretching exer-"
	cont "sizes!"
	
	para "Your #MON could"
	line "benefit from it"
	cont "too!"
	done
	
UnknownText_0x19014a:
	text "Good! Savor it!"
	done

UnknownText_0x19015b:
	text "You don't have"
	line "enough money."
	done

UnknownText_0x190178:
	text "Oh, fine then…"
	done

UnknownText_0x190188:
	text "You don't have"
	line "room for this."
	done

UnknownText_0x1901a6:
	text "RAGECANDYBAR's"
	line "sold out."

	para "I'm packing up."
	line "Don't bother me,"
	cont "kiddo."
	done

OldManResturauntClue:
	text "I highly suggest"
	line "you visit the"
	
	para "WILDBARK VILLAGE"
	line "DINNER BELL"
	cont "RESTURAUNT."
	
	para "I'm always there"
	line "for the early bird"
	cont "special!"
	
	para "I hear the head"
	line "chef is a CUT"
	cont "master!"
	
	para "Must be really"
	line "good at cooking!"
	done

UnknownText_0x19021d:
	text "MAGIKARP have"
	line "returned to LAKE"
	cont "OF RAGE."

	para "That should be"
	line "good news for the"
	cont "anglers there."
	done

UnknownText_0x190276:
	text "Beautiful, isn't"
	line "it?"
	
	para "The mountains, the"
	line "lakes, the people."
	cont "Ah, JANTO."
	
	para "It feels as if"
	line "nothing can go"
	cont "wrong."
	done

UnknownText_0x1902f2:
	text "What would you say"
	line "is your favorite"
	cont "place to visit?"
	
	para "I bet you've seen"
	line "a lot of towns by"
	cont "now."
	done

MahoganyTownSignText:
	text "WILDBARK VILLAGE"

	para "Where The Roots"
	line "Run Deep"
	done

MahoganyTownRagecandybarSignText:
	text "WILDBARK VILLAGE"
	line "DINNER BELL"
	
	para "Fine cooking for"
	line "the whole family!"
	done

MahoganyGymSignText:
	text "WILDBARK VILLAGE"
	line "#MON GYM"
	cont "LEADER: LUNA"

	para "The Queen of"
	line "Darkness"
	done

MahoganyTown_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 7, 29, 1, MAHOGANY_MART_1F
	warp_def 21, 11, 1, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	warp_def 23, 28, 1, GOLDENROD_GYM
	warp_def 7, 17, 1, MAHOGANY_POKECENTER_1F
	warp_def 5, 11, 1, SPROUT_TOWER_1F
	warp_def 12, 2, 3, MAHOGANYGATES
	warp_def 13, 2, 4, MAHOGANYGATES
	warp_def 10, 33, 5, MAHOGANYGATES
	warp_def 21, 5, 1, MAHOGANYEXTRAHOUSE
	warp_def 31, 17, 9, MAHOGANYGATES
	warp_def 31, 18, 10, MAHOGANYGATES

.CoordEvents: db 2
	xy_trigger 0, 0, 1, 0, UnknownScript_0x190013, 0, 0
	xy_trigger 0, 0, 2, 0, UnknownScript_0x190013, 0, 0

.BGEvents: db 6
	signpost 16, 18, SIGNPOST_READ, MahoganyTownSign
	signpost 7, 13, SIGNPOST_READ, MahoganyTownRagecandybarSign
	signpost 23, 25, SIGNPOST_READ, MahoganyGymSign
	signpost 7, 18, SIGNPOST_READ, MahoganyTownPokeCenterSign
	signpost 7, 16, SIGNPOST_READ, MahoganyTownSignpostDEVScript
	signpost 7, 30, SIGNPOST_READ, MahoganyTowneMartSign

.ObjectEvents: db 5
	person_event SPRITE_POKEFAN_M, 23, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x19002e, -1
	person_event SPRITE_GRAMPS, 11, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x19007e, -1
	person_event SPRITE_FISHER, 10, 22, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x190092, -1
	person_event SPRITE_LASS, 20, 17, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x190095, -1
	person_event SPRITE_YOUNGSTER, 18, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MahoganyHeadbuttGuy, -1
