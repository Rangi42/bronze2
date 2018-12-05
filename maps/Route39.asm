const_value set 2
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek1:
	trainer EVENT_BEAT_POKEFANM_DEREK, POKEFANM, DEREK1, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, 0, PokefanmDerek1Script

PokefanmDerek1Script:
;	writecode VAR_CALLERID, PHONE_POKEFANM_DEREK
	end_if_just_battled
	opentext
;	checkflag ENGINE_DEREK_HAS_NUGGET
;	iftrue UnknownScript_0x1a5b4a
;	checkcellnum PHONE_POKEFANM_DEREK
;	iftrue UnknownScript_0x1a5b6e
;	checkpoke PIKACHU
;	iffalse UnknownScript_0x1a5b5c
;	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
;	iftrue UnknownScript_0x1a5b33
	writetext UnknownText_0x1a5cf8
	waitbutton
	closetext
;	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
;	scall UnknownScript_0x1a5b62
;	jump UnknownScript_0x1a5b36
	end
UnknownScript_0x1a5b33:
	scall UnknownScript_0x1a5b66
UnknownScript_0x1a5b36:
	askforphonenumber PHONE_POKEFANM_DEREK
	if_equal $1, UnknownScript_0x1a5b76
	if_equal $2, UnknownScript_0x1a5b72
	trainertotext POKEFANM, DEREK1, $0
	scall UnknownScript_0x1a5b6a
	jump UnknownScript_0x1a5b6e

UnknownScript_0x1a5b4a:
	scall UnknownScript_0x1a5b7a
	verbosegiveitem NUGGET
	iffalse UnknownScript_0x1a5b59
	clearflag ENGINE_DEREK_HAS_NUGGET
	jump UnknownScript_0x1a5b6e

UnknownScript_0x1a5b59:
	jump UnknownScript_0x1a5b7e

UnknownScript_0x1a5b5c:
	writetext UnknownText_0x1a5dec
	waitbutton
	closetext
	end

UnknownScript_0x1a5b62:
	jumpstd asknumber1m
	end

UnknownScript_0x1a5b66:
	jumpstd asknumber2m
	end

UnknownScript_0x1a5b6a:
	jumpstd registerednumberm
	end

UnknownScript_0x1a5b6e:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a5b72:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a5b76:
	jumpstd phonefullm
	end

UnknownScript_0x1a5b7a:
	jumpstd giftm
	end

UnknownScript_0x1a5b7e:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer EVENT_BEAT_POKEFANF_RUTH, POKEFANF, RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, PokefanfRuthScript

PokefanfRuthScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5db2
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer EVENT_BEAT_SAILOR_EUGENE, SAILOR, EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, SailorEugeneScript

SailorEugeneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5c4d
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer EVENT_BEAT_PSYCHIC_NORMAN, PSYCHIC_T, NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, PsychicNormanScript

PsychicNormanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5e57
	waitbutton
	closetext
	end

PokefanFScript_0x1a5bbe:
	faceplayer
	opentext
	checknite
	iffalse UnknownScript_0x1a5be5
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue UnknownScript_0x1a5bdf
	writetext UnknownText_0x1a5ee8
	waitbutton
	closetext
	winlosstext UnknownText_0x1a5f17, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

UnknownScript_0x1a5bdf:
	writetext UnknownText_0x1a5f31
	waitbutton
	closetext
	end

UnknownScript_0x1a5be5:
	writetext UnknownText_0x1a5ec4
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

FruitTreeScript_0x1a5bf4:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	dwb EVENT_ROUTE_39_HIDDEN_NUGGET, NUGGET

Route39HiddenSign:
	jumptext Route39HiddenSignText

SailorBlockShortcut:
	jumptextfaceplayer SailorBlockShortcutText
	
SailorBlockShortcutText:
	text "Like exploring,"
	line "aye kid?"
	
	para "Yeah, me too,"
	line "me too."
	done
	
Route39HiddenSignText:
	text "What the hell are"
	line "are you doing"
	cont "here?"
	
	para "Get lost!"
	done
	
Route39MiltankText:
	text "MILTANK: Mooo!"
	done

SailorEugeneSeenText:
	text "I just got back to"
	line "OLIVINE."

	para "So how about a"
	line "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

UnknownText_0x1a5c4d:
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done

PokefanmDerek1SeenText:
	text "Let me show you"
	line "my best friends!"
	done

PokefanmDerek1BeatenText:
	text "What have you done"
	line "to my friends?!"
	done

UnknownText_0x1a5cf8:
	text "If #MON aren't"
	line "your best friends,"
	
	para "then what would"
	line "you have them for?"
	done

PokefanfRuthSeenText:
	text "Hello dear!"
	line "Could your #MON"
	
	para "be anywhere near"
	line "as cute as mine?"
	cont "Please show me!"
	done

PokefanfRuthBeatenText:
	text "Mine are still"
	line "cuter."
	done

UnknownText_0x1a5db2:
	text "The cutest #MON"
	line "of all are baby"
	cont"#MON!"
	done

UnknownText_0x1a5dec:
	text "PIKACHU is it!"
	line "Don't you agree?"
	done

PsychicNormanSeenText:
	text "Is it possible"
	line "for someone to"
	
	para "hold too much"
	line "power?"
	done

PsychicNormanBeatenText:
	text "It truly is."
	done

UnknownText_0x1a5e57:
	text "It was an honor to"
	line "battle with #-"
	cont "MON"
	
	para "the likes of"
	line "yours."
	done

UnknownText_0x1a5ec4:
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done

UnknownText_0x1a5ee8:
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done

UnknownText_0x1a5f17:
	text "Oh, how disap-"
	line "pointing…"
	done

UnknownText_0x1a5f31:
	text "I met my MEOWTH at"
	line "night, right here"
	cont "on ROUTE 39."

	para "I'm not sure why,"
	line "but it seems to"

	para "like it when I"
	line "train here."

	para "It seems to become"
	line "friendlier by"

	para "training here than"
	line "anywhere else."
	done

Route39SignText:
	text "ROUTE 10"

	para "FIGBRANCH TOWN -"
	line "NEWPORT CITY"
	done

MoomooFarmSignText:
	text "Why not enjoy a"
	line "relaxing picnic?"
	
	para "FELONWOOD PARK"
	line "ahead."
	done

Route39TrainerTipsText:
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done

Route39_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 1, 1, 1, ROUTE_39_BARN
	warp_def 21, 5, 3, ROUTE_35_NATIONAL_PARK_GATE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 37, 15, SIGNPOST_READ, Route39TrainerTips
	signpost 37, 3, SIGNPOST_READ, MoomooFarmSign
	signpost 48, 8, SIGNPOST_READ, Route39Sign
	signpost 37, 17, SIGNPOST_ITEM, Route39HiddenNugget
	signpost 2, 4, SIGNPOST_READ, Route39HiddenSign

.ObjectEvents: db 6
	person_event SPRITE_SAILOR, 29, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorBlockShortcut, EVENT_NATIONAL_PARK_TM_DIG
	person_event SPRITE_POKEFAN_M, 34, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanmDerek1, -1
	person_event SPRITE_POKEFAN_F, 25, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	person_event SPRITE_STANDING_YOUNGSTER, 23, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerPsychicNorman, -1
	person_event SPRITE_FRUIT_TREE, 40, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a5bf4, -1
	person_event SPRITE_POKEFAN_F, 40, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1a5bbe, -1
