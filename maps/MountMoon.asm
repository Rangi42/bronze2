const_value set 2
	const MOUNTMOON_SILVER

MountMoon_MapScriptHeader:
.MapTriggers:
	db 0

	; triggers
;	maptrigger .Trigger0
;	maptrigger .Trigger1

.MapCallbacks:
	db 0

;.Trigger0:
;	priorityjump .RivalBattle
;	end

;.Trigger1:
;	end

;.RivalBattle:
;	spriteface PLAYER, RIGHT
;	showemote EMOTE_SHOCK, PLAYER, 15
;	special Special_FadeOutMusic
;	pause 15
;	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
;	playmusic MUSIC_RIVAL_ENCOUNTER
;	opentext
;	writetext MountMoonSilverTextBefore
;	waitbutton
;	closetext
;	checkevent EVENT_GOT_TOTODILE_FROM_ELM
;	iftrue .Totodile
;	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
;	iftrue .Chikorita
;	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
;	setlasttalked MOUNTMOON_SILVER
;	loadtrainer RIVAL2, 3
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .FinishBattle

;.Totodile:
;	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
;	setlasttalked MOUNTMOON_SILVER
;	loadtrainer RIVAL2, 1
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .FinishBattle

;.Chikorita:
;	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
;	setlasttalked MOUNTMOON_SILVER
;	loadtrainer RIVAL2, 2
;	startbattle
;	dontrestartmapmusic
;	reloadmapafterbattle
;	jump .FinishBattle

;.FinishBattle:
;	playmusic MUSIC_RIVAL_AFTER
;	opentext
;	writetext MountMoonSilverTextAfter
;	waitbutton
;	closetext
;	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
;	disappear MOUNTMOON_SILVER
;	dotrigger $1
;	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
;	playmapmusic
;	end

;MountMoonSilverMovementBefore:
;	step_left
;	step_left
;	step_left
;	step_end

;MountMoonSilverMovementAfter:
;	step_right
;	step_right
;	step_down
;	step_down
;	step_down
;	step_down
;	step_down
;	step_end

;MountMoonSilverTextBefore:
;	text "<......> <......> <......>"
;
;	para "It's been a while,"
;	line "<PLAYER>."
;
;	para "…Since I lost to"
;	line "you, I thought"
;
;	para "about what I was"
;	line "lacking with my"
;	cont "#MON…"
;
;	para "And we came up"
;	line "with an answer."
;
;	para "<PLAYER>, now we'll"
;	line "show you!"
;	done
;
;MountMoonSilverTextWin:
;	text "<......> <......> <......>"
;
;	para "I thought I raised"
;	line "my #MON to be"
;
;	para "the best they"
;	line "could be…"
;
;	para "…But it still "
;	line "wasn't enough…"
;	done

;MountMoonSilverTextAfter:
;	text "<......> <......> <......>"
;
;	para "…You won, fair"
;	line "and square."
;
;	para "I admit it. But"
;	line "this isn't the"
;	cont "end."
;
;	para "I'm going to be"
;	line "the greatest #-"
;	cont "MON trainer ever."
;
;	para "Because these guys"
;	line "are behind me."
;
;	para "…Listen, <PLAYER>."
;
;	para "One of these days"
;	line "I'm going to prove"
;
;	para "how good I am by"
;	line "beating you."
;	done

;MountMoonSilverTextLoss:
;	text "<......> <......> <......>"
;
;	para "I've repaid my"
;	line "debt to you."
;
;	para "With my #MON,"
;	line "I'm going to beat"
;
;	para "the CHAMPION and"
;	line "become the world's"
;	cont "greatest trainer."
;	done

MountMoon_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 19, 7, 1, ROUTE_3
	warp_def 5, 3, 9, PEWTER_CITY
	warp_def 7, 13, 2, ROUTE_5
	warp_def 31, 13, 5, ROUTE_5
	warp_def 5, 25, 1, MOUNT_MOON_SQUARE
	warp_def 15, 25, 2, MOUNT_MOON_SQUARE
	warp_def 3, 25, 3, MOUNT_MOON
	warp_def 13, 25, 4, MOUNT_MOON

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
