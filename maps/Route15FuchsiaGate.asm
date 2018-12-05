const_value set 2
	const ROUTE15FUCHSIAGATE_OFFICER
	const ROUTE15FUCHSIAGATE_BRONZENORTH
	const ROUTE15FUCHSIAGATE_BRONZESOUTH

Route15FuchsiaGate_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	end
	
.Trigger1:
	end
	
OfficerScript_0x19679e:
	jumptextfaceplayer UnknownText_0x1967a1

FuchGateMeetBronze1:
	special Special_FadeOutMusic
	dotrigger $1
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear ROUTE15FUCHSIAGATE_BRONZENORTH
	applymovement ROUTE15FUCHSIAGATE_BRONZENORTH, BronzeWalksTowards1
	opentext
	writetext BronzeSaysNothing
	waitbutton
	closetext
	applymovement ROUTE15FUCHSIAGATE_BRONZENORTH, BronzeLeaves1
	disappear ROUTE15FUCHSIAGATE_BRONZENORTH
	playsound SFX_ENTER_DOOR
	waitsfx
	special RestartMapMusic
	end

FuchGateMeetBronze2:
	special Special_FadeOutMusic
	dotrigger $1
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear ROUTE15FUCHSIAGATE_BRONZESOUTH
	applymovement ROUTE15FUCHSIAGATE_BRONZESOUTH, BronzeWalksTowards1
	opentext
	writetext BronzeSaysNothing
	waitbutton
	closetext
	applymovement ROUTE15FUCHSIAGATE_BRONZESOUTH, BronzeLeaves2
	disappear ROUTE15FUCHSIAGATE_BRONZESOUTH
	playsound SFX_ENTER_DOOR
	waitsfx
	special RestartMapMusic
	end
	
BronzeWalksTowards1:
	step_right
	step_right
	step_right
	step_end
	
BronzeLeaves1:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
BronzeLeaves2:
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

BronzeSaysNothing:
	text "…………………………"
	line "…………………………"
	done
	
UnknownText_0x1967a1:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 3, ROUTE_14
	warp_def 5, 0, 4, ROUTE_14
	warp_def 4, 9, 1, ROUTE_15
	warp_def 5, 9, 2, ROUTE_15

.CoordEvents: db 2
	xy_trigger 0, 4, 4, 0, FuchGateMeetBronze1, 0, 0
	xy_trigger 0, 5, 4, 0, FuchGateMeetBronze2, 0, 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19679e, -1
	person_event SPRITE_RED, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	person_event SPRITE_RED, 5, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
