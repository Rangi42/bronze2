const_value set 2
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_SILVER
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA

IndigoPlateauPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 2

	maptrigger RivalTrigger0
	maptrigger RivalTrigger1
	; triggers
;	dw UnknownScript_0x180009, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x18000a

UnknownScript_0x180009:
	end

RivalTrigger0
	end
	
RivalTrigger1
	end
	
UnknownScript_0x18000a:
	domaptrigger WILLS_ROOM, $0
	domaptrigger KOGAS_ROOM, $0
	domaptrigger BRUNOS_ROOM, $0
	domaptrigger KARENS_ROOM, $0
	domaptrigger LANCES_ROOM, $0
	domaptrigger HALL_OF_FAME, $0
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	return

PlateauRivalBattle1:
;	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
;	iffalse PlateauRivalScriptDone
;	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
;	iftrue PlateauRivalScriptDone
;	checkcode VAR_WEEKDAY
;	if_equal SUNDAY, PlateauRivalScriptDone
;	if_equal TUESDAY, PlateauRivalScriptDone
;	if_equal THURSDAY, PlateauRivalScriptDone
;	if_equal FRIDAY, PlateauRivalScriptDone
;	if_equal SATURDAY, PlateauRivalScriptDone
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	moveperson INDIGOPLATEAUPOKECENTER1F_SILVER, $11, $9
	appear INDIGOPLATEAUPOKECENTER1F_SILVER
	special Special_FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface PLAYER, RIGHT
	jump PlateauRivalBattleCommon

PlateauRivalBattle2:
;	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
;	iffalse PlateauRivalScriptDone
;	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
;	iftrue PlateauRivalScriptDone
;	checkcode VAR_WEEKDAY
;	if_equal SUNDAY, PlateauRivalScriptDone
;	if_equal TUESDAY, PlateauRivalScriptDone
;	if_equal THURSDAY, PlateauRivalScriptDone
;	if_equal FRIDAY, PlateauRivalScriptDone
;	if_equal SATURDAY, PlateauRivalScriptDone
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	appear INDIGOPLATEAUPOKECENTER1F_SILVER
	special Special_FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface PLAYER, LEFT
PlateauRivalBattleCommon:
	opentext
	writetext PlateauRivalText1
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL1, 15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

.Totodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL1, 13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

.Chikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL1, 14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump PlateauRivalPostBattle

PlateauRivalPostBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PlateauRivalText2
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_SILVER
	dotrigger $1
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
PlateauRivalScriptDone:
	end

NurseScript_0x18012c:
	jumpstd pokecenternurse

ClerkScript_0x18012f:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

CooltrainerMScript_0x180136:
	jumptextfaceplayer UnknownText_0x180178

TeleportGuyScript:
	faceplayer
	opentext
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 13,  4
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end

PlateauRivalMovement1:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

PlateauRivalMovement2:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

PlateauRivalLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

UnknownText_0x180178:
	text "At the #MON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done

PlateauRivalText1:
	text "Stop right"
	line "there!"
	
	para "<PLAYER>, you"
	line "made it to"
	cont "the ELITE FOUR?"
	
	para "I was usually one"
	line "step ahead of you…"
	
	para "I want to"
	line "challenge you to"
	cont "A battle."
	
	para "If anyone is going"
	line "to be CHAMPION"
	
	para "first, it's going"
	line "to be me."
	done

PlateauRivalWinText:
	text "I'd be lying if"
	line "I said I wasn't"
	cont "disappointed."
	done

PlateauRivalText2:
	text "That was harsh,"
	line "but I'm not giving"
	cont "up still."
	
	para "I'll train more and"
	line "try to become the"
	cont "CHAMPION."
	
	para "Goodbye,"
	line "<PLAYER>."
	done

PlateauRivalLoseText:
	text "Wow. I think I"
	line "have what it takes"
	
	para "to be the"
	line "CHAMPION!"
	done

TeleportGuyText1:
	text "Ah! You're chal-"
	line "lenging the ELITE"

	para "FOUR? Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train some more,"

	para "my ABRA can help"
	line "you."

	para "It can TELEPORT"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done

TeleportGuyNoText:
	text "OK, OK. The best"
	line "of luck to you!"
	done

AbraText:
	text "ABRA: Aabra…"
	done

IndigoPlateauPokeCenter1F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 13, 5, 1, ROUTE_23
	warp_def 13, 6, 1, ROUTE_23
	warp_def 13, 0, 1, POKECENTER_2F
	warp_def 3, 14, 1, WILLS_ROOM

.CoordEvents: db 2
	xy_trigger 0, 4, 16, 0, PlateauRivalBattle1, 0, 0
	xy_trigger 0, 4, 17, 0, PlateauRivalBattle2, 0, 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_NURSE, 7, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x18012c, -1
	person_event SPRITE_CLERK, 7, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x18012f, -1
	person_event SPRITE_COOLTRAINER_M, 11, 11, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x180136, -1
	person_event SPRITE_SILVER, 9, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	person_event SPRITE_GRAMPS, 9, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	person_event SPRITE_JYNX, 9, 0, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
