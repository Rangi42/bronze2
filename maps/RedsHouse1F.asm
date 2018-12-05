const_value set 2
	const REDSHOUSE1F_REDS_MOM
	const REDSHOUSE1F_REDS_BronzeMom2
	const REDSHOUSE1F_REDS_DAUGHTER

RedsHouse1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger, 0

.MapCallbacks:
	db 0

.Trigger:
	end	

RedsMom:
	faceplayer
	opentext
;	checkevent EVENT_MET_REDS_MOM
;	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
;	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FSink:
	jumptext RedSink
	
RedsHouse1FStove:
	jumptext RedStove
	
BronzeMom2:
	jumptextfaceplayer BronzeMom2Text
	
BronzeDaughter1:
	jumptextfaceplayer BronzeDaughter1Text

RedStove:	
	text "Nice and clean!"
	done

RedSink:
	text "This sink is"
	line "spotless!"
	done
	
BronzeDaughter1Text:
	text "I haven't seen"
	line "my little sister"
	cont "in a while."
	
	para "I hope she's"
	line "doing okay."
	done

BronzeMom2Text:
	text "I remember when"
	line "I was on a #MON"
	cont "adventure!"
	
	para "I'm not too old"
	line "now, I could"
	
	para "probably go and"
	line "catch some more"
	cont "no problem!"
	done
	
RedsMomText1:
	text "Hi!"

	para "BRONZE has been"
	line "away for quite"
	cont "some time."
	
	para "He does drop by"
	line "from time to time."
	
	para "But so far he has"
	line "been very busy"
	
	para "with travel and"
	line "training."
	
	para "It was nice to"
	line "meet another young"
	
	para "trainer such as"
	line "yourself!"
	done

RedsMomText2:
	text "I worry about RED"
	line "getting hurt or"

	para "sick, but he's a"
	line "boy. I'm proud"

	para "that he is doing"
	line "what he wants to"

	para "do."
	done

RedsHouse1FTVText:
	text "It's a NINTENDO"
	line "64!"
	done

RedsHouse1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 7, 8, 1, PALLET_TOWN
	warp_def 7, 9, 1, PALLET_TOWN
	warp_def 0, 11, 1, REDS_HOUSE_2F
	warp_def 7, 20, 14, PALLET_TOWN
	warp_def 7, 21, 14, PALLET_TOWN

.CoordEvents: db 0

.BGEvents: db 3
	signpost 1, 6, SIGNPOST_READ, RedsHouse1FStove
	signpost 1, 7, SIGNPOST_READ, RedsHouse1FSink
	signpost 2, 3, SIGNPOST_READ, RedsHouse1FTV

.ObjectEvents: db 3
	person_event SPRITE_REDS_MOM, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RedsMom, -1
	person_event SPRITE_COOLTRAINER_F, 3, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BronzeDaughter1, -1
	person_event SPRITE_TEACHER, 3, 19, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BronzeMom2, -1
