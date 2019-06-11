const_value set 2
	const KRISSHOUSE2F_CONSOLE
	const KRISSHOUSE2F_DOLL_1
	const KRISSHOUSE2F_DOLL_2
	const KRISSHOUSE2F_BIG_DOLL

KrissHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .InitializeRoom

	dbw MAPCALLBACK_TILES, .SetSpawn

.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_IN_YOUR_ROOM
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	jumpstd initializeevents
	return

.SkipInizialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return


	db 0, 0, 0 ; filler


Doll1:
	describedecoration 1

Doll2:
	describedecoration 2

BigDoll:
	describedecoration 3

GameConsole:
	describedecoration 4

KrissHousePoster:
	dw EVENT_KRISS_ROOM_POSTER, .Script
.Script:
	describedecoration 0

KrissHouseRadio:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext KrisRadioText1
	pause 45
	writetext KrisRadioText2
	pause 45
	writetext KrisRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext KrisRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext KrisRadioText4
	pause 45
	closetext
	end

KrissHouseBookshelf:
	jumpstd picturebookshelf

KrissHousePC:
	opentext
	special Special_KrissHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, $0, $0
	end

WarpToWarpRoom:
	warp KRISS_HOUSE_2F, $e, $1
	end

Start2ndQuest:
	opentext
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE	
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE	
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
	setflag ENGINE_POKEDEX
	giveitem PASS
	giveitem BICYCLE
	giveitem RARE_CANDY, 99
	giveitem MASTER_BALL, 99
	giveitem MAX_POTION, 99
	giveitem MAX_REVIVE, 99
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_FLASH
	giveitem TM_ROCK_SMASH
	giveitem HM_STRENGTH
	giveitem MYSTERY_EGG
	givepoke CHARIZARD, 100 
	givepoke BLASTOISE, 100
	givepoke VENUSAUR, 100 
	givepoke PIKACHU, 100
	setevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_SWITCH_14
	setevent EVENT_MT_MOON_RIVAL
	clearevent EVENT_RED_IN_MT_SILVER
	clearevent EVENT_SWITCH_13
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext Quest2StartText
	waitbutton
	closetext
	end
	
RoomSignpostSPECIALScript:
; Janto Badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE	
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE	
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
; Kohto Badges
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
; Johto Fly Flags
	setflag ENGINE_FLYPOINT_NEW_BARK_TOWN
	setflag ENGINE_FLYPOINT_CHERRYGROVE_CITY
	setflag ENGINE_FLYPOINT_CHERRYGROVE_CITY
	setflag ENGINE_FLYPOINT_VIOLET_CITY
	setflag ENGINE_FLYPOINT_ECRUTEAK_CITY
	setflag ENGINE_FLYPOINT_MAHOGANY_TOWN
	setflag ENGINE_FLYPOINT_GOLDENROD_CITY
	setflag ENGINE_FLYPOINT_OLIVINE_CITY
	setflag ENGINE_FLYPOINT_AZALEA_TOWN
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_CIANWOOD_CITY
	setflag ENGINE_FLYPOINT_BLACKTHORN_CITY
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
; Kanto Fly Flags
	setflag ENGINE_FLYPOINT_PALLET_TOWN
	setflag ENGINE_FLYPOINT_VIRIDIAN_CITY
	setflag ENGINE_FLYPOINT_PEWTER_CITY
	setflag ENGINE_FLYPOINT_CERULEAN_CITY
	setflag ENGINE_FLYPOINT_VERMILION_CITY
	setflag ENGINE_FLYPOINT_LAVENDER_TOWN
	setflag ENGINE_FLYPOINT_CELADON_CITY
	setflag ENGINE_FLYPOINT_SAFFRON_CITY
	setflag ENGINE_FLYPOINT_FUCHSIA_CITY
	setflag ENGINE_FLYPOINT_SILVER_CAVE
; Extra Items	
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
	setflag ENGINE_POKEDEX
	setevent EVENT_SWITCH_9
	setevent EVENT_SWITCH_10
	giveitem BICYCLE
	giveitem RARE_CANDY, 99
	giveitem MASTER_BALL, 99
	giveitem MAX_POTION, 99
	giveitem MAX_REVIVE, 99
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_FLASH
	giveitem TM_ROCK_SMASH
	giveitem HM_STRENGTH
	giveitem MYSTERY_EGG
	domaptrigger NEW_BARK_TOWN, $1
	opentext
	givepoke CHARIZARD, 100 
	givepoke BLASTOISE, 100
	givepoke VENUSAUR, 100 
	givepoke PIKACHU, 100 
	jumptext RoomSpecialText
	end	
	
RoomSignpostSPECIAL2Script:
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	specialphonecall SPECIALCALL_ASSISTANT
	jumptext RoomSpecialText
	end
	
RoomSignpostSPECIAL3Script:
	setevent EVENT_BEAT_ELITE_FOUR
	clearevent EVENT_RED_IN_MT_SILVER	
	specialphonecall SPECIALCALL_SSTICKET
	jumptext RoomSpecialText
	end

RoomSignpostSPECIALChurchScript
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_5
	jumptext RoomSpecialText
	end
	
RoomNewBarkTown:
	jumptext RoomNewBarkTownText
	
RoomCherrygrove:
	jumptext RoomCherrygroveText

RoomVioletCity:
	jumptext RoomVioletCityText
	
RoomGoldenrodCity:
	jumptext RoomGoldenrodCityText
	
RoomEcruteakCity:
	jumptext RoomEcruteakCityText
	
RoomMahoganyTown:
	jumptext RoomMahoganyTownText
	
RoomOlivineCity:
	jumptext RoomOlivineCityText
	
RoomAzaleaTown:
	jumptext RoomAzaleaTownText
	
RoomCianwoodCity:
	jumptext RoomCianwoodCityText
	
RoomBlackthornCity:
	jumptext RoomBlackthornCityText
	
; Kanto Warp Scripts

RoomPalletTown:
	jumptext RoomPalletTownText
	
RoomViridianCity:
	jumptext RoomViridianCityText

RoomPewterCity:
	jumptext RoomPewterCityText
	
RoomCeruleanCity:
	jumptext RoomCeruleanCityText
	
RoomVermilionCity:
	jumptext RoomVermilionCityText
	
RoomLavenderTown:
	jumptext RoomLavenderTownText
	
RoomCeladonCity:
	jumptext RoomCeladonCityText
	
RoomSaffronCity:
	jumptext RoomSaffronCityText
	
RoomFuchsiaCity:
	jumptext RoomFuchsiaCityText
	
RoomCinnabarIsland:
	jumptext RoomCinnabarIslandText

RoomChampionRoom:
	jumptext RoomChampionRoomText
	
RoomHallofFame:
	jumptext RoomHallofFameText

Quest2StartText:
	text "SECOND QUEST"
	line "START!!"
	done
	
RoomNewBarkTownText:
	text "OLD OAK TOWN"
	done

RoomCherrygroveText:
	text "SILVERLEAF TOWN"
	done
	
RoomVioletCityText:
	text "WILLOWBRUSH TOWN"
	done
	
RoomGoldenrodCityText:
	text "ROSEGLEN CITY"
	done
	
RoomEcruteakCityText:
	text "FERNWORTH TOWN"
	done
	
RoomMahoganyTownText:
	text "WILDBARK VILLAGE"
	done
	
RoomOlivineCityText:
	text "NEWPORT CITY"
	done
	
RoomAzaleaTownText:
	text "FIGBRANCH TOWN"
	done
	
RoomCianwoodCityText:
	text "MAUVEWOOD TOWN"
	done
	
RoomBlackthornCityText:
	text "HARDROOT TOWN"
	done

; Kanto Warp Text

RoomPalletTownText:
	text "CARTRIDGE TOWN"
	done

RoomViridianCityText:
	text "ORCHID CITY"
	done
	
RoomPewterCityText:
	text "RUSSET TOWN"
	done
	
RoomCeruleanCityText:
	text "CHARCOAL TOWN"
	done
	
RoomVermilionCityText:
	text "CELESTE CITY"
	done
	
RoomLavenderTownText:
	text "LITTLEPOND"
	done
	
RoomCeladonCityText:
	text "BRANDIES CITY"
	done
	
RoomSaffronCityText:
	text "PEEL CITY"
	done
	
RoomFuchsiaCityText:
	text "GAMBOGE TOWN"
	done
	
RoomCinnabarIslandText:
	text "CINNABAR ISLAND"
	done

RoomChampionRoomText:
	text "CHAMPION ROOM"
	done	
	
RoomHallofFameText:
	text "ROUTE 21"
	done

RoomSpecialText:
	text "Events Activated!"
	done
	
KrisRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#MON CHANNEL!"
	done

KrisRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

KrissHouse2F_MapEventHeader:: db 0, 0

.Warps: db 26
	warp_def 0,  7, 3, KRISS_HOUSE_1F
	warp_def 0, 19, 1, CHERRYGROVE_CITY
	warp_def 0, 21, 1, VIOLET_CITY
	warp_def 0, 31, 1, AZALEA_TOWN
	warp_def 0, 23, 3, GOLDENROD_CITY
	warp_def 0, 25, 6, ECRUTEAK_CITY
	warp_def 0, 29, 1, OLIVINE_CITY
	warp_def 0, 27, 1, MAHOGANY_TOWN
	warp_def 0, 33, 1, CIANWOOD_CITY
	warp_def 0, 35, 1, BLACKTHORN_CITY
	warp_def 4, 23, 1, PALLET_TOWN
	warp_def 4, 19, 1, VIRIDIAN_CITY
	warp_def 4, 21, 1, PEWTER_CITY
	warp_def 4, 17, 10, CERULEAN_CITY
	warp_def 4, 25, 3, VERMILION_CITY
	warp_def 4, 27, 6, LAVENDER_TOWN
	warp_def 4, 29, 1, CELADON_CITY
	warp_def 4, 31, 5, SAFFRON_CITY
	warp_def 4, 33, 1, FUCHSIA_CITY
	warp_def 4, 35, 1, NEW_BARK_TOWN
	warp_def 0, 17, 1, NEW_BARK_TOWN
	warp_def 8, 17, 1, LANCES_ROOM
	warp_def 8, 19, 1, ROUTE_23
	warp_def 8, 21, 1, MAHOGANYEXTRAHOUSE
	warp_def 8, 23, 1, EARLS_POKEMON_ACADEMY
	warp_def 8, 25, 1, UNDERGROUND_WAREHOUSE

.CoordEvents: db 0

.BGEvents: db 32
	signpost 1, 2, SIGNPOST_UP, KrissHousePC
	signpost 1, 3, SIGNPOST_READ, KrissHouseRadio
	signpost 1, 5, SIGNPOST_READ, KrissHouseBookshelf
	signpost 0, 6, SIGNPOST_IFSET, KrissHousePoster
	signpost 6, 2, SIGNPOST_READ, WarpToWarpRoom
	signpost 0, 17, SIGNPOST_READ, RoomSignpostSPECIALScript
	signpost 0, 23, SIGNPOST_READ, RoomSignpostSPECIAL2Script
	signpost 8, 19, SIGNPOST_READ, RoomSignpostSPECIAL3Script
	signpost 0, 16, SIGNPOST_READ, RoomNewBarkTown
	signpost 0, 18, SIGNPOST_READ, RoomCherrygrove
	signpost 0, 20, SIGNPOST_READ, RoomVioletCity
	signpost 0, 22, SIGNPOST_READ, RoomGoldenrodCity
	signpost 0, 24, SIGNPOST_READ, RoomEcruteakCity
	signpost 0, 26, SIGNPOST_READ, RoomMahoganyTown
	signpost 0, 28, SIGNPOST_READ, RoomOlivineCity
	signpost 0, 30, SIGNPOST_READ, RoomAzaleaTown
	signpost 0, 32, SIGNPOST_READ, RoomCianwoodCity
	signpost 0, 34, SIGNPOST_READ, RoomBlackthornCity
	signpost 4, 22, SIGNPOST_READ, RoomPalletTown
	signpost 4, 18, SIGNPOST_READ, RoomViridianCity
	signpost 4, 20, SIGNPOST_READ, RoomPewterCity
	signpost 4, 16, SIGNPOST_READ, RoomCeruleanCity
	signpost 4, 24, SIGNPOST_READ, RoomVermilionCity
	signpost 4, 26, SIGNPOST_READ, RoomLavenderTown
	signpost 4, 28, SIGNPOST_READ, RoomCeladonCity
	signpost 4, 30, SIGNPOST_READ, RoomSaffronCity
	signpost 4, 32, SIGNPOST_READ, RoomFuchsiaCity
	signpost 4, 34, SIGNPOST_READ, RoomCinnabarIsland
	signpost 8, 16, SIGNPOST_READ, RoomChampionRoom
	signpost 8, 18, SIGNPOST_READ, RoomHallofFame
	signpost 8, 23, SIGNPOST_READ, RoomSignpostSPECIALChurchScript
	signpost 4, 17, SIGNPOST_READ, Start2ndQuest

.ObjectEvents: db 4
	person_event SPRITE_CONSOLE, 2, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_KRISS_HOUSE_2F_CONSOLE
	person_event SPRITE_DOLL_1, 4, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll1, EVENT_KRISS_HOUSE_2F_DOLL_1
	person_event SPRITE_DOLL_2, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll2, EVENT_KRISS_HOUSE_2F_DOLL_2
	person_event SPRITE_BIG_DOLL, 1, 0, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BigDoll, EVENT_KRISS_HOUSE_2F_BIG_DOLL
