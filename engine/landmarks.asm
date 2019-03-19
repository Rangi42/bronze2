GetLandmarkCoords: ; 0x1ca896
; Return coordinates (d, e) of landmark e.
	push hl
	ld l, e
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret
; 0x1ca8a5


GetLandmarkName:: ; 0x1ca8a5
; Copy the name of landmark e to StringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Landmarks + 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, StringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret
; 0x1ca8c3


Landmarks: ; 0x1ca8c3

landmark: MACRO
	db \1, \2
	dw \3
ENDM

	landmark   0,   0, SpecialMapName
	landmark $94, $84, NewBarkTownName
	landmark $7B, $84, Route29Name
	landmark $64, $84, CherrygroveCityName
	landmark $64, $7A, Route30Name
	landmark $64, $74, UnionCaveName	
	landmark $5C, $6C, Route31Name
	landmark $4C, $6C, VioletCityName
	landmark $40, $6C, Route36Name 
	landmark $34, $5F, Route34Name	
	landmark $24, $54, IlexForestName
	landmark $1C, $44, Route32Name ;Route 6
	landmark $1C, $34, EcruteakCityName
	landmark $2C, $34, Route42Name ;Route 7
	landmark $2C, $31, MtMortarName
	landmark $3C, $34, MahoganyTownName
	landmark $3C, $44, Route35Name ;Route 8
	landmark $3C, $54, GoldenrodCityName
	landmark $40, $50, RadioTowerName
	landmark $48, $54, Route44Name ;ROUTE 9
	landmark $54, $54, OlivineCityName
	landmark $54, $48, Route39Name ;ROUTE 10
	landmark $54, $3C, NationalParkName
	landmark $66, $3C, Route38Name ;ROUTE 11
	landmark $74, $3C, AzaleaTownName
	landmark $84, $3C, Route37Name
	landmark $94, $3C, LakeOfRageName
	landmark $74, $44, Route40Name
	landmark $74, $4C, Route41Name
	landmark $74, $54, CianwoodCityName
	landmark $74, $5C, Route43Name ;ROUTE 15
	landmark $7C, $5C, IcePathName
	landmark $84, $5C, Route33Name ;ROUTE 16
	landmark $8C, $5C, BlackthornCityName 
	landmark $8C, $6B, Route45Name ;ROUTE 17
	landmark $8C, $7A, Route46Name ;ROUTE 18
	landmark $56, $84, Route27Name ;ROUTE 19
	landmark $47, $84, Route26Name    ;ROUTE 20
	landmark $3C, $84, VictoryRoadName
	landmark $3C, $80, Route23Name
	landmark $3C, $7C, IndigoPlateauName
	landmark $2C, $44, PalletTownName
	landmark $3C, $44, Route7Name 
	landmark $4C, $44, LavenderTownName
	landmark $5F, $44, Route1Name
	landmark $6C, $36, Route6Name
	landmark $7C, $34, ViridianCityName
	landmark $7C, $48, Route3Name
	landmark $7C, $5C, MtMoonName
	landmark $74, $64, Route5Name
	landmark $64, $64, PewterCityName
	landmark $4C, $64, Route25Name
	landmark $4C, $74, Route14Name ;ROUTE 6
	landmark $54, $74, RockTunnelName ;RELIC CAVERN
	landmark $44, $84, SaffronCityName
	landmark $3C, $74, Route9Name ;ROUTE 7
	landmark $3C, $64, Route8Name ;ROUTE 8
	landmark $30, $64, Route11Name ;ROUTE 9
	landmark $24, $6C, FuchsiaCityName
	landmark $44, $5C, Route4Name ;ROUTE 10
	landmark $44, $54, CeladonCityName
	landmark $58, $84, Route15Name ;ROUTE 11
	landmark $64, $84, DiglettsCaveName
	landmark $6C, $84, Route13Name ;ROUTE 12
	landmark $74, $7C, Route18Name ;ROUTE 13
	landmark $74, $74, CeruleanCityName
	landmark $8C, $80, Route12Name ;ROUTE 14
	landmark $8C, $94, VermilionCityName
	landmark $94, $74, SilverCaveName
	landmark 0, 0, UndergroundName
	landmark 148, 132, FastShipName


NewBarkTownName:     db "OLD OAK¯TOWN@"
CherrygroveCityName: db "SILVERLEAF¯TOWN@"
VioletCityName:      db "WILLOWBUSH¯TOWN@"
AzaleaTownName:      db "FIGBRANCH¯TOWN@"
GoldenrodCityName:   db "ROSEGLEN¯CITY@"
EcruteakCityName:    db "FERNWORTH¯TOWN@"
OlivineCityName:     db "NEWPORT¯CITY@"
CianwoodCityName:    db "MAUVEWOOD¯TOWN@"
MahoganyTownName:    db "WILDBARK¯VILLAGE@"
BlackthornCityName:  db "HARDROOT¯TOWN@"
LakeOfRageName:      db "MT.¯REDSTONE@"
SilverCaveName:      db "MT. ENDER@"
UnionCaveName:       db "BRONZE CAVE@"
RadioTowerName:      db "TV STATION@"
NationalParkName:    db "FELONWOOD¯PARK@"
MtMortarName:        db "GALLUS CAVE@"
IcePathName:         db "SLUDGE CAVE@"
NotApplicableName:   db "N/A@"
PalletTownName:      db "CARTRIDGE¯TOWN@"
ViridianCityName:    db "ORCHID¯CITY@"
PewterCityName:      db "RUSSET TOWN@"
CeruleanCityName:    db "CHARCOAL¯TOWN@"
LavenderTownName:    db "LITTLEPOND@"
VermilionCityName:   db "CELESTE¯CITY@"
CeladonCityName:     db "BRANDEIS¯CITY@"
SaffronCityName:     db "CASCADE¯CITY@"
FuchsiaCityName:     db "GAMBOGE¯TOWN@"
IndigoPlateauName:   db "PASTEL¯PLATEAU@"
VictoryRoadName:     db "VICTORY¯ROAD@"
MtMoonName:          db "BROWN CAVE@"
RockTunnelName:      db "RELIC¯CAVERN@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
PokemonMansionName:  db "#MON¯MANSION@"
CeruleanCaveNane:    db "CERULEAN¯CAVE@"
Route1Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 4@"
Route4Name:          db "ROUTE 10@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 3@"
Route7Name:          db "ROUTE 1@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 7@"
Route11Name:         db "ROUTE 9@"
Route12Name:         db "ROUTE 14@"
Route13Name:         db "ROUTE 12@"
Route14Name:         db "ROUTE 6@"
Route15Name:         db "ROUTE 11@"
Route18Name:         db "ROUTE 13@"
Route23Name:         db "ROUTE 21@"
Route25Name:         db "JUNCTION¯PARK@"
Route26Name:         db "ROUTE 20@"
Route27Name:         db "ROUTE 19@"
Route29Name:         db "ROUTE 1@"
Route30Name:         db "ROUTE 2@"
Route31Name:         db "ROUTE 3@"
Route32Name:         db "ROUTE 6@"
Route33Name:         db "ROUTE 16@"
Route34Name:         db "ROUTE 5@"
Route35Name:         db "ROUTE 8@"
Route36Name:         db "ROUTE 4@"
Route37Name:         db "ROUTE 12@"
Route38Name:         db "ROUTE 11@"
Route39Name:         db "ROUTE 10@"
Route40Name:         db "ROUTE 13@"
Route41Name:         db "ROUTE 14@"
Route42Name:         db "ROUTE 7@"
Route43Name:         db "ROUTE 15@"
Route44Name:         db "ROUTE 9@"
Route45Name:         db "ROUTE 17@"
Route46Name:         db "ROUTE 18@"
IlexForestName:      db "CALLOW¯FOREST@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "ACRE¯FOREST@"
UndergroundName:     db "UNDERGROUND@"
SpecialMapName:      db "SPECIAL@"


RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP ; S.S. Aqua
	jr z, .johto
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp KANTO_LANDMARK
	jr c, .johto

; Victory Road area is considered to be Johto.
	cp VICTORY_ROAD
	jr c, .kanto

.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret
