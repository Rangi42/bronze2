const_value set 2
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUY
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CooltrainerMScript_0x71670:
	faceplayer
	opentext
	writetext UnknownText_0x716ce
	checkcode VAR_DEXCAUGHT
	if_greater_than 248, UnknownScript_0x7167e
	waitbutton
	closetext
	end

UnknownScript_0x7167e:
	buttonsound
	writetext UnknownText_0x71725
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext UnknownText_0x71760
	buttonsound
	special Diploma
	writetext UnknownText_0x71763
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GymGuyScript_0x71696:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue UnknownScript_0x716a4
	writetext UnknownText_0x717b4
	waitbutton
	closetext
	end

UnknownScript_0x716a4:
	writetext UnknownText_0x717d8
	yesorno
	iffalse UnknownScript_0x716b0
	special PrintDiploma
	closetext
	end

UnknownScript_0x716b0:
	writetext UnknownText_0x71830
	waitbutton
	closetext
	end

UnknownScript_0x716b6:
	writetext UnknownText_0x71863
	waitbutton
	closetext
	end

SuperNerdScript_0x716bc:
	jumptextfaceplayer UnknownText_0x71895

FisherScript_0x716bf:
	jumptextfaceplayer UnknownText_0x718ca

MapCeladonMansion3FSignpost0Script:
	jumptext UnknownText_0x7190b

MapCeladonMansion3FSignpost1Script:
	jumptext UnknownText_0x71928

MapCeladonMansion3FSignpost2Script:
	jumptext UnknownText_0x71952

MapCeladonMansion3FSignpost3Script:
	jumptext UnknownText_0x71996

CeladonMansionOfficer:
	jumptextfaceplayer CeladonOfficerText
	
CeladonOfficerText:
	text "I'm sorry but the"
	line "roof is off"
	cont "limits."
	done
	
UnknownText_0x716ce:
	text "I'm the GAME"
	line "DESIGNER!"
	
	para "It brings me so"
	line "much joy to bring"
	cont "my vision to life!"
	done

UnknownText_0x71725:
	text "Wow! Excellent!"
	line "You completed your"
	cont "#DEX!"

	para "Congratulations!"
	done

UnknownText_0x71760:
	text "…"
	done

UnknownText_0x71763:
	text "The GRAPHIC ARTIST"
	line "will print out a"
	cont "DIPLOMA for you."

	para "You should go show"
	line "it off."
	done

UnknownText_0x717b4:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "I drew you!"
	done

UnknownText_0x717d8:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Oh, you completed"
	line "your #DEX?"

	para "Want me to print"
	line "out your DIPLOMA?"
	done

UnknownText_0x71830:
	text "Give me a shout if"
	line "you want your"
	cont "DIPLOMA printed."
	done

UnknownText_0x71863:
	text "Something's wrong."
	line "I'll have to can-"
	cont "cel printing."
	done

UnknownText_0x71895:
	text "Who, me? I'm the"
	line "PROGRAMMER."

	para "I lose a lot of"
	line "sleep."
	done

UnknownText_0x718ca:
	text "Hi! I'm in charge"
	line "of #MON teams."
	
	para "Did you enjoy"
	line "all the battles?"
	done

UnknownText_0x7190b:
	text "GAME FREAKO"
	line "DEVELOPMENT ROOM"
	done

UnknownText_0x71928:
	text "It's a detailed"
	line "drawing of a"
	
	para "girl and a boy"
	line "trainer."
	done

UnknownText_0x71952:
	text "It's the game"
	line "program. Messing"

	para "with it could put"
	line "even more bugs in"
	cont "the game!"
	done

UnknownText_0x71996:
	text "It looks like"
	line "complicated game"
	cont "code!"
	done

CeladonMansion3F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def -4, 0, 1, CELADON_MANSION_ROOF
	warp_def -3, 1, 2, CELADON_MANSION_2F
	warp_def 0, 6, 3, CELADON_MANSION_2F
	warp_def 0, 7, 2, CELADON_MANSION_ROOF

.CoordEvents: db 0

.BGEvents: db 4
	signpost 8, 5, SIGNPOST_UP, MapCeladonMansion3FSignpost0Script
	signpost 1, 4, SIGNPOST_UP, MapCeladonMansion3FSignpost1Script
	signpost 6, 1, SIGNPOST_UP, MapCeladonMansion3FSignpost2Script
	signpost 1, 1, SIGNPOST_UP, MapCeladonMansion3FSignpost3Script

.ObjectEvents: db 5
	person_event SPRITE_YOUNGSTER, 4, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x71670, -1
	person_event SPRITE_YOUNGSTER, 2, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x71696, -1
	person_event SPRITE_YOUNGSTER, 7, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x716bc, -1
	person_event SPRITE_LASS, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x716bf, -1
	person_event SPRITE_OFFICER, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonMansionOfficer, -1
