const_value set 2
	const WHIRLISLANDNE_POKE_BALL
	const ACRECAVE_KID
	const ACRECAVE_GUY
	const ACRECAVE_MONSTER

WhirlIslandNE_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

.MapCallbacks:
	db 0
	
.Trigger0:
	end
	
.Trigger1:
	end
	
.Trigger2:
	end

AcreAmbush:
	showemote EMOTE_SHOCK, PLAYER, 20
;	playmusic MUSIC_JOHTO_WILD_BATTLE
	applymovement PLAYER, RunToPokemonMovement
	cry PUPITAR
	showemote EMOTE_SAD, ACRECAVE_MONSTER, 35
	opentext
	writetext AcreBoyHelpMeText
	waitbutton
	closetext
	applymovement PLAYER, MoveToPokemonMovement
	spriteface ACRECAVE_MONSTER, RIGHT
	cry PUPITAR
	wait 5
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon PUPITAR, 34
	startbattle
	reloadmapafterbattle
	disappear ACRECAVE_MONSTER
	applymovement ACRECAVE_KID, AcreKidWalksToYou
	opentext
;	moveperson ACRECAVE_GUY, 13, 21
	writetext AcreKidThanksYouText
	waitbutton
	appear ACRECAVE_GUY
	closetext
	follow PLAYER, ACRECAVE_KID
	applymovement PLAYER, PlayerLeavesAcreCaveMovement
	stopfollow
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, ACRECAVE_GUY, 20
	applymovement ACRECAVE_GUY, DadRunsToSonMovement
	spriteface ACRECAVE_KID, DOWN
	opentext
	writetext DadFindsSonCaveText
	waitbutton
	closetext
	applymovement ACRECAVE_GUY, DadMovesToPlayerMovement
	spriteface PLAYER, DOWN
	opentext
	writetext AcreDadIsThankfulText
	buttonsound
	verbosegiveitem RAINBOW_WING
;	waitbutton
	closetext
	applymovement ACRECAVE_GUY, DadMovesBackToSonMovement
	opentext
	writetext AcreDadLetsLeaveSonText
	waitbutton
	closetext
	follow ACRECAVE_GUY, ACRECAVE_KID
	applymovement ACRECAVE_GUY, DadLeavesCaveMovement
	special RestartMapMusic
	setevent EVENT_ACRE_FOREST_LOOKING_DAD
	disappear ACRECAVE_GUY
	disappear ACRECAVE_KID
	dotrigger $2
	end

AcreBoyCry:
	opentext
	writetext AcreBoyCryText
	dotrigger $1
;	disappear ACRECAVE_GUY
	waitbutton
	closetext
	end

AcreCaveBoulder:
	jumpstd strengthboulder
	
AcreBoySaved:
	jumptextfaceplayer AcreBoySavedText
	
WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

DadLeavesCaveMovement:
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end
	
PlayerLeavesAcreCaveMovement
	step_up
	step_right
	step_right
	step_end
	
AcreKidWalksToYou:
	step_right
	step_end
	
RunToPokemonMovement:
	step_left
	big_step_left
	step_down
	turn_head_left
	step_end

DadRunsToSonMovement:
	step_left
	step_left
	step_left
	step_down
	step_left
	step_down
	step_left
	step_left
	turn_head_up
	step_end
	
MoveToPokemonMovement:
	slow_step_left
	step_end

DadMovesToPlayerMovement:
	step_right
	turn_head_up
	step_end
	
DadMovesBackToSonMovement:
	step_left
	turn_head_up
	step_end

AcreDadLetsLeaveSonText:
	text "FATHER: Come on,"
	line "son."
	
	para "Let's go home."
	done
	
AcreDadIsThankfulText:
	text "FATHER: I'm ever"
	line "so thankful!"
	
	para "My son means the"
	line "world to me."
	
	para "I am so glad he's"
	line "safe."
	
	para "Here. You can have"
	line "this as a reward."
	
	para "My son means a"
	line "heck of a lot"
	
	para "more to me than"
	line "this expensive"
	cont "rock I bought."
	
	para "I'm sure you'd"
	line "need it more than"
	cont "I do."
	done
	
DadFindsSonCaveText:
	text "FATHER: My son!"
	
	para "There you are."
	
	para "I was worried"
	line "sick!"
	
	para "I heard some"
	line "screaming so"
	
	para "I jumped down"
	line "here."
	
	para "BOY: I'm here,"
	line "daddy."
	
	para "This nice trainer"
	line "saved me from an"
	cont "angry #MON."
	
	para "I think it was"
	line "going to eat me!"
	done
	
AcreKidThanksYouText:
	text "BOY: Thank you"
	line "for saving me."
	
	para "That #MON"
	line "was awful mad!"
	
	para "I was so busy"
	line "looking for a"
	
	para "place to hide"
	line "that I fell down"
	cont "this hole."
	
	para "Could you lead"
	line "me out of this"
	cont "place?"
	done
	
AcreBoyHelpMeText:
	text "BOY: Ahhh! Help!"
	
	para "I have no time"
	line "for questions,"
	
	para "I fell into a"
	line "hole and got"
	
	para "chased by this"
	line "#MON!"
	
	para "It's really mad at"
	line "me!"
	
	para "Please save me!"
	line "Please!"
	done
	
AcreBoySavedText:
	text "Thank you so much"
	line "for helping me,"
	cont "big kid!"
	done
	
AcreBoyCryText:
	text "<PLAYER> hears a"
	line "faint cry deep "
	cont "the cave."
	done
	
WhirlIslandNE_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def -2, 3, 2, ROUTE_41
	warp_def 3, 23, 6, DIGLETTS_CAVE
	warp_def -2, 5, 3, WHIRL_ISLAND_B1F

.CoordEvents: db 3
	xy_trigger 0, 12, 8, 0, AcreBoyCry, 0, 0
	xy_trigger 0, 12, 9, 0, AcreBoyCry, 0, 0
	xy_trigger 1, 21, 13, 0, AcreAmbush, 0, 1

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 8, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
	person_event SPRITE_BUG_CATCHER, 22, 8, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcreBoySaved, EVENT_ACRE_SAVE_BOY
	person_event SPRITE_GENTLEMAN, 20, 17, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ACRE_FATHER
	person_event SPRITE_MONSTER, 22, 9, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ACRE_SAVE_BOY
	person_event SPRITE_BOULDER, 5, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcreCaveBoulder, -1
	person_event SPRITE_BOULDER, 12, 23, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcreCaveBoulder, -1
	person_event SPRITE_BOULDER, 14, 23, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcreCaveBoulder, -1
