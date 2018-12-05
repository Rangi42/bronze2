const_value set 2
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall AzaleaGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_THUNDERPUNCH
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, GUITARIST, PELO, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, TWINS, AMYANDMAY2, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherbenny:
	trainer EVENT_BEAT_BUG_CATCHER_BENNY, GUITARIST, SHAUN, Bug_catcherbennySeenText, Bug_catcherbennyBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherbennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherAl:
	trainer EVENT_BEAT_BUG_CATCHER_AL, GUITARIST, KENDAL, Bug_catcherAlSeenText, Bug_catcherAlBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherJosh:
	trainer EVENT_BEAT_BUG_CATCHER_JOSH, GUITARIST, RUDY, Bug_catcherJoshSeenText, Bug_catcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymLockedDoor:
	jumptext AzaleaGymLockedDoorText
	
AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BUGSY, 1, $1
	jumpstd gymstatue2

AzaleaGymLockedDoorText:
	text "These doors are"
	line "locked!"
	done
	
BugsyText_INeverLose:
	text "I'm BLANCHE!"
	line "My #MON are"
	
	para "strong enough to"
	line "power this entire"
	cont "GYM!"
	
	para "Do you think you"
	line "stand a chance?"
	
	para "I'm an expert in"
	line "electricity."
	
	para "You'll be quite"
	line "shocked!"	
	done

BugsyText_ResearchIncomplete:
	text "Woah, nelly!"
	
	para "You're the real"
	line "deal, kid."
	
	para "You've earned this"
	line "BADGE."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "CHARGEBADGE."
	done

BugsyText_HiveBadgeSpeech:
	text "With the CHARGE-"
	line "BADGE #MON"
	
	para "up to L30 will"
	line "obey you, even"
	cont "traded ones."
	
	para "Here, you can also"
	line "have this gift."
	done

BugsyText_FuryCutterSpeech:
	text "TM41 contains"
	line "THUNDERPUNCH."

	para "It's a very"
	line "powerful electric"
	cont "attack."
	
	para "It even has the"
	line "potential to"
	cont "paralyze your foe."
	
	para "Quite a strategic"
	line "move."
	
	para "Ghaha!"
	line "Use it carefully!"
	done

BugsyText_BugMonsAreDeep:
	text "I'm going to fine"
	line "tune my training"
	cont "skills!"
	done

Bug_catcherbennySeenText:
	text "You can't move"
	line "on without"
	
	para "challenging me"
	line "first!"
	done

Bug_catcherbennyBeatenText:
	text "Buzz cut!"
	done

Bug_catcherbennyAfterBattleText:
	text "Sorry kiddo,"
	line "but this was an"
	cont "elaborate ruse!"
	done

Bug_catcherAlSeenText:
	text "Is this the"
	line "correct door?"
	
	para "Guess you'll"
	line "find out later!"
	done

Bug_catcherAlBeatenText:
	text "I've been"
	line "unplugged!"
	done

Bug_catcherAlAfterBattleText:
	text "Electric #MON"
	line "are the best!"
	
	para "You should get"
	line "a bunch of em!"
	done

Bug_catcherJoshSeenText:
	text "You're probably"
	line "far from the"
	cont "leader!"
	cont "Who knows?"
	done

Bug_catcherJoshBeatenText:
	text "Okay now!"
	done

Bug_catcherJoshAfterBattleText:
	text "I have no"
	line "regrets."
	done

TwinsAmyandmay1SeenText:
	text "Is this the"
	line "correct door?"
	
	para "You'll have to"
	line "battle me first,"
	cont "buddy!"
	done

TwinsAmyandmay1BeatenText:
	text "Gosh darn!"
	done

TwinsAmyandmay1AfterBattleText:
	text "I have nothing"
	line "else to say."
	cont "Move on, dude."
	done

TwinsAmyandmay2SeenText:
	text "MAY: You want to"
	line "see the LEADER?"
	cont "We come first!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY & MAY: Oh,"
	line "double goodness!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Our bug #-"
	line "MON lost! Oh, what"
	cont "a shame."
	done

AzaleaGymGuyText:
	text "Hey, soon to be"
	line "champ!"
	
	para "BLANCHE, is an"
	line "electrifying"
	cont "leader!"
	
	para "If you go up"
	line "against her,"
	
	para "don't use any"
	line "flying-type"
	cont "#MON."
	
	para "You won't get"
	line "very far!"
	done

AzaleaGymGuyWinText:
	text "Well done!"
	line "I think you'll go"
	cont "far, kid."
	
	para "You probably don't"
	line "even need my tips!"
	done

AzaleaGym_MapEventHeader:: db 0, 0

.Warps: db 24
	warp_def 39, 4, 10, ECRUTEAK_CITY
	warp_def 39, 5, 10, ECRUTEAK_CITY
	warp_def 32, 2, 5, AZALEA_GYM
	warp_def 32, 3, 6, AZALEA_GYM
	warp_def 25, 2, 3, AZALEA_GYM
	warp_def 25, 3, 4, AZALEA_GYM
	warp_def 32, 6, 9, AZALEA_GYM
	warp_def 32, 7, 10, AZALEA_GYM
	warp_def 25, 14, 7, AZALEA_GYM
	warp_def 25, 15, 8, AZALEA_GYM
	warp_def 10, 2, 13, AZALEA_GYM
	warp_def 10, 3, 14, AZALEA_GYM
	warp_def 5, 2, 11, AZALEA_GYM
	warp_def 5, 3, 12, AZALEA_GYM
	warp_def 5, 0, 16, AZALEA_GYM
	warp_def 35, 4, 15, AZALEA_GYM
	warp_def 20, 14, 19, AZALEA_GYM
	warp_def 20, 15, 20, AZALEA_GYM
	warp_def 15, 14, 17, AZALEA_GYM
	warp_def 15, 15, 18, AZALEA_GYM
	warp_def 20, 2, 23, AZALEA_GYM
	warp_def 20, 3, 24, AZALEA_GYM
	warp_def 15, 2, 21, AZALEA_GYM
	warp_def 15, 3, 22, AZALEA_GYM

.CoordEvents: db 0

.BGEvents: db 4
	signpost 37, 3, SIGNPOST_READ, AzaleaGymStatue
	signpost 37, 6, SIGNPOST_READ, AzaleaGymStatue
	signpost 10, 15, SIGNPOST_READ, AzaleaGymLockedDoor
	signpost 10, 14, SIGNPOST_READ, AzaleaGymLockedDoor

.ObjectEvents: db 7
	person_event SPRITE_BUGSY, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BugsyScript, -1
	person_event SPRITE_ROCKER, 11, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerBug_catcherbenny, -1
	person_event SPRITE_ROCKER, 33, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerBug_catcherAl, -1
	person_event SPRITE_ROCKER, 21, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerBug_catcherJosh, -1
	person_event SPRITE_ROCKER, 33, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerTwinsAmyandmay1, -1
	person_event SPRITE_TWIN, 10, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	person_event SPRITE_GYM_GUY, 37, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
