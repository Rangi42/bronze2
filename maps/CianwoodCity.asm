const_value set 2
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_SUPER_NERD
	const CIANWOODCITY_LASS_2
	const CIANWOODCITY_SUPER_NERD_2
	const CIANWOODCITY_DOOR_BLOCKER

CianwoodCity_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw MissingKidsPhonecall, 0
	dw NoMissingKidsPhonecall, 1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	return

MissingKidsPhonecall:
	dotrigger $1
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	end
	
NoMissingKidsPhonecall:
	end
	
;.FlyPoint:
;	setflag ENGINE_FLYPOINT_CIANWOOD
;	setevent EVENT_EUSINE_IN_BURNED_TOWER
;	checkevent EVENT_FOUGHT_EUSINE
;	iffalse UnknownScript_0x1a001d
;	disappear CIANWOODCITY_EUSINE
;UnknownScript_0x1a001d:
;	return

UnknownScript_0x1a001e:
;	spriteface PLAYER, UP
;	showemote EMOTE_SHOCK, PLAYER, 15
;	pause 15
;	playsound SFX_WARP_FROM
;	applymovement CIANWOODCITY_SUICUNE, MovementData_0x1a00da
;	spriteface PLAYER, DOWN
;	pause 15
;	playsound SFX_WARP_FROM
;	applymovement CIANWOODCITY_SUICUNE, MovementData_0x1a00e0
;	disappear CIANWOODCITY_SUICUNE
;	pause 10
;	dotrigger $0
;	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
;	domaptrigger ROUTE_42, $1
;	checkevent EVENT_FOUGHT_EUSINE
;	iftrue .Done
;	setevent EVENT_FOUGHT_EUSINE
;	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
;	appear CIANWOODCITY_EUSINE
;	applymovement CIANWOODCITY_EUSINE, MovementData_0x1a00e7
;	opentext
;	writetext UnknownText_0x1a0433
;	waitbutton
;	closetext
;	winlosstext UnknownText_0x1a05a1, 0
;	setlasttalked CIANWOODCITY_EUSINE
;	loadtrainer MYSTICALMAN, EUSINE
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
;	opentext
;	writetext UnknownText_0x1a05c3
;	waitbutton
;	closetext
;	applymovement CIANWOODCITY_EUSINE, MovementData_0x1a00ec
;	disappear CIANWOODCITY_EUSINE
;	pause 20
;	special Special_FadeOutMusic
;	playmapmusic
;	pause 10
;.Done:
;	end

PokefanFScript_0x1a0084:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotRareCandys
	writetext UnknownText_0x1a01e3
	buttonsound
	verbosegiveitem RARE_CANDY, 3
	iffalse .BagFull
	setevent EVENT_GOT_HM02_FLY
	writetext UnknownText_0x1a021d
	waitbutton
	closetext
	end

.BagFull
	writetext CianNoRoomForCandyText
	waitbutton
	closetext
	end
	
.GotRareCandys:
	writetext UnknownText_0x1a021d
	waitbutton
	closetext
	end
	
UnknownScript_0x1a009c:
	writetext UnknownText_0x1a01e3
	buttonsound
	verbosegiveitem HM_FLY
	iffalse UnknownScript_0x1a00b1
	setevent EVENT_GOT_HM02_FLY
	writetext UnknownText_0x1a021d
	buttonsound
UnknownScript_0x1a00ad:
	writetext UnknownText_0x1a0277
	waitbutton
UnknownScript_0x1a00b1:
	closetext
	end

CianGuyOutsideGym:
	faceplayer
	opentext
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iffalse .GymClosed
	writetext CianGuyOutsideGymText
	waitbutton
	closetext
	end
	
.GymClosed
	writetext CianGuyOutsideGymClosedText
	waitbutton
	closetext
	end
	
StandingYoungsterScript_0x1a00b3:
	jumptextfaceplayer UnknownText_0x1a02df

PokefanMScript_0x1a00b6:
	jumptextfaceplayer UnknownText_0x1a0319

LassScript_0x1a00b9:
	jumptextfaceplayer UnknownText_0x1a0394

UnknownScript_0x1a00bc:
	jumptextfaceplayer UnknownText_0x1a03cc

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumpstd martsign

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokeCenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	dwb EVENT_CIANWOOD_CITY_HIDDEN_REVIVE, REVIVE

CianwoodCityHiddenMaxEther:
	dwb EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER, MAX_ETHER
	
CianwoodBuildingSign:
	jumptext CianwoodBuildingSignText

CianBottomOfMapPerson:
	jumptextfaceplayer CianBottomOfMapPersonText

CianKeyPerson:
	faceplayer
	opentext
	writetext CianKeyPersonText1
	yesorno
	iffalse .Refuse1
	writetext CianKeyPersonText2
	yesorno
	iffalse .Refuse2
	checkitem SODA_POP
	iffalse .YouDontHave
	takeitem SODA_POP
	writetext CianKeyPersonText3
	waitbutton
	closetext
	applymovement CIANWOODCITY_SUPER_NERD_2, MovementData_0x1a00e7
	disappear CIANWOODCITY_SUPER_NERD_2
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	end

.Refuse1
	writetext CianKeyPersonTextRefuse1
	waitbutton
	closetext
	end
	
.Refuse2
	writetext CianKeyPersonTextRefuse2
	waitbutton
	closetext
	end
	
.YouDontHave
	writetext YouDontHaveText
	waitbutton
	closetext
	end

CianwoodCityDEVScript:
	jumptext CianwoodCityDEVText
	
CianGymDoorBlock:
	jumptext CianGymDoorBlockText
	
MovementData_0x1a00da:
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	db $38 ; movement
	step_end

MovementData_0x1a00e0:
	db $39 ; movement
	fast_jump_step_right
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end

MovementData_0x1a00e7:
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x1a00ec:
	step_down
	step_down
	step_down
	step_down
	step_end

CianwoodCityDEVText:
	text "Dev Diary 10"

	para "The 20th of"
	line "FEBUARY 2018"
		
	para "Finished the final"
	line "story event in the"
	cont "post game."
	
	para "It's a full play-"
	line "able game from"
	cont "start to finish."
	
	para "Granted, minus"
	line "a lot of edited"
	
	para "graphics and"
	line "polish,"
	
	para "But I am feeling"
	line "very proud."
	
	para "This is the game"
	line "I wanted to make."
		
	para "-FREAKO out."
	done
	
CianGuyOutsideGymClosedText:
	text "I can't get into"
	line "the GYM."
	
	para "Something is keep-"
	line "ing the door"
	cont "closed."
	done
	
CianNoRoomForCandyText:
	text "Oh I'm sorry."
	line "Your pack is full!"
	done
	
CianGymDoorBlockText:
	text "The door appears"
	line "to be blocked by"
	
	para "a mysterious"
	line "force."
	done
	
CianKeyPersonText1:
	text "Hey kid."
	line "Looking for a"
	cont "way into the GYM?"
	done
	
CianKeyPersonTextRefuse1:
	text "Well alright then."
	done

CianKeyPersonText2:
	text "Well I'm a little"
	line "thirsty."
	
	para "I could use some"
	line "drinks and maybe"
	
	para "I'll let you know"
	line "how."
	
	para "Do you have any"
	line "SODA POP for me?"
	done
	
CianKeyPersonText3:
	text "Wow, thanks!"
	
	para "…Glug glug…"
	
	para "…Glug glug…"
	
	para "Ah! Refreshing!"
	
	para "Alright, the"
	line "secret is in the"
	
	para "building behind"
	line "me."
	
	para "I'll meet you"
	line "inside!"
	done

YouDontHaveText:
	text "Hey! You don't"
	line "have any SODA"
	cont "POPs!"
	
	para "Come back when you"
	line "have some SODA"
	cont "POP."
	done
	
CianKeyPersonTextRefuse2:
	text "Come back when"
	line "you have some"
	
	para "SODA POP for me"
	line "to drink."	
	done
	
CianBottomOfMapPersonText:
	text "I'm a traveler."
	
	para "Hey, you have"
	line "BADGES too!"
	
	para "You must travel a"
	line "lot."
	done
	
CianGuyOutsideGymText:
	text "I couldn't beat"
	line "the GYM LEADER"
	
	para "so I'm just going"
	line "to sulk to myself"
	cont "over here."
	done

CianGotRareCandyText:
	text "Don't feed too many"
	line "to one #MON!"
	
	para "They could get a"
	line "tummyache!"
	done
	
UnknownText_0x1a00f1:
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#MON knew how"
	line "to FLY…"
	done

UnknownText_0x1a0163:
	text "But you can't use"
	line "FLY without this"
	cont "city's GYM BADGE."

	para "If you beat the"
	line "GYM LEADER here,"
	cont "come see me."

	para "I'll have a nice"
	line "gift for you."
	done

UnknownText_0x1a01e3:
	text "Oh what a sweet"
	line "trainer you are!"
	
	para "And such lovely"
	line "#MON too!"
	
	para "Here, have some"
	line "candy, on me!"
	done

UnknownText_0x1a021d:
	text "RARE CANDY can"
	line "be very helpful"
	
	para "and tasty for your"
	line "#MON!"
	done

UnknownText_0x1a0277:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

UnknownText_0x1a02df:
	text "What's it like to"
	line "ride a #MON"
	cont "over the sea?"
	
	para "Nothing but you"
	line "and a close"
	cont "friend,"
	
	para "together in the"
	line "vast openness."
	cont "Sounds scary."
	done

UnknownText_0x1a0319:
	text "They say these"
	line "rocks were formed"
	
	para "by a #MON long,"
	line "long ago."
	
	para "I wish I could"
	line "create something"
	cont "even half as big!"
	done

UnknownText_0x1a0394:
	text "Do you like water"
	line "type #MON?"
	
	para "I like those the"
	line "most."
	
	para "But I think other"
	line "#MON are cool,"
	cont "as well."
	done

; possibly unused
UnknownText_0x1a03cc:
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done

UnknownText_0x1a0433:
	text "EUSINE: Yo,"
	line "<PLAYER>."

	para "Wasn't that"
	line "SUICUNE just now?"

	para "I only caught a"
	line "quick glimpse, but"

	para "I thought I saw"
	line "SUICUNE running on"
	cont "the waves."

	para "SUICUNE is beau-"
	line "tiful and grand."

	para "And it races"
	line "through towns and"

	para "roads at simply"
	line "awesome speeds."

	para "It's wonderful…"

	para "I want to see"
	line "SUICUNE up close…"

	para "I've decided."

	para "I'll battle you as"
	line "a trainer to earn"
	cont "SUICUNE's respect!"

	para "Come on, <PLAYER>."
	line "Let's battle now!"
	done

UnknownText_0x1a05a1:
	text "I hate to admit"
	line "it, but you win."
	done

UnknownText_0x1a05c3:
	text "You're amazing,"
	line "<PLAYER>!"

	para "No wonder #MON"
	line "gravitate to you."

	para "I get it now."

	para "I'm going to keep"
	line "searching for"
	cont "SUICUNE."

	para "I'm sure we'll see"
	line "each other again."

	para "See you around!"
	done

CianwoodCitySignText:
	text "MAUVEWOOD TOWN"

	para "The Lakeside"
	line "Coast City"
	done

CianwoodGymSignText:
	text "MAUVEWOOD TOWN"
	line "#MON GYM"

	para "LEADER: SEBASTIAN"

	para "The Pure Essence"
	line "of Enlightenment"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "CIANWOOD CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

CianwoodPokeSeerSignText:
	text "THE # SEER"
	done

CianwoodBuildingSignText:
	text "Welcome To Our"
	line "Domain"
	
	para "SECRET CLUBHOUSE"
	done
	
CianwoodCity_MapEventHeader:: db 0, 0

.Warps: db 10
	warp_def 37, 31, 1, MANIAS_HOUSE
	warp_def 41, 10, 1, OLIVINE_GYM
	warp_def 27, 19, 1, CIANWOOD_POKECENTER_1F
	warp_def 29, 27, 1, CIANWOOD_PHARMACY
	warp_def 15, 21, 1, CIANWOOD_CITY_PHOTO_STUDIO
	warp_def 37, 21, 1, CIANWOOD_LUGIA_SPEECH_HOUSE
	warp_def 25, 35, 1, POKE_SEERS_HOUSE
	warp_def 19, 7, 1, OLIVINE_LIGHTHOUSE_1F
	warp_def 55, 29, 1, ROUTE_43_MAHOGANY_GATE
	warp_def 55, 30, 2, ROUTE_43_MAHOGANY_GATE

.CoordEvents: db 0

.BGEvents: db 10
	signpost 28, 32, SIGNPOST_READ, CianwoodCitySign
	signpost 41, 7, SIGNPOST_READ, CianwoodGymSign
	signpost 27, 20, SIGNPOST_READ, CianwoodPokeCenterSign
	signpost 29, 28, SIGNPOST_READ, CianwoodPharmacySign
	signpost 11, 12, SIGNPOST_READ, CianwoodPhotoStudioSign
	signpost 25, 33, SIGNPOST_READ, CianwoodPokeSeerSign
	signpost 11, 39, SIGNPOST_ITEM, CianwoodCityHiddenRevive
	signpost 11, 17, SIGNPOST_ITEM, CianwoodCityHiddenMaxEther
	signpost 23, 9, SIGNPOST_READ, CianwoodBuildingSign
	signpost 26, 18, SIGNPOST_READ, CianwoodCityDEVScript

.ObjectEvents: db 9
	person_event SPRITE_POKEFAN_F, 40, 29, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StandingYoungsterScript_0x1a00b3, -1
	person_event SPRITE_POKEFAN_M, 20, 26, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1a00b6, -1
	person_event SPRITE_LASS, 30, 23, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x1a00b9, -1
	person_event SPRITE_ROCK, 0, 20, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_POKEFAN_F, 30, 31, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1a0084, -1
	person_event SPRITE_SUPER_NERD, 46, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CianGuyOutsideGym, -1
	person_event SPRITE_LASS, 50, 30, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CianBottomOfMapPerson, -1
	person_event SPRITE_SUPER_NERD, 35, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianKeyPerson, EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	person_event SPRITE_SUICUNE, 41, 10, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianGymDoorBlock, EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
