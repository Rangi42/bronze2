const_value set 2
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M
	const VERBLOCK
	const VERBLOCK2

VermilionCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

TeacherScript_0x1aa983:
	jumptextfaceplayer UnknownText_0x1aaa15

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

SuperNerdScript_0x1aa99b:
	jumptextfaceplayer UnknownText_0x1aab1a

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftrue UnknownScript_0x1aa9ab
	writetext UnknownText_0x1aab64
	waitbutton
	closetext
	end

UnknownScript_0x1aa9ab:
	writetext UnknownText_0x1aab84
	pause 15
	cry SNORLAX
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	checkcode VAR_BADGES
	if_equal 16, .AllBadges
;	if_greater_than 13, .MostBadges
;	if_greater_than 9, .SomeBadges
	writetext UnknownText_0x1aabc8
	waitbutton
	closetext
	end

;.SomeBadges:
;	writetext UnknownText_0x1aac2b
;	waitbutton
;	closetext
;	end

;.MostBadges:
;	writetext UnknownText_0x1aac88
;	waitbutton
;	closetext
;	end

.AllBadges:
	writetext UnknownText_0x1aacf3
	buttonsound
	verbosegiveitem HP_UP, 5
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext UnknownText_0x1aad4a
	waitbutton
.Done:
	closetext
	end

CeruBlockPath:
	faceplayer
	opentext
	checkcode VAR_BADGES
	if_greater_than 14, .Leaves
	writetext CeruYoungBlockText
	waitbutton
	closetext
	end

.Leaves
	writetext CeruYoungBlockTextLeaves
	waitbutton
	closetext
	applymovement VERBLOCK2, CeruGymGuyLeavesMovement
	playsound SFX_ENTER_DOOR
	disappear VERBLOCK2
	end
	
VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokeCenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	dwb EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL, FULL_HEAL

LabClosedScript:
	jumptext LabClosedText

CeruGymGuyLeavesMovement:
	step_up
	step_end
	
CeruYoungBlockTextLeaves:
	text "Wow, look at all"
	line "those BADGES!"
	
	para "You're a real hot"
	line "shot!"
	
	para "You should come"
	line "into the GYM!"
	
	para "This way."
	done
	
CeruYoungBlockText:
	text "Hey, I can't let"
	line "you through here!"
	
	para "You have barely"
	line "enough BADGES"
	
	para "in this region to"
	line "be strong enough."
	done
	
LabClosedText:
	text "The door is"
	line "locked."
	done

UnknownText_0x1aaa15:
	text "I'd love to go for"
	line "a swim."
	
	para "But the TENTACRUEL"
	line "are exactly what"
	cont "they are."
	cont "Cruel."
	done

VermilionMachopOwnerText:
	text "My #MON are my"
	line "partners forever."
	
	para "And that makes me"
	line "happy."
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

UnknownText_0x1aab1a:
	text "This place is a"
	line "paradise for"
	
	para "people and"
	line "#MON."
	
	para "It's the final"
	line "stop for most"
	
	para "trainers before"
	line "the #MON"
	cont "LEAGUE."
	done

UnknownText_0x1aab64:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

UnknownText_0x1aab84:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

UnknownText_0x1aabc8:
	text "Wow! It's nice to"
	line "meet such a strong"
	cont "trainer."
	
	para "Have a lot of"
	line "BADGES is"
	cont "impressive."
	
	para "If you can get the"
	line "final one from"
	
	para "this town, I'll"
	line "give ya a reward!"
	done

UnknownText_0x1aac2b:
	text "You've started to"
	line "collect KANTO GYM"
	cont "BADGES?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

UnknownText_0x1aac88:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of KANTO"
	line "GYMS soon."

	para "Let me know if"
	line "you get all eight"
	cont "BADGES."
	done

UnknownText_0x1aacf3:
	text "Impressive!"
	
	para "You've got all the"
	line "KOHTO BADGES and"
	cont "then some!"
	
	para "Here, you earned"
	line "these!"
	done

UnknownText_0x1aad4a:
	text "You must be one of"
	line "the world's"
	
	para "strongest trainers"
	line "with all those"
	cont "BADGES."
	done

VermilionCitySignText:
	text "CELESTE CITY"

	para "The Exotic Island"
	line "Town"
	done

VermilionGymSignText:
	text "CELESTE CITY"
	line "#MON GYM"
	cont "LEADER: MAURO"

	para "The Psychic #-"
	line "MON Guru"
	done

PokemonFanClubSignText:
	text "These two trees"
	line "were planted in"
	
	para "remembrance to"
	line "those lost at sea."
	done

VermilionCityDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

VermilionCityPortSignText:
	text "VERMILION PORT"
	line "ENTRANCE"
	done

VermilionCity_MapEventHeader:: db 0, 0

.Warps: db 10
	warp_def 9, 35, 1, VERMILION_HOUSE_FISHING_SPEECH_HOUSE
	warp_def 19, 9, 1, VERMILION_POKECENTER_1F
	warp_def 25, 21, 1, POKEMON_FAN_CLUB
	warp_def 11, 7, 1, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	warp_def 11, 13, 2, VERMILION_MART
	warp_def 3, 33, 1, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE
	warp_def 15, 28, 1, VERMILION_GYM
	warp_def 31, 25, 1, VERMILION_PORT_PASSAGE
	warp_def 31, 26, 2, VERMILION_PORT_PASSAGE
	warp_def 13, 30, 1, DIGLETTS_CAVE

.CoordEvents: db 0

.BGEvents: db 8
	signpost 12, 20, SIGNPOST_READ, VermilionCitySign
	signpost 20, 30, SIGNPOST_READ, VermilionGymSign
	signpost 27, 11, SIGNPOST_READ, PokemonFanClubSign
	signpost 13, 28, SIGNPOST_READ, VermilionCityDiglettsCaveSign
	signpost 13, 29, SIGNPOST_READ, VermilionCityPortSign
	signpost 19, 10, SIGNPOST_READ, VermilionCityPokeCenterSign
	signpost 11, 14, SIGNPOST_READ, VermilionCityMartSign
	signpost 11, 26, SIGNPOST_ITEM, VermilionCityHiddenFullHeal

.ObjectEvents: db 8
	person_event SPRITE_YOUNGSTER, 26, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1aa983, -1
	person_event SPRITE_FISHER, 22, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	person_event SPRITE_MACHOP, 0, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, VermilionMachop, -1
	person_event SPRITE_SUPER_NERD, 13, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x1aa99b, -1
	person_event SPRITE_BIG_SNORLAX, 0, 0, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	person_event SPRITE_POKEFAN_M, 6, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	person_event SPRITE_SUICUNE, 21, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LabClosedScript, -1
	person_event SPRITE_YOUNGSTER, 16, 28, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeruBlockPath, EVENT_GOT_SECRETPOTION_FROM_PHARMACY
