const_value set 2
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_OLIVINE_RIVAL
	const OLIVINECITY_GYM_BLOCKER
	const OLIVINECITY_FISHER

OlivineCity_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
;	maptrigger .Trigger2
;	maptrigger .Trigger3

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end
	
.Trigger2:
	end

.Trigger3:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	return

WorriedMotherRightScript:
	spriteface PLAYER, DOWN
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, WorriedMotherRightMovement
	spriteface PLAYER, LEFT
	jump WorriedMotherFinishScript

WorriedMotherLeftScript:
	spriteface PLAYER, DOWN
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, WorriedMotherLeftMovement
	jump WorriedMotherFinishScript
	
WorriedMotherFinishScript:
	opentext
	writetext UnknownText_0x1a88fa
	waitbutton
	closetext
	applymovement OLIVINECITY_OLIVINE_RIVAL, WorriedMotherLeavesMovement
	disappear OLIVINECITY_OLIVINE_RIVAL
	dotrigger $1
	special RestartMapMusic
	end

OlivineFisherScript:
	faceplayer
	opentext
	writetext OlivineFisherText
	yesorno
	iffalse .OlivineSaidNo
	writetext OlivineFisherAcceptText
	waitbutton
	closetext	
	end
	
.OlivineSaidNo
	writetext OlivineFisherRefuseText
	waitbutton
	closetext
	end
	
SailorScript_0x1a88a3:
	jumptextfaceplayer UnknownText_0x1a8a58

SailorGymBlockerScript:
	jumptextfaceplayer SailorGymBlockerText
	
StandingYoungsterScript_0x1a88a6:
	faceplayer
	opentext
;	random $2
;	if_equal $0, UnknownScript_0x1a88b4
	writetext UnknownText_0x1a8b04
	waitbutton
	closetext
	end

UnknownScript_0x1a88b4:
	writetext UnknownText_0x1a8b41
	waitbutton
	closetext
	end

SailorScript_0x1a88ba:
	jumptextfaceplayer UnknownText_0x1a8b71

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokeCenterSign:
	jumpstd pokecentersign

OlivineCityMartSign:
	jumpstd martsign

OlivineCitySignpostDEVScript:
	jumptext OlivineCitySignpostDEVText
	
WorriedMotherRightMovement:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_up
	turn_head_right
	step_end

WorriedMotherLeftMovement:
	big_step_up
	big_step_up
	big_step_up
	step_up
	step_end

WorriedMotherLeavesMovement:
	step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x1a88f4:
	step_down
	turn_head_up
	step_end

MovementData_0x1a88f7:
	step_up
	turn_head_down
	step_end

OlivineFisherText:
	text "Mmm. I love me"
	line "some #MON"
	cont "gumbo!"
	cont "Want to try some?"
	done
	
OlivineFisherRefuseText:
	text "Yeah, I didn't"
	line "think so."
	done
	
OlivineFisherAcceptText:
	text "No way, man!"
	line "It's all mine!"
	done
	
UnknownText_0x1a88fa:
	text "Oh where is he?!"
	
	para "My son has gone"
	line "missing! I can't"
	cont "find him anyhwere!"
	
	para "He started acting"
	line "very strange and"
	
	para "talked about how"
	line "he wanted to join"
	
	para "a secret club and"
	line "he just packed his"
	cont "things and left!"
	
	para "Please help me"
	line "find my baby!"
	
	para "…Snivel, hic…"
	
	para "Please!"
	done

UnknownText_0x1a8a58:
	text "Hah! if you expect"
	line "to beat the GYM"
	
	para "in this city you"
	line "ain't gonna do"
	
	para "well with those"
	line "big city fire type"
	cont "#MON!"
	done

UnknownText_0x1a8b04:
	text "Care to join me"
	line "in casting your"
	cont "ROD?"
	
	para "It's a lot more"
	line "fun with a"
	cont "partner!"
	done

UnknownText_0x1a8b41:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

UnknownText_0x1a8b71:
	text "Sailin' is me"
	line "life."
	
	para "Treading the"
	line "waters with me"
	
	para "beloved water"
	line "#MON!"
	done

OlivineCitySignText:
	text "NEWPORT CITY"

	para "Tranquility on"
	line "the Lake"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "NEWPORT CITY"
	line "#MON GYM"
	cont "LEADER: CORALINE"

	para "Always in the"
	line "Deep End"
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done

UnknownText_0x1a8cba:
	text "BATTLE TOWER AHEAD"
	done
	
SailorGymBlockerText:
	text "Battle?"
	line "What? No!"
	
	para "This is where I"
	line "have my coffee"
	cont "break!"
	
	para "If you want in"
	line "the GYM, you're"
	
	para "gonna have to"
	line "wait, buddy!"
	done

OlivineCitySignpostDEVText:
	text "Dev Diary 8"

	para "The 10th of"
	line "JUNE 2017"
	
	para "Well, after a"
	line "long hiatus of not"
	cont "working on it,"
	
	para "I got back to"
	line "coding and now"
	
	para "the main story is"
	line "complete."
	
	para "I've been doing"
	line "a lot of play-"
	
	para "testing and I"
	line "decided to insert"
	
	para "more events into"
	line "the story."
	
	para "Beef it up a"
	line "little!"
	
	para "I'm pretty dang"
	line "proud of how"
	
	para "this game is"
	line "coming together."
	
	para "But after that,"
	line "there's still"
	cont "region 2!"	
	
	para "-FREAKO out."
	done
	
OlivineCity_MapEventHeader:: db 0, 0

.Warps: db 13
	warp_def 17, 31, 1, OLIVINE_POKECENTER_1F
	warp_def 29, 30, 1, CIANWOOD_GYM
	warp_def 11, 25, 1, OLIVINE_TIMS_HOUSE
	warp_def 0, 0, 1, OLIVINE_HOUSE_BETA
	warp_def 11, 13, 1, OLIVINE_PUNISHMENT_SPEECH_HOUSE
	warp_def 27, 15, 1, OLIVINE_GOOD_ROD_HOUSE
	warp_def 17, 22, 1, OLIVINE_CAFE
	warp_def 17, 17, 2, OLIVINE_MART
	warp_def 8, 25, 1, OLIVINE_LIGHTHOUSE_1F
	warp_def 8, 29, 1, OLIVINE_PORT_PASSAGE
	warp_def 8, 30, 2, OLIVINE_PORT_PASSAGE
	warp_def 22, 2, 8, OLIVINE_PORT_PASSAGE
	warp_def 23, 2, 9, OLIVINE_PORT_PASSAGE

.CoordEvents: db 2
	xy_trigger 0, 1, 22, 0, WorriedMotherRightScript, 0, 0
	xy_trigger 0, 1, 21, 0, WorriedMotherLeftScript, 0, 0

.BGEvents: db 8
	signpost 24, 6, SIGNPOST_READ, OlivineCitySign
	signpost 8, 31, SIGNPOST_READ, OlivineCityPortSign
	signpost 29, 27, SIGNPOST_READ, OlivineGymSign
	signpost 8, 26, SIGNPOST_READ, OlivineLighthouseSign
	signpost 20, 3, SIGNPOST_READ, OlivineCityBattleTowerSign
	signpost 17, 32, SIGNPOST_READ, OlivineCityPokeCenterSign
	signpost 17, 18, SIGNPOST_READ, OlivineCityMartSign
	signpost 17, 30, SIGNPOST_READ, OlivineCitySignpostDEVScript

.ObjectEvents: db 6
	person_event SPRITE_SAILOR, 27, 26, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x1a88a3, -1
	person_event SPRITE_FISHER, 34, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StandingYoungsterScript_0x1a88a6, -1
	person_event SPRITE_SAILOR, 22, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x1a88ba, -1
	person_event SPRITE_POKEFAN_F, 6, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	person_event SPRITE_SAILOR, 30, 30, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorGymBlockerScript, EVENT_NATIONAL_PARK_TM_DIG
	person_event SPRITE_FISHER, 13, 20, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OlivineFisherScript, -1
