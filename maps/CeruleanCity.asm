const_value set 2
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER
	const CERYYOUNGBLOCK
	

CeruleanCity_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	maptrigger .Trigger0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

.Trigger0:
	end
	
CooltrainerMScript_0x184009:
	faceplayer
	opentext
	writetext UnknownText_0x1840bc
	yesorno
	iffalse .CooltrainerMScript_0x184009_2
	writetext LocalManYesText
	waitbutton
	closetext
	end

.CooltrainerMScript_0x184009_2:
	writetext LocalManNoText
	waitbutton
	closetext
	end
	
UnknownScript_0x184017:
	writetext UnknownText_0x184144
	waitbutton
	closetext
	end

SuperNerdScript_0x18401d:
	jumptextfaceplayer UnknownText_0x1841a8

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CooltrainerFScript_0x18402a:
	faceplayer
	opentext
	writetext UnknownText_0x1841fa
	waitbutton
	closetext
;	spriteface CERULEANCITY_COOLTRAINER_F, LEFT
;	opentext
;	writetext UnknownText_0x184229
;	waitbutton
;	closetext
;	opentext
;	writetext CeruleanCitySlowbroText
;	cry SLOWBRO
;	waitbutton
;	closetext
;	opentext
;	writetext UnknownText_0x18424b
;;	waitbutton
	closetext
	end

FisherScript_0x18404a:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184058
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue UnknownScript_0x18405e
UnknownScript_0x184058:
	writetext UnknownText_0x18424e
	waitbutton
	closetext
	end

UnknownScript_0x18405e:
	writetext UnknownText_0x184275
	waitbutton
	closetext
	end

YoungsterScript_0x184064:
	faceplayer
	opentext
	writetext UnknownText_0x1842a9
	waitbutton
	closetext
;	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
;	iffalse UnknownScript_0x184072
	end

UnknownScript_0x184072:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	spriteface CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext UnknownText_0x1842ee
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokeCenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityHiddenBerserkGene:
	dwb EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY, BERSERK_GENE

ArriveInKohtoManTrigger:
	spriteface CERULEANCITY_FISHER, RIGHT
	showemote EMOTE_SHOCK, CERULEANCITY_FISHER, 20
	setflag ENGINE_MAP_CARD
	applymovement CERULEANCITY_FISHER, ArriveInKohtoManMovement
	opentext
	writetext ArriveInKohtoManText
	waitbutton
	closetext
	dotrigger $1
	applymovement CERULEANCITY_FISHER, ArriveInKohtoManMovement2
	end
	
CeruBlockGym:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .HaveItem
	writetext CeruBlockAskforItem
	waitbutton
	closetext
	end
	
.HaveItem
	writetext CeruBlockAskforItemText
	yesorno
	iftrue .GiveItem
	writetext CeruBlockDidntGiveItemText
	waitbutton
	closetext
	end
	
.GiveItem
	takeitem SECRETPOTION
	writetext CeruBlockThanks
	waitbutton
	closetext
	applymovement CERYYOUNGBLOCK, CeruYoungsterLeavesMovement
	playsound SFX_ENTER_DOOR
	disappear CERYYOUNGBLOCK
	end
	
CeruGiveSecretPotion:
	giveitem SECRETPOTION
	end
	
CharcoalTownRock:
	jumpstd smashrock
	
ArriveInKohtoManMovement:
	step_right
	step_right
	step_up
	step_end

ArriveInKohtoManMovement2:
	step_down
	step_left
	step_left
	step_end

CeruYoungsterLeavesMovement:
	step_up
	step_end

CeruBlockDidntGiveItemText:
	text "Hey, no fair!"
	
	para "I work hard,"
	line "y'know."
	done
	
CeruBlockAskforItem:
	text "Man am I thirsty."
	
	para "I think I could"
	line "get back on the"
	
	para "job if I had a"
	line "bottle of water"
	
	para "from LITTLEPOND's"
	line "fresh lake."
	
	para "There's nothing"
	line "quite like it!"
	
	para "It's very special"
	line "water."
	done
	
CeruBlockAskforItemText:
	text "Woah, you have"
	line "SPECIALWATER?"
	
	para "Could I have that"
	line "to drink?"
	done
	
CeruBlockThanks:
	text "Thanks!"

	para "This will tide"
	line "me over for a"
	cont "good while."
	
	para "They don't make"
	line "water as fresh as"
	
	para "this anywhere"
	line "else."
	
	para "If you want to"
	line "challenge the GYM,"
	cont "come on in!"
	done
	
ArriveInKohtoManText:
	text "Do you know what"
	line "you just did?"
	
	para "You've arrived in"
	line "in KOHTO!"
	
	para "I can tell you are"
	line "new to this place."
	
	para "Check your"
	line "MAPGEAR and see!"
	done
	
LocalManYesText:
	text "Nice! Hopefully"
	line "you'll stick"
	cont "around!"
	done

LocalManNoText:
	text "Oh… Well we'll"
	line "have to try to"
	cont "impress you, then!"
	done
	
UnknownText_0x1840bc:
	text "A JANTO local?"
	line "What's that place"
	cont "like?"
	
	para "I don't get to"
	line "travel much."
	
	para "Do you like it"
	line "here?"
	done

UnknownText_0x184144:
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

UnknownText_0x1841a8:
	text "I will never"
	line "understand the"
	
	para "true power of my"
	line "#MON if I don't"
	cont "treat them well."
	done

CeruleanCitySlowbroText:
	text "SLOWBRO: Yarah?"
	done

UnknownText_0x1841fa:
	text "I'm going to meet"
	line "PROF. KOA in"
	cont "CARTIDGE TOWN."
	
	para "He's an expert"
	line "#MON"
	cont "researcher!"
	done

UnknownText_0x184229:
	text "SLOWBRO, show me"
	line "your CONFUSION!"
	done

UnknownText_0x18424b:
	text "…"
	done

UnknownText_0x18424e:
	text "They shut that"
	line "train station down"
	
	para "years ago, just to"
	line "open it back up"
	cont "again."

	para "Who's in charge of"
	line "public facilities"
	cont "here?"
	done

UnknownText_0x184275:
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
	done

UnknownText_0x1842a9:
	text "This town has two"
	line "#MON GYMs."
	
	para "The leaders are"
	line "brother and"
	cont "sister!"
	
	para "Talk about sibling"
	line "rivialry!"
	done

UnknownText_0x1842ee:
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done

CeruleanCitySignText:
	text "CHARCOAL TOWN"
	
	para "A Gritty Isolated"
	line "Locale"
	done

CeruleanGymSignText:
	text "CHARCOAL CITY"
	line "#MON GYM 1"
	cont "LEADER: ELROY"

	para "The Extreme"
	line "#MON Dude"
	done

CeruleanBikeShopSignText:
	text "CHARCOAL CITY"
	line "#MON GYM 2"
	cont "LEADER: KARLA"

	para "The Sky High"
	line "Flying Trainer"
	done

CeruleanPoliceSignText:
	text "There's a notice"
	line "here…"

	para "Stamp out thievery"
	line "and make the city"

	para "a friendlier, more"
	line "cheerful place!"

	para "CERULEAN POLICE"
	done

CeruleanCapeSignText:
	text "CHARCOAL TOWN"
	line "TRAIN STATION"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCity_MapEventHeader:: db 0, 0

.Warps: db 12
	warp_def 9, 19, 1, CERULEAN_GYM_BADGE_SPEECH_HOUSE
	warp_def 17, 28, 1, CERULEAN_POLICE_STATION
	warp_def 17, 11, 1, CERULEAN_TRADE_SPEECH_HOUSE
	warp_def 13, 31, 1, CERULEAN_POKECENTER_1F
	warp_def 29, 12, 1, CERULEAN_GYM
	warp_def 9, 23, 2, CERULEAN_MART
	warp_def 15, 41, 1, CERULEANCITYGATES
	warp_def 43, 15, 6, CERULEANCITYGATES
	warp_def 43, 16, 7, CERULEANCITYGATES
	warp_def 23, 30, 2, GOLDENROD_MAGNET_TRAIN_STATION
	warp_def 7, 30, 1, SEAFOAM_GYM
	warp_def 5, 39, 1, ROUTE_12_SUPER_ROD_HOUSE

.CoordEvents: db 1
	xy_trigger 0, 24, 30, 0, ArriveInKohtoManTrigger, 0, 0

.BGEvents: db 10
	signpost 16, 24, SIGNPOST_READ, CeruleanCitySign
	signpost 29, 9, SIGNPOST_READ, CeruleanGymSign
	signpost 7, 34, SIGNPOST_READ, CeruleanBikeShopSign
	signpost 5, 30, SIGNPOST_READ, CeruleanPoliceSign
	signpost 24, 28, SIGNPOST_READ, CeruleanCapeSign
	signpost 5, 32, SIGNPOST_READ, CeruleanLockedDoor
	signpost 13, 32, SIGNPOST_READ, CeruleanCityPokeCenterSign
	signpost 9, 24, SIGNPOST_READ, CeruleanCityMartSign
	signpost 4, 34, SIGNPOST_ITEM, CeruleanCityHiddenBerserkGene
	signpost 6, 30, SIGNPOST_READ, CeruGiveSecretPotion

.ObjectEvents: db 8
	person_event SPRITE_FISHER, 18, 19, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x184009, -1
	person_event SPRITE_SUPER_NERD, 13, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x18401d, -1
	person_event SPRITE_SLOWPOKE, -5, -5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	person_event SPRITE_COOLTRAINER_F, 26, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x18402a, -1
	person_event SPRITE_FISHER, 26, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x18404a, -1
	person_event SPRITE_YOUNGSTER, 32, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x184064, -1
	person_event SPRITE_GYM_GUY, 8, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeruBlockGym, EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	person_event SPRITE_ROCK, 5, 36, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharcoalTownRock, -1
