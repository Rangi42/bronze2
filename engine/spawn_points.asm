
SpawnPoints: ; 0x152ab

spawn: MACRO
; map, y, x
	map \1
	db \2, \3
ENDM
;Kohtoyy
	spawn KRISS_HOUSE_2F,              3, 3

	spawn PALLET_TOWN,                 7, 4
	spawn LAVENDER_TOWN,              19, 4
	spawn VIRIDIAN_CITY,               7, 12
	spawn PEWTER_CITY,                17, 6
	spawn SAFFRON_CITY,               21, 14
	spawn FUCHSIA_CITY,               17, 10
	spawn CELADON_CITY,               21, 26	
	spawn CERULEAN_CITY,              31, 14
	spawn VERMILION_CITY,              9, 20
	spawn SILVER_CAVE_OUTSIDE,        23, 12
;Janto
	spawn NEW_BARK_TOWN,              13, 4
	spawn CHERRYGROVE_CITY,           21, 4
	spawn VIOLET_CITY,                27, 26
	spawn ECRUTEAK_CITY,              27, 28
	spawn MAHOGANY_TOWN,              17, 8
	spawn GOLDENROD_CITY,             17, 14
	spawn OLIVINE_CITY,               31, 18
	spawn AZALEA_TOWN,                13, 24
	spawn LAKE_OF_RAGE,                2, 26
	spawn CIANWOOD_CITY,              19, 28
	spawn BLACKTHORN_CITY,            15, 30
	spawn ROUTE_23,                    9, 6	;Outside Indigo Plateau
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6, 2
	spawn N_A,                        -1, -1



LoadSpawnPoint: ; 1531f
	; loads the spawn point in wd001
	push hl
	push de
	ld a, [wd001]
	cp SPAWN_N_A
	jr z, .spawn_n_a
	ld l, a
	ld h, 0
rept 2 ; multiply hl by 4
	add hl,hl
endr
	ld de, SpawnPoints
	add hl, de
	ld a, [hli]
	ld [MapGroup], a
	ld a, [hli]
	ld [MapNumber], a
	ld a, [hli]
	ld [XCoord], a
	ld a, [hli]
	ld [YCoord], a
.spawn_n_a
	pop de
	pop hl
	ret
; 15344


IsSpawnPoint: ; 15344
; Checks if the map loaded in de is a spawn point.  Returns carry if it's a spawn point.
	ld hl, SpawnPoints
	ld c, 0
.loop
	ld a, [hl]
	cp SPAWN_N_A
	jr z, .nope
	cp d
	jr nz, .next
	inc hl
	ld a, [hld]
	cp e
	jr z, .yes

.next
	push bc
	ld bc, 4 ; length of a spawn table entry
	add hl, bc
	pop bc
	inc c
	jr .loop

.nope
	and a
	ret

.yes
	scf
	ret
; 15363
