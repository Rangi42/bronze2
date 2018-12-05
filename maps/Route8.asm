const_value set 2
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE
	const ROUTE8_BLOCK

Route8_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBikerDwayne:
	trainer EVENT_BEAT_BIKER_DWAYNE, BIKER, DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, BikerDwayneScript

BikerDwayneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c0c8
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer EVENT_BEAT_BIKER_HARRIS, BIKER, HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, BikerHarrisScript

BikerHarrisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c143
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer EVENT_BEAT_BIKER_ZEKE, BIKER, ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, BikerZekeScript

BikerZekeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c1a3
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer EVENT_BEAT_SUPER_NERD_SAM, SUPER_NERD, SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, SupernerdSamScript

SupernerdSamScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c219
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer EVENT_BEAT_SUPER_NERD_TOM, SUPER_NERD, TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, SupernerdTomScript

SupernerdTomScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c27e
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

FruitTreeScript_0x6c06c:
	fruittree FRUITTREE_ROUTE_8

Route8BlockerGuy:
	faceplayer
	opentext
	checkcode VAR_BADGES
	if_greater_than 11, .Leaves
	writetext Route8BlockerGuyText
	waitbutton
	closetext
	end
	
.Leaves
	writetext Route8BlockerGuyText2
	waitbutton
	closetext
	applymovement ROUTE8_BLOCK, Route8MovementBlock
;	setevent EVENT_GOT_SILVER_WING
	disappear ROUTE8_BLOCK
	end

Route8MovementBlock:
	step_up
	step_up
	step_up
	step_right
	step_up
	step_end
	
Route8BlockerGuyText:
	text "Hey champ."
	
	para "You're new to"
	line "this region aren't"
	cont "you?"
	
	para "In that case, you"
	line "should get as many"
	cont "BADGES as you can!"
	
	para "Try it, should be"
	line "fun!"
	done
	
Route8BlockerGuyText2:
	text "Woah, you have a"
	line "lot of KOHTO"
	cont "BADGES!"
	
	para "I'll just get out"
	line "of your way."
	done
	
BikerDwayneSeenText:
	text "We're the KANTO"
	line "#MON FEDERATION"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

UnknownText_0x6c0c8:
	text "The KANTO #MON"
	line "FEDERATION will"
	cont "never fall!"
	done

BikerHarrisSeenText:
	text "The cops shut down"
	line "our UNDERGROUND"

	para "PATH! That really"
	line "fries me!"
	done

BikerHarrisBeatenText:
	text "F-forgive me!"
	done

UnknownText_0x6c143:
	text "Wiped out by some"
	line "punk from JOHTO…"
	done

BikerZekeSeenText:
	text "We're the KANTO"
	line "#MON FEDERA-"
	cont "TION!"
	cont "Right on!"
	done

BikerZekeBeatenText:
	text "Yikes! Sorry!"
	done

UnknownText_0x6c1a3:
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

SupernerdSamSeenText:
	text "I can calculate"
	line "that I am the"
	cont "superior trainer."
	done

SupernerdSamBeatenText:
	text "My calculations"
	line "were wrong!"
	done

UnknownText_0x6c219:
	text "Hm… Maybe one day"
	line "we should battle"
	cont "again."
	done

SupernerdTomSeenText:
	text "I wonder if you're"
	line "tough."
	done

SupernerdTomBeatenText:
	text "Just as I thought…"
	line "You are tough!"
	done

UnknownText_0x6c27e:
	text "Your #MON are"
	line "really something."
	
	para "Let's shake hands!"
	done

Route8LockedDoorText:
	text "NORTH - BRANDIES"
	line "CITY"
	
	para "EAST - JUNCTION"
	line "PARK"
	done

Route8UndergroundPathSignText:
	text "ROUTE 8"
;	
;	para "GAMBOGE TOWN -"
;	line "CASCADE CITY"
	done

Route8_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 8, 2, 3, ROUTE8GATES
	warp_def 9, 2, 4, ROUTE8GATES
	warp_def 3, 47, 7, ROUTE8GATES
	warp_def 7, 59, 6, ROUTE25GATES
	warp_def 6, 59, 5, ROUTE25GATES
	warp_def 21, 11, 9, ROUTE8GATES
	warp_def 21, 12, 10, ROUTE8GATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 12, 6, SIGNPOST_READ, Route8UndergroundPathSign
	signpost 9, 45, SIGNPOST_READ, Route8LockedDoor

.ObjectEvents: db 7
	person_event SPRITE_BIKER, 1, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	person_event SPRITE_BIKER, 1, 27, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 5, TrainerBikerHarris, -1
	person_event SPRITE_BIKER, 1, 28, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerBikerZeke, -1
	person_event SPRITE_SUPER_NERD, 12, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerSupernerdSam, -1
	person_event SPRITE_SUPER_NERD, 8, 55, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSupernerdTom, -1
	person_event SPRITE_FRUIT_TREE, 8, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x6c06c, -1
	person_event SPRITE_FISHER, 17, 55, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 5, Route8BlockerGuy, EVENT_GOT_SILVER_WING
