const_value set 2
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScriptHeader:
.MapTriggers:
	db 0

	; triggers
;	maptrigger .Trigger0
;	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
;	priorityjump .MrPokemonEvent
	end

.Trigger1:
	end

MrPokemonEventScript:
;	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
;	spriteface MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	checkevent EVENT_MR_POKEMONS_HOUSE_OAK
	iftrue MrPokemonRivalHere
	faceplayer
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
;	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
;	opentext
;	writetext MrPokemonIntroText2
;	buttonsound
;	waitsfx
;	giveitem MYSTERY_EGG
;	writetext MrPokemonsHouse_GotEggText
;	playsound SFX_KEY_ITEM
;	waitsfx
;	itemnotify
;	blackoutmod CHERRYGROVE_CITY
;	writetext MrPokemonIntroText3
;	buttonsound
;	spriteface MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
;	writetext MrPokemonIntroText4
;	buttonsound
;	spriteface MRPOKEMONSHOUSE_GENTLEMAN, DOWN
;	spriteface MRPOKEMONSHOUSE_OAK, LEFT
;	writetext MrPokemonIntroText5
;	waitbutton
;	closetext
	end

MrPokemonRivalHere:
	jumptextfaceplayer MrPokemonText_AlwaysNewDiscoveries
	
MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	jump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
;	playmusic MUSIC_PROF_OAK
;	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
;	spriteface PLAYER, RIGHT
	faceplayer
	opentext
	writetext MrPokemonsHouse_OakText1
	waitbutton
;	waitsfx
;	writetext MrPokemonsHouse_GetDexText
;	playsound SFX_ITEM
;	waitsfx
;	setflag ENGINE_POKEDEX
;	writetext MrPokemonsHouse_OakText2
;	waitbutton
;	closetext
;	spriteface PLAYER, DOWN
;	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
;	waitsfx
;	special RestartMapMusic
;	pause 15
;	spriteface PLAYER, UP
;	opentext
;	writetext MrPokemonsHouse_MrPokemonHealText
;	waitbutton
;	closetext
;	special Special_FadeBlackQuickly
;	special Special_ReloadSpritesNoPalettes
;	playmusic MUSIC_HEAL
;	special Mobile_HealParty
;	special HealParty
;	pause 60
;	special Special_FadeInQuickly
;	special RestartMapMusic
;	opentext
;	writetext MrPokemonText_ImDependingOnYou
;	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .RunAroundMrPokemon
	applymovement MRPOKEMONSHOUSE_OAK, RivalLeavesMrPokemonMovement
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	jump .MrPokemonEventToggles

.RunAroundMrPokemon
	applymovement MRPOKEMONSHOUSE_OAK, RunAroundMrPokemonMovement
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	jump .MrPokemonEventToggles
	end
	
.MrPokemonEventToggles
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_KRISS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_KRISS_NEIGHBORS_HOUSE_NEIGHBOR
	dotrigger $1
	domaptrigger CHERRYGROVE_CITY, $1
	domaptrigger ELMS_LAB, $3
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end
	
MapMrPokemonsHouseSignpost1Script:
	jumptext MrPokemonsHouse_Sign1Text

MapMrPokemonsHouseSignpost2Script:
	jumptext MrPokemonsHouse_Sign2Text

MapMrPokemonsHouseSignpost3Script:
	jumptext MrPokemonsHouse_Sign3Text
	
MapMrPokemonsHouseSignpost4Script:
	jumptext MrPokemonsHouse_Sign4Text
	
MapMrPokemonsHouseSignpost5Script:
	jumptext MrPokemonsHouse_Sign5Text
	

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step_right
	step_up
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step_down
	step_left
	step_left
	step_end


RunAroundMrPokemonMovement:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end
	
RivalLeavesMrPokemonMovement:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
MrPokemonsHouse_OakExits:
	step_down
	step_left
	turn_head_down
	db $3f ; movement
	step_end

MrPokemonsHouse_Sign5Text:
	text "It's a NINTENDO"
	line "64!"
	
	para "The cartridge is"
	line "some kind of RPG."
	done
	
MrPokemonIntroText1:
	text "Hello <PLAY_G>."
	line "Oh, you're looking"
	cont "for <RIVAL>?"
	
	para "She's upstairs"
	line "playing her video"
	cont "games."
	
	para "I know you two"
	line "haven't really"
	
	para "seen eye to eye,"
	line "but maybe training"
	
	para "#MON together"
	line "might be a good"
	
	para "bonding expereince"
	line "for you both."
	done

MrPokemonIntroText2:
	text "This is what I"
	line "want PROF.ELM to"
	cont "examine."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "MYSTERY EGG."
	done

MrPokemonIntroText3:
	text "I know a couple"
	line "who run a #MON"
	cont "DAY-CARE service."

	para "They gave me that"
	line "EGG."

	para "I was intrigued,"
	line "so I sent mail to"
	cont "PROF.ELM."

	para "For #MON evolu-"
	line "tion, PROF.ELM is"
	cont "the authority."
	done

MrPokemonIntroText4:
	text "Even PROF.OAK here"
	line "recognizes that."
	done

MrPokemonIntroText5:
	text "If my assumption"
	line "is correct, PROF."
	cont "ELM will know it."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "You are returning"
	line "to PROF.ELM?"

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "I wish the best"
	line "for my daughter."
	
	para "I really hope she"
	line "can find the right"
	cont "path."
	done

MrPokemonsHouse_OakText1:
	text "Oh. It's you,"
	line "<PLAY_G>."
	
	para "Picking a #-"
	line "MON was today?!"
	
	para "Man, I'd better"
	line "get one before you"
	cont "do--"
	
	para "You already have a"
	line "#MON?"
	
	para "Well that's hardly"
	line "fair."
	
	para "Guess I'll have to"
	line "run to the LAB and"
	
	para "get a better one"
	line "than you!"
	
	para "I'll be the strong-"
	line "ger trainer, you'll"
	cont "see, <PLAY_G>!"
	
	para "I'll even race you"
	line "back!"	
	cont "Ready? Go!"
	
	para "Eat my dust,"
	line "Dweeb."
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"

	para "But I've stayed"
	line "too long."

	para "I have to get to"
	line "GOLDENROD for my"
	cont "usual radio show."

	para "<PLAY_G>, I'm"
	line "counting on you!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "EXP.SHARE I got"
	cont "from PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_Sign1Text:
	text "It looks like it"
	line "hasn't been"
	
	para "cleaned in some"
	line "time."
	done

MrPokemonsHouse_Sign2Text:
	text "Plenty of dishes!"
	done

MrPokemonsHouse_Sign3Text:
	text "Only the best"
	line "frozen food!"
	done
	
MrPokemonsHouse_Sign4Text:
	text "We don't get this"
	line "strange channel"
	
	para "on the TV in our"
	line "house."
	done

MrPokemonsHouse_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 4, 6, CHERRYGROVE_CITY
	warp_def 7, 5, 6, CHERRYGROVE_CITY
	warp_def 0, 11, 4, MR_POKEMONS_HOUSE
	warp_def 0, 29, 3, MR_POKEMONS_HOUSE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 1, 0, SIGNPOST_READ, MapMrPokemonsHouseSignpost1Script
	signpost 1, 1, SIGNPOST_READ, MapMrPokemonsHouseSignpost2Script
	signpost 1, 2, SIGNPOST_READ, MapMrPokemonsHouseSignpost3Script
	signpost 1, 6, SIGNPOST_READ, MapMrPokemonsHouseSignpost4Script
	signpost 3, 25, SIGNPOST_READ, MapMrPokemonsHouseSignpost5Script

.ObjectEvents: db 2
	person_event SPRITE_TEACHER, 4, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MrPokemonEventScript, -1
	person_event SPRITE_SILVER, 4, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MrPokemonsHouse_OakScript, EVENT_MR_POKEMONS_HOUSE_OAK
