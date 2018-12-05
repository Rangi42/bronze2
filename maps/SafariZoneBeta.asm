const_value set 2
	const POSTOFFICE_CLERK
	const POSTOFFICE_WORKER

SafariZoneBeta_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PostOfficeDeskMan:
	faceplayer
	opentext
	writetext PostOfficeDeskManText
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .ItIsSundayPost
	waitbutton
	closetext
	end
	
.ItIsSundayPost
	buttonsound
	writetext PostOfficeDeskManSundayText
	waitbutton
	closetext
	end

PostOfficeMan:
	jumptextfaceplayer PostOfficeManText
	
PostOfficeDeskManSundayText:
	text "It is SUNDAY?"
	line "What am I doing at"
	cont "work!?"
	
	para "I feel like a"
	line "complete fool!"
	done

PostOfficeDeskManText:
	text "Mail, mail."
	line "So much mail."
	
	para "If we didn't have"
	line "SUNDAYS off, I'd"
	cont "go completely mad!"
	done

PostOfficeManText:
	text "We're out of"
	line "novelty #MON"
	cont "keychains."
	
	para "Everybody loves"
	line "those!"
	done
	
SafariZoneBeta_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 7, 7, FUCHSIA_CITY
	warp_def 7, 8, 7, FUCHSIA_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK, 5, 12, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PostOfficeDeskMan, -1
	person_event SPRITE_CLERK, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PostOfficeMan, -1
