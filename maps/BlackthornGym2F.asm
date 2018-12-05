const_value set 2
	const BLACKTHORNGYM2F_COOLTRAINER_M
	const BLACKTHORNGYM2F_COOLTRAINER_F

BlackthornGym2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

	; callbacks
;	dbw MAPCALLBACK_CMDQUEUE, .Boulders

;.Boulders:
;	writecmdqueue .BoulderCmdQueue
;	return
;
;.BoulderCmdQueue:
;	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
;	dw 0 ; filler

;.BoulderTable:
;	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Disappear4
;	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Disappear5
;	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Disappear6
;	db -1 ; end

;.Disappear4:
;	disappear BLACKTHORNGYM2F_BOULDER1
;	jump .Fall
;
;.Disappear5:
;	disappear BLACKTHORNGYM2F_BOULDER2
;	jump .Fall

;.Disappear6:
;	disappear BLACKTHORNGYM2F_BOULDER3
;	jump .Fall

;.Fall:
;	pause 30
;	scall .FX
;	opentext
;	writetext BlackthornGym2FBoulderFellText
;	waitbutton
;	closetext
;	end

;.FX:
;	playsound SFX_STRENGTH
;	earthquake 80
;	end


BlackthornGymBoulder:
	jumpstd strengthboulder

TrainerCooltrainermCody:
	trainer EVENT_BEAT_COOLTRAINERM_CODY, BLACKBELT_T, EUSKE, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, CooltrainermCodyScript

CooltrainermCodyScript:
	end_if_just_battled
	opentext
	writetext CooltrainermCodyAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfFran:
	trainer EVENT_BEAT_COOLTRAINERF_FRAN, BLACKBELT_T, ENDO, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, CooltrainerfFranScript

CooltrainerfFranScript:
	end_if_just_battled
	opentext
	writetext CooltrainerfFranAfterText
	waitbutton
	closetext
	end

CooltrainermCodySeenText:
	text "I can shatter"
	line "anything into"
	cont "oblivion!"
	done

CooltrainermCodyBeatenText:
	text "Oh, my poor heart"
	line "is shattered!"
	done

CooltrainermCodyAfterText:
	text "HARKEN won't be"
	line "happy about my"
	cont "loss at all."
	done

CooltrainerfFranSeenText:
	text "Are you the"
	line "<PLAYER>?"
	
	para "Pfft. I can take"
	line "you!"
	done

CooltrainerfFranBeatenText:
	text "I am humbled."
	done

CooltrainerfFranAfterText:
	text "Please, go on."
	done

BlackthornGym2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

BlackthornGym2F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 3, 8, 3, BLACKTHORN_GYM_1F
	warp_def 18, 11, 4, BLACKTHORN_GYM_1F
	warp_def 18, 12, 5, BLACKTHORN_GYM_1F
	warp_def 5, 13, 4, BLACKTHORN_GYM_1F
	warp_def 18, 14, 7, BLACKTHORN_GYM_1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_BLACK_BELT, 4, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	person_event SPRITE_BLACK_BELT, 9, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerCooltrainerfFran, -1
