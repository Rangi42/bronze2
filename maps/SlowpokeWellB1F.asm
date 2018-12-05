const_value set 2
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL
	const SLOWPOKEWELLB1F_ARTGUY
	const SLOWPOKEWELLB1F_ARTGUYDURINGATTACK

SlowpokeWellB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
;	priorityjump CheckRocketMusicScript
	end

.Trigger1:
	end

	
CheckRocketMusicScript:
;	checkevent EVENT_SLOWPOKE_WELL_ROCKETS
;	iffalse .PlayRocketMusic
;	end
;.PlayRocketMusic
;	playmusic MUSIC_ROCKET_HIDEOUT
	end
	
KurtScript_0x5a5d5:
	jumptextfaceplayer UnknownText_0x5a6b5

TrainerGruntM29:
	trainer EVENT_BEAT_ROCKET_GRUNTM_29, GRUNTM, 29, GruntM29SeenText, GruntM29BeatenText, 0, GruntM29Script

GruntM29Script:
	end_if_just_battled
	opentext
	writetext TrainerGruntM29SlowpokeProfitText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer EVENT_BEAT_ROCKET_GRUNTM_1, GRUNTM, 1, GruntM1SeenText, GruntM1BeatenText, 0, GruntM1Script

GruntM1Script:
	domaptrigger ECRUTEAK_CITY, $2
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	playsound SFX_RUN
	waitsfx
	pause 15
	special Special_FadeInQuickly
;	disappear SLOWPOKEWELLB1F_KURT
;	moveperson SLOWPOKEWELLB1F_KURT, $b, $6
;	appear SLOWPOKEWELLB1F_KURT
;	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
;	spriteface PLAYER, RIGHT
;	opentext
;	writetext KurtLeaveSlowpokeWellText
;	waitbutton
;	closetext
;	setevent EVENT_CLEARED_SLOWPOKE_WELL
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
;	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
;	domaptrigger AZALEA_TOWN, $1
;	clearevent EVENT_ILEX_FOREST_APPRENTICE
;	clearevent EVENT_ILEX_FOREST_FARFETCHD
;	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
;	setevent EVENT_CHARCOAL_KILN_APPRENTICE
;	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
;	setevent EVENT_SLOWPOKE_WELL_KURT
;	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
;	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
;	clearevent EVENT_KURTS_HOUSE_KURT_1
;	special FadeOutPalettes
;	special HealParty
;	pause 15
;	warp KURTS_HOUSE, $3, $3
	end

TrainerGruntM2:
	trainer EVENT_BEAT_ROCKET_GRUNTM_2, GRUNTM, 2, GruntM2SeenText, GruntM2BeatenText, 0, GruntM2Script

GruntM2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5aaf2
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer EVENT_BEAT_ROCKET_GRUNTF_1, GRUNTF, 1, GruntF1SeenText, GruntF1BeatenText, 0, GruntF1Script

GruntF1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ab8d
	waitbutton
	closetext
	end

EcruArtGuru:
	faceplayer
	opentext
;	cry SLOWPOKE
	writetext EcruArtGuruText
;	yesorno
;	iftrue UnknownScript_0x5a68f
	waitbutton
	closetext
	end

UnknownScript_0x5a68f:
;	writetext UnknownText_0x5ac09
	waitbutton
	closetext
	end

EcruArtKid:
	faceplayer
	opentext
	writetext EcruArtKidText
;	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

SlowpokeArtGuyScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeArtGuyScriptSaved
	writetext SlowpokeArtGuyText
	waitbutton
	closetext
	end
	
.SlowpokeArtGuyScriptSaved
	writetext SlowpokeArtGuySavedText
	waitbutton
	closetext
	end
	
SlowpokeArtLass:
	jumptextfaceplayer SlowpokeArtLassText

ArtSignRead1:
	jumptext ArtSignReadText
	
ArtSignRead2:
	jumptext ArtSignReadText2
	
KurtSlowpokeWellVictoryMovementData:
	step_left
	step_left
	step_left
	step_left
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_left
	step_up
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_end

ArtSignReadText:
	text "It's some abstract"
	line "art!"
	done
	
ArtSignReadText2
	text "Kids shouldn't"
	line "look at this one."
	done
	
UnknownText_0x5a6b5:
	text "KURT: Hey there,"
	line "<PLAYER>!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "WELL."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #MON"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para "<PLAYER>, show them"
	line "how gutsy you are"
	cont "in my place!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Way to go,"
	line "<PLAYER>!"

	para "TEAM ROCKET has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done

GruntM29SeenText:
	text "Why art?"
	line "Well art doesn't"
	
	para "fight back. It's a"
	line "lot easier!"
	done

GruntM29BeatenText:
	text "Get out of my"
	line "face!"
	done

TrainerGruntM29SlowpokeProfitText:
	text "When we get the"
	line "money, you're all"
	
	para "going to pay!"
	line "You'll see!"
	done

GruntM1SeenText:
	text "This robbery will"
	line "go to plan!"
	
	para "No punk little kid"
	line "will stop us!"
	cont "Haha!"
	done

GruntM1BeatenText:
	text "My pals have all"
	line "left the building!"
	done

TrainerGruntM1WhenTalkText:
	text "Yeah, TEAM ROCKET"
	line "was knocked down"
	
	para "twice. But we're"
	line "coming back"
	
	para "stronger than"
	line "ever!"
	
	para "Once we sell these"
	line "paitings, we can"
	
	para "finally build a"
	line "new base."
	
	para "Sorry kid, but"
	line "I gotta go."
	cont "Good luck, twerp!"
	done

GruntM2SeenText:
	text "I'm just admiring"
	line "art!"
	
	para "Oh this one under"
	line "my arm?"
	cont "I painted that!"
	done

GruntM2BeatenText:
	text "Drat!"
	done

UnknownText_0x5aaf2:
	text "Nevermind what"
	line "we're doing."
	cont "Just leave."
	done

GruntF1SeenText:
	text "The paintings"
	line "will earn us a"
	cont "hefty sum!"
	done

GruntF1BeatenText:
	text "You little brat!"
	done

UnknownText_0x5ab8d:
	text "They can always"
	line "just paint new"
	cont "ones!"
	done

EcruArtGuruText:
	text "I may be a FISHING"
	line "GURU, but I really"

	para "enjoy masterworks"
	line "such as this as"
	cont "well!"
	done

;UnknownText_0x5ac09:
;	text "<PLAYER> read the"
;	line "MAIL."
;
;	para "Be good and look"
;	line "after the house"
;
;	para "with Grandpa and"
;	line "SLOWPOKE."
;
;	para "Love, Dad"
;	done

EcruArtKidText:
	text "I just love"
	line "art like this."
	
	para "I try to make"
	line "drawings like it"
	cont "in school."
	done
	
SlowpokeArtGuyText:
	text "Why did this have"
	line "to happen to me?"
	
	para "I spent so long"
	line "securing my"
	cont "art gallery!"
	done
	
SlowpokeArtGuySavedText:
	text "Hey, <PLAYER>."
	line "Feel free to look"
	
	para "around as you"
	line "wish!"
	
	para "Just breathe in"
	line "the culture."
	done

SlowpokeArtLassText:
	text "Hi! Don't you"
	line "just love art"
	cont "of #MON?"
	done

SlowpokeWellB1F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 17, 6, 16, ECRUTEAK_CITY
	warp_def 17, 7, 16, ECRUTEAK_CITY

.CoordEvents: db 0

.BGEvents: db 36
	signpost 11, 15, SIGNPOST_READ, ArtSignRead1
	signpost 11, 14, SIGNPOST_READ, ArtSignRead1
	signpost 11, 11, SIGNPOST_READ, ArtSignRead1
	signpost 11, 10, SIGNPOST_READ, ArtSignRead1
	signpost 11, 5, SIGNPOST_READ, ArtSignRead1
	signpost 11, 4, SIGNPOST_READ, ArtSignRead1
	signpost 11, 3, SIGNPOST_READ, ArtSignRead1
	signpost 11, 2, SIGNPOST_READ, ArtSignRead1
	signpost 7, 17, SIGNPOST_READ, ArtSignRead1
	signpost 7, 16, SIGNPOST_READ, ArtSignRead1
	signpost 7, 15, SIGNPOST_READ, ArtSignRead1
	signpost 7, 14, SIGNPOST_READ, ArtSignRead1
	signpost 1, 7, SIGNPOST_READ, ArtSignRead1
	signpost 1, 6, SIGNPOST_READ, ArtSignRead1
	signpost 7, 9, SIGNPOST_READ, ArtSignRead1
	signpost 7, 8, SIGNPOST_READ, ArtSignRead1
	signpost 7, 7, SIGNPOST_READ, ArtSignRead1
	signpost 7, 6, SIGNPOST_READ, ArtSignRead1
	signpost 7, 5, SIGNPOST_READ, ArtSignRead1
	signpost 7, 4, SIGNPOST_READ, ArtSignRead1
	signpost 7, 3, SIGNPOST_READ, ArtSignRead1
	signpost 7, 2, SIGNPOST_READ, ArtSignRead1
	signpost 7, 1, SIGNPOST_READ, ArtSignRead1
	signpost 7, 0, SIGNPOST_READ, ArtSignRead1
	signpost 1, 17, SIGNPOST_READ, ArtSignRead1
	signpost 1, 16, SIGNPOST_READ, ArtSignRead1
	signpost 1, 15, SIGNPOST_READ, ArtSignRead1
	signpost 1, 14, SIGNPOST_READ, ArtSignRead1
	signpost 1, 13, SIGNPOST_READ, ArtSignRead1
	signpost 1, 12, SIGNPOST_READ, ArtSignRead1
	signpost 1, 11, SIGNPOST_READ, ArtSignRead1
	signpost 1, 10, SIGNPOST_READ, ArtSignRead1
	signpost 1, 9, SIGNPOST_READ, ArtSignRead1
	signpost 1, 8, SIGNPOST_READ, ArtSignRead1
	signpost 11, 13, SIGNPOST_READ, ArtSignRead2
	signpost 11, 12, SIGNPOST_READ, ArtSignRead2

.ObjectEvents: db 11
	person_event SPRITE_ROCKET, 6, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 1, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 11, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET_GIRL, 3, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_FISHING_GURU, 6, 13, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EcruArtGuru, EVENT_AZALEA_TOWN_SLOWPOKES
	person_event SPRITE_BUG_CATCHER, 2, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EcruArtKid, EVENT_AZALEA_TOWN_SLOWPOKES
	person_event SPRITE_KURT, 25, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtScript_0x5a5d5, EVENT_SLOWPOKE_WELL_KURT
	person_event SPRITE_BOULDER, -5, -5, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	person_event SPRITE_POKE_BALL, 12, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
	person_event SPRITE_LASS, 8, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SlowpokeArtLass, EVENT_AZALEA_TOWN_SLOWPOKES
	person_event SPRITE_FISHER, 13, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SlowpokeArtGuyScript, -1
