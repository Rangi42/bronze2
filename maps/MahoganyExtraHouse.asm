const_value set 2
	const MAHOGANYEXTRAHOUSEDRAGON
	const MAHOGANYEXTRAHOUSEFAKEGROOM
	const MAHOGANYEXTRAHOUSEDRAGON2
	const MAHOGANYEXTRAHOUSEFAKEGROOM2
	const MAHOGANYEXTRAHOUSEBRIDE

MahoganyExtraHouse_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

BrideAfterWedding:
	jumptextfaceplayer BrideAfterWeddingText

MahoganyFakeGroomGiftScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue MahoganyFakeGroomGiftScript2
	writetext MahoganyFakeGroomGift
	buttonsound
	verbosegiveitem EXP_SHARE
	iffalse MahoganySomething
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
MahoganyFakeGroomGiftScript2:
	writetext MahoganyFakeGroomGiftGotAlready
	waitbutton
MahoganySomething:
	closetext
	end

MahoganyFakeGroom
	checkevent EVENT_SWITCH_2
	iftrue .MahoganyFakeGroomKnowsHesLate
	faceplayer
	opentext
	writetext FakeGroomIsWaitingForWedding
	waitbutton
	closetext
	end
	
.MahoganyFakeGroomKnowsHesLate
	faceplayer
	domaptrigger EARLS_POKEMON_ACADEMY, $1
	clearevent EVENT_SWITCH_1
	opentext
	writetext FakeGroomKnowsHesLateText
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .MahoganyRunAround
	applymovement MAHOGANYEXTRAHOUSEFAKEGROOM, MahoganyManRunAroundMovement
	spriteface MAHOGANYEXTRAHOUSEDRAGON, DOWN
	opentext
	writetext FakeGroomKnowsHesLateText2
	waitbutton
	closetext
	follow MAHOGANYEXTRAHOUSEFAKEGROOM, MAHOGANYEXTRAHOUSEDRAGON
	applymovement MAHOGANYEXTRAHOUSEFAKEGROOM, MahoganyManRunAroundMovement2
	disappear MAHOGANYEXTRAHOUSEFAKEGROOM
	playsound SFX_ENTER_DOOR
	stopfollow
	applymovement MAHOGANYEXTRAHOUSEDRAGON, MahoganyDragonStepDown
	disappear MAHOGANYEXTRAHOUSEDRAGON
	playsound SFX_ENTER_DOOR
	wait 10
	setevent EVENT_SWITCH_3
	end
	
.MahoganyRunAround
	applymovement MAHOGANYEXTRAHOUSEFAKEGROOM, MahoganyManMovement
	spriteface MAHOGANYEXTRAHOUSEDRAGON, DOWN
	opentext
	writetext FakeGroomKnowsHesLateText2
	waitbutton
	closetext
	follow MAHOGANYEXTRAHOUSEFAKEGROOM, MAHOGANYEXTRAHOUSEDRAGON
	applymovement MAHOGANYEXTRAHOUSEFAKEGROOM, MahoganyManMovement2
	disappear MAHOGANYEXTRAHOUSEFAKEGROOM
	playsound SFX_ENTER_DOOR
	stopfollow
	applymovement MAHOGANYEXTRAHOUSEDRAGON, MahoganyDragonStepDown
	disappear MAHOGANYEXTRAHOUSEDRAGON
	playsound SFX_ENTER_DOOR
	wait 10
	setevent EVENT_SWITCH_3
	end

MahoganyDragonScript
	faceplayer
	opentext 
	writetext MahoganyDragonText
	cry DRAGONITE
	waitbutton
	closetext
	end
	
GroomWarp
	warp EARLS_POKEMON_ACADEMY, $2, $1
	end

MahoganyManMovement
	big_step_right
	big_step_right
	turn_head_up
	step_end
	
MahoganyManMovement2
	step_down
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end
	
MahoganyManRunAroundMovement
	step_down
	big_step_right
	big_step_right
	step_up
	step_end
	
MahoganyManRunAroundMovement2
	step_down
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end
	
MahoganyDragonStepDown
	step_down
	step_end
	
.Text:

BrideAfterWeddingText:
	text "Ah, life is wond-"
	line "erful, to be with"
	cont "the one you love!"
	done

MahoganyFakeGroomGiftGotAlready:
	text "An EXP.SHARE"
	line "will give EXP"
	
	para "POINTS to a #-"
	line "MON in your party"
	
	para "even if they don't"
	line "battle!"
	
	para "It's like sharing"
	line "the love."
	
	para "Love is wonderful"
	line "isn't it?"
	done

MahoganyFakeGroomGift:
	text "Ah, there you are!"
	line "Again, thank you"
	
	para "so much for gett-"
	line "ing me to the"
	cont "wedding on time!"
	
	para "Ah yes, your"
	line "reward!"
	cont "Please, take this!"
	done
	
MahoganyDragonText:
	text "DRAGONITE: Gurra-"
	line "rrrg!"
	done
	
FakeGroomIsWaitingForWedding:
	text "Oh such joy."
	line "I have to get to a"
	cont "wedding soon."
	
	para "There's nothing"
	line "more beautiful"
	
	para "than a union be-"
	line "tween two eternal"
	cont "loves."
	done
	
FakeGroomKnowsHesLateText:
	text "Oh such joy."
	line "I have to get to a"
	cont "wedding soon."
	
	para "There's nothing"
	line "more beautiful"
	
	para "than a union be-"
	line "tween two eternal"
	cont "loves."
	
	para "What's that?"
	line "The wedding is on"
	cont "right now?!"
	
	para "Oh my oh my, I"
	line "must not be late!"
	
	para "Thank you so much"
	line "for telling me!"
	
	para "If you'd like, you"
	line "could swing by."
	
	para "We'd love to have"
	line "you there!"
	done
	
FakeGroomKnowsHesLateText2:
	text "DRAGONITE, we must"
	line "hurry!"
	done
	
MahoganyExtraHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 3, 9, MAHOGANY_TOWN
	warp_def 7, 4, 9, MAHOGANY_TOWN

.CoordEvents: db 0

.BGEvents: db 1
	signpost 0, 2, SIGNPOST_READ, GroomWarp

.ObjectEvents: db 5
	person_event SPRITE_DRAGON, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MahoganyDragonScript, EVENT_SWITCH_3
	person_event SPRITE_GENTLEMAN, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MahoganyFakeGroom, EVENT_SWITCH_3
	person_event SPRITE_DRAGON, 4, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MahoganyDragonScript, EVENT_SWITCH_5
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MahoganyFakeGroomGiftScript, EVENT_SWITCH_5
	person_event SPRITE_TEACHER, 4, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BrideAfterWedding, EVENT_SWITCH_5
