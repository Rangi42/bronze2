
LoadMapGroupRoof:: ; 1c000
	ld a, [MapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld hl, Roofs
	ld bc, $90
	call AddNTimes
	ld de, VTiles2 tile $0a
	ld bc, $90
	call CopyBytes
	ret
; 1c021

MapGroupRoofs: ; 1c021i
	db -1 ; group 0
	db  4 ; group 1  ;Olivine City
	db  2 ; group 2  ;Mahogany Town
	db -1 ; group 3
	db  0 ; group 4  ;Ecruteak City
	db  3 ; group 5  ;Blackthorn City
	db -1 ; group 6  ;Cinnabar Island
	db 	1 ; group 7  ;Cerulean City
	db  0 ; group 8  ;Azalea Town
	db  2 ; group 9
	db  1 ; group 10 ;Violet City
	db  1 ; group 11 ;Goldenrod City
	db 	1 ; group 12 ;Vermilion City
	db -1 ; group 13 ;Pallet Town
	db -1 ; group 14 ;Pewter City
	db -1 ; group 15
	db -1 ; group 16
	db  1 ; group 17 ;Fuchsia City
	db  1 ; group 18 ;Lavender Town
	db  0 ; group 19
	db -1 ; group 20
	db -1 ; group 21 ;Celadon City
	db  2 ; group 22 ;Cianwood City
	db  2 ; group 23 ;Viridian City
	db  4 ; group 24 ;New Bark Town
	db 	0 ; group 25 ;Saffron City
	db  4 ; group 26 ;Cherrygrove City
; 1c03c

Roofs: ; 1c03c
INCBIN "gfx/tilesets/roofs/0.2bpp" ;Vertical Stripes
INCBIN "gfx/tilesets/roofs/1.2bpp" ;Dark Stripe on Top
INCBIN "gfx/tilesets/roofs/2.2bpp" ;Vertical Tiles
INCBIN "gfx/tilesets/roofs/3.2bpp" ;Horizonal Tiles
INCBIN "gfx/tilesets/roofs/4.2bpp" ;White Edges
; 1c30c
