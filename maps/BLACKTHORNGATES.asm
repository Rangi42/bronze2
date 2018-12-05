const_value set 2
	const BLACKTHORNGATES_OFFICER
	const BLACKTHORNGATES_TEACHER
	const BLACKTHORNGATES_BUENA
	const BLACKTHORNGATES_POKEFAN_M
	const BLACKTHORNGATES_POKEFAN_F
	const BLACKTHORNGATES_RIVAL
	const BLACKTHORNGATES_OFFICER2
	
BLACKTHORNGATES_MapScriptHeader::

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.Callbacks: db 0

.Trigger0:
	end
	
.Trigger1:
	end

.Scripts:

BlackAngryFatherScript
	faceplayer
	opentext
	writetext blackthorngatepersontext_1
	waitbutton
	spriteface BLACKTHORNGATES_POKEFAN_M, UP
	closetext
	end

BlackLostKidsTrigger1
	dotrigger $1
	spriteface PLAYER, UP
	applymovement BLACKTHORNGATES_TEACHER, BlackMotherMovement
	opentext
	writetext BlackMotherText1
	waitbutton
	closetext
	opentext
	writetext BlackOfficerReplyText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, BLACKTHORNGATES_POKEFAN_M, 15
	opentext
	writetext BlackFatherText1
	waitbutton
	closetext
	applymovement BLACKTHORNGATES_POKEFAN_M, BlackFatherMovement1
	spriteface PLAYER, RIGHT
	spriteface BLACKTHORNGATES_POKEFAN_M, LEFT
	opentext
	writetext BlackFatherText2
	waitbutton
	closetext
	applymovement BLACKTHORNGATES_POKEFAN_M, BlackFatherMovement2
	opentext
	writetext BlackOfficerReplyText2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, BLACKTHORNGATES_POKEFAN_M, 15
	opentext
	writetext BlackFatherText3
	waitbutton
	closetext
	applymovement BLACKTHORNGATES_POKEFAN_M, BlackFatherLeaveMovement1
	follow BLACKTHORNGATES_POKEFAN_M, BLACKTHORNGATES_POKEFAN_F
	applymovement BLACKTHORNGATES_POKEFAN_M, BlackFatherLeaveMovement2
	playsound SFX_ENTER_DOOR
	wait 10
	spriteface BLACKTHORNGATES_TEACHER, RIGHT
	spriteface BLACKTHORNGATES_BUENA, LEFT
	opentext
	writetext BlackMotherText2
	waitbutton
	closetext
	follow BLACKTHORNGATES_BUENA, BLACKTHORNGATES_TEACHER
	applymovement BLACKTHORNGATES_BUENA, BlackBuenaLeaveMovement
	playsound SFX_ENTER_DOOR
	wait 10
	spriteface PLAYER, RIGHT
	playsound SFX_ENTER_DOOR
	waitsfx
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement BLACKTHORNGATES_RIVAL, BlackRivalMovement1
	opentext
	writetext BlackRivalText1
	waitbutton
	closetext
	applymovement BLACKTHORNGATES_RIVAL, BlackRivalLeaveMovement
	disappear BLACKTHORNGATES_RIVAL
;	playsound SFX_ENTER_DOOR
;	waitsfx
	special RestartMapMusic
	wait 10
	domaptrigger NATIONAL_PARK, $2
	setevent EVENT_TOGEPI_HATCHED
	disappear BLACKTHORNGATES_TEACHER
	disappear BLACKTHORNGATES_BUENA
	disappear BLACKTHORNGATES_POKEFAN_M
	disappear BLACKTHORNGATES_POKEFAN_F
	end
	
BlackLostKidsTrigger2
	dotrigger $1
	jumptext blackthorngateofficertext_1	
	end

blackthorngateperson_1:
	jumptextfaceplayer blackthorngatepersontext_1
	
blackthorngateofficer_1:
	jumptextfaceplayer blackthorngateofficertext_1
	
blackthorngateofficer_2:
	jumptextfaceplayer blackthorngateofficertext_2

BlackGateUndergroundSign
	jumptext BlackGateUndergroundSignText
	
BlackMotherMovement:
	step_up
	step_end

BlackFatherMovement1:
	step_down
	step_end
	
BlackFatherMovement2:
	step_up
	step_end
	
BlackRivalMovement1:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
BlackFatherLeaveMovement1:
	step_down
	step_right
	step_end
	
BlackFatherLeaveMovement2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
BlackBuenaLeaveMovement:
	step_right
	step_right
	step_right
	step_end
	
BlackRivalLeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
.Text:

BlackRivalText1:
	text "Oh look, it's"
	line "<PLAYER>."
	
	para "I'm kinda impressed"
	line "you made it all"
	
	para "the way to"
	line "HARDROOT TOWN"
	cont "all on your own."
	
	para "You must have"
	line "gotten much"
	cont "stronger."
	
	para "Hey, tell you"
	line "what."

	para "If you feel like"
	line "joining our little"
	
	para "club, feel free to"
	line "drop by the PARK."
	
	para "It's my shift for"
	line "guard duty, so"
	
	para "come on by if you"
	line "like."	
	done

BlackMotherText1:
	text "MOTHER: Our chil-"
	line "dren are missing,"
	
	para "and you can't do"
	line "anything about it?"
	done
	
BlackMotherText2:
	text "MOTHER: We're"
	line "leaving too!"
	done
	
BlackOfficerReplyText1:
	text "OFFICER: Ladies,"
	line "please calm down"
	
	para "we are doing our"
	line "best to find your"
	cont "missing children."
	
	para "Rest assured, we"
	line "have our top men"
	cont "on the job."
	done
	
BlackOfficerReplyText2:
	text "OFFICER: Look,"
	line "we know you're"
	
	para "all really upset,"
	line "but we must"
	
	para "remain calm in"
	line "moments like"
	cont "these."
	
	para "We have our top"
	line "men-"
	done
	
BlackFatherText1:
	text "FATHER: We highly"
	line "doubt that!"
	
	para "You have no leads"
	line "and this is a"
	cont "serious problem!"
	done
	
BlackFatherText2
	text "Heck, I bet this"
	line "random kid here"
	
	para "could do a better"
	line "job than you"
	cont "officers!"
	done
	
BlackFatherText3
	text "FATHER: Oh I've"
	line "had enough of"
	cont "this!"
	done
	
blackthorngatepersontext_1:
	text "This is just"
	line "unacceptable!"
	
	para "I am so plum"
	line "mad right now."
	done
	
blackthorngateofficertext_1:
	text "Don't even doubt"
	line "it, kid."
	
	para "My job is not"
	line "easy."
	done
	
blackthorngateofficertext_2:
	text "That stairway"
	line "behind you can"
	
	para "take you all the"	
	line "way to the PARK."
	done

BlackGateUndergroundSignText:
	text "UNDERGROUND PATH"
	line "to FELONWOOD PARK"
	done
	
BLACKTHORNGATES_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 4, 0, 4, ROUTE_33
	warp_def 5, 0, 5, ROUTE_33
	warp_def 4, 9, 9, BLACKTHORN_CITY
	warp_def 5, 9, 7, BLACKTHORN_CITY
	warp_def 10, 7, 2, BLACKTHORNUNDERGROUND

.CoordEvents: db 2
	xy_trigger 0, 5, 2, 0, BlackLostKidsTrigger1, 0, 0
	xy_trigger 0, -2, 2, 0, BlackLostKidsTrigger2, 0, 0

.BGEvents: db 1
	signpost 10, 8, SIGNPOST_READ, BlackGateUndergroundSign

.ObjectEvents: db 7
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, blackthorngateofficer_1, -1
	person_event SPRITE_TEACHER, 5, 5, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOGEPI_HATCHED
	person_event SPRITE_BUENA, 4, 6, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOGEPI_HATCHED
	person_event SPRITE_POKEFAN_M, 4, 3, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BlackAngryFatherScript, EVENT_TOGEPI_HATCHED
	person_event SPRITE_POKEFAN_F, 4, 4, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOGEPI_HATCHED
	person_event SPRITE_SILVER, 5, 8, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOGEPI_HATCHED
	person_event SPRITE_OFFICER, 9, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, blackthorngateofficer_2, -1
