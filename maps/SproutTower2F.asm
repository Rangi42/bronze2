const_value set 2
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSageNico:
	trainer EVENT_BEAT_SAGE_NICO, BLACKBELT_T, KEIJI, SageNicoSeenText, SageNicoBeatenText, 0, SageNicoScript

SageNicoScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1847ff
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer EVENT_BEAT_SAGE_EDMOND, BLACKBELT_T, YANI, SageEdmondSeenText, SageEdmondBeatenText, 0, SageEdmondScript

SageEdmondScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18486f
	waitbutton
	closetext
	end

MapSproutTower2FSignpost0Script:
	jumptext UnknownText_0x1848c8

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SageNicoSeenText:
	text "People come from"
	line "all over JANTO for"
	
	para "the finest cuts of"
	line "meat!"
	done

SageNicoBeatenText:
	text "You are very"
	line "talented."
	done

UnknownText_0x1847ff:
	text "Go fourth, young"
	line "one."
	
	para "Can you make it to"
	line "the top?"
	done

SageEdmondSeenText:
	text "The freshest"
	line "ingredients."
	
	para "The finest"
	line "quality."
	done

SageEdmondBeatenText:
	text "You've trained"
	line "well."
	done

UnknownText_0x18486f:
	text "The head chef is"
	line "on the top floor."
	
	para "If you can reach"
	line "him, you might get"
	cont "a reward."
	done

UnknownText_0x1848c8:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower2F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 15, 18, 3, SPROUT_TOWER_1F
	warp_def 15, 19, 4, SPROUT_TOWER_1F
	warp_def 1, 0, 5, SPROUT_TOWER_1F
	warp_def 15, 4, 1, SPROUT_TOWER_3F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 15, 12, SIGNPOST_READ, MapSproutTower2FSignpost0Script

.ObjectEvents: db 3
	person_event SPRITE_BLACK_BELT, 8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerSageNico, -1
	person_event SPRITE_BLACK_BELT, 15, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 5, TrainerSageEdmond, -1
	person_event SPRITE_POKE_BALL, 1, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
