const_value set 2
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_GROWLITHE

PewterNidoranSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SuperNerdScript_0x1a2807:
	faceplayer
	opentext
	checkevent EVENT_SECRET_SWITCH_LADY_EVENT_OVER
	iftrue JunctionSecretDone
	checkevent EVENT_SECRET_SWITCH1
	iftrue SecretSwitchItemTree
	checkevent EVENT_SECRET_SWITCH_LADY_TALKED_TO
	iftrue JunctionSwitchReminder
	writetext SecretSwitchLadyText1
	waitbutton
	setevent EVENT_SECRET_SWITCH_LADY_TALKED_TO
	closetext
	end

JunctionSwitchReminder:
	writetext SwitchEventReminderText
	waitbutton
	closetext
	end

SecretSwitchItemTree
	checkevent EVENT_SECRET_SWITCH1
	iffalse JunctionSwitchReminder
	checkevent EVENT_SECRET_SWITCH2
	iffalse JunctionSwitchReminder
	checkevent EVENT_SECRET_SWITCH3
	iffalse JunctionSwitchReminder
	checkevent EVENT_SECRET_SWITCH4
	iftrue .YouWin
	jump JunctionSwitchReminder
	
.YouWin
	setevent EVENT_SECRET_SWITCH_LADY_EVENT_OVER
	writetext JunctionSecretYouWinText
	waitbutton
	verbosegiveitem CLEAR_BELL
	writetext JunctionSecretDoneText
	waitbutton
	closetext
	end
	
JunctionSecretDone:
	writetext JunctionSecretDoneText
	waitbutton
	closetext
	end
	
PewterNidoran:
	faceplayer
	opentext
	writetext PewterNidoranText
	cry FEAROW
	waitbutton
	closetext
	end

SecretSwitchLadyText1:
	text "My FEAROW and I"
	line "often find rare"
	
	para "items while"
	line "exploring."
	
	para "I found what I"
	line "think is a very"
	cont "special stone."
	
	para "I'm not sure what"
	line "it does but--"
	
	para "Huh."
	
	para "Your eyes lit up"
	line "like you know what"
	cont "it is."
	
	para "Tell you what, I"
	line "like to test other"
	
	para "trainers for their"
	line "treasure hunting"
	cont "abilities."
	
	para "I've hidden 4"
	line "secret switches"
	cont "in JUNCTION PARK."
	
	para "If you can find"
	line "them all, I'll"
	
	para "give you this"
	line "stone!"
	
	para "Good luck,"
	line "trainer!"
	done

SwitchEventReminderText:
	text "Try and find all"
	line "4 hidden switches"
	cont "in JUNCTION PARK!"
	
	para "When you do,"
	line "come back here"
	
	para "and I'll give you"
	line "a reward!"
	done
	
JunctionSecretYouWinText:
	text "Oh my, oh my!"
	
	para "You have found all"
	line "the secret"
	cont "switches!"
	
	para "For being such an"
	line "amazing treasure"
	
	para "hunter, I have"
	line "this reward for"
	cont "you!"
	done
	
JunctionSecretDoneText:
	text "I really admire"
	line "teasure hunters."
	
	para "My FEAROW and I"
	line "are always finding"
	cont "rare items!"
	done
	
PewterNidoranText:
	text "FEAROW: Feero!"
	done

PewterNidoranSpeechHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, PEWTER_CITY
	warp_def 7, 3, 1, PEWTER_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x1a2807, -1
	person_event SPRITE_BIRD, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PewterNidoran, -1
