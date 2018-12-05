MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	trigger_def POKECENTER_2F,                          wPokecenter2FTrigger
	trigger_def TRADE_CENTER,                           wTradeCenterTrigger
	trigger_def COLOSSEUM,                              wColosseumTrigger
	trigger_def TIME_CAPSULE,                           wTimeCapsuleTrigger
	trigger_def POWER_PLANT,                            wPowerPlantTrigger
	trigger_def ROUTE12GATES,                           wROUTE12GATESTrigger
	trigger_def BLACKTHORNGATES,                        wBLACKTHORNGATESTrigger
	trigger_def TRAINER_HOUSE_B1F,                      wTrainerHouseB1FTrigger
	trigger_def VICTORY_ROAD_GATE,                      wVictoryRoadGateTrigger
	trigger_def SAFFRON_TRAIN_STATION,                  wSaffronTrainStationTrigger
	trigger_def ROUTE_16_GATE,                          wRoute16GateTrigger
	trigger_def ROUTE_17_18_GATE,                       wRoute1718GateTrigger
	trigger_def INDIGO_PLATEAU_POKECENTER_1F,           wIndigoPlateauPokecenter1FTrigger
	trigger_def WILLS_ROOM,                             wWillsRoomTrigger
	trigger_def KOGAS_ROOM,                             wKogasRoomTrigger
	trigger_def BRUNOS_ROOM,                            wBrunosRoomTrigger
	trigger_def KARENS_ROOM,                            wKarensRoomTrigger
	trigger_def LANCES_ROOM,                            wLancesRoomTrigger
	trigger_def HALL_OF_FAME,                           wHallOfFameTrigger
	trigger_def CERULEAN_CITY,                          wCeruleanCityTrigger
	trigger_def NEW_BARK_TOWN,                          wNewBarkTownTrigger
	trigger_def ELMS_LAB,                               wElmsLabTrigger
	trigger_def KRISS_HOUSE_1F,                         wKrissHouse1FTrigger
	trigger_def ROUTE_29,                               wRoute29Trigger
	trigger_def CHERRYGROVE_CITY,                       wCherrygroveCityTrigger
	trigger_def MR_POKEMONS_HOUSE,                      wMrPokemonsHouseTrigger
	trigger_def VIOLET_CITY,                            wVioletCityTrigger
	trigger_def ROUTE_35_NATIONAL_PARK_GATE,            wRoute35NationalParkGateTrigger
	trigger_def ROUTE_36,                               wRoute36Trigger
	trigger_def ROUTE_36_NATIONAL_PARK_GATE,            wRoute36NationalParkGateTrigger
	trigger_def SLOWPOKE_WELL_B1F,                      wSlowpokeWellB1FTrigger
	trigger_def ROUTE_15_FUCHSIA_GATE,                  wRoute15FuchsiaGateTrigger
	trigger_def GOLDENROD_MAGNET_TRAIN_STATION,         wGoldenrodMagnetTrainStationTrigger
	trigger_def GOLDENROD_POKECENTER_1F,                wGoldenrodPokecenter1FTrigger
	trigger_def OLIVINE_CITY,                           wOlivineCityTrigger
	trigger_def ROUTE_34,                               wRoute34Trigger
	trigger_def ROUTE_34_ILEX_FOREST_GATE,              wRoute34IlexForestGateTrigger
	trigger_def ECRUTEAK_HOUSE,                         wEcruteakHouseTrigger
	trigger_def MOUNT_MOON_SQUARE,                      wMountMoonSquareTrigger
	trigger_def ROUTE36_UNDERGROUND_PATH,               wRoute36_Underground_PathTrigger
	trigger_def ECRUTEAK_GYM,                           wEcruteakGymTrigger
	trigger_def NATIONAL_PARK,                          wNationalParkTrigger
	trigger_def UNDERGROUND_WAREHOUSE,                  wUndergroundWarehouseTrigger
	trigger_def CIANWOOD_CITY,                          wCianwoodCityTrigger
	trigger_def BATTLE_TOWER_1F,                        wBattleTower1FTrigger
	trigger_def BATTLE_TOWER_BATTLE_ROOM,               wBattleTowerBattleRoomTrigger
	trigger_def BATTLE_TOWER_ELEVATOR,                  wBattleTowerElevatorTrigger
	trigger_def BATTLE_TOWER_HALLWAY,                   wBattleTowerHallwayTrigger
	trigger_def BATTLE_TOWER_OUTSIDE,                   wBattleTowerOutsideTrigger
	trigger_def ROUTE_43_GATE,                          wRoute43GateTrigger
	trigger_def ROUTE_5,                                wRoute5Trigger
	trigger_def SPROUT_TOWER_3F,                        wSproutTower3FTrigger
	trigger_def TIN_TOWER_1F,                           wTinTower1FTrigger
	trigger_def BURNED_TOWER_1F,                        wBurnedTower1FTrigger
	trigger_def BURNED_TOWER_B1F,                       wBurnedTowerB1FTrigger
	trigger_def RADIO_TOWER_5F,                         wRadioTower5FTrigger
	trigger_def RUINS_OF_ALPH_OUTSIDE,                  wRuinsOfAlphOutsideTrigger
	trigger_def RUINS_OF_ALPH_RESEARCH_CENTER,          wRuinsOfAlphResearchCenterTrigger
	trigger_def RUINS_OF_ALPH_HO_OH_CHAMBER,            wRuinsOfAlphHoOhChamberTrigger
	trigger_def RUINS_OF_ALPH_KABUTO_CHAMBER,           wRuinsOfAlphKabutoChamberTrigger
	trigger_def RUINS_OF_ALPH_OMANYTE_CHAMBER,          wRuinsOfAlphOmanyteChamberTrigger
	trigger_def RUINS_OF_ALPH_AERODACTYL_CHAMBER,       wRuinsOfAlphAerodactylChamberTrigger
	trigger_def RUINS_OF_ALPH_INNER_CHAMBER,            wRuinsOfAlphInnerChamberTrigger
	trigger_def CELADON_MANSION_ROOF,                   wCeladonMansionRoofTrigger
	trigger_def TEAM_ROCKET_BASE_B1F,                   wTeamRocketBaseB1FTrigger
	trigger_def TEAM_ROCKET_BASE_B2F,                   wTeamRocketBaseB2FTrigger
	trigger_def EARLS_POKEMON_ACADEMY,                  wEarlsPokemonAcademyTrigger
	trigger_def WHIRL_ISLAND_NE,						wWhirlIslandNETrigger
	trigger_def SILVER_CAVE_ROOM_3,                     wSilverCaveRoom3Trigger
	trigger_def VICTORY_ROAD,                           wVictoryRoadTrigger
	trigger_def DRAGONS_DEN_B1F,                        wDragonsDenB1FTrigger
	trigger_def DRAGON_SHRINE,                          wDragonShrineTrigger
	trigger_def OLIVINE_PORT,                           wOlivinePortTrigger
	trigger_def VERMILION_PORT,                         wVermilionPortTrigger
	trigger_def FAST_SHIP_1F,                           wFastShip1FTrigger
	trigger_def FAST_SHIP_B1F,                          wFastShipB1FTrigger
	trigger_def ECRUTEAK_CITY,                          wEcruteakCityTrigger
	trigger_def MOBILE_TRADE_ROOM_MOBILE,               wMobileTradeRoomMobileTrigger
	trigger_def MOBILE_BATTLE_ROOM,                     wMobileBattleRoomTrigger
	db -1
; 4d15b
