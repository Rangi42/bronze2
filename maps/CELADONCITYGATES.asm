CELADONCITYGATES_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

CeladonGateOfficer1:
	jumptextfaceplayer CeladonGateOfficer1Text
	
CeladonGateFisher:
	jumptextfaceplayer CeladonGateFisherText

.Text:

CeladonGateOfficer1Text:
	text "Quite a long"
	line "walk up that hill,"
	cont "huh?"
	done
	
CeladonGateFisherText:
	text "I'm gonna show"
	line "off my fire"
	
	para "breathing talents"
	line "all over KOHTO."
	done

CELADONCITYGATES_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 10, CELADON_CITY
	warp_def 0, 5, 11, CELADON_CITY
	warp_def 7, 4, 4, ROUTE_4
	warp_def 7, 5, 4, ROUTE_4

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonGateOfficer1, -1
	person_event SPRITE_FISHER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CeladonGateFisher, -1
