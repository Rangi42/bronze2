const_value set 2
	const ROUTE5_POKEFAN_M
	const ROUTE5_SILVER

Route5_MapScriptHeader:
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

RivalFinalBattleTrigger1:
	spriteface PLAYER, RIGHT
	appear ROUTE5_SILVER
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE5_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	setevent EVENT_MT_MOON_RIVAL
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked ROUTE5_SILVER
	loadtrainer RIVAL1, 18
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked ROUTE5_SILVER
	loadtrainer RIVAL1, 16
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked ROUTE5_SILVER
	loadtrainer RIVAL1, 17
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement ROUTE5_SILVER, MountMoonSilverMovementAfter
	disappear ROUTE5_SILVER
	dotrigger $1
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end
	
PokefanMScript_0x1adb19:
	jumptextfaceplayer UnknownText_0x1adb22

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

MountMoonSilverMovementBefore:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MountMoonSilverMovementAfter:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MountMoonSilverTextBefore:
	text "It's been quite a"
	line "while, <PLAYER>."
	
	para "I've had a long"
	line "time to think"
	
	para "about my actions"
	line "and how I've been"
	cont "treating people."
	
	para "I've learned to"
	line "love my #MON"
	cont "and trust in them."
	
	para "We've grown a lot"
	line "closer, and"
	
	para "because of that, I"
	line "think I'll finally"
	
	para "be able to beat"
	line "you."
	
	para "Fair and square,"
	line "of course."
	
	para "Here goes"
	line "everything!"
	done

MountMoonSilverTextWin:
	text "Oh. I see."
	
	para "My training is"
	line "not yet complete."
	done

MountMoonSilverTextAfter:
	text "I'm a little"
	line "disappointed."
	
	para "But I'm okay with"
	line "this."
	
	para "I already feel"
	line "stronger."
	
	para "But this means"
	line "I can get stronger"
	cont "still!"
	
	para "Thank you for"
	line "testing my skill."
	
	para "One day though, I"
	line "will beat you,"
	
	para "and I can really"
	line "prove myself."
	
	para "Farewell <PLAYER>."
	done

MountMoonSilverTextLoss:
	text "<......> <......> <......>"

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done
	
UnknownText_0x1adb22:
	text "I remember BROWN"
	line "CAVE being a lot"
	cont "bigger."
	
	para "Well I guess it's"
	line "easier to"
	cont "navigate."
	done

Route5UndergroundPathSignText:
	text "BROWN CAVE"
	done

HouseForSaleSignText:
	text "RUSSET TOWN"
	line "Through Here"
	done

Route5_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 3, 21, 1, ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def 11, 6, 3, MOUNT_MOON
	warp_def 3, 18, 2, ROUTE_5_SAFFRON_CITY_GATE
	warp_def 3, 24, 1, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE
	warp_def 5, 22, 4, MOUNT_MOON

.CoordEvents: db 1
	xy_trigger 0, 6, 22, 0, RivalFinalBattleTrigger1, 0, 0

.BGEvents: db 2
	signpost 5, 27, SIGNPOST_READ, Route5UndergroundPathSign
	signpost 11, 3, SIGNPOST_READ, HouseForSaleSign

.ObjectEvents: db 2
	person_event SPRITE_YOUNGSTER, 12, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1adb19, -1
	person_event SPRITE_SILVER, 6, 28, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
