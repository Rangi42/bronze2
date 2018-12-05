const_value set 2
	const ROUTE_36_GATE_YOUNGSTER
	const ROUTE_36_GATE_LASS
	const ROUTE_36_GATE_OFFICER
	const ROUTE_36_GATE_RIVAL
	const ROUTE_36_GATE_RIVAL2

Route36_Underground_Path_MapScriptHeader::

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.Callbacks: db 0

;.Scripts:

.Trigger0:
	end

.Trigger1:
	end

Route36RivalBattleTrigger1:
;	disappear ROUTE_36_GATE_RIVAL
	disappear ROUTE_36_GATE_RIVAL2
;	wait 15
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear ROUTE_36_GATE_RIVAL
	applymovement ROUTE_36_GATE_RIVAL, Route36RivalWalkDown1
	jump Route36BattleBegin

Route36RivalBattleTrigger2:
	disappear ROUTE_36_GATE_RIVAL
;	disappear ROUTE_36_GATE_RIVAL2
;	wait 15
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear ROUTE_36_GATE_RIVAL2
	applymovement ROUTE_36_GATE_RIVAL2, Route36RivalWalkDown2
	jump Route36BattleBegin
	
Route36BattleBegin:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route36RivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext Route36RivalWinText, Route36RivalLossText
	setlasttalked ROUTE_36_GATE_RIVAL
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext Route36RivalWinText, Route36RivalLossText
	setlasttalked ROUTE_36_GATE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext Route36RivalWinText, Route36RivalLossText
	setlasttalked ROUTE_36_GATE_RIVAL
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route36RivalAfterText
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement ROUTE_36_GATE_RIVAL, Route36RivalLeave
	applymovement ROUTE_36_GATE_RIVAL2, Route36RivalLeave	
;	playsound SFX_EXIT_BUILDING
	disappear ROUTE_36_GATE_RIVAL
	disappear ROUTE_36_GATE_RIVAL2
	dotrigger $1
	waitsfx
	playmapmusic
	end
	
Under36person_1:
	jumptextfaceplayer Under36persontext_1
	
Under36person_2:
	jumptextfaceplayer Under36persontext_2
	
Under36officer_1:
	jumptextfaceplayer Under36officertext_1

Route36RivalWalkDown1
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end
	
Route36RivalWalkDown2
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end
	
Route36RivalLeave
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
.Text:

Route36RivalBeforeText:
	text "<PLAYER>!"
	
	para "I'm amazed you"
	line "didn't give up"
	cont "this soon."
	
	para "I suppose I"
	line "should encourage"
	
	para "you by beating"
	line "you in a battle!"
	
	para "Wadda ya say?"
	line "I'm game!"
	done
	
Route36RivalAfterText:
	text "I'm going to"
	line "the #MON CENTER"
	
	para "to clean up this"
	line "mess you've made."
	
	para "Don't run into me"
	line "again."
	done

Route36RivalWinText:
	text "Pfff. Don't"
	line "humor me."
	
	para "I'm still"
	line "the strongest."
	done
	
Route36RivalLossText:
	text "Yay"
	done

Under36persontext_1:
	text "Be careful in the"
	line "underground."
	
	para "It can be a bit"
	line "spooky!"
	done
	
Under36persontext_2:
	text "Huff…"
	line "There's still a"
	
	para "ways to go to the"
	line "next route!"
	done
	
Under36officertext_1:
	text "Hah! You never"
	line "know what kind of"
	
	para "people to expect"
	line "to pop out of"
	cont "that staircase."
	
	para "It's a fun job!"
	done

Route36_Underground_Path_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 5, 4, 3, ROUTE36_UNDERGROUND_PATH
	warp_def 18, 3, 4, ROUTE36_UNDERGROUND_PATH
	warp_def 34, 19, 1, ROUTE36_UNDERGROUND_PATH
	warp_def 5, 22, 2, ROUTE36_UNDERGROUND_PATH
	warp_def 0, 22, 1, ROUTE_34
	warp_def 0, 23, 2, ROUTE_34
	warp_def 4, 9, 1, ROUTE_36
	warp_def 5, 9, 2, ROUTE_36

.CoordEvents: db 2
	xy_trigger 0, 36, 7, 0, Route36RivalBattleTrigger1, 0, 0
	xy_trigger 0, 37, 7, 0, Route36RivalBattleTrigger2, 0, 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_YOUNGSTER, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Under36person_1, -1
	person_event SPRITE_LASS, 30, 2, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Under36person_2, -1
	person_event SPRITE_OFFICER, 4, 18, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Under36officer_1, -1
	person_event SPRITE_SILVER, 31, 4, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	person_event SPRITE_SILVER, 32, 4, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
