const_value set 2
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY

SaffronGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SabrinaScript_0x189c2e:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext UnknownText_0x189cdf
	waitbutton
	closetext
	winlosstext UnknownText_0x189df4, 0
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext UnknownText_0x189e95
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext UnknownText_0x189ead
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x189f6c
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer EVENT_BEAT_MEDIUM_REBECCA, LASS, MANDIE, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, MediumRebeccaScript

MediumRebeccaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18a034
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer EVENT_BEAT_PSYCHIC_FRANKLIN, BEAUTY, VICTORIA1, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, PsychicFranklinScript

PsychicFranklinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18a0a6
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer EVENT_BEAT_MEDIUM_DORIS, LASS, ADELINA, MediumDorisSeenText, MediumDorisBeatenText, 0, MediumDorisScript

MediumDorisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18a136
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer EVENT_BEAT_PSYCHIC_JARED, BEAUTY, SAMANTHA1, PsychicJaredSeenText, PsychicJaredBeatenText, 0, PsychicJaredScript

PsychicJaredScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18a1b3
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext SABRINA, 1, $1
	jumpstd gymstatue2

UnknownText_0x189cdf:
	text "Oh hi!"
	
	para "Yes, it's me,"
	line "BIANCA."
	
	para "The leader of"
	line "this GYM."
	
	para "You'll have to"
	line "try harder than"
	
	para "your best if you"
	line "want to stand a"
	cont "chance."
	
	para "Stand back, it's"
	line "going to get hot!"
	done

UnknownText_0x189df4:
	text "No way!"
	
	para "I can't have let"
	line "this happen."
	
	para "Ah, darn."
	
	para "You have earned"
	line "yourself the"
	cont "TERRABADGE."
	done

UnknownText_0x189e95:
	text "<PLAYER> received"
	line "TERRABADGE."
	done

UnknownText_0x189ead:
	text "Wear it with"
	line "pride."
	
	para "Not many trainers"
	line "get to own one of"
	cont "these."
	done

UnknownText_0x189f6c:
	text "Do you need"
	line "something?"
	
	para "I have some"
	line "advice at least."
	
	para "Just keep going."
	done

MediumRebeccaSeenText:
	text "You won't douse"
	line "me out!"
	done

MediumRebeccaBeatenText:
	text "Arrgh, too much."
	done

UnknownText_0x18a034:
	text "I'm all wet."
	done

PsychicFranklinSeenText:
	text "Fire comes from"
	line "the soul."
	
	para "Just try and put"
	line "out my fire!"
	done

PsychicFranklinBeatenText:
	text "I'm all snuffed"
	line "out."
	done

UnknownText_0x18a0a6:
	text "BIANCA has a pure"
	line "soul of fire."
	done

MediumDorisSeenText:
	text "I'm not about to"
	line "let you through!"
	done

MediumDorisBeatenText:
	text "Roasted."
	done

UnknownText_0x18a136:
	text "Darn! I didn't use"
	line "the right moves."
	
	para "You better beat"
	line "BIANCA."
	done

PsychicJaredSeenText:
	text "Are you one to"
	line "take the long"
	cont "road?"
	done

PsychicJaredBeatenText:
	text "I was no match"
	line "for you."
	done

UnknownText_0x18a1b3:
	text "I need to get my"
	line "act together for"
	cont "my next battle."
	done

SaffronGymGuyText:
	text "Yo, CHAMP!"

	para "This GYM is"
	line "flaming hot!"
	
	para "I'm sure you know"
	line "how to deal with"
	cont "fire-types."
	
	para "I won't get in"
	line "your way."
	done

SaffronGymGuyWinText:
	text "Ah, I see BIANCA"
	line "kept her eye on"
	cont "her badges."
	
	para "A splendid battle!"
	done

SaffronGym_MapEventHeader:: db 0, 0

.Warps: db 32
	warp_def 17, 6, 2, SAFFRON_CITY
	warp_def 17, 7, 2, SAFFRON_CITY
	warp_def -1, 3, 18, SAFFRON_GYM
	warp_def -1, 5, 19, SAFFRON_GYM
	warp_def -1, 1, 20, SAFFRON_GYM
	warp_def -2, 17, 21, SAFFRON_GYM
	warp_def -2, 1, 22, SAFFRON_GYM
	warp_def -2, 9, 23, SAFFRON_GYM
	warp_def -2, 19, 24, SAFFRON_GYM
	warp_def -2, 7, 25, SAFFRON_GYM
	warp_def -1, 10, 26, SAFFRON_GYM
	warp_def -1, 7, 27, SAFFRON_GYM
	warp_def -2, 13, 28, SAFFRON_GYM
	warp_def -2, 4, 29, SAFFRON_GYM
	warp_def -2, 15, 30, SAFFRON_GYM
	warp_def -2, 10, 31, SAFFRON_GYM
	warp_def -2, 3, 32, SAFFRON_GYM
	warp_def -1, 11, 3, SAFFRON_GYM
	warp_def -2, 16, 4, SAFFRON_GYM
	warp_def -2, 12, 5, SAFFRON_GYM
	warp_def -2, 2, 6, SAFFRON_GYM
	warp_def -2, 5, 7, SAFFRON_GYM
	warp_def -1, 6, 8, SAFFRON_GYM
	warp_def -2, 11, 9, SAFFRON_GYM
	warp_def -1, 4, 10, SAFFRON_GYM
	warp_def -1, 2, 11, SAFFRON_GYM
	warp_def -2, 18, 12, SAFFRON_GYM
	warp_def -2, 8, 13, SAFFRON_GYM
	warp_def -1, 0, 14, SAFFRON_GYM
	warp_def -2, 6, 15, SAFFRON_GYM
	warp_def -2, 0, 16, SAFFRON_GYM
	warp_def -2, 14, 17, SAFFRON_GYM

.CoordEvents: db 0

.BGEvents: db 2
	signpost 15, 5, SIGNPOST_READ, SaffronGymStatue
	signpost 15, 8, SIGNPOST_READ, SaffronGymStatue

.ObjectEvents: db 6
	person_event SPRITE_SABRINA, 0, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SabrinaScript_0x189c2e, -1
	person_event SPRITE_LASS, 8, 7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerMediumRebecca, -1
	person_event SPRITE_BUENA, 5, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPsychicFranklin, -1
	person_event SPRITE_LASS, 3, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerMediumDoris, -1
	person_event SPRITE_BUENA, 0, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerPsychicJared, -1
	person_event SPRITE_GYM_GUY, 15, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
