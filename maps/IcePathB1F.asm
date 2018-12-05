const_value set 2
	const ICEPATHB1F_BOULDER1
	const ICEPATHB1F_BOULDER2
	const ICEPATHB1F_BOULDER3
	const ICEPATHB1F_BOULDER4
	const ICEPATHB1F_POKE_BALL
	const ICEPATHB1F_BOULDER5
	const ICEPATHB1F_BOULDER6
	const ICEPATHB1F_BOULDER7
	const ICEPATHB1F_BOULDER8
	const ICEPATHB1F_BOULDER9
	
IcePathB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	dbw CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.StoneTable:
	stonetable 3, ICEPATHB1F_BOULDER1, .Boulder1
	stonetable 4, ICEPATHB1F_BOULDER2, .Boulder2
	stonetable 5, ICEPATHB1F_BOULDER3, .Boulder3
	stonetable 6, ICEPATHB1F_BOULDER4, .Boulder4
	db -1

.Boulder1:
	disappear ICEPATHB1F_BOULDER1
	clearevent EVENT_BOULDER_IN_ICE_PATH_1A
	jump .FinishBoulder

.Boulder2:
	disappear ICEPATHB1F_BOULDER2
	clearevent EVENT_BOULDER_IN_ICE_PATH_2A
	jump .FinishBoulder

.Boulder3:
	disappear ICEPATHB1F_BOULDER3
	clearevent EVENT_BOULDER_IN_ICE_PATH_3A
	jump .FinishBoulder

.Boulder4:
	disappear ICEPATHB1F_BOULDER4
	clearevent EVENT_BOULDER_IN_ICE_PATH_4A
	jump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	opentext
	writetext IcePathBoulderFellThroughText
	waitbutton
	closetext
	end

.BoulderFallsThrough:
	playsound SFX_STRENGTH
	earthquake 80
	end


IcePathB1FBoulder:
	jumpstd strengthboulder

IcePathB1FIron:
	itemball IRON

IcePathB1FHiddenMaxPotion:
	dwb EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION, MAX_POTION


IcePathBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done


IcePathB1F_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 3, 19, 3, ICE_PATH_1F
	warp_def 0, 4, 1, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def 0, 3, 3, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def 0, 6, 4, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def 0, 2, 5, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def 0, 5, 6, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def 23, 15, 4, ICE_PATH_1F
	warp_def 35, 20, 1, ICE_PATH_B2F_BLACKTHORN_SIDE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 27, 17, SIGNPOST_ITEM, IcePathB1FHiddenMaxPotion

.ObjectEvents: db 10
	person_event SPRITE_BOULDER, 6, 10, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_1
	person_event SPRITE_BOULDER, 4, 10, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_2
	person_event SPRITE_BOULDER, 26, 5, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_3
	person_event SPRITE_BOULDER, 5, 10, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_POKE_BALL, 17, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePathB1FIron, EVENT_ICE_PATH_B1F_IRON
	person_event SPRITE_BOULDER, 13, 12, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_BOULDER, 15, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_BOULDER, 27, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_BOULDER, 21, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_BOULDER, 12, 12, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
