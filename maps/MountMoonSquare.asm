const_value set 2
	const MOUNTMOONSQUARE_FAIRY1
	const MOUNTMOONSQUARE_FAIRY2
	const MOUNTMOONSQUARE_ROCK

MountMoonSquare_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger0, 0

.MapCallbacks:
	db 0

	; callbacks

;	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x77093

;	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x77097

.Trigger0:
	end

UnknownScript_0x77093:
;	setevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
;	return

UnknownScript_0x77097:
;	disappear MOUNTMOONSQUARE_ROCK
;	return

FairyDance:
;	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
;	iftrue .NoDancing
;	checkcode VAR_WEEKDAY
;	if_not_equal MONDAY, .NoDancing
;	checknite
;	iffalse .NoDancing
;	appear MOUNTMOONSQUARE_FAIRY1
;	appear MOUNTMOONSQUARE_FAIRY2
	opentext
	writetext CultChanting
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x77121
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
;	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77123
;	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77126
;	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77128
;	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x7712b
;	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x7712d
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77132
	stopfollow
	showemote EMOTE_SHOCK, MOUNTMOONSQUARE_FAIRY1, 15
	playmusic MUSIC_SAGE_ENCOUNTER
	applymovement MOUNTMOONSQUARE_FAIRY1, FairyMoveDown
	applymovement MOUNTMOONSQUARE_FAIRY2, FairyMoveDown
;	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
	pause 10
	opentext
	writetext LavFirstSageEncounter
	waitbutton
	closetext
	winlosstext CultBeaten1Text, 0
	loadtrainer SAGE, 1
	startbattle
	reloadmapafterbattle
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, FairyMoveRightOne
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
	spriteface MOUNTMOONSQUARE_FAIRY2, DOWN
	playmusic MUSIC_SAGE_ENCOUNTER
	opentext
	writetext LavSecondSageEncounter
	waitbutton
	closetext
	winlosstext CultBeaten2Text, 0
	loadtrainer SAGE, 2
	startbattle
	reloadmapafterbattle
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
;	cry CLEFAIRY
	pause 15
	opentext
	writetext CultBeatenForGood
	waitbutton
	closetext
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77134
	disappear MOUNTMOONSQUARE_FAIRY1
	disappear MOUNTMOONSQUARE_FAIRY2
	stopfollow
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
;	clearevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
;	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	dotrigger $1
	end

.NoDancing:
	end

MountMoonSquareHiddenMoonStone:
	dwb EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE, MOON_STONE


DontLitterSign:
	jumptext DontLitterSignText

MtMoonSquareRock:
	itemball RED_SCALE

MovementData_0x77121:
	step_up
	step_end

MovementData_0x77123:
	slow_step_down
	slow_step_down
;	slow_jump_step_down
	step_end

MovementData_0x77126:
	slow_step_right
	slow_step_right
;	slow_jump_step_right
	step_end

MovementData_0x77128:
	slow_step_up
	slow_step_up
;	slow_jump_step_up
	step_end

MovementData_0x7712b:
;	slow_jump_step_left
	slow_step_left
	slow_step_left
	step_end

MovementData_0x7712d:
	slow_step_down
	slow_step_down
;	slow_jump_step_down
	step_end
	
FairyMoveRightOne
	step_right
	step_end

MovementData_0x77130:
	slow_step_down
	step_end

MovementData_0x77132:
	slow_step_right
	step_end

MovementData_0x77134:
	step_down
	step_down
	step_left
	step_down
	step_down
	step_down
	step_down
	slow_step_right
	slow_step_right
	step_end

FairyMoveDown:
	step_down
	step_end
	
LavFirstSageEncounter:
	text "Why must you"
	line "disturb our"
	cont "ritual?"
	
	para "This stone here"
	line "grants us ultimate"
	cont "power."
	
	para "When it is enchan-"
	line "ted, it will make"
	
	para "us unstoppable as"
	line "#MON trainers."
	
	para "We will now"
	line "dispose of you!"
	done

CultBeaten1Text:
	text "Oh… my…"
	done

LavSecondSageEncounter:
	text "The stone's full"
	line "power must not"
	cont "have charged yet."
	
	para "I will now bring"
	line "its full power!"
	done
	
CultBeaten2Text:
	text "Preposterous!"
	done
	
DontLitterSignText:
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done

CultBeatenForGood:
	text "I cannot believe"
	line "this."
	
	para "The stone is not"
	line "powerful at all."
	
	para "Both of us could"
	line "not beat you,"
	
	para "even after our"
	line "stone ritual!"
	
	para "You can have the"
	line "stone."
	
	para "It's useless to"
	line "us."
	
	para "Farewell."
	done
	
CultChanting:
	text "Hummmmmmmmm."
	line "Hummmmmmmmm."
	done
	
MountMoonSquare_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 3, 25, 7, LAVENDER_TOWN
	warp_def 11, 27, 6, MOUNT_MOON
	warp_def 12, 23, 1, MOUNT_MOON_GIFT_SHOP

.CoordEvents: db 1
	xy_trigger 0, 11, 7, 0, FairyDance, 0, 0

.BGEvents: db 2
	signpost 3, 19, SIGNPOST_ITEM, MountMoonSquareHiddenMoonStone
	signpost 9, 23, SIGNPOST_READ, DontLitterSign

.ObjectEvents: db 3
	person_event SPRITE_SAGE, 6, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	person_event SPRITE_SAGE, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	person_event SPRITE_ENTEI, 7, 7, PERSONTYPE_ITEMBALL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MtMoonSquareRock, EVENT_FOUGHT_SUDOWOODO
