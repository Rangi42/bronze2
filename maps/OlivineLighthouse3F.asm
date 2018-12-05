const_value set 2
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperTheo:
	trainer EVENT_BEAT_BIRD_KEEPER_THEO, BIRD_KEEPER, THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b2df
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer EVENT_BEAT_GENTLEMAN_PRESTON, SUPER_NERD, LARS, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, GentlemanPrestonScript

GentlemanPrestonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b457
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer EVENT_BEAT_SAILOR_TERRELL, SUPER_NERD, MAURICE, SailorTerrellSeenText, SailorTerrellBeatenText, 0, SailorTerrellScript

SailorTerrellScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b384
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

Bird_keeperTheoSeenText:
	text "Why are you here?"
	line "Are you just going"

	para "to gawk? I suggest"
	line "that you leave!"
	done

Bird_keeperTheoBeatenText:
	text "You really are"
	line "concerned…"
	done

UnknownText_0x5b2df:
	text "How the heck do"
	line "you go up?"

	para "I want to visit"
	line "the sick #MON,"

	para "but I can't get up"
	line "there…"
	done

SailorTerrellSeenText:
	text "So you seek the"
	line "truth?"
	done

SailorTerrellBeatenText:
	text "The elders won't"
	line "like this."
	done

UnknownText_0x5b384:
	text "I believe there"
	line "is a 14.6 percent"
	
	para "chance of you"
	line "succeeding."
	done

GentlemanPrestonSeenText:
	text "#MON battling"
	line "is my speciality."
	
	para "How can you top"
	line "that?"
	done

GentlemanPrestonBeatenText:
	text "Arugh! I need"
	line "to train more."
	done

UnknownText_0x5b457:
	text "Do you even know"
	line "know true power?"
	done

OlivineLighthouse3F_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 9, 15, 1, OLIVINE_LIGHTHOUSE_4F
	warp_def 15, 3, 2, OLIVINE_LIGHTHOUSE_2F
	warp_def 5, 9, 4, OLIVINE_LIGHTHOUSE_4F
	warp_def 13, 14, 5, OLIVINE_LIGHTHOUSE_2F
	warp_def 13, 15, 6, OLIVINE_LIGHTHOUSE_2F
	warp_def 15, 14, 5, OLIVINE_LIGHTHOUSE_4F
	warp_def 15, 15, 6, OLIVINE_LIGHTHOUSE_4F
	warp_def 3, 8, 7, OLIVINE_LIGHTHOUSE_4F
	warp_def 3, 9, 8, OLIVINE_LIGHTHOUSE_4F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_SUPER_NERD, 13, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSailorTerrell, -1
	person_event SPRITE_SUPER_NERD, 8, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerGentlemanPreston, -1
	person_event SPRITE_YOUNGSTER, 0, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBird_keeperTheo, -1
	person_event SPRITE_POKE_BALL, 2, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
