const_value set 2
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS
	const OLIVINELIGHTHOUSE4F_WINGUY

OlivineLighthouse4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerLassConnie:
	trainer EVENT_BEAT_LASS_CONNIE, SUPER_NERD, POWELL, LassConnie1SeenText, LassConnie1BeatenText, 0, LassConnie1Script

LassConnie1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b63c
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer EVENT_BEAT_SAILOR_KENT, SUPER_NERD, EDD, SailorKentSeenText, SailorKentBeatenText, 0, SailorKentScript

SailorKentScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b584
	waitbutton
	closetext
	end

LightYouWinGuy:
	faceplayer
	opentext
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .ShortQuestion
	writetext LightYouWinGuyText1
	yesorno
	iffalse .Refuse
	checkitem SODA_POP
	iffalse .NoSoda
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	writetext LightYouWinGuyText2
	waitbutton
	closetext
	jump .GuyRunsAway
	
.Refuse
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	writetext LightYouWinGuyRefuseText
	waitbutton
	closetext
	end

.NoSoda
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	writetext LightYouWinGuyNoSodaText
	waitbutton 
	closetext
	end

.ShortQuestion
	writetext LightYouWinGuyText12
	yesorno
	iffalse .Refuse
	checkitem SODA_POP
	iffalse .NoSoda
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	writetext LightYouWinGuyText2
	takeitem SODA_POP
	waitbutton
	closetext
	jump .GuyRunsAway
	
.GuyRunsAway
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	checkcode VAR_FACING
	if_equal DOWN, .RunDown
	if_equal UP, .RunLeft
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunRight1
	playsound SFX_TACKLE
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunRight2
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunRight3
	disappear OLIVINELIGHTHOUSE4F_WINGUY
	end
	
.RunDown
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunDown1
	playsound SFX_TACKLE
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunDown2
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunDown3
	disappear OLIVINELIGHTHOUSE4F_WINGUY
	end

.RunLeft
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunLeft1
	playsound SFX_TACKLE
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunLeft2
	applymovement OLIVINELIGHTHOUSE4F_WINGUY, MovementRunLeft3
	disappear OLIVINELIGHTHOUSE4F_WINGUY
	end
	
LightYouWinGuyText1:
	text "Well done!"
	
	para "You passed all"
	line "three tests of"
	cont "strength."
	
	para "You have truly"
	line "earned entrance"
	
	para "to the MAUVEWOOD"
	line "CITY GYM!"
	
	para "I will now tell"
	line "you the secret."
	
	para "Oh, but first do"
	line "you have another"
	
	para "SODA POP for me?"
	line "I'm kinda thirsty."
	done
	
LightYouWinGuyText12:
	text "Do you have a"
	line "SODA POP for me?"
	done
	
LightYouWinGuyText2:
	text "Ah!"
	
	para "…Glug glug…"
	
	para "…Glug glug…"

	para "Oh, by the way--"
	line "I don't have"
	
	para "anything to do"
	line "with the GYM."
	
	para "This is a SUPER"
	line "NERD CLUBHOUSE."
	
	para "The GYM is open."
	line "The leader was"
	cont "just out."
	
	para "I just wanted"
	line "someone to buy me"
	cont "some drinks."
	
	para "Funny right?"
	line "Haha!"
	done

LightYouWinGuyNoSodaText:
	text "You don't have"
	line "any SODA POP."
	
	para "Come back when"
	line "you've brought me"
	cont "a SODA POP."
	done

LightYouWinGuyRefuseText:
	text "Well I'll only"
	line "tell you once"
	cont "I've had a drink."
	done
	
	
SailorKentSeenText:
	text "I'm no nerd."
	
	para "I'm a SUPER NERD!"
	done

SailorKentBeatenText:
	text "I'm super upset."
	done

UnknownText_0x5b584:
	text "I don't want to"
	line "talk about it."
	done

LassConnie1SeenText:
	text "Well the good news"
	line "is, I'm the last"
	
	para "guy between you"
	line "and the GYM."
	done

LassConnie1BeatenText:
	text "Arrugh!"
	line "Taken down."
	done

UnknownText_0x5b63c:
	text "I'm a sucker!"
	para "Or am I?"
	done

MovementRunRight1
	big_step_up
	step_end
	
MovementRunRight2
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

MovementRunRight3
	big_step_left
	big_step_left
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
MovementRunLeft1
	big_step_right
	step_end
	
MovementRunLeft2
	fix_facing
	jump_step_left
	remove_fixed_facing
	step_end

MovementRunLeft3
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementRunDown1
	big_step_down
	big_step_down
	step_end
	
MovementRunDown2
	fix_facing
	jump_step_up
	remove_fixed_facing
	step_end

MovementRunDown3
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
	
OlivineLighthouse4F_MapEventHeader:: db 0, 0

.Warps: db 10
	warp_def 9, 15, 1, OLIVINE_LIGHTHOUSE_3F
	warp_def 5, 3, 2, OLIVINE_LIGHTHOUSE_5F
	warp_def 5, 11, 3, OLIVINE_LIGHTHOUSE_5F
	warp_def 5, 9, 3, OLIVINE_LIGHTHOUSE_3F
	warp_def 15, 14, 6, OLIVINE_LIGHTHOUSE_3F
	warp_def 15, 15, 7, OLIVINE_LIGHTHOUSE_3F
	warp_def 3, 8, 8, OLIVINE_LIGHTHOUSE_3F
	warp_def 3, 9, 9, OLIVINE_LIGHTHOUSE_3F
	warp_def 13, 14, 4, OLIVINE_LIGHTHOUSE_5F
	warp_def 13, 15, 5, OLIVINE_LIGHTHOUSE_5F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_SUPER_NERD, 13, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSailorKent, -1
	person_event SPRITE_SUPER_NERD, 13, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassConnie, -1
	person_event SPRITE_SUPER_NERD, 9, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LightYouWinGuy, EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
