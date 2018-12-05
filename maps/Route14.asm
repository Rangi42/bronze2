const_value set 2
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM
	const ROUTE14_BLOCK

Route14_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Kim:
	faceplayer
	opentext
	trade $5
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer EVENT_BEAT_POKEFANM_CARTER, POKEFANM, CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, PokefanmCarterScript

PokefanmCarterScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad508
	waitbutton
	closetext
	end

TrainerBird_keeperRoy:
	trainer EVENT_BEAT_BIRD_KEEPER_ROY, BIRD_KEEPER, ROY, Bird_keeperRoySeenText, Bird_keeperRoyBeatenText, 0, Bird_keeperRoyScript

Bird_keeperRoyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad5a4
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer EVENT_BEAT_POKEFANM_TREVOR, POKEFANM, TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, PokefanmTrevorScript

PokefanmTrevorScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad660
	waitbutton
	closetext
	end

Route14Blocker:
	faceplayer
	opentext
	checkcode VAR_BADGES
	if_greater_than 11, .Leaves
	writetext Route14BlockerText
	waitbutton
	closetext
	end
	
.Leaves
	writetext Route14BlockerText2
	waitbutton
	closetext
	applymovement ROUTE14_BLOCK, Route14BlockerLeave
;	setevent EVENT_GOT_SILVER_WING
	disappear ROUTE14_BLOCK
	playsound SFX_ENTER_DOOR
	end

RelicCavernSignScript:
	jumptext RelicCavernSignText

Route14SignScript1:
	jumptext Route14SignText1
	
Route14SignScript2:
	jumptext Route14SignText2
	
Route14BlockerLeave:
	step_up
	step_end
	
RelicCavernSignText:
	text "RELIC CAVERN"
	done
	
Route14SignText1:
	text "ROUTE 6"
	
	para "CASCADE CITY -"
	line "JUNCTION PARK"
	done
	
Route14SignText2:
	text "CASCADE CITY"
	line "THROUGH HERE"
	done
	
Route14BlockerText:
	text "Hey kid, you"
	line "should collect"
	cont "lots of badges."
	
	para "There are plenty"
	line "of GYMS to"
	cont "challenge!"
	done
	
Route14BlockerText2:
	text "Oh man you sure"
	line "like exploring"
	cont "huh?"
	
	para "You sure have a"
	line "lot of badges."
	
	para "I'll just get out"
	line "of your way."
	done

PokefanmCarterSeenText:
	text "I love these evo-"
	line "lution stages of"
	cont "my #MON!"
	
	para "Let me show you!"
	done

PokefanmCarterBeatenText:
	text "I'm stuffed!"
	done

UnknownText_0x1ad508:
	text "You are pretty"
	line "strong."
	
	para "Did you beat the"
	line "#MON LEAGUE?"
	done

Bird_keeperRoySeenText:
	text "I want to be a"
	line "#MON LEAGUE"
	cont "CHAMPION!"
	done

Bird_keeperRoyBeatenText:
	text "I dream big."
	line "Maybe too big."
	done

UnknownText_0x1ad5a4:
	text "You'll see my"
	line "name in lights"
	cont "some day."
	done

PokefanmTrevorSeenText:
	text "RAICHU!"
	
	para "Sorry, that's just"
	line "how I sneeze."
	done

PokefanmTrevorBeatenText:
	text "My RAICHU duo!"
	done

UnknownText_0x1ad660:
	text "You're a pretty"
	line "great trainer."
	
	para "You should catch"
	line "a RAICHU."
	done

Route14_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 40, 2, 3, ROUTE_8_SAFFRON_GATE
	warp_def 41, 2, 4, ROUTE_8_SAFFRON_GATE
	warp_def 34, 27, 1, ROUTE_15_FUCHSIA_GATE
	warp_def 35, 27, 2, ROUTE_15_FUCHSIA_GATE
	warp_def 1, 11, 15, ROUTE25GATES
	warp_def 21, 18, 1, WHIRL_ISLAND_B2F

.CoordEvents: db 0

.BGEvents: db 3
	signpost 23, 17, SIGNPOST_READ, RelicCavernSignScript
	signpost 1, 9, SIGNPOST_READ, Route14SignScript1
	signpost 39, 5, SIGNPOST_READ, Route14SignScript2

.ObjectEvents: db 5
	person_event SPRITE_POKEFAN_M, 17, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanmCarter, -1
	person_event SPRITE_YOUNGSTER, 32, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBird_keeperRoy, -1
	person_event SPRITE_POKEFAN_M, 19, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	person_event SPRITE_TEACHER, 8, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 4, Kim, -1
	person_event SPRITE_POKEFAN_M, 2, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 4, Route14Blocker, EVENT_GOT_SILVER_WING
