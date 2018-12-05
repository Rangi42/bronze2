const_value set 2
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUY

FuchsiaGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

JanineScript_0x195db9:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
;	applymovement FUCHSIAGYM_JANINE, MovementData_0x195f27
	faceplayer
	opentext
	writetext UnknownText_0x195f35
	waitbutton
	closetext
	winlosstext UnknownText_0x195fa1, 0
	loadtrainer JANINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	setevent EVENT_STUDIO_BLOCKER_MAN
	setevent EVENT_STUDIO_ROCKETS_WALK_IN
	specialphonecall SPECIALCALL_BIKESHOP
;	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
;	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
;	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
;	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special RunCallback_04
	opentext
	writetext UnknownText_0x195feb
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	jump UnknownScript_0x195e02
.FightDone:
	faceplayer
	opentext
UnknownScript_0x195e02:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue UnknownScript_0x195e15
	writetext UnknownText_0x196002
	buttonsound
	verbosegiveitem TM_THUNDERPUNCH
	iffalse UnknownScript_0x195e15
	setevent EVENT_GOT_TM06_TOXIC
UnknownScript_0x195e15:
	writetext UnknownText_0x196074
	waitbutton
	closetext
	end

FuschiaGym1Script_0x195e1b:
	trainer EVENT_BEAT_LASS_ALICE, LASS, ALICE, UnknownText_0x1960e6, UnknownText_0x196126, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x196139
	waitbutton
	closetext
	end

FuschiaGym2Script_0x195e55:
	trainer EVENT_BEAT_LASS_LINDA, LASS, LINDA, UnknownText_0x196166, UnknownText_0x19617b, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x196199
	waitbutton
	closetext
	end

FuschiaGym3Script_0x195e8f:
	trainer EVENT_BEAT_PICNICKER_CINDY, PICNICKER, CINDY, UnknownText_0x1961bb, UnknownText_0x1961f1, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19620c
	waitbutton
	closetext
	end
	
FuschiaGym4Script_0x195ec9:
	trainer EVENT_BEAT_CAMPER_BARRY, CAMPER, BARRY, UnknownText_0x196228, UnknownText_0x19624a, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19626b
	waitbutton
	closetext
	end

FuchsiaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuyWinScript
	writetext FuchsiaGymGuyText
	waitbutton
	closetext
	end

.FuchsiaGymGuyWinScript:
	writetext FuchsiaGymGuyWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JANINE, 1, $1
	jumpstd gymstatue2

MovementData_0x195f27:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

UnknownText_0x195f35:
	text "Aye, dude."
	
	para "I hope my GYM"
	line "didn't completely"
	
	para "drain you before"
	line "the battle."
	
	para "I'm KOHEN."
	
	para "The leader of this"
	line "kickin' GYM."
	
	para "I've always been"
	line "powered by my"
	cont "electric friends."
	
	para "Better step back"
	line "before you get hit"
	cont "by my lightning!"
	done

UnknownText_0x195fa1:
	text "Wowza."
	
	para "Call me shocked."
	line "You're pretty hot!"

	para "Here's ZAPBADGE."
	line "Take it."
	done

UnknownText_0x195feb:
	text "<PLAYER> received"
	line "ZAPBADGE."
	done

UnknownText_0x196002:
	text "I'm so floored, I'll"
	line "even give you a"
	cont "gift!"

	para "It's THUNDERPUNCH."
	
	para "It's a powerful"
	line "punch that can"
	
	para "leave your opp-"
	line "onent paralyzed."
	done

UnknownText_0x196074:
	text "I'm never going to"
	line "stop training."
	
	para "My #MON could"
	line "power a city with"
	
	para "the strength"
	line "they'll have."
	done

UnknownText_0x1960e6:
	text "Woah, did you"
	line "see those sparks"
	cont "between us?!"
	
	para "That means we"
	line "should battle!"
	done

UnknownText_0x196126:
	text "Ow ow ow!"
	done

UnknownText_0x196139:
	text "We should hang out"
	line "some time."
	done

UnknownText_0x196166:
	text "Fooled you!"
	line "Hahaha!"
	
	para "This is a dead"
	line "end."
	done

UnknownText_0x19617b:
	text "Ooh… My joke"
	line "backfired."
	done

UnknownText_0x196199:
	text "Well, at least I"
	line "weakened you up a"
	cont "bit for KOHEN."
	done

UnknownText_0x1961bb:
	text "Beware."
	
	para "High voltage!"
	done

UnknownText_0x1961f1:
	text "Hey, no fair."
	line "I wanted to win!"
	done

UnknownText_0x19620c:
	text "I'm cooked."
	
	para "No need to talk"
	line "to me."
	done

UnknownText_0x196228:
	text "I'm picking up a"
	line "signal…"
	
	para "You're on my"
	line "radar!"
	done

UnknownText_0x19624a:
	text "Dude, you're too"
	line "good!"
	done

UnknownText_0x19626b:
	text "KOHEN will show"
	line "you what's what."
	done

FuchsiaGymGuyText:
	text "Yo, CHAMP!"
	
	para "This GYM is pretty"
	line "electrifying!"
	
	para "Better keep your"
	line "water-type #-"
	cont "MON outta here."
	done

FuchsiaGymGuyWinText:
	text "I was blown away"
	line "by that battle!"
	done

FuchsiaGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 23, 6, 3, FUCHSIA_CITY
	warp_def 23, 7, 3, FUCHSIA_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 21, 5, SIGNPOST_READ, FuchsiaGymStatue
	signpost 21, 8, SIGNPOST_READ, FuchsiaGymStatue

.ObjectEvents: db 6
	person_event SPRITE_JANINE, 5, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, JanineScript_0x195db9, -1
	person_event SPRITE_LASS, 11, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, FuschiaGym1Script_0x195e1b, -1
	person_event SPRITE_LASS, 15, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, FuschiaGym2Script_0x195e55, -1
	person_event SPRITE_LASS, 3, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, FuschiaGym3Script_0x195e8f, -1
	person_event SPRITE_YOUNGSTER, 9, 1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, FuschiaGym4Script_0x195ec9, -1
	person_event SPRITE_GYM_GUY, 21, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuchsiaGymGuyScript, -1
