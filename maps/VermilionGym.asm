const_value set 2
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SurgeScript_0x1920a5:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext UnknownText_0x192142
	waitbutton
	closetext
	winlosstext UnknownText_0x192238, 0
	loadtrainer LT_SURGE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	domaptrigger ROUTE12GATES, $1 
	opentext
	writetext UnknownText_0x192277
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext UnknownText_0x192291
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x192303
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer EVENT_BEAT_GENTLEMAN_GREGORY, PSYCHIC_T, PAUL2, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, GentlemanGregoryScript

GentlemanGregoryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1923b0
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer EVENT_BEAT_GUITARIST_VINCENT, PSYCHIC_T, LEON1, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, GuitaristVincentScript

GuitaristVincentScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19244b
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer EVENT_BEAT_JUGGLER_HORTON, PSYCHIC_T, MIKE2, JugglerHortonSeenText, JugglerHortonBeatenText, 0, JugglerHortonScript

JugglerHortonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1924d6
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

MapVermilionGymSignpost14Script:
	jumptext UnknownText_0x19261e

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2

UnknownText_0x192142:
	text "<PLAYER>, is it?"
	
	para "I am MAURO."
	
	para "I specilise in"
	line "#MON with"
	cont "psychic abilities."
	
	para "Together my #-"
	line "MON and I have"
	
	para "bent space and"
	line "time to our wills."
	
	para "I will be your"
	line "final GYM chall-"
	cont "enge."
	
	para "Let us begin!"
	done

UnknownText_0x192238:
	text "Such power."
	
	para "Such grace."
	
	para "That earns you the"
	line "PSYCHOBADGE!"
	done

UnknownText_0x192277:
	text "<PLAYER> received"
	line "PSYCHOBADGE."
	done

UnknownText_0x192291:
	text "Ah, you are quite"
	line "a strong trainer."
	
	para "It's not every day"
	line "a trainer like you"
	cont "comes along."
	
	para "In fact, I think"
	line "you're strong"
	
	para "enough to visit"
	line "MT. ENDER."
	
	para "I'll give the word"
	line "up north to let"
	cont "you in."
	
	para "I sense a further"
	line "challenge awaits"
	cont "you."
	done

UnknownText_0x192303:
	text "Well done,"
	line "<PLAYER>."
	
	para "Dont forget MT."
	line "ENDER is up north."
	
	para "It's quite a"
	line "challenge!"
	done

GentlemanGregorySeenText:
	text "This is where your"
	line "path comes to an"
	cont "unfortunate end."
	done

GentlemanGregoryBeatenText:
	text "I have failed"
	line "MAURO."
	done

UnknownText_0x1923b0:
	text "I have nothing to"
	line "say to you."
	done

GuitaristVincentSeenText:
	text "I can feel your"
	line "power."
	
	para "Can it be true?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how amazing!"
	done

UnknownText_0x19244b:
	text "I feel nothing but"
	line "humbleness."
	done

JugglerHortonSeenText:
	text "I can see into"
	line "your mind."
	
	para "I'm going to take"
	line "you down!"
	done

JugglerHortonBeatenText:
	text "I was overpowered…"
	done

UnknownText_0x1924d6:
	text "You are quite"
	line "strong."
	
	para "I'll see how MAURO"
	line "deals with you."
	done

VermilionGymGuyText:
	text "Yo! CHAMP!"
	
	para "This is the last"
	line "GYM in KOHTO."
	
	para "It will take all"
	line "of your might to"
	cont "take down MAURO."
	
	para "He specializes"
	line "in psychic-types."
	
	para "All I can say is"
	line "good luck."
	done

VermilionGymGuyWinText:
	text "If I was sitting,"
	line "I'd have been on"
	
	para "the edge of my seat"
	line "for that battle!"
	
	para "I mean, wow."
	
	para "Talk about a clash"
	line "of titans!"
	done

UnknownText_0x19261e:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 4, 7, VERMILION_CITY
	warp_def 13, 5, 7, VERMILION_CITY

.CoordEvents: db 0

.BGEvents: db 17
	signpost -7, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -7, -1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -7, 0, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -7, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -7, 2, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -6, -1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -6, 0, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -6, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -6, 2, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -6, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -5, -1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -5, 0, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -5, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -5, 2, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost -5, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 3, SIGNPOST_READ, VermilionGymStatue
	signpost 11, 6, SIGNPOST_READ, VermilionGymStatue

.ObjectEvents: db 5
	person_event SPRITE_SURGE, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SurgeScript_0x1920a5, -1
	person_event SPRITE_YOUNGSTER, 5, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	person_event SPRITE_YOUNGSTER, 9, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 5, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerGuitaristVincent, -1
	person_event SPRITE_YOUNGSTER, 7, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerJugglerHorton, -1
	person_event SPRITE_GYM_GUY, 11, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
