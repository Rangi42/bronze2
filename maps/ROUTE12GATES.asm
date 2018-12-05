const_value set 2
	const ROUTE12GATES_OFFICER
	const ROUTE12GATES_GRAMPS

ROUTE12GATES_MapScriptHeader::

.MapTriggers:
	db 4

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3

.Callbacks: db 0

.Trigger0:
	end
	
.Trigger1:
	end
	
.Trigger2:
	end
	
.Trigger3:
	end

.Scripts:

Route12BlockNorth2:
	jump Route12BlockSouth2
	
Route12BlockSouth2:
	showemote EMOTE_SHOCK, ROUTE12GATES_OFFICER, 15
	opentext
	writetext WhatDidISayText
	waitbutton
	closetext
	applymovement PLAYER, Route12PlayerStepsBack
	end

Route12BlockNorth:
	jump Route12BlockSouth
	
Route12BlockSouth:
	checkcode VAR_FACING
	if_equal UP, BlockDoNothing1
	if_equal LEFT, BlockDoNothing1
	if_equal DOWN, BlockDoNothing1
	opentext
	writetext Route12YouCantPassText
	waitbutton
	closetext
;	applymovement PLAYER, Route12PlayerStepsBack
	end
	
BlockDoNothing1:
	end
	
OfficerBlockSilver:
	opentext
	writetext OfficerBlockSilverText1
	waitbutton
	closetext
	end
	
Route12GateGramps:
	jumptextfaceplayer Route12GateGrampsText
	
Route12PlayerStepsBack
	step_left
	step_left
	step_left
	step_end
	
.Text:

WhatDidISayText:
	text "Hey kid!"
	
	para "What did I just"
	line "say!?"
	done

Route12GateGrampsText:
	text "They added a gate"
	line "to the east that"
	
	para "leads to MT."
	line "ENDER."
	
	para "Only the strongest"
	line "#MON trainers"
	
	para "are allowed in"
	line "there."
	done

Route12YouCantPassText:
	text "Sorry, kid."
	
	para "But I have orders"
	line "not to let anyone"
	cont "through."
	done

OfficerBlockSilverText1
	text "Since MAURO has"
	line "allowed it, you"

	para "can pass on"
	line "through."
	done

ROUTE12GATES_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 7, 4, 2, ROUTE_12
	warp_def 7, 5, 2, ROUTE_12
	warp_def 3, 4, 5, CERULEANCITYGATES
	warp_def 4, 16, 3, ROUTE_12
	warp_def 5, 16, 4, ROUTE_12
	warp_def 4, 25, 3, SILVER_CAVE_OUTSIDE
	warp_def 5, 25, 4, SILVER_CAVE_OUTSIDE

.CoordEvents: db 4
	xy_trigger 0, 4, 21, 0, Route12BlockNorth, 0, 0
	xy_trigger 0, 5, 21, 0, Route12BlockSouth, 0, 0
	xy_trigger 0, 4, 23, 0, Route12BlockNorth2, 0, 0
	xy_trigger 0, 5, 23, 0, Route12BlockSouth2, 0, 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerBlockSilver, -1
	person_event SPRITE_GRAMPS, 3, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route12GateGramps, -1
