const_value set 2
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSwimmerfKaylee:
	trainer EVENT_BEAT_SWIMMERF_KAYLEE, SWIMMERF, KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, SwimmerfKayleeScript

SwimmerfKayleeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6c7f
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer EVENT_BEAT_SWIMMERF_SUSIE, SWIMMERF, SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, SwimmerfSusieScript

SwimmerfSusieScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6d11
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer EVENT_BEAT_SWIMMERF_DENISE, SWIMMERF, DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, SwimmerfDeniseScript

SwimmerfDeniseScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6d79
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer EVENT_BEAT_SWIMMERF_KARA, SWIMMERF, KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, SwimmerfKaraScript

SwimmerfKaraScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6e58
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer EVENT_BEAT_SWIMMERF_WENDY, SWIMMERF, WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, SwimmerfWendyScript

SwimmerfWendyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6ec2
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer EVENT_BEAT_SWIMMERM_CHARLIE, SWIMMERM, CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, SwimmermCharlieScript

SwimmermCharlieScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a696e
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer EVENT_BEAT_SWIMMERM_GEORGE, SWIMMERM, GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, SwimmermGeorgeScript

SwimmermGeorgeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a69d4
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer EVENT_BEAT_SWIMMERM_BERKE, SWIMMERM, BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, SwimmermBerkeScript

SwimmermBerkeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6aa4
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer EVENT_BEAT_SWIMMERM_KIRK, SWIMMERM, KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, SwimmermKirkScript

SwimmermKirkScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6b6c
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer EVENT_BEAT_SWIMMERM_MATHEW, SWIMMERM, MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, SwimmermMathewScript

SwimmermMathewScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6bed
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	dwb EVENT_ROUTE_41_HIDDEN_MAX_ETHER, MAX_ETHER

SwimmermCharlieSeenText:
	text "The water's warm"
	line "here. I'm loose"
	cont "and limber."

	para "Sure, I'll take"
	line "you on!"
	done

SwimmermCharlieBeatenText:
	text "Yikes! I've got"
	line "prune skin!"
	done

UnknownText_0x1a696e:
	text "Isn't it relaxing"
	line "just floating like"
	cont "this?"
	done

SwimmermGeorgeSeenText:
	text "I'm a bit tired."
	line "If I win, lend me"
	cont "your #MON."
	done

SwimmermGeorgeBeatenText:
	text "Pant, pant…"
	done

UnknownText_0x1a69d4:
	text "It's so far to"
	line "CIANWOOD."

	para "But it's no easy"
	line "return trip to"
	cont "OLIVINE either."

	para "What should I do?"
	done

SwimmermBerkeSeenText:
	text "See those islands"
	line "that are blocked"
	cont "by whirlpools?"

	para "There just has to"
	line "be a secret!"
	done

SwimmermBerkeBeatenText:
	text "What's the secret"
	line "to your strength?"
	done

UnknownText_0x1a6aa4:
	text "It was a dark and"
	line "stormy night…"

	para "I saw this giant"
	line "#MON flying"
	cont "from the islands."

	para "It was scattering"
	line "feathers from its"
	cont "silver wings."
	done

SwimmermKirkSeenText:
	text "The waves are wild"
	line "here."

	para "They tire you out"
	line "while you swim."
	done

SwimmermKirkBeatenText:
	text "I'm beat!"
	done

UnknownText_0x1a6b6c:
	text "The currents keep"
	line "me from reaching"
	cont "that island."
	done

SwimmermMathewSeenText:
	text "Are you seeking"
	line "the secrets of"
	cont "WHIRL ISLANDS?"
	done

SwimmermMathewBeatenText:
	text "Ooh, you've got"
	line "great endurance!"
	done

UnknownText_0x1a6bed:
	text "A secret about"
	line "WHIRL ISLANDS…"

	para "It's pitch-black"
	line "inside!"
	done

SwimmerfKayleeSeenText:
	text "Do you think I"
	line "look cute in my"
	cont "bathing suit?"
	done

SwimmerfKayleeBeatenText:
	text "Hehe!"
	done

UnknownText_0x1a6c7f:
	text "I don't mind"
	line "losing."
	
	para "I just need to"
	line "look good!"
	done

SwimmerfSusieSeenText:
	text "Do you always"
	line "need a #MON to"
	
	para "travel across"
	line "water?"
	done

SwimmerfSusieBeatenText:
	text "I'm sunk!"
	done

UnknownText_0x1a6d11:
	text "If you need swim-"
	line "ming lessons, give"
	cont "me a call!"
	done

SwimmerfDeniseSeenText:
	text "I just keep"
	line "swimming until"
	
	para "I'm strong and"
	line "toned!"
	done

SwimmerfDeniseBeatenText:
	text "Ahhh!"
	done

UnknownText_0x1a6d79:
	text "I should let my"
	line "#MON out to"
	cont "swim with me."
	
	para "We can all keep"
	line "fit together!"
	done

SwimmerfKaraSeenText:
	text "Eeek! Did you"
	line "just touch my"
	cont "leg?"
	done

SwimmerfKaraBeatenText:
	text "Oh! It was a"
	line "MAGIKARP!"
	done

UnknownText_0x1a6e58:
	text "You never know"
	line "what kind of #-"
	
	para "MON are gonna"
	line "sneak up on you in"
	cont "the water."
	done

SwimmerfWendySeenText:
	text "Traveling by sea…"
	
	para "It makes me wish"
	line "I was an old timey"
	cont "pirate!"
	done

SwimmerfWendyBeatenText:
	text "I'd make an awful"
	line "pirate!"
	done

UnknownText_0x1a6ec2:
	text "I'm traveling to"
	line "MAUVEWOOD TOWN."
	
	para "It's a wonderful"
	line "place!"
	done

Route41_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 15, 35, 1, WHIRL_ISLAND_NW
	warp_def 15, 36, 1, WHIRL_ISLAND_NE
	warp_def 16, 35, 1, WHIRL_ISLAND_SW
	warp_def 15, 37, 1, WHIRL_ISLAND_SE
	warp_def 1, 11, 7, ROUTE33_GATES

.CoordEvents: db 0

.BGEvents: db 1
	signpost 10, 24, SIGNPOST_ITEM, Route41HiddenMaxEther

.ObjectEvents: db 10
	person_event SPRITE_OLIVINE_RIVAL, 23, 32, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	person_event SPRITE_OLIVINE_RIVAL, 24, 32, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	person_event SPRITE_OLIVINE_RIVAL, 25, 32, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	person_event SPRITE_OLIVINE_RIVAL, 26, 32, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	person_event SPRITE_OLIVINE_RIVAL, 27, 32, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	person_event SPRITE_SWIMMER_GIRL, 24, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerSwimmerfKaylee, -1
	person_event SPRITE_SWIMMER_GIRL, 15, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	person_event SPRITE_SWIMMER_GIRL, 30, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerSwimmerfDenise, -1
	person_event SPRITE_SWIMMER_GIRL, 8, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	person_event SPRITE_SWIMMER_GIRL, 37, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
