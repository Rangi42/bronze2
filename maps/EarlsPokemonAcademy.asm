; Remove "See you later"
; Fix book in front of sage
; fix sage's speech

const_value set 2
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX
	const EARLSPOKEMONACADEMY_BRIDE
	const EARLSPOKEMONACADEMY_GROOM
	const EARLSPOKEMONACADEMY_BEST_MAN

EarlsPokemonAcademy_MapScriptHeader:
.MapTriggers:
	db 2
	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	end

.Trigger1:
	end
	
AcademyEarl:
	faceplayer
	checkevent EVENT_SWITCH_3
	iffalse .AcademyEarlWaiting
	opentext
	writetext AcademyEarlAfterWedding
	waitbutton
	closetext
	end

.AcademyEarlWaiting:
	opentext
	writetext AcademyEarlWaitingText
	waitbutton
	closetext
	end

YoungsterScript_0x68a83:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_3
	iftrue .YoungsterScript_0x68a83After
	writetext UnknownText_0x68d80
	waitbutton
	closetext
	end
	
.YoungsterScript_0x68a83After:
	writetext UnknownText_0x68d80After
	waitbutton
	closetext
	end

GameboyKidScript_0x68a86:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_3
	iftrue .GameboyKidScript_0x68a86After
	writetext UnknownText_0x68dda
	waitbutton
	closetext
	end

.GameboyKidScript_0x68a86After:
	writetext UnknownText_0x68ddaAfter
	waitbutton
	closetext	
	end
	
GameboyKidScript_0x68a91:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_3
	iftrue .GameboyKidScript_0x68a91After
	writetext UnknownText_0x68e07
	waitbutton
	closetext
	end

.GameboyKidScript_0x68a91After:
	writetext UnknownText_0x68e07After
	waitbutton
	closetext	
	end

YoungsterScript_0x68a9c:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_3
	iftrue .YoungsterScript_0x68a9cAfter
	writetext UnknownText_0x68e39
	waitbutton
	closetext
	end
	
.YoungsterScript_0x68a9cAfter:
	writetext UnknownText_0x68e39After
	waitbutton
	closetext	
	end
	
AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
	closetext
	end

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

AcademyNotebook:
	opentext
	writetext WeddingBookText
	waitbutton
	closetext
	end

ChurchWarp
	warp MAHOGANYEXTRAHOUSE, $2, $1
	end

EarlBride
	faceplayer
	setevent EVENT_SWITCH_2
	opentext
	writetext EarlBrideText
	waitbutton
	closetext
	end

ChurchTriggerRight
	applymovement PLAYER, EarlPathRight
	jump EarlWedding
	end
	
ChurchTriggerLeft
	applymovement PLAYER, EarlPath
	jump EarlWedding
	end
	
EarlWedding
	spriteface PLAYER, UP
	dotrigger $2
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	opentext
	writetext GettingMarriedText
	waitbutton
	closetext
	showemote EMOTE_HEART, EARLSPOKEMONACADEMY_BRIDE, 15
	showemote EMOTE_HEART, EARLSPOKEMONACADEMY_GROOM, 15
	opentext
	writetext GettingMarriedText2
	waitbutton
	closetext
;	special FadeOutPalettes
;	wait 8
	follow EARLSPOKEMONACADEMY_BRIDE, EARLSPOKEMONACADEMY_GROOM
	applymovement EARLSPOKEMONACADEMY_BRIDE, AcademyCoupleLeave
	spriteface EARLSPOKEMONACADEMY_BRIDE, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext CoupleLeavingText
	waitbutton
	closetext
	applymovement EARLSPOKEMONACADEMY_BRIDE, AcademyCoupleLeave2
	playsound SFX_ENTER_DOOR
	applymovement EARLSPOKEMONACADEMY_BEST_MAN, BestManLeave
	opentext
	writetext BestManLeaveText
	waitbutton
	closetext	
	applymovement EARLSPOKEMONACADEMY_BEST_MAN, BestManLeave2
	playsound SFX_ENTER_DOOR
	disappear EARLSPOKEMONACADEMY_BRIDE
	disappear EARLSPOKEMONACADEMY_GROOM
	disappear EARLSPOKEMONACADEMY_BEST_MAN
;	special FadeInPalettes
	end
	
AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

MovementData_0x68b2d:
	turn_head_down
	step_end
	
EarlPathRight:
	step_up
	step_left
	step_up
	step_up
	step_up
	step_up
	step_left
	step_end
	
EarlPath:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_left
	step_end

AcademyCoupleLeave:
	step_down
	step_down
	step_end
	
AcademyCoupleLeave2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
BestManLeave:
	step_left
	step_left
	step_end
	
BestManLeave2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
GettingMarriedText:
	text "SAGE: We are gath-"
	line "ered here today to"
	
	para "celebrate an"
	line "unbreakable bond"
	
	para "between two lovers"
	line "that knew it was"
	
	para "meant to be, the"
	line "moment their eyes"
	cont "met."
	
	para "May you stay"
	line "together in sick-"
	
	para "ness and in health"
	line "'till death do you"
	cont "part."
	
	para "You may now kiss"
	line "the bride!"
	done
	
GettingMarriedText2:
	text "SAGE: Congrat-"
	line "ulations!"
	
	para "You are now hus-"
	line "band and wife!"
	
	para "EVERYONE: Cheers!"
	
	para "SAGE: Now enjoy"
	line "your lives toget-"
	cont "her!"
	done
	
CoupleLeavingText:
	text "Thank you for"
	line "bringing him"
	cont "here!"
	done
	
BestManLeaveText:
	text "I cannot thank you"
	line "enough for helping"
	cont "me out."
	
	para "Come by my house"
	line "later and I'll"

	para "have a reward for"
	line "you!"
	cont "See you later!"
	done
	
AcademyEarlWaitingText:
	text "This nice woman"
	line "is supposed to be"
	cont "wed very soon."
	
	para "I cannot wait"
	line "forever, unlike"
	cont "love."
	
	para "I hope the groom"
	line "shows up soon."
	done
	
UnknownText_0x68b3b:
	text "EARL, I am!"

	para "Wonderful are"
	line "#MON, yes!"

	para "Teach you I will"
	line "to be a better"
	cont "trainer!"

	para "What you want to"
	line "know? Want to be"
	cont "a winner is you?"
	done

UnknownText_0x68bbd:
	text "Good! Teach you,"
	line "I will!"

	para "In battle, #MON"
	line "top on list jump"
	cont "out first!"

	para "Change order in"
	line "list, make battle"
	cont "easy, maybe!"

	para "More from me you"
	line "want to hear?"
	done

UnknownText_0x68c51:
	text "So, want to know"
	line "how to raise"
	cont "#MON well?"
	done

AcademyEarlAfterWedding:
	text "What a beautiful"
	line "wedding."
	
	para "You could really"
	line "feel the love!"
	done

UnknownText_0x68d31:
	text "Oh! Smart student"
	line "you are! Nothing"
	cont "more do I teach!"

	para "Good to #MON"
	line "you must be!"
	done

UnknownText_0x68d80:
	text "Is my hair looking"
	line "okay?"
	done
	
UnknownText_0x68d80After:
	text "I tried not to"
	line "cry."
	cont "Oh, I'm so awful!"
	done

UnknownText_0x68dda:
	text "I'm very excited"
	line "to be at this"
	cont "wedding!"
	done
	
UnknownText_0x68ddaAfter:
	text "Absolutely"
	line "marvelous!"
	done

UnknownText_0x68e07:
	text "Huh? The #MON I"
	line "just got is hold-"
	cont "ing something!"
	done
	
UnknownText_0x68e07After:
	text "I'm finished!"
	done

UnknownText_0x68e39:
	text "Doesn't the bride"
	line "look wonderful?"
	done
	
UnknownText_0x68e39After:
	text "I hope I can get"
	line "married some day!"
	done

AcademyBlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done

AcademyBlackboardText2:
; unused
	text "Read which topic?"
	done

EarlBrideText:
	text "Oh dear oh dear…"
	line "my wedding is very"
	
	para "soon and the groom"
	line "has not shown up."
	cont "Did he forget?"
	
	para "I am very worried."
	line "This was supposed"
	
	para "to be the best day"
	line "of my life…"
	
	para "Oh if only someone"
	line "could help me…"
	done
	
AcademyPoisonText:
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

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

AcademySleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

AcademyFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #MON"

	para "in battle are"
	line "#MON trainers."

	para "They are expected"
	line "to visit #MON"

	para "GYMS and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Boy: E-he-he…"

	para "I haven't written"
	line "anymore…"
	done

AcademyStickerMachineText:
	text "This super machine"
	line "prints data out as"

	para "stickers!"
	done

WeddingBookText:
	text "It's a book with"
	line "wedding vows in"
	cont "it."
	done
	
EarlsPokemonAcademy_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 7, VIOLET_CITY
	warp_def 15, 5, 3, VIOLET_CITY

.CoordEvents: db 2
	xy_trigger 1, 10, 4, 0, ChurchTriggerLeft, 0, 0
	xy_trigger 1, 10, 5, 0, ChurchTriggerRight, 0, 0

.BGEvents: db 5
	signpost -2, 0, SIGNPOST_READ, AcademyBookshelf
	signpost -2, 1, SIGNPOST_READ, AcademyBookshelf
	signpost -4, 2, SIGNPOST_READ, AcademyBlackboard
	signpost -4, 3, SIGNPOST_READ, AcademyBlackboard
	signpost 0, 2, SIGNPOST_READ, ChurchWarp

.ObjectEvents: db 9
	person_event SPRITE_SAGE, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AcademyEarl, -1
	person_event SPRITE_BUENA, 7, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x68a83, -1
	person_event SPRITE_GENTLEMAN, 9, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x68a86, -1
	person_event SPRITE_TEACHER, -8, -8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x68a91, -1
	person_event SPRITE_LASS, 7, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x68a9c, -1
	person_event SPRITE_POKEDEX, 2, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcademyNotebook, -1
	person_event SPRITE_TEACHER, 3, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EarlBride, EVENT_SWITCH_4
	person_event SPRITE_DRAGON, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SWITCH_1
	person_event SPRITE_GENTLEMAN, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SWITCH_1
