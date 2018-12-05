const_value set 2
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 0

.Trigger0:
	end

.Trigger1:
	end

.Trigger2:
	end

TVCamera5F:
	jumptext TVCamera5FText
	
; THIS SCRIPT HERE!
;
; LOOK AT MEEEEEEEEEEEEEE!
;
FakeDirectorScript:
	showemote EMOTE_SHOCK, PLAYER, 15	
;	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	applymovement PLAYER, PlayerMovesToStudio
;	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	spriteface RADIOTOWER5F_DIRECTOR, LEFT
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, 3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
;	buttonsound
;	verbosegiveitem BASEMENT_KEY
	waitbutton
	closetext
	applymovement RADIOTOWER5F_ROCKER, StarMove1
	spriteface PLAYER, UP
	opentext
	writetext StarText1
	waitbutton
	closetext	
	applymovement RADIOTOWER5F_ROCKER, StarMove2
	spriteface RADIOTOWER5F_DIRECTOR, UP
	opentext
	writetext StarText2
	waitbutton
	closetext
	spriteface RADIOTOWER5F_DIRECTOR, DOWN
	spriteface RADIOTOWER5F_ROCKET, UP
	opentext
	writetext DirectorLetsGetOut
	waitbutton
	closetext	
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	domaptrigger ECRUTEAK_GYM, $1	
	special FadeOutPalettes
	playsound SFX_RUN
	wait 8
	disappear RADIOTOWER5F_DIRECTOR
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	special FadeInPalettes
	wait 10
	applymovement RADIOTOWER5F_ROCKER, StarMove3
	opentext
	writetext StarText3
	buttonsound
	verbosegiveitem HM_FLY
	writetext StarText4
	waitbutton
	closetext	
	dotrigger $1
	special FadeOutPalettes
	warp GOLDENROD_CITY, $1C, $8
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EVENT_BEAT_ROCKET_EXECUTIVEF_1, EXECUTIVEF, 1, Executivef1SeenText, Executivef1BeatenText, 0, Executivef1Script

Executivef1Script:
	end_if_just_battled
	opentext
	writetext Executivef1AfterText
	waitbutton
	closetext
	end

RadioTower5FRocketBossTrigger:
	applymovement PLAYER, MovementData_0x60125
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveperson RADIOTOWER5F_DIRECTOR, $c, $0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	spriteface PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	dotrigger $2
	domaptrigger ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	jump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

MapRadioTower5FSignpost0Script:
	jumptext SignpostRadioTower5FOffice

MapRadioTower5FSignpost2Script:
	jumptext SignpostRadioTower5FStudio

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

FakeDirectorMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

RadioTower5FDirectorWalksIn:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

RadioTower5FDirectorWalksOut:
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x60125:
	step_left
	step_left
	step_end

PlayerMovesToStudio:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end
	
StarMove1:
	step_up
	big_step_left
	big_step_left
	big_step_left
	step_left
	turn_head_down
	step_end
	
StarMove2:
	step_right
	turn_head_down
	step_end

StarMove3:
	step_left
	turn_head_down
	step_end

StarText1:
	text "SCARLET: You saved"
	line "me!"
	
	para "I am so grateful!"
	
	para "I had no part in"
	line "in this!"
	
	para "They used my fame"
	line "to help their"
	cont "awful cause."
	
	para "These people don't"
	line "care for #MON!"
	
	para "They only want to"
	line "abuse #MON to"
	cont "make money!"
	
	para "So thank you for"
	line "coming to my aid!"
	done

StarText2:
	text "As for you."
	
	para "You're in big"
	line "trouble!"
	
	para "You almost ruined"
	line "my career making"
	
	para "me say those"
	line "things!"
	
	para "You will pay."
	
	para "I'm calling the"
	line "police!"
	
	para "Don't you go"
	line "anywhere!"	
	done	

StarText3:
	text "SCARLET: How can I"
	line "ever repay you?"
	
	para "I know!"
	line "Take this!"
	done
	
StarText4:
	text "That's the HM for"
	line "FLY!"
	
	para "When taught to a"
	line "#MON it can"
	
	para "take you high into"
	line "the sky, and soar"

	para "among the clouds,"
	line "to travel to other"
	cont "cities!"
	
	para "But only if you"
	line "have ROSEGLEN"
	cont "CITY's GYM BADGE."
	
	para "Say… I think you"
	line "should probably"
	
	para "check out the"
	line "ROSEGLEN GYM later"
	
	para "today if you have"
	line "time."
	
	para "I think you'd be"
	line "welcome there!"
	
	para "And once again,"	
	line "thank you so"
	cont "much!"
	
	para "If I ever need"
	line "someone to play"
	
	para "A strong trainer"
	line "In my show, I'll"
	
	para "have my agent give"
	line "you a call!"
	
	para "Thank you, thank"
	line "you, THANK YOU!"
	
	para "Run along now!"
	done
	
DirectorLetsGetOut:
	text "ROCKET GRUNT:"
	line "Looks like TEAM"
	
	para "ROCKET better"
	line "blast off!"
	done	
	
FakeDirectorTextBefore1:
	text "ROCKET GRUNT: Well"
	line "done SCARLET."
	
	para "Now that you've"
	line "endorsed us,"
		
	para "children all over"
	line "the region will"
	
	para "join our great"
	line "cause!"
	done

FakeDirectorTextBefore2:
	text "ROCKET GRUNT:"
	line "What?! Who let"
	cont "this kid in here?"
	
	para "Huh?"
	
	para "How could you"
	line "have beaten all"
	
	para "of us in the"
	line "building?"
	
	para "I will put a stop"
	line "to you right now!"
	done

FakeDirectorWinText:
	text "Mwhahaha."
	done

FakeDirectorTextAfter:
	text "You're too late."
	
	para "The damage has"
	line "been done."
	
	para "We got our message"
	line "out."
	
	para "There's nothing"
	line "more you can do."
	cont "You tried, kid."
	done

Executivef1SeenText:
	text "I was warned about"
	line "you."
	
	para "I will dispose of"
	line "you immediately."
	done

Executivef1BeatenText:
	text "It's already too"
	line "late."
	done
	
Executivef1AfterText:
	text "I was beaten by a"
	line "worthless kid."
	
	para "I can't face my"
	line "assosiates now."
	
	para "But we shall be"
	line "celebrating to-"
	cont "night."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? You managed to"
	line "get this far?"

	para "You must be quite"
	line "the trainer."

	para "We intend to take"
	line "over this RADIO"

	para "STATION and an-"
	line "nounce our come-"
	cont "back."

	para "That should bring"
	line "our boss GIOVANNI"

	para "back from his solo"
	line "training."

	para "We are going to"
	line "regain our former"
	cont "glory."

	para "I won't allow you"
	line "to interfere with"
	cont "our plans."
	done

RadioTower5FRocketBossWinText:
	text "No! Forgive me,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "How could this be?"

	para "Our dreams have"
	line "come to naught."

	para "I wasn't up to the"
	line "task after all."

	para "Like GIOVANNI did"
	line "before me, I will"

	para "disband TEAM"
	line "ROCKET here today."

	para "Farewell."
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTOR: <PLAY_G>,"
	line "thank you!"

	para "Your courageous"
	line "actions have saved"

	para "#MON nation-"
	line "wide."

	para "I know it's not"
	line "much, but please"
	cont "take this."
	done

RadioTower5FDirectorDescribeClearBellText:
;	text "There used to be a"
;	line "tower right here"
;	cont "in GOLDENROD CITY."
;
;	para "But it was old and"
;	line "creaky."
;
;	para "So we replaced it"
;	line "with our RADIO"
;	cont "TOWER."
;
;	para "We dug up that"
;	line "bell during"
;	cont "construction."
;
;	para "I heard that all"
;	line "sorts of #MON"
;
;	para "lived in GOLDENROD"
;	line "in the past."
;
;	para "Perhaps…"
;
;	para "That bell has some"
;	line "connection to the"
;
;	para "TIN TOWER in"
;	line "ECRUTEAK CITY…"
;
;	para "Ah!"
;
;	para "That reminds me…"
;
;	para "I overheard TEAM"
;	line "ROCKET whispering."
;
;	para "Apparently, some-"
;	line "thing is going on"
;	cont "at the TIN TOWER."
;
;	para "I have no idea"
;	line "what is happening,"
;
;	para "but you might look"
;	line "into it."
;
;	para "OK, I better go to"
;	line "my OFFICE."
	done

RadioTower5FDirectorText:
;	text "DIRECTOR: Hello,"
;	line "<PLAY_G>!"
;
;	para "You know, I love"
;	line "#MON."
;
;	para "I built this RADIO"
;	line "TOWER so I could"
;
;	para "express my love"
;	line "of #MON."
;
;	para "It would be nice"
;	line "if people enjoyed"
;	cont "our programs."
	done

BenText:
	text "BEN: Do you listen"
	line "to our music?"
	done

SignpostRadioTower5FOffice:
	text "4F MAIN STUDIO"
	done

SignpostRadioTower5FStudio:
	text "5F STUDIO 1"
	done

TVCamera5FText:
	text "It's a TV"
	line "CAMERA."
	done
	
RadioTower5F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 0, 13, 1, RADIO_TOWER_4F
	warp_def -2, 22, 3, RADIO_TOWER_4F

.CoordEvents: db 2
	xy_trigger 0, 2, 5, 0, FakeDirectorScript, 0, 0
	xy_trigger 1, 8, 21, 0, RadioTower5FRocketBossTrigger, 0, 0

.BGEvents: db 5
	signpost 0, 11, SIGNPOST_READ, MapRadioTower5FSignpost0Script
	signpost -3, 13, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost -3, 15, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost 1, 5, SIGNPOST_READ, RadioTower5FBookshelf
	signpost 1, 17, SIGNPOST_READ, RadioTower5FBookshelf

.ObjectEvents: db 6
	person_event SPRITE_ROCKET, 7, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Director, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 8, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_MORTY, 7, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Ben, -1
	person_event SPRITE_POKE_BALL, 2, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
	person_event SPRITE_UNUSED_GUY, 7, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TVCamera5F, -1
