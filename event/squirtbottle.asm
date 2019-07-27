;This script is now for the teleporter.

_Squirtbottle: ; 50730
	ld hl, .SelectRegionBoxScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
	
.SelectRegionBoxScript
	checkflag ENGINE_FLYPOINT_CERULEAN
	iffalse .JantoTeleportMenu
	refreshscreen $0
	loadmenudata .MenuDataHeader3
	verticalmenu
	closewindow
	if_equal $1, .JantoTeleportMenu
	if_equal $2, .end
	closetext
	end
	
.JantoTeleportMenu
	refreshscreen $0
	loadmenudata .MenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, .NewBarkTeleport
	if_equal $2, .SilverleafTeleport
	if_equal $3, .end
	if_equal $4, .end
	if_equal $5, .end
	if_equal $6, .end
	if_equal $7, .end
	if_equal $8, .scriptmenutest2
	closetext
	end

.NewBarkTeleport
	opentext
	writetext ItemFinderFinishedText
	closetext
	special FadeOutPalettes
	warpfacing DOWN, NEW_BARK_TOWN, 13, 4
	end
	
.SilverleafTeleport
	checkflag ENGINE_FLYPOINT_CHERRYGROVE
	iftrue .TeleportNow
	opentext
	writetext HaventVisitedTeleport
	waitbutton
	closetext
	end

.TeleportNow
	opentext
	writetext ItemFinderFinishedText
	closetext
	special FadeOutPalettes
	warpfacing DOWN, CHERRYGROVE_CITY, 21, 4
	end

.scriptmenutest2
	refreshscreen $0
	loadmenudata .MenuDataHeader2
	verticalmenu
	closewindow
	if_equal $1, .JantoTeleportMenu
	if_equal $2, .end
	if_equal $3, .RedstoneTeleportMenu
	if_equal $4, .end
	if_equal $5, .HardrootTeleportMenu
	if_equal $6, .HallofFameTeleportMenu
	if_equal $7, .end
	closetext
	end

.RedstoneTeleportMenu
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .TeleportRedNow
	opentext
	writetext HaventVisitedTeleport
	waitbutton
	closetext
	end

.TeleportRedNow
	opentext
	writetext ItemFinderFinishedText
	closetext
	special FadeOutPalettes
	warpfacing DOWN, LAKE_OF_RAGE, 2, 26
	end

.HardrootTeleportMenu
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .TeleportHardNow
	opentext
	writetext HaventVisitedTeleport
	waitbutton
	closetext
	end

.TeleportHardNow
	opentext
	writetext ItemFinderFinishedText
	closetext
	special FadeOutPalettes
	warpfacing DOWN, BLACKTHORN_CITY, 15, 30
	end
	
.HallofFameTeleportMenu
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .TeleportHallNow
	opentext
	writetext HaventVisitedTeleport
	waitbutton
	closetext
	end

.TeleportHallNow
	opentext
	writetext ItemFinderFinishedText
	closetext
	special FadeOutPalettes
	warpfacing DOWN, ROUTE_23, 9, 6 
	end
	
.NextRegionTeleport
	checkflag ENGINE_FLYPOINT_CERULEAN
	iftrue .end
	opentext
	writetext HaventVisitedTeleport
	waitbutton
	closetext
	end

.end
	closetext
	end


.MenuDataHeader3: ; 0x48dfc
	db $40 ; flags
	db 05, 06 ; start coords
	db 11, 14 ; end coords
	dw .MenuData23
	db 1 ; default option
; 0x48e04

.MenuData23: ; 0x48e04
	db $80 ; flags
	db 2 ; items
	db "JANTO@"
	db "KOHTO@"
	
.MenuDataHeader: ; 0x48dfc
	db $40 ; flags
	db 00, 03 ; start coords
	db 17, 17 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x48e04

.MenuData2: ; 0x48e04
	db $80 ; flags
	db 8 ; items
	db "OLD OAK@"
	db "SILVERLEAF@"
	db "WILLOWBRUSH@"
	db "FERNWORTH@"
	db "WILDBARK@"
	db "ROSEGLEN@"
	db "NEWPORT@"
	db "More@"
	
; 2nd MENU
	
.MenuDataHeader2: ; 0x48dfc
	db $40 ; flags
	db 00, 03 ; start coords
	db 15, 17 ; end coords
	dw .MenuData22
	db 1 ; default option
; 0x48e04

.MenuData22: ; 0x48e04
	db $80 ; flags
	db 7 ; items
	db "Back@"
	db "FIGBRANCH@"
	db "MT.REDSTONE@"
	db "MAUVEWOOD@"
	db "HARDROOT@"
	db "LEAGUE@"
	db "Exit@"
	
ItemFinderFinishedText:
	text "Teleporting..."
	done

HaventVisitedTeleport:
	text "You haven't visited"
	line "here yet."
	done