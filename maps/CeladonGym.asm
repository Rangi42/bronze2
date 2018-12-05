const_value set 2
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2
	const CELADONGYM_TEMP_LEADER

CeladonGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ErikaScript_0x72a6a:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue UnknownScript_0x72aae ;CeladonFightDone
	writetext UnknownText_0x72b28
	waitbutton
	closetext
JumpIntoGymBattle
	winlosstext UnknownText_0x72c3e, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext UnknownText_0x72c96
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
CeladonFightDone:
;	checkevent EVENT_BEAT_ERIKA
;	iftrue UnknownScript_0x72aae
	writetext UnknownText_0x72cb0
	waitbutton
	closetext
	end
;	buttonsound
;	verbosegiveitem TM_GIGA_DRAIN
;	iffalse UnknownScript_0x72aae
;	setevent EVENT_GOT_TM19_GIGA_DRAIN
UnknownScript_0x72aae:
	writetext UnknownText_0x72d8f
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer EVENT_BEAT_LASS_MICHELLE, COOLTRAINERM, DEX, LassMichelleSeenText, LassMichelleBeatenText, 0, LassMichelleScript

LassMichelleScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72e30
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer EVENT_BEAT_PICNICKER_TANYA, COOLTRAINERM, JUNG, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, PicnickerTanyaScript

PicnickerTanyaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72e8e
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer EVENT_BEAT_BEAUTY_JULIA, COOLTRAINERM, EVANS, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, CeladonBadgeGiver

CeladonBadgeGiver:
;	end_if_just_battled
	opentext
	checkevent EVENT_ALREADY_HAD_FIGHT_LEADER
	iftrue YouHaveFought
	checkevent EVENT_TALKED_TO_CELADON_LEADER
	iftrue CeladonBadgeGiveFakeOut
	checkevent EVENT_CELADON_FAKE_LEADER_TALKED_TO
	iftrue CeladonBadgeGiverTalkedToOnce
	writetext LeaderMissing
;	buttonsound
;	writetext UnknownText_0x72f01
	waitbutton
	setevent EVENT_CELADON_FAKE_LEADER_TALKED_TO
	closetext
	end

YouHaveFought:
	writetext CeladonHello
	waitbutton
	closetext
	end
	
CeladonBadgeGiverTalkedToOnce:
	writetext CeladonBadgeGiverReminder
	waitbutton
	closetext
	end

CeladonBadgeGiveFakeOut:
	writetext CeladonBadgeGiveFakeOutText
	waitbutton
	closetext
	opentext
	writetext CeladonStop
	waitbutton
	closetext
	clearevent EVENT_CELADON_LEADER_OFF
	checkcode VAR_FACING
	appear CELADONGYM_TEMP_LEADER
	setevent EVENT_CELADON_TEMPORARY_LEADER
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement CELADONGYM_TEMP_LEADER, gym_upface_movement
	spriteface PLAYER, RIGHT
	opentext
	writetext LeaderYouHaveToBattleText
	waitbutton
	closetext
	setevent EVENT_ALREADY_HAD_FIGHT_LEADER
	setevent EVENT_LEADER_IN_HOUSE_OFF
	jump JumpIntoGymBattle
	
TrainerTwinsJoandzoe1:
	trainer EVENT_BEAT_TWINS_JO_AND_ZOE, COOLTRAINERF, ROBINA, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText, 0, TwinsJoandzoe1Script

TwinsJoandzoe1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72f70
	waitbutton
	closetext
	end

TrainerTwinsJoandzoe2:
	trainer EVENT_BEAT_TWINS_JO_AND_ZOE, TWINS, JOANDZOE2, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText, 0, TwinsJoandzoe2Script

TwinsJoandzoe2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72fc0
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext ERIKA, 1, $1
	jumpstd gymstatue2

CeladonLeadedTalkedSkip:
	setevent EVENT_TALKED_TO_CELADON_LEADER
	end

ThisGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_ERIKA
	iftrue .ThisGymGuyWinScript
	opentext
	writetext ThisGymGuyText
	waitbutton
	closetext
	end

.ThisGymGuyWinScript:
	opentext
	writetext ThisGymGuyWinText
	waitbutton
	closetext
	end
	
gym_upface_movement:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end
	
;gym_leftface_movement:
;	step_up
;	step_up
;	step_up
;	step_up
;	step_up
;	turn_head_up
;	step_end
	
;gym_rightface_movement:
;	step_up
;	step_up
;	step_up
;	step_up
;	step_up
;	step_left
;	step_left
;	turn_head_up
;	step_end
	
CeladonStop:
	text "DISTANT VOICE:"
	line "STOP!"
	done

ThisGymGuyText:
	text "Hey CHAMP!"
	
	para "This GYM is all"
	line "about normal-type"
	cont "#MON."
	
	para "Give it your all!"
	done
	
ThisGymGuyWinText
	text "What a fight!"
	
	para "No wonder you're"
	line "the CHAMP!"
	done
	
LeaderMissing:
	text "Hey uh, I know"
	line "It's pretty late"
	
	para "to tell you, but"
	line "the leader isn't"
	cont "here."
	
	para "He actually moved"
	line "out of the country"
	
	para "and the new guy--"
	line "CALVIN, kinda got"
	cont "cold feet."
	
	para "Said being chosen"
	line "to be a leader was"
	cont "too much pressure."
	
	para "He's back at his"
	line "home I assume."
	
	para "Perhaps you could"
	line "convince him to"
	cont "come back."
	done
	
CeladonBadgeGiverReminder:
	text "The leader is"
	line "hiding out at"
	cont "home."
	
	para "Go see if you can"
	line "get them to come"
	cont "back."
	done
	
CeladonBadgeGiveFakeOutText:
	text "You talked to the"
	line "leader?"
	
	para "Oh, I guess they"
	line "aren't coming back."
	
	para "Well, I guess I'll"
	line "give you this"
	
	para "spare BADGE I"
	line "have."
	
	para "Sorry about this"
	line "inconvenience."
	done

LeaderYouHaveToBattleText:
	text "CALVIN: This isn't"
	line "right."
	
	para "I had a think"
	line "about this."
	
	para "And I can't just"
	line "give a BADGE"
	cont "away."
	
	para "I can't have that"
	line "resting on my"
	cont "mind."
	
	para "I will battle you."
	
	para "It is the only"
	line "right way to earn"
	cont "a BADGE."
	done

CeladonHello:
	text "Best of luck to"
	line "you!"
	done
	
UnknownText_0x72b28:
	text "CALVIN: I had a"
	line "think about this."
	
	para "And I can't just"
	line "give a BADGE"
	cont "away."
	
	para "I can't have that"
	line "resting on my"
	cont "mind."
	
	para "I will battle you."
	
	para "It is the only"
	line "right way to earn"
	cont "a BADGE."
	done

UnknownText_0x72c3e:
	text "I'm really proud"
	line "of this fight."

	para "You are very"
	line "strong."

	para "I shall give to"
	line "you…"
	cont "The BLANKBADGE!"
	done

UnknownText_0x72c96:
	text "<PLAYER> received"
	line "BLANKBADGE."
	done

UnknownText_0x72cb0:
	text "CALVIN: That was"
	line "some match."
	
	para "I think I'll be"
	line "a fine GYM LEADER."
	
	para "I loved watching"
	line "you prove yourself"
	cont "to me."
	
	para "Hopefully I don't"
	line "lose all my future"
	cont "battles, though."
	
	para "Have a good one,"
	line "<PLAYER>!"
	done

UnknownText_0x72d8f:
	text "CALVIN: I am going"
	line "to be the best GYM"
	cont "LEADER I can be."
	
	para "See you again,"
	line "sometime."
	done

LassMichelleSeenText:
	text "Witness as I"
	line "beat this trainer!"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	line "No good!"
	done

UnknownText_0x72e30:
	text "Dang, you got"
	line "me good."
	done

PicnickerTanyaSeenText:
	text "Aha!"
	
	para "People fall for"
	line "this route every"
	cont "time!"
	done

PicnickerTanyaBeatenText:
	text "That's it!"
	done

UnknownText_0x72e8e:
	text "This path leads"
	line "nowhere."
	
	para "Very funny trick"
	line "don't you think?"
	done

BeautyJuliaSeenText:
	text "Better look out"
	line "dude!"
	
	para "I'm comin' at ya!"
	done

BeautyJuliaBeatenText:
	text "How disappointing!"
	done

UnknownText_0x72f01:
	text "How do I go about"
	line "becoming ladylike"
	cont "like ERIKA?"
	done

TwinsJoandzoe1SeenText:
	text "Let's get"
	line "started!"
	done

TwinsJoandzoe1BeatenText:
	text "My #MON lost!"
	done

UnknownText_0x72f70:
	text "Don't look so"
	line "happy."
	done

TwinsJoandzoe2SeenText:
	text "We're going to"
	line "protect ERIKA!"
	done

TwinsJoandzoe2BeatenText:
	text "We couldn't win…"
	done

UnknownText_0x72fc0:
	text "ERIKA is much,"
	line "much stronger!"
	done

CeladonGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 17, 4, 8, CELADON_CITY
	warp_def 17, 5, 8, CELADON_CITY

.CoordEvents: db 0

.BGEvents: db 3
	signpost 15, 3, SIGNPOST_READ, CeladonGymStatue
	signpost 15, 6, SIGNPOST_READ, CeladonGymStatue
	signpost 0, 5, SIGNPOST_READ, CeladonLeadedTalkedSkip

.ObjectEvents: db 8
	person_event SPRITE_ERIKA, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ErikaScript_0x72a6a, EVENT_CELADON_LEADER_OFF
	person_event SPRITE_COOLTRAINER_M, 11, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassMichelle, -1
	person_event SPRITE_COOLTRAINER_M, 11, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerPicnickerTanya, -1
	person_event SPRITE_COOLTRAINER_M, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBeautyJulia, -1
	person_event SPRITE_COOLTRAINER_F, 8, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerTwinsJoandzoe1, -1
	person_event SPRITE_COOLTRAINER_F, -5, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsJoandzoe2, -1
	person_event SPRITE_ERIKA, 8, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ErikaScript_0x72a6a, EVENT_CELADON_TEMPORARY_LEADER
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ThisGymGuyScript, -1
