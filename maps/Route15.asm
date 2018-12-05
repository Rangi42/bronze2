const_value set 2
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerTeacherColette:
	trainer EVENT_BEAT_TEACHER_COLETTE, TEACHER, COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, TeacherColetteScript

TeacherColetteScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa60d
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer EVENT_BEAT_TEACHER_HILLARY, TEACHER, HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, TeacherHillaryScript

TeacherHillaryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa6ca
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer EVENT_BEAT_SCHOOLBOY_KIP, SCHOOLBOY, KIPP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, SchoolboyKippScript

SchoolboyKippScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa740
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer EVENT_BEAT_SCHOOLBOY_TOMMY, SCHOOLBOY, TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, SchoolboyTommyScript

SchoolboyTommyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa7bc
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer EVENT_BEAT_SCHOOLBOY_JOHNNY, SCHOOLBOY, JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, SchoolboyJohnnyScript

SchoolboyJohnnyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa84a
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer EVENT_BEAT_SCHOOLBOY_BILLY, SCHOOLBOY, BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, SchoolboyBillyScript

SchoolboyBillyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa8b0
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15Locked:
	jumptext Route15LockedText
	
Route15PPUp:
	itemball PP_UP

R15AcreForestSign:
	jumptext R15AcreForestSignText
	
R15AcreForestSignText:
	text "ACRE FOREST"
	done
	
Route15LockedText:
	text "It's locked."
	done
	
TeacherColetteSeenText:
	text "Are you disrupting"
	line "my students?"
	done

TeacherColetteBeatenText:
	text "Detention!"
	done

UnknownText_0x1aa60d:
	text "If you come across"
	line "my pupils, you"
	
	para "should give them"
	line "a lesson in"
	cont "battling."
	done

TeacherHillarySeenText:
	text "On sunny days, I"
	line "think that the"

	para "kids would rather"
	line "be playing in the"

	para "schoolyard than"
	line "studying in class."
	done

TeacherHillaryBeatenText:
	text "I didn't want to"
	line "lose…"
	done

UnknownText_0x1aa6ca:
	text "Studying is impor-"
	line "tant, but exercise"
	cont "is just as vital."
	done

SchoolboyKippSeenText:
	text "We're battling wild"
	line "#MON for a"
	cont "school test!"
	done

SchoolboyKippBeatenText:
	text "Augh, that was"
	line "wild."
	done

UnknownText_0x1aa740:
	text "Where did the"
	line "teacher go?"
	done

SchoolboyTommySeenText:
	text "I won't lose"
	line "this battle!"
	done

SchoolboyTommyBeatenText:
	text "Arugh, I failed!"
	done

UnknownText_0x1aa7bc:
	text "I'm really in need"
	line "of a passing"
	cont "grade."
	done

SchoolboyJohnnySeenText:
	text "Our class is so"
	line "spread out!"
	
	para "I think I can"
	line "sneak in a battle."
	done

SchoolboyJohnnyBeatenText:
	text "Totally wicked!"
	done

UnknownText_0x1aa84a:
	text "This was so"
	line "exciting!"
	done

SchoolboyBillySeenText:
	text "We get to bring"
	line "our #MON on"
	cont "field trips!"
	done

SchoolboyBillyBeatenText:
	text "Ah, darn it, man!"
	done

UnknownText_0x1aa8b0:
	text "I'm the best"
	line "in my class and"
	
	para "I still didn't"
	line "win."
	done

Route15SignText:
	text "ROUTE 11"

	para "ACRE FOREST -"
	line "CASCADE CITY"
	done

Route15_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 6, 2, 3, ROUTE_15_FUCHSIA_GATE
	warp_def 7, 2, 4, ROUTE_15_FUCHSIA_GATE
	warp_def 4, 65, 1, ROUTE13FORESTGATES
	warp_def 5, 65, 2, ROUTE13FORESTGATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 3, 63, SIGNPOST_READ, R15AcreForestSign
	signpost 5, 5, SIGNPOST_READ, Route15Sign

.ObjectEvents: db 8
	person_event SPRITE_YOUNGSTER, 8, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	person_event SPRITE_YOUNGSTER, 4, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	person_event SPRITE_YOUNGSTER, 10, 56, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	person_event SPRITE_YOUNGSTER, 0, 45, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSchoolboyBilly, -1
	person_event SPRITE_TEACHER, 17, 30, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerTeacherColette, -1
	person_event SPRITE_TEACHER, -5, 54, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	person_event SPRITE_POKE_BALL, 18, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
	person_event SPRITE_SUICUNE, 17, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route15Locked, -1
