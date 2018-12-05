const_value set 2
	const BLACKTHORNBASEMENT_POKE_BALL1
	const BLACKTHORNBASEMENT_FAKE_BALL1
	const BLACKTHORNBASEMENT_FAKE_BALL2
	const BLACKTHORNBASEMENT_FAKE_BALL3

BlackthornExtraHouseBasement_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

BasementFakeBall:
	jumptext BasementFakeBallText

BasementFlashBall:
	giveitem HM_FLASH
	iffalse .BagFull
	disappear BLACKTHORNBASEMENT_POKE_BALL1
	setevent EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	opentext
	writetext Text_FoundFlash
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext Text_FoundFlashCont
	waitbutton
	closetext
	end

.BagFull:
	opentext
	writetext Text_FoundFlash
	buttonsound
	writetext Text_NoRoomForFlash
	waitbutton
	closetext
	end
	
.Text:

BasementFakeBallText:
	text "This isn't HM05."
	line "I better not take"
	cont "it."
	done

Text_FoundFlash:
	text "<PLAYER> found"
	line "HM05!"
	done

Text_NoRoomForFlash:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

Text_FoundFlashCont:
	text "<PLAYER> put the"
	line "HM05 in"
	cont "the TM POCKET."
	done
	
BlackthornExtraHouseBasement_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 4, 9, 3, BLACKTHORNEXTRAHOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 4, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BasementFlashBall, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	person_event SPRITE_POKE_BALL, 9, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BasementFakeBall, -1
	person_event SPRITE_POKE_BALL, 9, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BasementFakeBall, -1
	person_event SPRITE_POKE_BALL, 3, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BasementFakeBall, -1
