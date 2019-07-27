Trainers:

; All trainers follow a basic structure:;
	; Name
		; String in format "TEXT@"
	; Type
		; 0: Level, species
		; 1: Level, species, moves
		; 2: Level, species, item
		; 3: Level, species, item, moves
	; Party
		; Up to six monsters following the data type
	; $ff


FalknerGroup:
; ================================
; ================

	; FALKNER (1)
	db "MACK@" ;FALKNER
	db 1 ; moves

	; party

	db 8, CUBONE
		db BONE_CLUB
		db HEADBUTT
		db 0
		db 0

	db 7, RHYHORN
		db HORN_ATTACK
		db ENDURE
		db 0
		db 0
		
	db 7, PHANPY
		db ENDURE
		db MUD_SLAP
		db 0
		db 0

	db $ff ; end

; ================
; ================================


WhitneyGroup:
; ================================
; ================

	; WHITNEY (1)
	db "LUNA@"
	db 1 ; moves

	; party

	db 18, HOUNDOUR
        db EMBER
        db THIEF
        db SMOG
        db ROAR

    db 20, SNEASEL
        db QUICK_ATTACK
        db THIEF
        db ICY_WIND
        db SCREECH

    db 20, UMBREON
        db PURSUIT
        db RETURN
        db MOONLIGHT
        db TOXIC

	db $ff ; end

; ================
; ================================


BugsyGroup:
; ================================
; ================

	; BUGSY (1)
	db "BLANCHE@" ;BUGSY
	db 1 ; moves

	; party

	db 14, VOLTORB
		db SCREECH
		db TACKLE
		db HARDEN
		db 0

	db 16, PIKACHU
		db THUNDER_WAVE
		db THUNDERPUNCH
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db 14, MAGNEMITE
		db SUPERSONIC
		db THUNDERSHOCK
		db RETURN
		db THUNDERPUNCH
	
	db 16, MAGNEMITE
		db SUPERSONIC
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDERPUNCH

	db $ff ; end

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY (1)
	db "SCARLET@" ;MORTY
	db 1 ; moves

	; party

	db 24, PIDGEOTTO
		db FLY
		db WHIRLWIND
		db SAND_ATTACK
		db MUD_SLAP

	db 23, FEAROW
		db FLY
		db STEEL_WING
		db PURSUIT
		db FURY_ATTACK

	db 25, SCYTHER
		db FLY
		db AGILITY
		db FURY_CUTTER
		db HYPER_BEAM

	db 25, DODUO
		db FLY
		db RAGE
		db FURY_ATTACK
		db MUD_SLAP

	db $ff ; end

; ================

	; MORTY (2)
	db "SCARLET@" ;MORTY
	db 1 ; moves

	; party
	db 1, BULBASAUR
		db CUT
		db 0
		db 0
		db 0

	db $ff ; end

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE (1)
	db "CARVER@" ;PRYCE
	db 1 ; moves

	; party

	db 27, KABUTO
		db HARDEN
		db ROLLOUT
		db ROCK_SMASH
		db GIGA_DRAIN
		
	db 27, LARVITAR
		db BITE
		db ROCK_SLIDE
		db THRASH
		db SCREECH

	db 29, RHYHORN
		db HORN_ATTACK
		db STOMP
		db SCARY_FACE
		db ROLLOUT

	db 31, AERODACTYL
		db ANCIENTPOWER
		db ROLLOUT
		db SUPERSONIC
		db HYPER_BEAM

	db $ff ; end

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE (1)
	db "SEBASTIAN@" ;JASMINE
	db 1 ; moves

	; party

	db 32, ESPEON
		db PSYCHIC
		db SWIFT
		db CONFUSION
		db CURSE

	db 37, SLOWKING
		db PSYCHIC
		db SURF
		db HEADBUTT
		db DISABLE

	db 34, ALAKAZAM
		db PSYCHIC
		db DISABLE
		db CURSE
		db FUTURE_SIGHT
		
	db 36, HYPNO
		db PSYCHIC
		db HYPNOSIS
		db DISABLE
		db DYNAMICPUNCH

	db $ff ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK (1)
	db "CORALINE@" ;CHUCK
	db 1 ; moves

	; party

	db 27, SEEL
		db AURORA_BEAM
		db RAIN_DANCE
		db HEADBUTT
		db DOUBLE_TEAM

	db 30, AZUMARILL
		db BUBBLEBEAM
		db DEFENSE_CURL
		db ROLLOUT
		db RAIN_DANCE
		
	db 32, POLITOED
		db HYPNOSIS
		db WATER_GUN
		db SURF
		db DOUBLESLAP
		
	db 31, POLIWRATH
		db HYPNOSIS
		db RAIN_DANCE
		db SURF
		db ICE_PUNCH

	db $ff ; end

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR (1)
	db "HARKEN@" ;CLAIR
	db 1 ; moves

	; party

	db 37, MACHOKE
		db VITAL_THROW
		db LOW_KICK
		db FORESIGHT
		db ENDURE

	db 37, MACHAMP
		db SEISMIC_TOSS
		db LOW_KICK
		db FOCUS_ENERGY
		db DYNAMICPUNCH

	db 39, HITMONCHAN
		db DYNAMICPUNCH
		db FIRE_PUNCH
		db AGILITY
		db STRENGTH

	db 40, HITMONLEE
		db FOCUS_ENERGY
		db DYNAMICPUNCH
		db DOUBLE_TEAM
		db HI_JUMP_KICK

	db $ff ; end

; ================
; ================================


Rival1Group:
; ================================
; ================

	; RIVAL1 (1)
	db "?@"
	db 0 ; normal

	; party
	db 6, BULBASAUR

	db $ff ; end

; ================

	; RIVAL1 (2)
	db "?@"
	db 0 ; normal

	; party
	db 6, CHARMANDER

	db $ff ; end

; ================

	; RIVAL1 (3)
	db "?@"
	db 0 ; normal

	; party
	db 6, SQUIRTLE

	db $ff ; end

; ================

	; RIVAL1 (4)
	db "?@"
	db 0 ; normal

	; party
	db 7, NIDORAN_F
	db 8, SCYTHER
	db 9, BULBASAUR

	db $ff ; end

; ================

	; RIVAL1 (5)
	db "?@"
	db 0 ; normal

	; party
	db 7, NIDORAN_F
	db 8, SCYTHER
	db 9, CHARMANDER

	db $ff ; end

; ================

	; RIVAL1 (6)
	db "?@"
	db 0 ; normal

	; party
	db 7, NIDORAN_F
	db 8, SCYTHER
	db 9, SQUIRTLE

	db $ff ; end

; ================

	; RIVAL1 (7)
	db "?@"
	db 1 ; moves

	; party

	db 18, NIDORINA
		db POISON_STING
		db DOUBLE_KICK
		db DEFENSE_CURL
		db SCRATCH

	db 18, TYROGUE
		db TACKLE
		db HEADBUTT
		db ROCK_SMASH
		db PROTECT

	db 20, SCYTHER
		db PURSUIT
		db AGILITY
		db CUT
		db HEADBUTT

	db 23, IVYSAUR
		db VINE_WHIP
		db SLEEP_POWDER
		db RAZOR_LEAF
		db POISONPOWDER

	db $ff ; end

; ================

	; RIVAL1 (8)
	db "?@"
	db 1 ; moves

	; party

	db 18, NIDORINA
		db POISON_STING
		db DOUBLE_KICK
		db DEFENSE_CURL
		db SCRATCH

	db 18, TYROGUE
		db TACKLE
		db HEADBUTT
		db ROCK_SMASH
		db PROTECT

	db 20, SCYTHER
		db PURSUIT
		db AGILITY
		db CUT
		db HEADBUTT


	db 23, CHARMELEON
		db EMBER
		db RAGE
		db SCARY_FACE
		db MUD_SLAP

	db $ff ; end

; ================

	; RIVAL1 (9)
	db "?@"
	db 1 ; moves

	; party

	db 18, NIDORINA
		db POISON_STING
		db DOUBLE_KICK
		db DEFENSE_CURL
		db SCRATCH

	db 18, TYROGUE
		db TACKLE
		db HEADBUTT
		db ROCK_SMASH
		db PROTECT

	db 20, SCYTHER
		db PURSUIT
		db AGILITY
		db CUT
		db HEADBUTT


	db 23, WARTORTLE
		db BUBBLE
		db BITE
		db WATER_GUN
		db WITHDRAW

	db $ff ; end

; ================

	; RIVAL1 (10)
	db "?@"
	db 1 ; moves

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, MEGANIUM
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM

	db $ff ; end

; ================

	; RIVAL1 (11)
	db "?@"
	db 1 ; moves

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, QUILAVA
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK
		db FLAME_WHEEL

	db $ff ; end

; ================

	; RIVAL1 (12)
	db "?@"
	db 1 ; moves

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, FERALIGATR
		db RAGE
		db WATER_GUN
		db BITE
		db SCARY_FACE

	db $ff ; end

; ================

	; RIVAL1 (13) (Final Encounter In JANTO)
	db "?@"
	db 1 ; moves

	; party

	db 38, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 37, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 39, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 37, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 37, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 40, VENUSAUR
		db SLEEP_POWDER
		db RAZOR_LEAF
		db POISONPOWDER
		db GIGA_DRAIN

	db $ff ; end

; ================

	; RIVAL1 (14) (Final Encounter In JANTO)
	db "?@"
	db 1 ; moves

	; party

	db 38, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 37, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 39, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 37, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 37, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 40, CHARIZARD
		db FLAMETHROWER
		db RAGE
		db SMOKESCREEN
		db SCARY_FACE

	db $ff ; end

; ================

	; RIVAL1 (15) (Final Encounter In JANTO)
	db "?@"
	db 1 ; moves

	; party

	db 38, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 37, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 39, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 37, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 37, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 40, BLASTOISE
		db BITE
		db RAIN_DANCE
		db EARTHQUAKE
		db SURF

	db $ff ; end

; ================

	; RIVAL1 (16) (KOHTO)
	db "?@"
	db 1 ; moves

	; party

	db 40, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 43, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 44, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 45, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 45, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 48, VENUSAUR
		db SLEEP_POWDER
		db RAZOR_LEAF
		db POISONPOWDER
		db GIGA_DRAIN

	db $ff ; end

; ================

	; RIVAL1 (17) (KOHTO)
	db "?@"
	db 1 ; moves

	; party

	db 40, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 43, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 44, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 45, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 45, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 48, CHARIZARD
		db FLAMETHROWER
		db RAGE
		db SMOKESCREEN
		db SCARY_FACE

	db $ff ; end

; ================

	; RIVAL1 (18) (KOHTO)
	db "?@"
	db 1 ; moves

	; party

	db 40, NIDOQUEEN
		db DYNAMICPUNCH
		db DOUBLE_KICK
		db DEFENSE_CURL
		db BODY_SLAM

	db 43, HITMONTOP
		db MACH_PUNCH
		db AGILITY
		db RAPID_SPIN
		db STRENGTH

	db 44, SCIZOR
		db SLASH
		db AGILITY
		db CUT
		db FURY_CUTTER

	db 45, ELECTABUZZ
		db THUNDERPUNCH
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 45, KANGASKHAN
		db ENDURE
		db MEGA_PUNCH
		db RAGE
		db ROAR

	db 48, BLASTOISE
		db BITE
		db RAIN_DANCE
		db EARTHQUAKE
		db SURF

	db $ff ; end
; ================================


PokemonProfGroup:
; ================================
; ================
; ================================


WillGroup:
; ================================
; ================

    ; WILL (1)
    db "KALE@"
    db 1 ; moves

    ; party

    db 40, JUMPLUFF
        db GIGA_DRAIN
        db HEADBUTT
        db POISONPOWDER
        db COTTON_SPORE

    db 41, VILEPLUME
        db PETAL_DANCE
        db SLUDGE_BOMB
        db SUNNY_DAY
        db PROTECT

    db 41, VICTREEBEL
        db SOLARBEAM
        db SLUDGE_BOMB
        db CUT
        db SLEEP_POWDER

    db 41, PARASECT
        db GIGA_DRAIN
        db FURY_CUTTER
        db SUNNY_DAY
        db SPORE

    db 42, VENUSAUR
        db SOLARBEAM
        db TOXIC
        db LEECH_SEED
        db SUNNY_DAY

	db $ff ; end

; ================
; ================================


PKMNTrainerGroup:
; ================================
; ================

	; CAL (1)
	db "CAL@"
	db 0 ; normal

	; party
	db 10, CHIKORITA
	db 10, CYNDAQUIL
	db 10, TOTODILE

	db $ff ; end

; ================

	; CAL (2)
	db "CAL@"
	db 0 ; normal

	; party
	db 30, BAYLEEF
	db 30, QUILAVA
	db 30, CROCONAW

	db $ff ; end

; ================

	; CAL (3)
	db "CAL@"
	db 0 ; normal

	; party
	db 50, MEGANIUM
	db 50, TYPHLOSION
	db 50, FERALIGATR

	db $ff ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; HAYDEN (1)
	db "HAYDEN@"
	db 1 ; moves

	; party

	db 42, MAGCARGO
		db FLAMETHROWER
		db BODY_SLAM
		db ROCK_SLIDE
		db AMNESIA

	db 42, RAPIDASH
		db TAKE_DOWN
		db FIRE_BLAST
		db FIRE_SPIN
		db AGILITY

	db 42, NINETALES
		db FLAMETHROWER
		db QUICK_ATTACK
		db CONFUSE_RAY
		db SUNNY_DAY

	db 43, ARCANINE
		db FLAME_WHEEL
		db EXTREMESPEED
		db DIG
		db ROAR

	db 46, CHARIZARD
		db FLAMETHROWER
		db SLASH
		db DRAGON_RAGE
		db SMOKESCREEN

	db $ff ; end

; ================
; ================================


KarenGroup:
; ================================
; ================

	; FRANCINE (1)
	db "FRANCI@"
	db 1 ; moves

	; party

	db 42, TENTACRUEL
		db BUBBLEBEAM
		db ACID
		db GIGA_DRAIN
		db WHIRLPOOL

	db 42, MUK
		db SLUDGE_BOMB
		db THUNDERPUNCH
		db ACID_ARMOR
		db MINIMIZE

	db 45, CROBAT
		db BITE
		db TOXIC
		db MEAN_LOOK
		db CONFUSE_RAY

	db 44, NIDOQUEEN
		db BODY_SLAM
		db DOUBLE_KICK
		db EARTHQUAKE
		db TOXIC

	db 47, GENGAR
		db SHADOW_BALL
		db GIGA_DRAIN
		db TOXIC
		db CONFUSE_RAY

	db $ff ; end

; ================
; ================================


KogaGroup:
; ================================
; ================

	; CHRIS (1)
	db "CHRIS@"
	db 1 ; moves

	; party

	db 40, MAGNETON
		db TRI_ATTACK
		db SONICBOOM
		db ZAP_CANNON
		db LOCK_ON

	db 41, FORRETRESS
		db SWIFT
		db PROTECT
		db SPIKES
		db SANDSTORM

	db 43, SKARMORY
		db STEEL_WING
		db FLY
		db FURY_ATTACK
		db AGILITY

	db 42, STEELIX
		db IRON_TAIL
		db EARTHQUAKE
		db CRUNCH
		db SANDSTORM

	db 44, SCIZOR
		db METAL_CLAW
		db SLASH
		db FURY_CUTTER
		db SWORDS_DANCE

	db $ff ; end

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION (1)
	db "EMILY@"
	db 1 ; moves

	; party

	db 44, SMEARGLE
		db SPORE
		db BELLY_DRUM
		db SUPER_FANG
		db BATON_PASS

	db 47, DITTO
		db TRANSFORM
		db
		db
		db

	db 47, WIGGLYTUFF
		db DOUBLE_EDGE
		db ICE_BEAM
		db THUNDERBOLT
		db THUNDER_WAVE

	db 46, BLISSEY
		db SOFTBOILED
		db HEAL_BELL
		db FLAMETHROWER
		db TOXIC

	db 46, MILTANK
		db HEAL_BELL
		db MILK_DRINK
		db ROLLOUT
		db BODY_SLAM

	db 50, SNORLAX
		db BODY_SLAM
		db CURSE
		db REST
		db EARTHQUAKE

	db $ff ; end

; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "WEEDY@" ;WEEDY
	db 1 ; moves

	; party

	db 43, VILEPLUME
		db STUN_SPORE
		db CUT
		db DOUBLE_TEAM
		db HYPER_BEAM

	db 42, MEGANIUM
		db RAZOR_LEAF
		db BODY_SLAM
		db SAFEGUARD
		db SOLARBEAM

	db 42, JUMPLUFF
		db POISONPOWDER
		db STUN_SPORE
		db SLEEP_POWDER
		db HYPER_BEAM

	db 44, VENUSAUR
		db SOLARBEAM
		db VINE_WHIP
		db LEECH_SEED
		db SLEEP_POWDER

	db $ff ; end

; ================
; ================================


MistyGroup:
; ================================
; ================

	; MISTY (1)
	db "ELROY@" ;MISTY
	db 1 ; moves

	; party

	db 42, WEEZING
		db SMOG
		db SELFDESTRUCT
		db HAZE
		db TOXIC

	db 43, MUK
		db POISON_GAS
		db SLUDGE_BOMB
		db DISABLE
		db ACID_ARMOR

	db 44, CROBAT
		db WING_ATTACK
		db TOXIC
		db CONFUSE_RAY
		db LEECH_LIFE

	db 47, NIDOKING
		db DOUBLE_KICK
		db TOXIC
		db ROAR
		db HORN_ATTACK

	db $ff ; end

; ================
; ================================


LtSurgeGroup:
; ================================
; ================

	; LT_SURGE (1)
	db "MAURO@" ;MAURO
	db 1 ; moves

	; party

	db 52, WOBBUFFET
		db COUNTER
		db MIRROR_COAT
		db SAFEGUARD
		db DESTINY_BOND

	db 53, ALAKAZAM
		db PSYCHIC
		db PSYBEAM
		db RECOVER
		db DISABLE

	db 52, ESPEON
		db LOCK_ON
		db DOUBLE_TEAM
		db SWIFT
		db ZAP_CANNON

	db 54, SLOWKING
		db CURSE
		db WATER_GUN
		db HEADBUTT
		db PSYCHIC

	db 55, UNOWN
		db HIDDEN_POWER
		db 0
		db 0
		db 0

	db $ff ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST (1)
	db "ROSS@"
	db 0 ; normal

	; party
	db 29, ELECTRODE
	db 28, ELEKID
	db 29, PORYGON2

	db $ff ; end

; ================

	; SCIENTIST (2)
	db "MITCH@"
	db 0 ; normal

	; party
	db 28, VOLTORB
	db 31, DITTO
	db 32, ELECTRODE
	
	db $ff ; end

; ================

	; SCIENTIST (3)
	db "JED@"
	db 0 ; normal

	; party
	db 29, PORYGON
	db 31, PORYGON2

	db $ff ; end

; ================

	; SCIENTIST (4)
	db "MARC@"
	db 0 ; normal

	; party
	db 16, MAGNEMITE
	db 17, VOLTORB
	db 18, PORYGON

	db $ff ; end

; ================

	; SCIENTIST (5)
	db "RICH@"
	db 0 ; normal

	; party

	db 17, PORYGON
	db 17, ELEKID

	db $ff ; end

; ================
; ================================


ErikaGroup:
; ================================
; ================

	; ERIKA (1)
	db "CALVIN@" ;ERIKA ?
	db 1 ; moves

	; party

	db 42, PORYGON2
		db ZAP_CANNON
		db PSYBEAM
		db RECOVER
		db TRI_ATTACK

	db 41, SNORLAX
		db HEADBUTT
		db REST
		db BODY_SLAM
		db BELLY_DRUM

	db 45, PIDGEOT
		db FLY
		db WING_ATTACK
		db MIRROR_MOVE
		db SAND_ATTACK
		
	db 45, KANGASKHAN
		db ENDURE
		db BITE
		db RAGE
		db MEGA_PUNCH

	db $ff ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "JOEY@"
	db 0 ; normal

	; party
	db 4, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (2)
	db "MIKEY@"
	db 0 ; normal

	; party
	db 2, MURKROW
	db 4, NIDORAN_M

	db $ff ; end

; ================

	; YOUNGSTER (3)
	db "ALBERT@"
	db 0 ; normal

	; party
	db 7, SPEAROW
	db 8, WOOPER
	db 10, WOOPER

	db $ff ; end

; ================

	; YOUNGSTER (4)
	db "GORDON@"
	db 0 ; normal

	; party
	db 10, WOOPER

	db $ff ; end

; ================

	; YOUNGSTER (5)
	db "SAMUEL@"
	db 0 ; normal

	; party
	db 7, RATTATA
	db 8, PIDGEY
	db 8, SPEAROW

	db $ff ; end

; ================

	; YOUNGSTER (6)
	db "IAN@"
	db 0 ; normal

	; party
	db 8, NIDORAN_M
	db 7, PSYDUCK

	db $ff ; end

; ================

	; YOUNGSTER (7)
	db "JOEY@"
	db 0 ; normal

	; party
	db 15, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (8)
	db "JOEY@"
	db 1 ; moves

	; party

	db 21, RATICATE
		db TAIL_WHIP
		db QUICK_ATTACK
		db HYPER_FANG
		db SCARY_FACE

	db $ff ; end

; ================

	; YOUNGSTER (9)
	db "WARREN@"
	db 0 ; normal

	; party
	db 37, VENUSAUR
	db 33, KINGLER

	db $ff ; end

; ================

	; YOUNGSTER (10)
	db "JIMMY@"
	db 0 ; normal

	; party
	db 33, EXEGGUTOR
	db 36, ARBOK

	db $ff ; end

; ================

	; YOUNGSTER (11)
	db "OWEN@"
	db 0 ; normal

	; party
	db 34, GROWLITHE
	db 35, FARFETCH_D

	db $ff ; end

; ================

	; YOUNGSTER (12)
	db "JASON@"
	db 0 ; normal

	; party
	db 33, VICTREEBEL
	db 33, CROBAT
	db 34, PONYTA

	db $ff ; end

; ================

	; YOUNGSTER (13)
	db "JOEY@"
	db 1 ; moves

	; party

	db 30, RATICATE
		db TAIL_WHIP
		db QUICK_ATTACK
		db HYPER_FANG
		db PURSUIT

	db $ff ; end

; ================

	; YOUNGSTER (14)
	db "JOEY@"
	db 1 ; moves

	; party

	db 37, RATICATE
		db HYPER_BEAM
		db QUICK_ATTACK
		db HYPER_FANG
		db PURSUIT

	db $ff ; end

; ================

	; YOUNGSTER (15)
	db "MELVIN@"
	db 0 ; normal

	; party
	db 7, SANDSHREW
	db 8, CUBONE

	db $ff ; end
	
; ================

	; YOUNGSTER (16)
	db "AMIR@"
	db 0 ; normal

	; party
	db 6, DIGLETT
	db 7, RHYHORN

	db $ff ; end

; ================
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY (1)
	db "JACK@"
	db 0 ; normal

	; party
	db 21, HOUNDOUR
	db 22, HOUNDOUR

	db $ff ; end

; ================

	; SCHOOLBOY (2)
	db "KIPP@"
	db 0 ; normal

	; party
	db 35, ELECTRODE
	db 36, ELECTRODE
	db 31, MAGNETON

	db $ff ; end

; ================

	; SCHOOLBOY (3)
	db "ALAN@"
	db 0 ; normal

	; party
	db 10, GROWLITHE

	db $ff ; end

; ================

	; SCHOOLBOY (4)
	db "JOHNNY@"
	db 0 ; normal

	; party
	db 32, VILEPLUME
	db 34, MAROWAK

	db $ff ; end

; ================

	; SCHOOLBOY (5)
	db "DANNY@"
	db 0 ; normal

	; party
	db 31, ELECTABUZZ
	db 35, MR__MIME
	db 37, KABUTOPS

	db $ff ; end

; ================

	; SCHOOLBOY (6)
	db "TOMMY@"
	db 0 ; normal

	; party
	db 32, SLOWBRO
	db 36, SLOWKING

	db $ff ; end

; ================

	; SCHOOLBOY (7)
	db "DUDLEY@"
	db 0 ; normal

	; party
	db 35, PSYDUCK
	db 36, GOLDUCK

	db $ff ; end

; ================

	; SCHOOLBOY (8)
	db "JOE@"
	db 0 ; normal

	; party
	db 33, ESPEON
	db 34, VAPOREON
	db 34, JOLTEON
	
	db $ff ; end

; ================

	; SCHOOLBOY (9)
	db "BILLY@"
	db 0 ; normal

	; party
	db 33, PARAS
	db 37, PARASECT
	
	db $ff ; end

; ================

	; SCHOOLBOY (10)
	db "CHAD@"
	db 0 ; normal

	; party
	db 20, RATICATE
	db 21, ARIADOS
	db 22, BEEDRILL

	db $ff ; end

; ================

	; SCHOOLBOY (11)
	db "NATE@"
	db 0 ; normal

	; party
	db 32, LEDIAN
	db 32, EXEGGUTOR

	db $ff ; end

; ================

	; SCHOOLBOY (12)
	db "RICKY@"
	db 0 ; normal

	; party
	db 32, AIPOM
	db 32, DITTO

	db $ff ; end

; ================

	; SCHOOLBOY (13)
	db "JACK@"
	db 0 ; normal

	; party
	db 14, ODDISH
	db 17, VOLTORB

	db $ff ; end

; ================

	; SCHOOLBOY (14)
	db "JACK@"
	db 0 ; normal

	; party
	db 28, GLOOM
	db 31, ELECTRODE

	db $ff ; end

; ================

	; SCHOOLBOY (15)
	db "ALAN@"
	db 0 ; normal

	; party
	db 17, TANGELA
	db 17, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (16)
	db "ALAN@"
	db 0 ; normal

	; party
	db 20, NATU
	db 22, TANGELA
	db 20, QUAGSIRE
	db 25, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (17)
	db "CHAD@"
	db 0 ; normal

	; party
	db 19, MR__MIME
	db 19, MAGNEMITE

	db $ff ; end

; ================

	; SCHOOLBOY (18)
	db "CHAD@"
	db 0 ; normal

	; party
	db 27, MR__MIME
	db 31, MAGNETON

	db $ff ; end

; ================

	; SCHOOLBOY (19)
	db "JACK@"
	db 0 ; normal

	; party
	db 30, GLOOM
	db 33, GROWLITHE
	db 33, ELECTRODE

	db $ff ; end

; ================

	; SCHOOLBOY (20)
	db "JACK@"
	db 1 ; moves

	; party

	db 35, ELECTRODE
		db SCREECH
		db SONICBOOM
		db ROLLOUT
		db LIGHT_SCREEN

	db 35, GROWLITHE
		db SUNNY_DAY
		db LEER
		db TAKE_DOWN
		db FLAME_WHEEL

	db 37, VILEPLUME
		db SOLARBEAM
		db SLEEP_POWDER
		db ACID
		db MOONLIGHT

	db $ff ; end

; ================

	; SCHOOLBOY (21)
	db "ALAN@"
	db 0 ; normal

	; party
	db 27, NATU
	db 27, TANGELA
	db 30, QUAGSIRE
	db 30, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (22)
	db "ALAN@"
	db 1 ; moves

	; party

	db 35, XATU
		db PECK
		db NIGHT_SHADE
		db SWIFT
		db FUTURE_SIGHT

	db 32, TANGELA
		db POISONPOWDER
		db VINE_WHIP
		db BIND
		db MEGA_DRAIN

	db 32, YANMA
		db QUICK_ATTACK
		db DOUBLE_TEAM
		db SONICBOOM
		db SUPERSONIC

	db 35, QUAGSIRE
		db TAIL_WHIP
		db SLAM
		db AMNESIA
		db EARTHQUAKE

	db $ff ; end

; ================

	; SCHOOLBOY (23)
	db "CHAD@"
	db 0 ; normal

	; party
	db 30, MR__MIME
	db 34, MAGNETON

	db $ff ; end

; ================

	; SCHOOLBOY (24)
	db "CHAD@"
	db 1 ; moves

	; party

	db 34, MR__MIME
		db PSYCHIC_M
		db LIGHT_SCREEN
		db REFLECT
		db ENCORE

	db 38, MAGNETON
		db ZAP_CANNON
		db THUNDER_WAVE
		db LOCK_ON
		db SWIFT

	db $ff ; end

; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER (1)
	db "ROD@"
	db 0 ; normal

	; party
	db 6, DIGLETT
	db 7, RHYHORN

	db $ff ; end

; ================

	; BIRD_KEEPER (2)
	db "ABE@"
	db 0 ; normal

	; party
	db 7, SANDSHREW
	db 8, CUBONE

	db $ff ; end

; ================

	; BIRD_KEEPER (3)
	db "BRYAN@"
	db 0 ; normal

	; party
	db 17, PIDGEOTTO
	db 18, DODUO

	db $ff ; end

; ================

	; BIRD_KEEPER (4)
	db "THEO@"
	db 0 ; normal

	; party
	db 17, PIDGEY
	db 15, PIDGEY
	db 19, PIDGEY
	db 15, PIDGEY
	db 15, PIDGEY

	db $ff ; end

; ================

	; BIRD_KEEPER (5)
	db "TOBY@"
	db 0 ; normal

	; party
	db 15, DODUO
	db 16, DODUO
	db 17, DODUO

	db $ff ; end

; ================

	; BIRD_KEEPER (6)
	db "DENIS@"
	db 0 ; normal

	; party
	db 18, SPEAROW
	db 20, FEAROW
	db 18, SPEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (7)
	db "VANCE@"
	db 0 ; normal

	; party
	db 20, FEAROW
	db 22, PIDGEOTTO
	db 21, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (8)
	db "HANK@"
	db 0 ; normal

	; party
	db 34, PIDGEOT
	db 33, FEAROW
	db 33, DODUO

	db $ff ; end

; ================

	; BIRD_KEEPER (9)
	db "ROY@"
	db 0 ; normal

	; party
	db 36, MANTINE
	db 35, FEAROW
	db 38, PIDGEOT

	db $ff ; end

; ================

	; BIRD_KEEPER (10)
	db "BORIS@"
	db 0 ; normal

	; party
	db 30, FARFETCH_D
	db 38, FEAROW
	
	db $ff ; end

; ================

	; BIRD_KEEPER (11)
	db "BOB@"
	db 0 ; normal

	; party
	db 34, NOCTOWL
	db 37, NOCTOWL

	db $ff ; end

; ================

	; BIRD_KEEPER (12)
	db "JOSE@"
	db 0 ; normal

	; party
	db 36, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (13)
	db "PETER@"
	db 0 ; normal

	; party
	db 6, PIDGEY
	db 6, PIDGEY
	db 8, SPEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (14)
	db "JOSE@"
	db 0 ; normal

	; party
	db 34, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (15)
	db "PERRY@"
	db 0 ; normal

	; party
	db 37, FEAROW
	db 38, DELIBIRD

	db $ff ; end

; ================

	; BIRD_KEEPER (16)
	db "BRET@"
	db 0 ; normal

	; party
	db 34, PIDGEOTTO
	db 32, FEAROW
	db 32, DODRIO
	db 33, NOCTOWL

	db $ff ; end

; ================

	; BIRD_KEEPER (17)
	db "JOSE@"
	db 1 ; moves

	; party

	db 40, FARFETCH_D
		db FURY_ATTACK
		db DETECT
		db FLY
		db SLASH

	db $ff ; end

; ================

	; BIRD_KEEPER (18)
	db "VANCE@"
	db 0 ; normal

	; party
	db 32, PIDGEOTTO
	db 32, PIDGEOTTO

	db $ff ; end

; ================

	; BIRD_KEEPER (19)
	db "VANCE@"
	db 1 ; moves

	; party

	db 38, PIDGEOT
		db TOXIC
		db QUICK_ATTACK
		db WHIRLWIND
		db FLY

	db 38, PIDGEOT
		db SWIFT
		db DETECT
		db STEEL_WING
		db FLY

	db $ff ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "CARRIE@"
	db 0 ; normal

	; party

	db 16, SNEASEL
	db 17, MURKROW

	db $ff ; end

; ================

	; LASS (2)
	db "BRIDGET@"
	db 0 ; normal

	; party
	db 15, MURKROW
	db 16, MURKROW

	db $ff ; end

; ================

	; LASS (3)
	db "ALICE@" ;COOLTRAINER JEFFREY
	db 0 ; normal

	; party
	db 30, PIKACHU
	db 34, RAICHU

	db $ff ; end

; ================

	; LASS (4)
	db "KRISE@"
	db 0 ; normal

	; party
	db 20, SNUBBULL
	db 21, FLAAFFY

	db $ff ; end

; ================

	; LASS (5)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 31, VULPIX
	db 32, SLOWPOKE

	db $ff ; end

; ================

	; LASS (6)
	db "LINDA@" ;GRACE
	db 0 ; normal

	; party
	db 30, AMPHAROS
	db 31, AMPHAROS


	db $ff ; end

; ================

	; LASS (7)
	db "LAURA@"
	db 0 ; normal

	; party
	db 28, GLOOM
	db 35, VILEPLUME
	db 31, BELLOSSOM

	db $ff ; end

; ================

	; LASS (8)
	db "SHANNON@"
	db 0 ; normal

	; party
	db 32, GRANBULL
	db 33, SNEASEL
	db 35, PINECO

	db $ff ; end

; ================

	; LASS (9)
	db "MICHELLE@" ;COOLTRAINER_M DAX
	db 0 ; normal

	; party
	db 32, URSARING
	db 34, SNORLAX

	db $ff ; end

; ================

	; LASS (10)
	db "DANA@"
	db 0 ; normal

	; party
	db 21, FURRET
	db 22, LEDIAN
	db 22, BUTTERFREE

	db $ff ; end

; ================

	; LASS (11)
	db "ELLEN@"
	db 0 ; normal

	; party
	db 30, WIGGLYTUFF
	db 34, BLISSEY

	db $ff ; end

; ================

	; LASS (12)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (13)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (14)
	db "DANA@"
	db 1 ; moves

	; party

	db 21, FLAAFFY
		db TACKLE
		db GROWL
		db THUNDERSHOCK
		db THUNDER_WAVE

	db 21, PSYDUCK
		db SCRATCH
		db TAIL_WHIP
		db DISABLE
		db CONFUSION

	db $ff ; end

; ================

	; LASS (15)
	db "DANA@"
	db 1 ; moves

	; party

	db 29, PSYDUCK
		db SCRATCH
		db DISABLE
		db CONFUSION
		db SCREECH

	db 29, AMPHAROS
		db TACKLE
		db THUNDERSHOCK
		db THUNDER_WAVE
		db COTTON_SPORE

	db $ff ; end

; ================

	; LASS (16)
	db "DANA@"
	db 1 ; moves

	; party

	db 32, PSYDUCK
		db SCRATCH
		db DISABLE
		db CONFUSION
		db SCREECH

	db 32, AMPHAROS
		db TACKLE
		db THUNDERPUNCH
		db THUNDER_WAVE
		db COTTON_SPORE

	db $ff ; end

; ================

	; LASS (17)
	db "DANA@"
	db 1 ; moves

	; party

	db 36, AMPHAROS
		db SWIFT
		db THUNDERPUNCH
		db THUNDER_WAVE
		db COTTON_SPORE

	db 36, GOLDUCK
		db DISABLE
		db SURF
		db PSYCHIC_M
		db SCREECH

	db $ff ; end
	
; ================

	; LASS (18)
	db "MANDIE@" ;Cascade Gym
	db 0 ; normal

	; party
	db 35, ARCANINE
	db 34, NINETALES

	db $ff ; end
	
; ================

	; LASS (19)
	db "ADELINA@" ;Cascade Gym
	db 0 ; normal

	; party
	db 34, NINETALES
	db 36, ARCANINE
	db 34, ARCANINE

	db $ff ; end

; ================
; ================================


JanineGroup:
; ================================
; ================

	; JANINE (1)
	db "KOHEN@" ;KOHEN
	db 1 ; moves

	; party

	db 43, AMPHAROS
		db THUNDERSHOCK
		db THUNDER_WAVE
		db COTTON_SPORE
		db DYNAMICPUNCH

	db 45, ELECTABUZZ
		db THUNDERPUNCH
		db SWIFT
		db THUNDERBOLT
		db SCREECH

	db 46, ELECTRODE
		db SELFDESTRUCT
		db SONICBOOM
		db LIGHT_SCREEN
		db RETURN

	db 45, MAGNETON
		db THUNDER_WAVE
		db ZAP_CANNON
		db SUPERSONIC
		db SWIFT

	db $ff ; end

; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM (1)
	db "NICK@"
	db 1 ; moves

	; party

	db 26, CHARMANDER
		db EMBER
		db SMOKESCREEN
		db RAGE
		db SCARY_FACE

	db 26, SQUIRTLE
		db WITHDRAW
		db WATER_GUN
		db BITE
		db CURSE

	db 26, BULBASAUR
		db LEECH_SEED
		db POISONPOWDER
		db SLEEP_POWDER
		db RAZOR_LEAF

	db $ff ; end

; ================

	; COOLTRAINERM (2)
	db "AARON@"
	db 0 ; normal

	; party
	db 23, CHARMELEON
	db 22, VAPOREON
	db 23, SKARMORY

	db $ff ; end

; ================

	; COOLTRAINERM (3) ;GYM8BLACKBELT
	db "PAUL@"
	db 0 ; normal

	; party
	db 34, PRIMEAPE
	db 36, PRIMEAPE

	db $ff ; end

; ================

	; COOLTRAINERM (4) ;GYM8BLACKBELT
	db "CODY@"
	db 0 ; normal

	; party
	db 35, MACHOKE
	db 36, MACHOKE

	db $ff ; end

; ================

	; COOLTRAINERM (5) ;GYM8BLACKBELT
	db "MIKE@"
	db 0 ; normal

	; party
	db 34, PRIMEAPE
	db 36, MACHOKE

	db $ff ; end

; ================

	; COOLTRAINERM (6)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 35, TYPHLOSION
	db 35, VICTREEBEL
	db 36, GYARADOS

	db $ff ; end

; ================

	; COOLTRAINERM (7)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 35, TYPHLOSION
	db 35, VICTREEBEL
	db 36, GYARADOS

	db $ff ; end

; ================

	; COOLTRAINERM (8)
	db "RYAN@"
	db 0 ; normal

	; party

	db 29, CHARMELEON
	db 29, ELECTABUZZ

	db $ff ; end

; ================

	; COOLTRAINERM (9)
	db "JAKE@"
	db 0 ; normal

	; party

	db 33, FERALIGATR
	db 32, SCIZOR	

	db $ff ; end

; ================

	; COOLTRAINERM (10)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 35, TYPHLOSION
	db 35, VICTREEBEL
	db 36, GYARADOS

	db $ff ; end

; ================

	; COOLTRAINERM (11)
	db "BLAKE@"
	db 1 ; moves

	; party

	db 33, MAGNETON
		db THUNDERBOLT
		db SUPERSONIC
		db SWIFT
		db SCREECH

	db 31, QUAGSIRE
		db WATER_GUN
		db SLAM
		db AMNESIA
		db EARTHQUAKE

	db 31, EXEGGCUTE
		db LEECH_SEED
		db CONFUSION
		db SLEEP_POWDER
		db SOLARBEAM

	db $ff ; end

; ================

	; COOLTRAINERM (12)
	db "BRIAN@"
	db 1 ; moves

	; party

	db 35, SANDSLASH
		db SAND_ATTACK
		db POISON_STING
		db SLASH
		db SWIFT

	db $ff ; end

; ================

	; COOLTRAINERM (13)
	db "ERICK@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (14)
	db "ANDY@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (15)
	db "TYLER@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (16)
	db "SEAN@"
	db 0 ; normal

	; party
	db 35, FLAREON
	db 35, TANGELA
	db 35, TAUROS

	db $ff ; end

; ================

	; COOLTRAINERM (17)
	db "KEVIN@"
	db 0 ; normal

	; party
	db 38, RHYHORN
	db 35, CHARMELEON
	db 35, WARTORTLE

	db $ff ; end

; ================

	; COOLTRAINERM (18)
	db "STEVE@"
	db 0 ; normal

	; party
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (19)
	db "ALLEN@"
	db 0 ; normal

	; party

	db 21, IVYSAUR
	db 20, CHARMELEON
	db 22, CROCONAW	

	db $ff ; end

; ================

	; COOLTRAINERM (20)
	db "DARIN@"
	db 1 ; moves

	; party

	db 37, DRAGONAIR
		db WRAP
		db SURF
		db DRAGON_RAGE
		db SLAM

	db $ff ; end

; ================
	
	; COOLTRAINERM (21)
	db "JACKO@"
	db 0 ; normal

	; party
	db 16, PIDGEOTTO
	db 18, NOCTOWL
	db 16, NOCTOWL

	db $ff ; end
; ================

	; COOLTRAINERM (22)
	db "DARREN@"
	db 0 ; normal

	; party
	db 22, SCYTHER
	db 20, PIDGEOTTO
	

	db $ff ; end
; ================

	; COOLTRAINERM (23)
	db "MANNY@"
	db 0 ; normal

	; party

	db 20, STEELIX
	db 22, SCYTHER
	db 22, CROCONAW
	db 22, WARTORTLE

	db $ff ; end
	
; ================

	; COOLTRAINERM (24)
	db "JUNG@" ;Brandies Gym
	db 0 ; normal

	; party
	db 37, PORYGON
	db 34, FURRET
	db 35, FURRET

	db $ff ; end
	
; ================

	; COOLTRAINERM (25)
	db "DEX@" ;Brandies Gym
	db 0 ; normal

	; party
	db 32, URSARING
	db 34, SNORLAX

	db $ff ; end
	
; ================

	; COOLTRAINERM (26)
	db "EVANS@" ;Brandies Gym
	db 0 ; normal

	; party
	db 33, GRANBULL
	db 32, RATICATE

	db $ff ; end
	
; ================	
; ================================


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF (1)
	db "GWEN@"
	db 0 ; normal

	; party
	db 26, EEVEE
	db 22, FLAREON
	db 22, VAPOREON
	db 22, JOLTEON

	db $ff ; end

; ================

	; COOLTRAINERF (2)
	db "LOIS@"
	db 0 ; normal

	; party

	db 23, MANTINE
	db 23, WARTORTLE

	db $ff ; end

; ================

	; COOLTRAINERF (3) ;GYM8BLACKBELT
	db "FRAN@"
	db 0 ; normal

	; party
	db 37, HITMONLEE

	db $ff ; end

; ================

	; COOLTRAINERF (4) ;GYM8BLACKBELT
	db "LOLA@"
	db 0 ; normal

	; party
	db 34, TYROGUE
	db 36, MACHOKE
	db 33, HITMONCHAN

	db $ff ; end

; ================

	; COOLTRAINERF (5)
	db "KATE@"
	db 0 ; normal

	; party
	db 26, SHELLDER
	db 28, CLOYSTER

	db $ff ; end

; ================

	; COOLTRAINERF (6)
	db "IRENE@"
	db 0 ; normal

	; party
	db 22, GOLDEEN
	db 24, SEAKING

	db $ff ; end

; ================

	; COOLTRAINERF (7)
	db "KELLY@"
	db 0 ; normal

	; party
	db 29, AZUMARILL
	db 31, MEGANIUM
	db 32, CHARIZARD

	db $ff ; end

; ================

	; COOLTRAINERF (8)
	db "JOYCE@"
	db 0 ; normal

	; party

	db 38, VENUSAUR

	db $ff ; end

; ================

	; COOLTRAINERF (9)
	db "BETH@"
	db 0 ; normal

	; party

	db 36, BLASTOISE
	db 37, RAPIDASH

	db $ff ; end

; ================

	; COOLTRAINERF (10)
	db "REENA@"
	db 0 ; normal

	; party
	db 31, STARMIE
	db 33, NIDOQUEEN
	db 31, STARMIE

	db $ff ; end

; ================

	; COOLTRAINERF (11)
	db "MEGAN@"
	db 1 ; moves

	; party

	db 32, BULBASAUR
		db GROWL
		db LEECH_SEED
		db POISONPOWDER
		db RAZOR_LEAF

	db 32, IVYSAUR
		db GROWL
		db LEECH_SEED
		db POISONPOWDER
		db RAZOR_LEAF

	db 32, VENUSAUR
		db BODY_SLAM
		db SLEEP_POWDER
		db RAZOR_LEAF
		db SWEET_SCENT

	db $ff ; end

; ================

	; COOLTRAINERF (12)
	db "BETH@"
	db 1 ; moves

	; party

	db 39, RAPIDASH
		db STOMP
		db FIRE_SPIN
		db FURY_ATTACK
		db AGILITY

	db $ff ; end

; ================

	; COOLTRAINERF (13)
	db "CAROL@"
	db 0 ; normal

	; party
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES

	db $ff ; end

; ================

	; COOLTRAINERF (14)
	db "QUINN@"
	db 0 ; normal

	; party
	db 37, STARYU
	db 38, STARMIE
	db 38, FERALIGATR

	db $ff ; end

; ================

	; COOLTRAINERF (15)
	db "EMMA@"
	db 0 ; normal

	; party
	db 28, POLIWHIRL

	db $ff ; end

; ================

	; COOLTRAINERF (16)
	db "CYBIL@"
	db 0 ; normal

	; party

	db 22, BAYLEEF
	db 20, PONYTA

	db $ff ; end

; ================

	; COOLTRAINERF (17)
	db "JENN@"
	db 0 ; normal

	; party
	db 24, STARYU
	db 26, STARMIE

	db $ff ; end

; ================

	; COOLTRAINERF (18)
	db "BETH@"
	db 3 ; item + moves

	; party

	db 43, RAPIDASH, FOCUS_BAND
		db STOMP
		db FIRE_SPIN
		db FURY_ATTACK
		db FIRE_BLAST

	db $ff ; end

; ================

	; COOLTRAINERF (19)
	db "REENA@"
	db 0 ; normal

	; party
	db 34, STARMIE
	db 36, NIDOQUEEN
	db 34, STARMIE

	db $ff ; end

; ================

	; COOLTRAINERF (20)
	db "REENA@"
	db 3 ; item + moves

	; party

	db 38, STARMIE, NO_ITEM
		db DOUBLE_TEAM
		db PSYCHIC_M
		db WATERFALL
		db CONFUSE_RAY

	db 40, NIDOQUEEN, PINK_BOW
		db EARTHQUAKE
		db DOUBLE_KICK
		db TOXIC
		db BODY_SLAM

	db 38, STARMIE, NO_ITEM
		db BLIZZARD
		db PSYCHIC_M
		db WATERFALL
		db RECOVER

	db $ff ; end

; ================

	; COOLTRAINERF (21)
	db "CARA@"
	db 1 ; moves

	; party

	db 33, HORSEA
		db SMOKESCREEN
		db LEER
		db WHIRLPOOL
		db TWISTER

	db 33, HORSEA
		db SMOKESCREEN
		db LEER
		db WHIRLPOOL
		db TWISTER

	db 35, SEADRA
		db SWIFT
		db LEER
		db WATERFALL
		db TWISTER

	db $ff ; end

; ================

	; COOLTRAINERF (22)
	db "ELLIE@"
	db 0 ; normal

	; party
	db 18, SKIPLOOM
	db 17, PIDGEOTTO

	db $ff ; end

; ================

	; COOLTRAINERF (23)
	db "TABES@" ;GYM3COOLTRAINERF
	db 0 ; normal

	; party
	db 18, PIDGEOTTO
	db 17, SKIPLOOM

	db $ff ; end
	
; ================

	; COOLTRAINERF (24)
	db "ROBINA@" ;COOLTRAINER_F ROBINA
	db 0 ; normal

	; party
	db 35, PERSIAN
	db 36, PERSIAN

	db $ff ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY (1)
	db "VICTORIA@"
	db 0 ; normal

	; party
	db 14, SNEASEL
	db 15, MURKROW

	db $ff ; end

; ================

	; BEAUTY (2)
	db "SAMANTHA@"
	db 0 ; normal

	; party

	db 16, HOUNDOUR

	db $ff ; end

; ================

	; BEAUTY (3)
	db "JULIE@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (4)
	db "JACLYN@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (5)
	db "BRENDA@"
	db 0 ; normal

	; party
	db 16, FURRET

	db $ff ; end

; ================

	; BEAUTY (6)
	db "CASSIE@"
	db 0 ; normal

	; party
	db 28, VILEPLUME
	db 34, BUTTERFREE

	db $ff ; end

; ================

	; BEAUTY (7)
	db "CAROLINE@"
	db 0 ; normal

	; party
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL

	db $ff ; end

; ================

	; BEAUTY (8)
	db "CARLENE@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (9)
	db "JESSICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (10)
	db "RACHAEL@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (11)
	db "ANGELICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (12)
	db "KENDRA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (13)
	db "VERONICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (14)
	db "JULIA@" ;COOLTRAINER_M EVANS
	db 0 ; normal

	; party
	db 33, GRANBULL
	db 32, RATICATE

	db $ff ; end

; ================

	; BEAUTY (15)
	db "THERESA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (16)
	db "VALERIE@"
	db 1 ; moves

	; party

	db 17, HOPPIP
		db SYNTHESIS
		db TAIL_WHIP
		db TACKLE
		db POISONPOWDER

	db 17, SKIPLOOM
		db SYNTHESIS
		db TAIL_WHIP
		db TACKLE
		db STUN_SPORE

	db $ff ; end

; ================

	; BEAUTY (17)
	db "OLIVIA@"
	db 0 ; normal

	; party
	db 19, CORSOLA

	db $ff ; end

; ================

	; BEAUTY (18)
	db "SAMANTHA@" ;Cascade Gym
	db 0 ; normal

	; party
	db 33, MAGMAR
	db 32, NINETALES

	db $ff ; end
	
; ================

	; BEAUTY (19)
	db "VICTORIA@" ;Cascade Gym
	db 0 ; normal

	; party
	db 34, TYPHLOSION
	db 35, HOUNDOOM
	db 35, ARCANINE

	db $ff ; end
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "LARRY@"
	db 0 ; normal

	; party
	db 3, DROWZEE
	db 4, DROWZEE

	db $ff ; end

; ================

	; POKEMANIAC (2)
	db "ANDREW@"
	db 0 ; normal

	; party
	db 24, MAROWAK
	db 24, MAROWAK

	db $ff ; end

; ================

	; POKEMANIAC (3)
	db "CALVIN@"
	db 0 ; normal

	; party
	db 3, DROWZEE
	db 4, GASTLY	

	db $ff ; end

; ================

	; POKEMANIAC (4)
	db "SHANE@"
	db 0 ; normal

	; party
	db 10, SLOWPOKE
	db 13, KANGASKHAN
	db 15, STARYU

	db $ff ; end

; ================

	; POKEMANIAC (5)
	db "BEN@"
	db 0 ; normal

	; party
	db 29, SLOWKING

	db $ff ; end

; ================

	; POKEMANIAC (6)
	db "BRENT@"
	db 0 ; normal

	; party
	db 27, LICKITUNG
	db 26, RHYHORN

	db $ff ; end

; ================

	; POKEMANIAC (7)
	db "RON@"
	db 0 ; normal

	; party
	db 25, NIDOKING
	db 26, KANGASKHAN

	db $ff ; end

; ================

	; POKEMANIAC (8)
	db "ETHAN@"
	db 0 ; normal

	; party
	db 31, RHYHORN
	db 31, RHYDON

	db $ff ; end

; ================

	; POKEMANIAC (9)
	db "BRENT@"
	db 0 ; normal

	; party
	db 25, KANGASKHAN

	db $ff ; end

; ================

	; POKEMANIAC (10)
	db "BRENT@"
	db 1 ; moves

	; party

	db 36, PORYGON
		db RECOVER
		db PSYCHIC_M
		db CONVERSION2
		db TRI_ATTACK

	db $ff ; end

; ================

	; POKEMANIAC (11)
	db "ISSAC@"
	db 1 ; moves

	; party

	db 12, LICKITUNG
		db LICK
		db SUPERSONIC
		db CUT
		db 0

	db $ff ; end

; ================

	; POKEMANIAC (12)
	db "DONALD@"
	db 0 ; normal

	; party
	db 10, SLOWPOKE
	db 10, SLOWPOKE

	db $ff ; end

; ================

	; POKEMANIAC (13)
	db "ZACH@"
	db 0 ; normal

	; party
	db 22, RHYHORN
	db 20, NIDORINO

	db $ff ; end

; ================

	; POKEMANIAC (14)
	db "BRENT@"
	db 1 ; moves

	; party

	db 41, CHANSEY
		db ROLLOUT
		db ATTRACT
		db EGG_BOMB
		db SOFTBOILED

	db $ff ; end

; ================

	; POKEMANIAC (15)
	db "MILLER@"
	db 0 ; normal

	; party
	db 14, RHYHORN

	db $ff ; end

; ================

	; POKEMANIAC (16) ;GYM6HIKER
	db "PETE@"
	db 0 ; normal

	; party
	db 26, KABUTO
	db 27, OMANYTE

	db $ff ; end

; ================

	; POKEMANIAC (17) ;GYM6HIKER
	db "WENDAL@"
	db 0 ; normal

	; party
	db 25, GEODUDE
	db 26, GRAVELER
	db 24, RHYHORN

	db $ff ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; GRUNTM (1)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, MURKROW

	db $ff ; end

; ================

	; GRUNTM (2)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 7, RATTATA
	db 8, RATTATA
	db 9, ZUBAT

	db $ff ; end

; ================

	; GRUNTM (3)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 16, MURKROW
	db 17, RATICATE

	db $ff ; end

; ================

	; GRUNTM (4) ;GAME CORNER HIDEOUT
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, GRIMER
	db 17, ZUBAT

	db $ff ; end

; ================

	; GRUNTM (5) ;GAME CORNER HIDEOUT
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, RATTATA
	db 16, ZUBAT
	db 17, RATTATA

	db $ff ; end

; ================

	; GRUNTM (6)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, ZUBAT
	db 17, GRIMER
	db 17, EKANS

	db $ff ; end

; ================

	; GRUNTM (7)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 16, ZUBAT
	db 17, GRIMER
	db 16, GRIMER

	db $ff ; end

; ================

	; GRUNTM (8)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 17, KOFFING

	db $ff ; end

; ================

	; GRUNTM (9)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 16, RATICATE
	db 17, VOLTORB

	db $ff ; end

; ================

	; GRUNTM (10)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 17, ZUBAT
	db 17, GRIMER
	db 18, RATTATA

	db $ff ; end

; ================

	; GRUNTM (11)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 23, MUK
	db 23, KOFFING
	db 25, RATTATA

	db $ff ; end

; ================

	; GRUNTM (12)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 33, HOUNDOUR

	db $ff ; end

; ================

	; GRUNTM (13)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 27, RATTATA

	db $ff ; end

; ================

	; GRUNTM (14)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 30, ELECTRODE
	db 31, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (15)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 32, WEEZING

	db $ff ; end

; ================

	; GRUNTM (16)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 26, GRIMER
	db 28, RATICATE
	db 29, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (17)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 29, GOLBAT
	db 31, VENONAT
	db 28, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (18)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 29, ARBOK
	db 28, ARBOK
	db 31, KOFFING

	db $ff ; end

; ================

	; GRUNTM (19)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 30, GRIMER
	db 29, KOFFING

	db $ff ; end

; ================

	; GRUNTM (20)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 29, GOLBAT
	db 28, RATICATE

	db $ff ; end

; ================

	; GRUNTM (21)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 16, ZUBAT
	db 17, GRIMER
	db 18, RATTATA

	db $ff ; end

; ================

	; GRUNTM (22)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 17, GOLBAT
	db 18, BEEDRILL
	
	db $ff ; end

; ================

	; GRUNTM (23)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 30, KOFFING

	db $ff ; end

; ================

	; GRUNTM (24)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 30, MURKROW
	db 29, ARBOK

	db $ff ; end

; ================

	; GRUNTM (25)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 24, KOFFING
	db 24, MUK

	db $ff ; end

; ================

	; GRUNTM (26)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, RATTATA
	db 15, RATTATA

	db $ff ; end

; ================

	; GRUNTM (27)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 22, ZUBAT

	db $ff ; end

; ================

	; GRUNTM (28)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 28, KOFFING
	db 29, KOFFING
	db 29, KOFFING
	db 30, SANDSLASH

	db $ff ; end

; ================

	; GRUNTM (29)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 9, RATICATE
	db 8, RATTATA

	db $ff ; end

; ================

	; GRUNTM (30)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK

	db $ff ; end

; ================

	; GRUNTM (31)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 30, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (32) ;STUDIO ACTOR
	db "GRUNT@"
	db 0 ; normal

	; party
	db 39, GOLBAT
	db 40, RATICATE

	db $ff ; end

; ================

	; GRUNTM (33) ;STUDIO ACTOR
	db "GRUNT@"
	db 0 ; normal

	; party
	db 37, GOLBAT
	db 38, WEEZING
	db 41, WEEZING

	db $ff ; end

; ================
; ================================


GentlemanGroup:
; ================================
; ================

	; GENTLEMAN (1)
	db "PRESTON@"
	db 0 ; normal

	; party
	db 30, PORYGON
	db 31, PORYGON2

	db $ff ; end

; ================

	; GENTLEMAN (2)
	db "EDWARD@"
	db 0 ; normal

	; party
	db 33, PERSIAN

	db $ff ; end

; ================

	; GENTLEMAN (3)
	db "GREGORY@" ;PSYCHIC PAUL
	db 0 ; normal

	; party
	db 36, DROWZEE
	db 33, XATU
	db 37, DROWZEE

	db $ff ; end

; ================

	; GENTLEMAN (4)
	db "VIRGIL@"
	db 0 ; normal

	; party
	db 20, PONYTA

	db $ff ; end

; ================

	; GENTLEMAN (5)
	db "ALFRED@"
	db 0 ; normal

	; party
	db 28, KOFFING
	db 27, GROWLITHE

	db $ff ; end

; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER (1) ;GYM6HIKER
	db "ROXANNE@" 
	db 0 ; normal

	; party
	db 26, SHUCKLE
	db 27, GRAVELER
	

	db $ff ; end

; ================

	; SKIER (2)
	db "CLARISSA@" ;GYM6HIKER
	db 0 ; normal

	; party
	db 28, LARVITAR

	db $ff ; end

; ================
	
	; SKIER (3)
	db "ROXANNE@" 
	db 0 ; normal

	; party
	db 32, GOLBAT
	db 32, IVYSAUR

	db $ff ; end

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER (1)
	db "COLETTE@"
	db 0 ; normal

	; party
	db 36, NIDOQUEEN
	db 37, ALAKAZAM

	db $ff ; end

; ================

	; TEACHER (2)
	db "HILLARY@"
	db 0 ; normal

	; party
	db 32, AIPOM
	db 36, CUBONE

	db $ff ; end

; ================

	; TEACHER (3)
	db "SHIRLEY@"
	db 0 ; normal

	; party
	db 35, JIGGLYPUFF

	db $ff ; end

; ================
; ================================


SabrinaGroup:
; ================================
; ================

	; SABRINA (1)
	db "BIANCA@" ;BIANCA
	db 1 ; moves

	; party

	db 46, FLAREON
		db SMOG
		db BITE
		db FIRE_SPIN
		db MUD_SLAP

	db 46, ARCANINE
		db TAKE_DOWN
		db FLAME_WHEEL
		db ROAR
		db DIG

	db 48, CHARIZARD
		db FLY
		db FLAMETHROWER
		db SMOKESCREEN
		db FLASH

	db $ff ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "DON@"
	db 0 ; normal

	; party
	db 3, VENONAT
	db 3, SPINARAK
	db 3, PINECO

	db $ff ; end

; ================

	; BUG_CATCHER (2)
	db "ROB@"
	db 0 ; normal

	; party
	db 32, BEEDRILL
	db 32, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (3)
	db "ED@"
	db 0 ; normal

	; party
	db 30, BEEDRILL
	db 30, BEEDRILL
	db 30, BEEDRILL

	db $ff ; end

; ================

	; BUG_CATCHER (4)
	db "WADE@"
	db 0 ; normal

	; party
	db 2, LEDYBA
	db 3, SPINARAK
	db 3, VENONAT

	db $ff ; end

; ================

	; BUG_CATCHER (5)
	db "BENNY@" ;GYM2GUITARIST
	db 0 ; normal

	; party
	db 10, MAREEP
	db 9, MAGNEMITE
	db 11, MAGNEMITE

	db $ff ; end

; ================

	; BUG_CATCHER (6) ;GYM2GUITARIST
	db "AL@"
	db 0 ; normal

	; party
	db 10, PICHU
	db 12, PIKACHU

	db $ff ; end

; ================

	; BUG_CATCHER (7) ;GYM2GUITARIST
	db "JOSH@"
	db 0 ; normal

	; party
	db 13, VOLTORB
	db 11, VOLTORB
	
	db $ff ; end

; ================

	; BUG_CATCHER (8)
	db "ARNIE@"
	db 0 ; normal

	; party
	db 15, PARAS
	db 14, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (9)
	db "KEN@"
	db 0 ; normal

	; party
	db 30, ARIADOS
	db 32, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (10)
	db "WADE@"
	db 0 ; normal

	; party
	db 9, METAPOD
	db 9, METAPOD
	db 10, KAKUNA
	db 9, METAPOD

	db $ff ; end

; ================

	; BUG_CATCHER (11)
	db "WADE@"
	db 0 ; normal

	; party
	db 14, BUTTERFREE
	db 14, BUTTERFREE
	db 15, BEEDRILL
	db 14, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (12)
	db "DOUG@"
	db 0 ; normal

	; party
	db 34, ARIADOS

	db $ff ; end

; ================

	; BUG_CATCHER (13)
	db "ARNIE@"
	db 0 ; normal

	; party
	db 19, VENONAT

	db $ff ; end

; ================

	; BUG_CATCHER (14)
	db "ARNIE@"
	db 1 ; moves

	; party

	db 28, VENOMOTH
		db DISABLE
		db SUPERSONIC
		db CONFUSION
		db LEECH_LIFE

	db $ff ; end

; ================

	; BUG_CATCHER (15)
	db "WADE@"
	db 1 ; moves

	; party

	db 24, BUTTERFREE
		db CONFUSION
		db POISONPOWDER
		db SUPERSONIC
		db WHIRLWIND

	db 24, BUTTERFREE
		db CONFUSION
		db STUN_SPORE
		db SUPERSONIC
		db WHIRLWIND

	db 25, BEEDRILL
		db FURY_ATTACK
		db FOCUS_ENERGY
		db TWINEEDLE
		db RAGE

	db 24, BUTTERFREE
		db CONFUSION
		db SLEEP_POWDER
		db SUPERSONIC
		db WHIRLWIND

	db $ff ; end

; ================

	; BUG_CATCHER (16)
	db "WADE@"
	db 1 ; moves

	; party

	db 30, BUTTERFREE
		db CONFUSION
		db POISONPOWDER
		db SUPERSONIC
		db GUST

	db 30, BUTTERFREE
		db CONFUSION
		db STUN_SPORE
		db SUPERSONIC
		db GUST

	db 32, BEEDRILL
		db FURY_ATTACK
		db PURSUIT
		db TWINEEDLE
		db DOUBLE_TEAM

	db 34, BUTTERFREE
		db PSYBEAM
		db SLEEP_POWDER
		db GUST
		db WHIRLWIND

	db $ff ; end

; ================

	; BUG_CATCHER (17)
	db "ARNIE@"
	db 1 ; moves

	; party

	db 36, VENOMOTH
		db GUST
		db SUPERSONIC
		db PSYBEAM
		db LEECH_LIFE

	db $ff ; end

; ================

	; BUG_CATCHER (18)
	db "ARNIE@"
	db 1 ; moves

	; party

	db 40, VENOMOTH
		db GUST
		db SUPERSONIC
		db PSYCHIC_M
		db TOXIC

	db $ff ; end

; ================

	; BUG_CATCHER (19)
	db "WAYNE@"
	db 0 ; normal

	; party
	db 8, VENONAT
	db 10, SPINARAK
	db 8, LEDYBA

	db $ff ; end

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "JUSTIN@"
	db 0 ; normal

	; party
	db 5, MAGIKARP
	db 5, MAGIKARP
	db 15, MAGIKARP
	db 5, MAGIKARP

	db $ff ; end

; ================

	; FISHER (2)
	db "RALPH@"
	db 0 ; normal

	; party
	db 10, GOLDEEN

	db $ff ; end

; ================

	; FISHER (3)
	db "ARNOLD@"
	db 0 ; normal

	; party
	db 34, TENTACRUEL

	db $ff ; end

; ================

	; FISHER (4)
	db "KYLE@"
	db 0 ; normal

	; party
	db 35, SEAKING
	db 38, MANTINE
	db 37, STARMIE
	db 39, SLOWKING

	db $ff ; end

; ================

	; FISHER (5)
	db "HENRY@"
	db 0 ; normal

	; party
	db 8, POLIWAG
	db 8, POLIWAG

	db $ff ; end

; ================

	; FISHER (6)
	db "MARVIN@"
	db 0 ; normal

	; party
	db 28, GYARADOS
	db 27, KINGLER

	db $ff ; end

; ================

	; FISHER (7)
	db "TULLY@"
	db 0 ; normal

	; party
	db 10, WOOPER
	db 12, PSYDUCK
	
	db $ff ; end

; ================

	; FISHER (8)
	db "ANDRE@"
	db 0 ; normal

	; party
	db 22, GOLDEEN
	db 23, REMORAID

	db $ff ; end

; ================

	; FISHER (9)
	db "RAYMOND@"
	db 0 ; normal

	; party
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP

	db $ff ; end

; ================

	; FISHER (10)
	db "WILTON@"
	db 0 ; normal

	; party
	db 23, GOLDEEN
	db 23, GOLDEEN
	db 25, SEAKING

	db $ff ; end

; ================

	; FISHER (11)
	db "EDGAR@"
	db 0 ; normal

	; party

	db 20, PSYDUCK
	db 21, GOLDEEN
	db 22, HORSEA
	
	db $ff ; end

; ================

	; FISHER (12)
	db "JONAH@"
	db 0 ; normal

	; party
	db 25, SHELLDER
	db 29, OCTILLERY
	db 25, REMORAID
	db 29, CLOYSTER

	db $ff ; end

; ================

	; FISHER (13)
	db "MARTIN@"
	db 0 ; normal

	; party
	db 32, REMORAID
	db 37, MANTINE
	db 37, SEADRA

	db $ff ; end

; ================

	; FISHER (14)
	db "STEPHEN@"
	db 0 ; normal

	; party
	db 36, MAGIKARP
	db 34, QWILFISH
	db 37, GOLDUCK

	db $ff ; end

; ================

	; FISHER (15)
	db "BARNEY@"
	db 0 ; normal

	; party
	db 30, KINGLER
	db 38, GYARADOS

	db $ff ; end

; ================

	; FISHER (16)
	db "RALPH@"
	db 0 ; normal

	; party
	db 17, GOLDEEN

	db $ff ; end

; ================

	; FISHER (17)
	db "RALPH@"
	db 0 ; normal

	; party
	db 17, QWILFISH
	db 19, GOLDEEN

	db $ff ; end

; ================

	; FISHER (18)
	db "TULLY@"
	db 0 ; normal

	; party
	db 23, QWILFISH

	db $ff ; end

; ================

	; FISHER (19)
	db "TULLY@"
	db 0 ; normal

	; party
	db 32, GOLDEEN
	db 32, GOLDEEN
	db 32, QWILFISH

	db $ff ; end

; ================

	; FISHER (20)
	db "WILTON@"
	db 0 ; normal

	; party
	db 21, WOOPER
	db 20, REMORAID
	db 21, MARILL

	db $ff ; end

; ================

	; FISHER (21)
	db "SCOTT@"
	db 0 ; normal

	; party
	db 33, POLITOED
	db 32, POLIWHIRL
	db 34, SEAKING

	db $ff ; end

; ================

	; FISHER (22)
	db "WILTON@"
	db 1 ; moves

	; party

	db 34, SEAKING
		db SUPERSONIC
		db WATERFALL
		db FLAIL
		db FURY_ATTACK

	db 34, SEAKING
		db SUPERSONIC
		db WATERFALL
		db FLAIL
		db FURY_ATTACK

	db 38, REMORAID
		db PSYBEAM
		db AURORA_BEAM
		db BUBBLEBEAM
		db HYPER_BEAM

	db $ff ; end

; ================

	; FISHER (23)
	db "RALPH@"
	db 0 ; normal

	; party
	db 30, QWILFISH
	db 32, GOLDEEN

	db $ff ; end

; ================

	; FISHER (24)
	db "RALPH@"
	db 1 ; moves

	; party

	db 35, QWILFISH
		db TOXIC
		db MINIMIZE
		db SURF
		db PIN_MISSILE

	db 39, SEAKING
		db ENDURE
		db FLAIL
		db FURY_ATTACK
		db WATERFALL

	db $ff ; end

; ================

	; FISHER (25)
	db "TULLY@"
	db 1 ; moves

	; party

	db 34, SEAKING
		db SUPERSONIC
		db RAIN_DANCE
		db WATERFALL
		db FURY_ATTACK

	db 34, SEAKING
		db SUPERSONIC
		db RAIN_DANCE
		db WATERFALL
		db FURY_ATTACK

	db 37, QWILFISH
		db ROLLOUT
		db SURF
		db PIN_MISSILE
		db TAKE_DOWN

	db $ff ; end

; ================

	; FISHER (26)
	db "CARSON@"
	db 0 ; normal

	; party
	db 35, SEAKING
	db 33, GOLDEEN

	db $ff ; end

; ================

	; FISHER (26)
	db "EBERT@"
	db 0 ; normal

	; party
	db 33, SEADRA
	db 36, POLITOED
	db 33, POLIWRATH

	db $ff ; end

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "HAROLD@"
	db 0 ; normal

	; party
	db 32, REMORAID
	db 30, SEADRA

	db $ff ; end

; ================

	; SWIMMERM (2)
	db "SANCHO@" ;SIMON
	db 0 ; normal

	; party
	db 33, TENTACOOL
	db 35, TENTACRUEL

	db $ff ; end

; ================

	; SWIMMERM (3)
	db "REDUS@" ;RANDALL
	db 0 ; normal

	; party
	db 36, DEWGONG
	db 35, WARTORTLE
	db 38, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (4)
	db "CHARLIE@"
	db 0 ; normal

	; party
	db 21, SHELLDER
	db 19, TENTACOOL
	db 19, TENTACRUEL

	db $ff ; end

; ================

	; SWIMMERM (5)
	db "GEORGE@"
	db 0 ; normal

	; party
	db 16, TENTACOOL
	db 17, TENTACOOL
	db 16, TENTACOOL
	db 19, STARYU
	db 17, TENTACOOL
	db 19, REMORAID

	db $ff ; end

; ================

	; SWIMMERM (6)
	db "BERKE@"
	db 0 ; normal

	; party
	db 23, QWILFISH

	db $ff ; end

; ================

	; SWIMMERM (7)
	db "KIRK@"
	db 0 ; normal

	; party
	db 20, GYARADOS
	db 20, GYARADOS

	db $ff ; end

; ================

	; SWIMMERM (8)
	db "MATHEW@"
	db 0 ; normal

	; party
	db 23, KRABBY

	db $ff ; end

; ================

	; SWIMMERM (9)
	db "HAL@"
	db 0 ; normal

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db $ff ; end

; ================

	; SWIMMERM (10)
	db "PATON@"
	db 0 ; normal

	; party
	db 26, PILOSWINE
	db 26, PILOSWINE

	db $ff ; end

; ================

	; SWIMMERM (11)
	db "DARYL@"
	db 0 ; normal

	; party
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER

	db $ff ; end

; ================

	; SWIMMERM (12)
	db "WALTER@"
	db 0 ; normal

	; party
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA

	db $ff ; end

; ================

	; SWIMMERM (13)
	db "TONY@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (14)
	db "JEROME@"
	db 0 ; normal

	; party
	db 26, SEADRA
	db 28, TENTACOOL
	db 30, TENTACRUEL
	db 28, GOLDEEN

	db $ff ; end

; ================

	; SWIMMERM (15)
	db "TUCKER@"
	db 0 ; normal

	; party
	db 30, SHELLDER
	db 34, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (16)
	db "RICK@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (17)
	db "CAMERON@"
	db 0 ; normal

	; party
	db 34, MARILL

	db $ff ; end

; ================

	; SWIMMERM (18)
	db "SETH@"
	db 0 ; normal

	; party
	db 29, QUAGSIRE
	db 29, OCTILLERY
	db 32, QUAGSIRE

	db $ff ; end

; ================

	; SWIMMERM (19)
	db "JAMES@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (20)
	db "LEWIS@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (21)
	db "PARKER@" ;SKATER CHICK ROXANN 
	db 0 ; normal

	; party
	db 32, GOLBAT
	db 32, IVYSAUR

	db $ff ; end

; ================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "ELAINE@"
	db 0 ; normal

	; party
	db 25, GOLDEEN
	db 24, MARILL

	db $ff ; end

; ================

	; SWIMMERF (2)
	db "PAULA@"
	db 0 ; normal

	; party
	db 24, STARYU
	db 23, HORSEA

	db $ff ; end

; ================

	; SWIMMERF (3)
	db "KAYLEE@"
	db 0 ; normal

	; party
	db 25, QUAGSIRE
	db 15, MAGIKARP
	db 24, GYARADOS

	db $ff ; end

; ================

	; SWIMMERF (4)
	db "SUSIE@"
	db 0 ; normal

	; party

	db 24, CHINCHOU
	db 25, POLIWHIRL
	
	db $ff ; end

; ================

	; SWIMMERF (5)
	db "DENISE@"
	db 0 ; normal

	; party
	db 26, SEEL
	db 25, CORSOLA

	db $ff ; end

; ================

	; SWIMMERF (6)
	db "KARA@"
	db 0 ; normal

	; party
	db 25, STARYU
	db 24, SEEL

	db $ff ; end

; ================

	; SWIMMERF (7)
	db "WENDY@"
	db 0 ; normal

	; party

	db 26, SLOWPOKE
	db 25, QWILFISH

	db $ff ; end

; ================

	; SWIMMERF (8)
	db "LISA@"
	db 0 ; normal

	; party
	db 28, JYNX

	db $ff ; end

; ================

	; SWIMMERF (9)
	db "JILL@"
	db 0 ; normal

	; party
	db 28, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (10)
	db "MARY@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (11)
	db "KATIE@"
	db 0 ; normal

	; party
	db 33, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (12)
	db "DAWN@"
	db 0 ; normal

	; party
	db 34, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (13)
	db "TARA@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (14)
	db "NICOLE@"
	db 0 ; normal

	; party
	db 29, MARILL
	db 29, MARILL
	db 32, LAPRAS

	db $ff ; end

; ================

	; SWIMMERF (15)
	db "LORI@"
	db 0 ; normal

	; party
	db 32, STARMIE
	db 32, STARMIE

	db $ff ; end

; ================

	; SWIMMERF (16)
	db "JODY@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (17)
	db "NIKKI@"
	db 0 ; normal

	; party
	db 28, SEEL
	db 28, SEEL
	db 28, SEEL
	db 28, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (18)
	db "DIANA@" ;SKATER RONALD
	db 0 ; normal

	; party
	db 37, NIDORINA
	db 36, GOLBAT

	db $ff ; end

; ================

	; SWIMMERF (19)
	db "BRIANA@" ;SNOWBORDER BRAD
	db 0 ; normal

	; party
	db 35, GOLBAT
	db 35, GRIMER

	db $ff ; end

; ================
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR (1)
	db "EUGENE@"
	db 0 ; normal

	; party
	db 17, POLIWHIRL
	db 17, RATICATE
	db 19, KRABBY

	db $ff ; end

; ================

	; SAILOR (2)
	db "HUEY@"
	db 0 ; normal

	; party

	db 26, TENTACOOL
	db 24, POLIWHIRL

	db $ff ; end

; ================

	; SAILOR (3)
	db "TERRELL@"
	db 0 ; normal

	; party
	db 30, PONYTA
	db 28, VOLTORB

	db $ff ; end

; ================

	; SAILOR (4)
	db "KENT@"
	db 0 ; normal

	; party

	db 28, GRIMER
	db 30, MAGNETON

	db $ff ; end

; ================

	; SAILOR (5)
	db "ERNEST@"
	db 0 ; normal

	; party
	db 18, MACHOP
	db 18, MACHOP
	db 18, POLIWHIRL

	db $ff ; end

; ================

	; SAILOR (6)
	db "JEFF@"
	db 0 ; normal

	; party
	db 32, RATICATE
	db 32, RATICATE

	db $ff ; end

; ================

	; SAILOR (7)
	db "GARRETT@"
	db 0 ; normal

	; party
	db 34, KINGLER

	db $ff ; end

; ================

	; SAILOR (8)
	db "KENNETH@"
	db 0 ; normal

	; party
	db 28, MACHOP
	db 28, MACHOP
	db 28, POLIWRATH
	db 28, MACHOP

	db $ff ; end

; ================

	; SAILOR (9)
	db "STANLY@"
	db 0 ; normal

	; party
	db 31, MACHOP
	db 33, MACHOKE
	db 26, PSYDUCK

	db $ff ; end

; ================

	; SAILOR (10)
	db "HARRY@"
	db 0 ; normal

	; party
	db 19, WOOPER

	db $ff ; end

; ================

	; SAILOR (11)
	db "HUEY@"
	db 0 ; normal

	; party
	db 28, POLIWHIRL
	db 28, POLIWHIRL

	db $ff ; end

; ================

	; SAILOR (12)
	db "HUEY@"
	db 0 ; normal

	; party
	db 34, POLIWHIRL
	db 34, POLIWRATH

	db $ff ; end

; ================

	; SAILOR (13)
	db "HUEY@"
	db 1 ; moves

	; party

	db 38, POLITOED
		db WHIRLPOOL
		db RAIN_DANCE
		db BODY_SLAM
		db PERISH_SONG

	db 38, POLIWRATH
		db SURF
		db STRENGTH
		db ICE_PUNCH
		db SUBMISSION

	db $ff ; end

; ================

	; SAILOR (14)
	db "DONNIE@"
	db 0 ; normal

	; party

	db 26, TENTACOOL
	db 24, POLIWHIRL

	db $ff ; end
	
; ================

	; SAILOR (15) ;GYM5SAILOR
	db "FERNANDO@"
	db 0 ; normal

	; party

	db 25, SLOWPOKE
	db 24, MARILL

	db $ff ; end

; ================

	; SAILOR (16) ;GYM5SAILOR
	db "JACKSON@"
	db 0 ; normal

	; party
	db 23, SHELLDER
	db 24, MARILL
	db 25, AZUMARILL

	db $ff ; end

; ================

	; SAILOR (17)
	db "EUSTICE@"
	db 0 ; normal

	; party

	db 27, KRABBY
	db 23, TENTACOOL

	db $ff ; end

; ================
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD (1)
	db "STAN@"
	db 0 ; normal

	; party
	db 20, GRIMER

	db $ff ; end

; ================

	; SUPER_NERD (2)
	db "ERIC@"
	db 0 ; normal

	; party
	db 11, GRIMER
	db 11, GRIMER

	db $ff ; end

; ================

	; SUPER_NERD (3)
	db "GREGG@"
	db 0 ; normal

	; party
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (4)
	db "JAY@"
	db 0 ; normal

	; party
	db 22, KOFFING
	db 22, KOFFING

	db $ff ; end

; ================

	; SUPER_NERD (5)
	db "DAVE@"
	db 0 ; normal

	; party
	db 24, DITTO

	db $ff ; end

; ================

	; SUPER_NERD (6)
	db "SAM@"
	db 0 ; normal

	; party
	db 33, MAGNETON
	db 34, MUK
	db 34, MAGNETON

	db $ff ; end

; ================

	; SUPER_NERD (7)
	db "TOM@"
	db 0 ; normal

	; party
	db 32, PORYGON
	db 33, PORYGON2

	db $ff ; end

; ================

	; SUPER_NERD (8)
	db "PAT@"
	db 0 ; normal

	; party
	db 32, GROWLITHE
	db 34, ARCANINE
	db 36, MAGNETON

	db $ff ; end

; ================

	; SUPER_NERD (9)
	db "SHAWN@"
	db 0 ; normal

	; party
	db 31, MAGNEMITE
	db 33, MUK
	db 31, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (10)
	db "TERU@"
	db 0 ; normal

	; party
	db 7, MAGNEMITE
	db 11, VOLTORB
	db 7, MAGNEMITE
	db 9, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (11)
	db "RUSS@"
	db 0 ; normal

	; party
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (12)
	db "NORTON@"
	db 1 ; moves

	; party

	db 30, PORYGON
		db CONVERSION
		db CONVERSION2
		db RECOVER
		db TRI_ATTACK

	db $ff ; end

; ================

	; SUPER_NERD (13)
	db "HUGH@"
	db 0 ; normal

	; party

	db 23, PORYGON2
	db 20, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (14)
	db "MARKUS@"
	db 0 ; normal

	; party

	db 10, PORYGON
	db 12, SLOWPOKE
	db 11, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (15)
	db "DEXTER@"
	db 0 ; normal

	; party
	db 25, SLOWPOKE
	db 30, VOLTORB

	db $ff ; end

; ================

	; SUPER_NERD (16)
	db "SHELDON@"
	db 0 ; normal

	; party
	db 28, KOFFING
	db 27, GROWLITHE

	db $ff ; end
	
; ================
	
	; SUPER_NERD (17)
	db "MAURICE@"
	db 0 ; normal

	; party
	db 30, PONYTA
	db 28, VOLTORB

	db $ff ; end

; ================

	; SUPER_NERD (18)
	db "EDD@"
	db 0 ; normal

	; party
	db 30, PORYGON
	db 31, PORYGON2

	db $ff ; end
	
; ================

	;  SUPER_NERD (19)
	db "POWELL@"
	db 0 ; normal

	; party

	db 28, GRIMER
	db 30, MAGNETON

	db $ff ; end

; ================

	; SUPER_NERD (20)
	db "LARS@"
	db 0 ; normal

	; party
	db 31, VULPIX
	db 32, SLOWPOKE

	db $ff ; end

; ================

	; SUPER_NERD (21)
	db "ELIO@"
	db 0 ; normal

	; party

	db 23, MARILL
	db 22, GROWLITHE
	db 20, NIDORINO

	db $ff ; end

; ================
; ================================


Rival2Group:
; ================================
; ================

	; RIVAL2 (1)
	db "?@"
	db 1 ; moves

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, MEGANIUM
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM
		db LIGHT_SCREEN

	db $ff ; end

; ================

	; RIVAL2 (2)
	db "?@"
	db 1 ; moves

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FLAME_WHEEL
		db SWIFT

	db $ff ; end

; ================

	; RIVAL2 (3)
	db "?@"
	db 1 ; moves

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, FERALIGATR
		db RAGE
		db WATER_GUN
		db SCARY_FACE
		db SLASH

	db $ff ; end

; ================

	; RIVAL2 (4)
	db "?@"
	db 1 ; moves

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, MEGANIUM
		db GIGA_DRAIN
		db BODY_SLAM
		db LIGHT_SCREEN
		db SAFEGUARD

	db $ff ; end

; ================

	; RIVAL2 (5)
	db "?@"
	db 1 ; moves

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FIRE_BLAST
		db SWIFT

	db $ff ; end

; ================

	; RIVAL2 (6)
	db "?@"
	db 1 ; moves

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, FERALIGATR
		db SURF
		db RAIN_DANCE
		db SLASH
		db SCREECH

	db $ff ; end

; ================
; ================================


GuitaristGroup:
; ================================
; ================

	; GUITARIST (1)
	db "CLYDE@"
	db 0 ; normal

	; party
	db 34, ELECTABUZZ

	db $ff ; end

; ================

	; GUITARIST (2)
	db "VINCENT@" ;PSYCHIC LEON
	db 0 ; normal

	; party
	db 35, SLOWKING
	db 33, ALAKAZAM
	db 32, SLOWBRO

	db $ff ; end

; ================

	; GUITARIST (3)
	db "SHAUN@"
	db 0 ; normal

	; party
	db 10, PICHU
	db 12, PIKACHU

	db $ff ; end

; ================

	; GUITARIST (4)
	db "KENDAL@"
	db 0 ; normal

	; party
	db 13, VOLTORB
	db 11, VOLTORB
	
	db $ff ; end

; ================

	; GUITARIST (5)
	db "RUDY@" ;GYM2GUITARIST
	db 0 ; normal

	; party
	db 10, MAREEP
	db 9, MAGNEMITE
	db 11, MAGNEMITE

	db $ff ; end

; ================

	; TGUITARIST (6)
	db "PELO@" ;GYM2GUITARIST
	db 0 ; normal

	; party
	db 10, MAREEP
	db 13, MAREEP

	db $ff ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 27, GRAVELER
	db 26, MACHAMP
	db 25, URSARING
	

	db $ff ; end

; ================

	; HIKER (2)
	db "RUSSELL@"
	db 0 ; normal

	; party
	db 3, ONIX
	db 4, RHYHORN	

	db $ff ; end

; ================

	; HIKER (3)
	db "PHILLIP@"
	db 0 ; normal

	; party
	db 23, GEODUDE
	db 23, GEODUDE
	db 23, GRAVELER

	db $ff ; end

; ================

	; HIKER (4)
	db "LEONARD@"
	db 0 ; normal

	; party
	db 23, GEODUDE
	db 25, MACHOP

	db $ff ; end

; ================

	; HIKER (5)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 31, GRAVELER
	db 34, MACHAMP
	db 35, URSARING

	db $ff ; end

; ================

	; HIKER (6)
	db "BENJAMIN@"
	db 0 ; normal

	; party
	db 10, GEODUDE
	db 12, ONIX

	db $ff ; end

; ================

	; HIKER (7)
	db "ERIK@"
	db 0 ; normal

	; party
	db 30, DONPHAN
	db 30, MACHOKE

	db $ff ; end

; ================

	; HIKER (8)
	db "MICHAEL@"
	db 0 ; normal

	; party
	db 27, ONIX
	db 25, STEELIX
	db 28, GOLEM

	db $ff ; end

; ================

	; HIKER (9)
	db "PARRY@"
	db 0 ; normal

	; party
	db 30, GOLEM
	db 33, PRIMEAPE

	db $ff ; end

; ================

	; HIKER (10)
	db "TIMOTHY@"
	db 0 ; normal

	; party

	db 27, DUGTRIO
	db 31, DUGTRIO

	db $ff ; end

; ================

	; HIKER (11)
	db "BAILEY@"
	db 0 ; normal

	; party
	db 29, GRAVELER
	db 33, MAGCARGO

	db $ff ; end

; ================

	; HIKER (12)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 25, GRAVELER
	db 27, GRAVELER
	db 29, MACHOKE

	db $ff ; end

; ================

	; HIKER (13)
	db "TIM@"
	db 0 ; normal

	; party
	db 31, GRAVELER
	db 33, KANGASKHAN
	db 33, ONIX

	db $ff ; end

; ================

	; HIKER (14)
	db "NOLAND@"
	db 0 ; normal

	; party
	db 31, SANDSLASH
	db 33, GOLEM

	db $ff ; end

; ================

	; HIKER (15)
	db "SIDNEY@"
	db 0 ; normal

	; party
	db 32, DUGTRIO
	db 32, MAROWAK
	db 35, RHYDON

	db $ff ; end

; ================

	; HIKER (16)
	db "KENNY@"
	db 0 ; normal

	; party
	db 31, STEELIX
	db 29, GRAVELER
	db 34, GOLEM

	db $ff ; end

; ================

	; HIKER (17)
	db "JIM@"
	db 0 ; normal

	; party
	db 35, MACHAMP

	db $ff ; end

; ================

	; HIKER (18)
	db "DANIEL@"
	db 0 ; normal

	; party
	db 3, SANDSHREW
	db 4, ONIX

	db $ff ; end

; ================

	; HIKER (19)
	db "PARRY@"
	db 1 ; moves

	; party

	db 35, PILOSWINE
		db EARTHQUAKE
		db BLIZZARD
		db REST
		db TAKE_DOWN

	db 35, DUGTRIO
		db MAGNITUDE
		db DIG
		db MUD_SLAP
		db SLASH

	db 38, STEELIX
		db DIG
		db IRON_TAIL
		db SANDSTORM
		db SLAM

	db $ff ; end

; ================

	; HIKER (20)
	db "PARRY@"
	db 0 ; normal

	; party
	db 29, ONIX

	db $ff ; end

; ================

	; HIKER (21)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 30, GRAVELER
	db 30, GRAVELER
	db 32, MACHOKE

	db $ff ; end

; ================

	; HIKER (22)
	db "ANTHONY@"
	db 1 ; moves

	; party

	db 34, GRAVELER
		db MAGNITUDE
		db SELFDESTRUCT
		db DEFENSE_CURL
		db ROLLOUT

	db 36, GOLEM
		db MAGNITUDE
		db SELFDESTRUCT
		db DEFENSE_CURL
		db ROLLOUT

	db 34, MACHOKE
		db KARATE_CHOP
		db VITAL_THROW
		db HEADBUTT
		db DIG

	db $ff ; end

; ================

	; HIKER (23) ;GYM6HIKER
	db "RUDD@" 
	db 0 ; normal

	; party
	db 26, SHUCKLE
	db 27, GRAVELER
	

	db $ff ; end

; ================

	; HIKER (24)
	db "BERNARD@" ;GYM6HIKER
	db 0 ; normal

	; party
	db 28, LARVITAR

	db $ff ; end

; ================================


BikerGroup:
; ================================
; ================

	; BIKER (1)
	db "BENNY@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (2)
	db "KAZU@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (3)
	db "DWAYNE@"
	db 0 ; normal

	; party
	db 27, KOFFING
	db 28, KOFFING
	db 29, KOFFING
	db 30, KOFFING

	db $ff ; end

; ================

	; BIKER (4)
	db "HARRIS@"
	db 0 ; normal

	; party
	db 34, FLAREON

	db $ff ; end

; ================

	; BIKER (5)
	db "ZEKE@"
	db 0 ; normal

	; party
	db 32, KOFFING
	db 32, KOFFING

	db $ff ; end

; ================

	; BIKER (6)
	db "CHARLES@"
	db 0 ; normal

	; party
	db 30, KOFFING
	db 30, CHARMELEON
	db 30, WEEZING

	db $ff ; end

; ================

	; BIKER (7)
	db "RILEY@"
	db 0 ; normal

	; party
	db 34, WEEZING

	db $ff ; end

; ================

	; BIKER (8)
	db "JOEL@"
	db 0 ; normal

	; party
	db 32, MAGMAR
	db 32, MAGMAR

	db $ff ; end

; ================

	; BIKER (9)
	db "GLENN@"
	db 0 ; normal

	; party
	db 28, KOFFING
	db 30, MAGMAR
	db 32, WEEZING

	db $ff ; end

; ================
; ================================


BlaineGroup:
; ================================
; ================

	; BLAINE (1)
	db "KARLA@" ;BLAINE
	db 1 ; moves

	; party

	db 45, SKARMORY
		db FLY
		db STEEL_WING
		db AGILITY
		db FURY_ATTACK
		
	db 46, MANTINE
		db SURF
		db WING_ATTACK
		db TOXIC
		db CONFUSE_RAY

	db 48, AERODACTYL
		db ANCIENTPOWER
		db SCARY_FACE
		db SUPERSONIC
		db HYPER_BEAM

	db $ff ; end

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR (1)
	db "DUNCAN@"
	db 0 ; normal

	; party
	db 23, KOFFING
	db 25, MAGMAR
	db 23, KOFFING

	db $ff ; end

; ================

	; BURGLAR (2)
	db "EDDIE@"
	db 1 ; moves

	; party

	db 26, GROWLITHE
		db ROAR
		db EMBER
		db LEER
		db TAKE_DOWN

	db 24, KOFFING
		db TACKLE
		db SMOG
		db SLUDGE
		db SMOKESCREEN

	db $ff ; end

; ================

	; BURGLAR (3)
	db "COREY@"
	db 0 ; normal

	; party
	db 25, KOFFING
	db 28, MAGMAR
	db 25, KOFFING
	db 30, KOFFING

	db $ff ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER (1)
	db "OTIS@"
	db 0 ; normal

	; party
	db 29, MAGMAR
	db 32, WEEZING
	db 29, MAGMAR

	db $ff ; end

; ================

	; FIREBREATHER (2)
	db "DICK@"
	db 0 ; normal

	; party
	db 17, CHARMELEON

	db $ff ; end

; ================

	; FIREBREATHER (3)
	db "NED@"
	db 0 ; normal

	; party
	db 15, KOFFING
	db 16, GROWLITHE
	db 15, KOFFING

	db $ff ; end

; ================

	; FIREBREATHER (4)
	db "BURT@"
	db 0 ; normal

	; party
	db 32, KOFFING
	db 32, SLUGMA

	db $ff ; end

; ================

	; FIREBREATHER (5)
	db "BILL@"
	db 0 ; normal

	; party
	db 4, GROWLITHE

	db $ff ; end

; ================

	; FIREBREATHER (6)
	db "WALT@"
	db 0 ; normal

	; party
	db 11, MAGMAR
	db 13, MAGMAR

	db $ff ; end

; ================

	; FIREBREATHER (7)
	db "RAY@"
	db 0 ; normal

	; party
	db 9, VULPIX

	db $ff ; end

; ================

	; FIREBREATHER (8)
	db "LYLE@"
	db 0 ; normal

	; party
	db 28, KOFFING
	db 31, FLAREON
	db 28, KOFFING

	db $ff ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER (1)
	db "IRWIN@"
	db 0 ; normal

	; party
	db 15, MR__MIME
	db 18, MR__MIME
	db 18, VOLTORB
	db $ff ; end

; ================

	; JUGGLER (2)
	db "FRITZ@"
	db 0 ; normal

	; party
	db 29, MR__MIME
	db 29, MAGMAR
	db 29, MACHOKE

	db $ff ; end

; ================

	; JUGGLER (3)
	db "HORTON@"
	db 0 ; normal

	; party
	db 34, XATU
	db 33, HYPNO

	db $ff ; end

; ================

	; JUGGLER (4)
	db "IRWIN@"
	db 0 ; normal

	; party
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db 18, VOLTORB

	db $ff ; end

; ================

	; JUGGLER (5)
	db "IRWIN@"
	db 0 ; normal

	; party
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE

	db $ff ; end

; ================

	; JUGGLER (6)
	db "IRWIN@"
	db 0 ; normal

	; party
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE

	db $ff ; end

; ================
; ================================


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T (1)
	db "KENJI@"
	db 0 ; normal

	; party
	db 32, TYROGUE
	db 30, HITMONCHAN

	db $ff ; end

; ================

	; BLACKBELT_T (2)
	db "YOSHI@"
	db 0 ; normal

	; party

	db 27, KRABBY
	db 23, TENTACOOL

	db $ff ; end

; ================

	; BLACKBELT_T (3)
	db "KENJI@"
	db 0 ; normal

	; party
	db 32, TYROGUE
	db 30, HITMONCHAN

	db $ff ; end

; ================

	; BLACKBELT_T (4) ;GYM5SAILOR
	db "LAO@"
	db 0 ; normal

	; party

	db 26, TENTACOOL
	db 24, POLIWHIRL

	db $ff ; end

; ================

	; BLACKBELT_T (5) ;GYM5SAILOR
	db "NOB@"
	db 0 ; normal

	; party

	db 25, SLOWPOKE
	db 24, MARILL

	db $ff ; end

; ================

	; BLACKBELT_T (6)
	db "KIYO@"
	db 0 ; normal

	; party
	db 34, HITMONLEE
	db 34, HITMONCHAN

	db $ff ; end

; ================

	; BLACKBELT_T (7) ;GYM5SAILOR
	db "LUNG@"
	db 0 ; normal

	; party
	db 23, SHELLDER
	db 24, MARILL
	db 25, AZUMARILL

	db $ff ; end

; ================

	; BLACKBELT_T (8)
	db "KENJI@"
	db 0 ; normal

	; party
	db 32, TYROGUE
	db 30, HITMONCHAN

	db $ff ; end

; ================

	; BLACKBELT_T (9)
	db "WAI@"
	db 0 ; normal

	; party
	db 30, MACHOKE
	db 32, MACHOKE
	db 34, MACHOKE

	db $ff ; end

; ================

	; BLACKBELT_T (10) ;GYM8BLACKBELT
	db "WAN@"
	db 0 ; normal

	; party
	db 34, PRIMEAPE
	db 36, PRIMEAPE

	db $ff ; end

; ================

	; BLACKBELT_T (11) ;GYM8BLACKBELT
	db "HAMATO@"
	db 0 ; normal

	; party
	db 34, PRIMEAPE
	db 36, MACHOKE

	db $ff ; end

; ================

	; BLACKBELT_T (12) ;GYM8BLACKBELT
	db "EUSKE@"
	db 0 ; normal

	; party
	db 35, MACHOKE
	db 36, MACHOKE

	db $ff ; end

; ================

	; BLACKBELT_T (13) ;GYM8BLACKBELT
	db "LENI@"
	db 0 ; normal

	; party
	db 34, TYROGUE
	db 36, MACHOKE
	db 33, HITMONCHAN

	db $ff ; end

; ================
	; BLACKBELT_T (14) ;GYM8BLACKBELT
	db "ENDO@"
	db 0 ; normal

	; party
	db 37, HITMONLEE

	db $ff ; end

; ================

	; BLACKBELT_T (15)
	db "KYO@"
	db 0 ; normal

	; party
	db 16, MANKEY

	db $ff ; end

; ================

	; BLACKBELT_T (16)
	db "KEIJI@"
	db 0 ; normal

	; party
	db 15, TYROGUE
	db 16, MACHOP

	db $ff ; end

; ================

	; BLACKBELT_T (17)
	db "YANI@"
	db 0 ; normal

	; party
	db 14, MANKEY
	db 13, GEODUDE
	db 10, HERACROSS

	db $ff ; end

; ================

	; BLACKBELT_T (18)
	db "WAYN@"
	db 0 ; normal

	; party
	db 15, FARFETCH_D
	db 15, MACHOP

	db $ff ; end

; ================

	; BLACKBELT_T (19)
	db "OHAN@"
	db 0 ; normal

	; party
	db 17, CUBONE

	db $ff ; end

; ================

	; BLACKBELT_T (20)
	db "KYARA@"
	db 0 ; normal

	; party
	db 16, TYROGUE
	db 17, SUDOWOODO
	db 18, MACHOP
	db 15, SNEASEL
	
	db $ff ; end

; ================================


ExecutiveMGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "EXECUTIVE@"
	db 1 ; moves

	; party

	db 33, HOUNDOUR
		db EMBER
		db ROAR
		db BITE
		db FAINT_ATTACK

	db 33, KOFFING
		db TACKLE
		db SLUDGE
		db SMOKESCREEN
		db HAZE

	db 35, HOUNDOOM
		db EMBER
		db SMOG
		db BITE
		db FAINT_ATTACK

	db $ff ; end

; ================

	; EXECUTIVEM (2)
	db "EXECUTIVE@"
	db 0 ; normal

	; party

	db 19, GROWLITHE

	db $ff ; end

; ================

	; EXECUTIVEM (3)
	db "EXECUTIVE@"
	db 0 ; normal

	; party

	db 19, ARBOK
	db 18, KOFFING
	db 18, MURKROW
	db 19, GOLBAT

	db $ff ; end

; ================

	; EXECUTIVEM (4)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 22, ZUBAT
	db 24, RATICATE
	db 22, KOFFING

	db $ff ; end

; ================

	; GRUNTM (5) (WAREHOUSE FINAL ROCKET BOSS)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 36, WEEZING
	db 37, VILEPLUME
	db 35, HOUNDOOM
	db 36, GOLBAT

	db $ff ; end

; ================
; ================================


PsychicGroup:
; ================================
; ================

	; PSYCHIC_T (1)
	db "NATHAN@"
	db 0 ; normal

	; party
	db 26, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (2)
	db "FRANKLIN@" ;BEAUTY VICTORIA
	db 0 ; normal

	; party
	db 34, TYPHLOSION
	db 35, HOUNDOOM
	db 35, ARCANINE

	db $ff ; end

; ================

	; PSYCHIC_T (3)
	db "HERMAN@"
	db 0 ; normal

	; party
	db 30, EXEGGUTOR
	db 32, GOLDUCK
	db 34, ALAKAZAM

	db $ff ; end

; ================

	; PSYCHIC_T (4)
	db "FIDEL@"
	db 0 ; normal

	; party
	db 34, SLOWBRO
	db 35, SLOWKING

	db $ff ; end

; ================

	; PSYCHIC_T (5)
	db "GREG@"
	db 0 ; normal

	; party

	db 20, KADABRA
	db 21, DROWZEE
	db 22, DROWZEE
	db 20, NATU

	db $ff ; end

; ================

	; PSYCHIC_T (6)
	db "NORMAN@"
	db 0 ; normal

	; party
	db 21, NATU
	db 22, KADABRA
	db 22, ESPEON

	db $ff ; end

; ================

	; PSYCHIC_T (7)
	db "MARK@"
	db 1 ; moves

	; party

	db 10, ABRA
		db TELEPORT
		db FLASH
		db 0
		db 0

	db 12, PSYDUCK
		db POUND
		db HYPNOSIS
		db WATER_GUN
		db 0
	db 13, PSYDUCK
		db CONFUSION
		db WATER_GUN
		db 0
		db 0
		
	db $ff ; end

; ================

	; PSYCHIC_T (8)
	db "PHIL@"
	db 0 ; normal

	; party

	db 22, KADABRA
	db 20, DROWZEE
	db 21, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (9)
	db "RICHARD@"
	db 0 ; normal

	; party
	db 35, ALAKAZAM
	db 36, XATU	

	db $ff ; end

; ================

	; PSYCHIC_T (10)
	db "GILBERT@"
	db 0 ; normal

	; party
	db 30, STARMIE
	db 30, EXEGGCUTE
	db 34, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (11)
	db "JARED@" ;BEAUTY SAMANTHA
	db 0 ; normal

	; party
	db 33, MAGMAR
	db 32, NINETALES

	db $ff ; end

; ================

	; PSYCHIC_T (12)
	db "RODNEY@"
	db 0 ; normal

	; party
	db 29, DROWZEE
	db 33, HYPNO

	db $ff ; end
	
; ================

	; PSYCHIC_T (13)
	db "LEON@" ;PSYCHIC LEON
	db 0 ; normal

	; party
	db 42, SLOWKING
	db 45, ALAKAZAM
	db 42, SLOWBRO

	db $ff ; end

; ================

	; PSYCHIC_T (14)
	db "MIKE@"
	db 0 ; normal

	; party
	db 43, XATU
	db 44, HYPNO

	db $ff ; end

; ================
	
	; PSYCHIC_T (15)
	db "PAUL@" ;
	db 0 ; normal

	; party
	db 44, DROWZEE
	db 43, XATU
	db 45, DROWZEE

	db $ff ; end
	
; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER (1)
	db "LIZ@"
	db 0 ; normal

	; party
	db 8, NIDORAN_F
	db 7, SANDSHREW	

	db $ff ; end

; ================

	; PICNICKER (2)
	db "GINA@"
	db 0 ; normal

	; party
	db 8, HOPPIP
	db 9, ODDISH
	db 8, BELLSPROUT

	db $ff ; end

; ================

	; PICNICKER (3)
	db "BROOKE@"
	db 0 ; normal

	; party

	db 19, NIDORINA
	db 18, EKANS

	db $ff ; end

; ================

	; PICNICKER (4)
	db "KIM@"
	db 0 ; normal

	; party
	db 19, PONYTA
	db 17, CROCONAW

	db $ff ; end

; ================

	; PICNICKER (5)
	db "CINDY@" ;COOLTRAINER_F CINDY
	db 0 ; normal

	; party
	db 34, LANTURN
	db 35, AMPHAROS
	db 36, RAICHU

	db $ff ; end

; ================

	; PICNICKER (6)
	db "HOPE@"
	db 0 ; normal

	; party
	db 34, VICTREEBEL
	db 33, VILEPLUME

	db $ff ; end

; ================

	; PICNICKER (7)
	db "SHARON@"
	db 0 ; normal

	; party
	db 34, KINGLER
	db 33, STARMIE

	db $ff ; end

; ================

	; PICNICKER (8)
	db "DEBRA@"
	db 0 ; normal

	; party
	db 33, SEAKING

	db $ff ; end

; ================

	; PICNICKER (9)
	db "GINA@"
	db 0 ; normal

	; party
	db 14, HOPPIP
	db 14, HOPPIP
	db 17, IVYSAUR

	db $ff ; end

; ================

	; PICNICKER (10)
	db "ERIN@"
	db 0 ; normal

	; party
	db 31, CLEFABLE
	db 33, BUTTERFREE

	db $ff ; end

; ================

	; PICNICKER (11)
	db "LIZ@"
	db 0 ; normal

	; party
	db 15, WEEPINBELL
	db 15, NIDORINA

	db $ff ; end

; ================

	; PICNICKER (12)
	db "LIZ@"
	db 0 ; normal

	; party
	db 19, WEEPINBELL
	db 19, NIDORINO
	db 21, NIDOQUEEN

	db $ff ; end

; ================

	; PICNICKER (13)
	db "HEIDI@"
	db 0 ; normal

	; party
	db 32, GOLEM
	db 33, LICKITUNG
	db 34, SKIPLOOM

	db $ff ; end

; ================

	; PICNICKER (14)
	db "EDNA@"
	db 0 ; normal

	; party
	db 32, VENOMOTH
	db 34, DUGTRIO

	db $ff ; end

; ================

	; PICNICKER (15)
	db "GINA@"
	db 0 ; normal

	; party
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 29, IVYSAUR

	db $ff ; end

; ================

	; PICNICKER (16)
	db "TIFFANY@"
	db 0 ; normal

	; party
	
	db 27, SANDSLASH
	db 26, CLEFAIRY

	db $ff ; end

; ================

	; PICNICKER (17)
	db "TIFFANY@"
	db 0 ; normal

	; party
	
	db 27, SANDSLASH
	db 26, CLEFAIRY

	db $ff ; end

; ================

	; PICNICKER (18)
	db "ERIN@"
	db 0 ; normal

	; party
	db 32, PONYTA
	db 32, PONYTA

	db $ff ; end

; ================

	; PICNICKER (19)
	db "TANYA@" ;COOLTRAINER_M JUNG
	db 0 ; normal

	; party
	db 37, PORYGON
	db 34, FURRET
	db 35, FURRET

	db $ff ; end

; ================

	; PICNICKER (20)
	db "TIFFANY@"
	db 0 ; normal

	; party
	
	db 27, SANDSLASH
	db 26, CLEFAIRY

	db $ff ; end

; ================

	; PICNICKER (21)
	db "ERIN@"
	db 1 ; moves

	; party

	db 36, PONYTA
		db DOUBLE_TEAM
		db STOMP
		db FIRE_SPIN
		db SUNNY_DAY

	db 34, RAICHU
		db SWIFT
		db MUD_SLAP
		db QUICK_ATTACK
		db THUNDERBOLT

	db 36, PONYTA
		db DOUBLE_TEAM
		db STOMP
		db FIRE_SPIN
		db SUNNY_DAY

	db $ff ; end

; ================

	; PICNICKER (22)
	db "LIZ@"
	db 0 ; normal

	; party
	db 24, WEEPINBELL
	db 26, NIDORINO
	db 26, NIDOQUEEN

	db $ff ; end

; ================

	; PICNICKER (23)
	db "LIZ@"
	db 1 ; moves

	; party

	db 30, WEEPINBELL
		db SLEEP_POWDER
		db POISONPOWDER
		db STUN_SPORE
		db SLUDGE_BOMB

	db 32, NIDOKING
		db EARTHQUAKE
		db DOUBLE_KICK
		db POISON_STING
		db IRON_TAIL

	db 32, NIDOQUEEN
		db EARTHQUAKE
		db DOUBLE_KICK
		db TAIL_WHIP
		db BODY_SLAM

	db $ff ; end

; ================

	; PICNICKER (24)
	db "GINA@"
	db 0 ; normal

	; party
	db 30, SKIPLOOM
	db 30, SKIPLOOM
	db 32, IVYSAUR

	db $ff ; end

; ================

	; PICNICKER (25)
	db "GINA@"
	db 1 ; moves

	; party

	db 33, JUMPLUFF
		db STUN_SPORE
		db SUNNY_DAY
		db LEECH_SEED
		db COTTON_SPORE

	db 33, JUMPLUFF
		db SUNNY_DAY
		db SLEEP_POWDER
		db LEECH_SEED
		db COTTON_SPORE

	db 38, VENUSAUR
		db SOLARBEAM
		db RAZOR_LEAF
		db HEADBUTT
		db MUD_SLAP

	db $ff ; end

; ================

	; PICNICKER (26)
	db "TIFFANY@"
	db 0 ; normal

	; party
	
	db 27, SANDSLASH
	db 26, CLEFAIRY

	db $ff ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "ROLAND@"
	db 0 ; normal

	; party
	db 9, NIDORAN_M
	db 6, EKANS

	db $ff ; end

; ================

	; CAMPER (2)
	db "TODD@"
	db 0 ; normal

	; party
	db 9, YANMA
	db 7, WOOPER

	db $ff ; end

; ================

	; CAMPER (3)
	db "IVAN@"
	db 0 ; normal

	; party
	db 10, DIGLETT
	db 10, ZUBAT
	db 14, DIGLETT

	db $ff ; end

; ================

	; CAMPER (4)
	db "ELLIOT@"
	db 0 ; normal

	; party
	db 19, SANDSHREW
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (5)
	db "BARRY@" ;COOLTRAINER MACK
	db 0 ; normal

	; party
	db 34, LANTURN
	db 36, LANTURN
	db 35, ELECTABUZZ

	db $ff ; end

; ================

	; CAMPER (6)
	db "LLOYD@"
	db 0 ; normal

	; party
	db 34, NIDOKING
	db 36, NIDOQUEEN

	db $ff ; end

; ================

	; CAMPER (7)
	db "DEAN@"
	db 0 ; normal

	; party
	db 32, SEAKING
	db 34, POLITOED
	db 33, SANDSLASH

	db $ff ; end

; ================

	; CAMPER (8)
	db "SID@"
	db 0 ; normal

	; party
	db 31, DODUO
	db 32, DUGTRIO
	db 35, POLIWRATH

	db $ff ; end

; ================

	; CAMPER (9)
	db "HARVEY@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (10)
	db "DALE@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (11)
	db "TED@"
	db 0 ; normal

	; party
	db 33, AMPHAROS
	db 30, NIDOKING

	db $ff ; end

; ================

	; CAMPER (12)
	db "TODD@"
	db 0 ; normal

	; party
	db 17, GEODUDE
	db 17, GEODUDE
	db 23, PSYDUCK

	db $ff ; end

; ================

	; CAMPER (13)
	db "TODD@"
	db 0 ; normal

	; party
	db 23, GEODUDE
	db 23, GEODUDE
	db 26, PSYDUCK

	db $ff ; end

; ================

	; CAMPER (14)
	db "THOMAS@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (15)
	db "LEROY@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (16)
	db "DAVID@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (17)
	db "JOHN@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (18)
	db "JOAH@" ;Russet Gym
	db 0 ; normal

	; party
	db 35, VICTREEBEL
	db 33, JUMPLUFF
	db 36, VILEPLUME

	db $ff ; end

; ================

	; CAMPER (19)
	db "SPENCER@"
	db 0 ; normal

	; party
	db 27, ARBOK
	db 28, ARBOK

	db $ff ; end

; ================

	; CAMPER (20)
	db "TODD@"
	db 0 ; normal

	; party
	db 30, GRAVELER
	db 30, GRAVELER
	db 30, SLUGMA
	db 32, PSYDUCK

	db $ff ; end

; ================

	; CAMPER (21)
	db "TODD@"
	db 1 ; moves

	; party

	db 33, GRAVELER
		db SELFDESTRUCT
		db ROCK_THROW
		db HARDEN
		db MAGNITUDE

	db 33, GRAVELER
		db SELFDESTRUCT
		db ROCK_THROW
		db HARDEN
		db MAGNITUDE

	db 36, MAGCARGO
		db ROCK_THROW
		db HARDEN
		db AMNESIA
		db FLAMETHROWER

	db 34, GOLDUCK
		db DISABLE
		db PSYCHIC_M
		db SURF
		db PSYCH_UP

	db $ff ; end

; ================

	; CAMPER (22)
	db "QUENTIN@"
	db 0 ; normal

	; party
	db 30, FEAROW
	db 32, FEAROW
	db 31, SCYTHER

	db $ff ; end

; ================
; ================================


ExecutiveFGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "EXECUTIVE@"
	db 0 ; normal

	; party

	db 17, MEOWTH
	db 18, PERSIAN
	db $ff ; end

; ================

	; EXECUTIVEF (2)
	db "EXECUTIVE@"
	db 1 ; moves

	; party

	db 23, ARBOK
		db WRAP
		db LEER
		db POISON_STING
		db BITE

	db 23, GLOOM
		db ABSORB
		db SWEET_SCENT
		db SLEEP_POWDER
		db ACID

	db 25, MURKROW
		db PECK
		db PURSUIT
		db HAZE
		db 0

	db $ff ; end

; ================

	; EXECUTIVEF (3) ;STUDIO ACTOR
	db "EXECUTIVE@"
	db 1 ; moves

	; party

	db 42, ARBOK
		db WRAP
		db LEER
		db POISON_STING
		db BITE

	db 41, GLOOM
		db ABSORB
		db SWEET_SCENT
		db SLEEP_POWDER
		db ACID

	db 42, MURKROW
		db PECK
		db PURSUIT
		db HAZE
		db 0

	db $ff ; end

; ================
; ================================


SageGroup:
; ================================
; ================

	; SAGE (1) ;CULT SAGE 1
	db "ALBERTO@" ;CHOW
	db 0 ; normal

	; party
	db 38, PRIMEAPE
	db 40, HAUNTER
	db 41, WEEZING
	db 40, HAUNTER

	db $ff ; end

; ================

	; SAGE (2) ;CULT SAGE 2
	db "NEALO@" ;NICO
	db 0 ; normal

	; party
	db 39, HAUNTER
	db 40, GENGAR
	db 41, WEEPINBELL
	db 40, WEEPINBELL

	db $ff ; end

; ================

	; SAGE (3)
	db "JIN@"
	db 0 ; normal

	; party
	db 6, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (4)
	db "TROY@"
	db 0 ; normal

	; party
	db 15, FARFETCH_D
	db 15, MACHOP

	db $ff ; end

; ================

	; SAGE (5) ;GYM3COOLTRAINERM
	db "JEFFREY@"
	db 0 ; normal

	; party
	db 22, SCYTHER
	db 20, PIDGEOTTO
	

	db $ff ; end

; ================

	; SAGE (6) ;GYM3COOLTRAINERM
	db "PING@"
	db 0 ; normal

	; party
	db 16, PIDGEOTTO
	db 18, NOCTOWL
	db 16, NOCTOWL

	db $ff ; end

; ================

	; SAGE (7)
	db "EDMOND@"
	db 0 ; normal

	; party
	db 14, MANKEY
	db 13, GEODUDE
	db 10, HERACROSS

	db $ff ; end

; ================

	; SAGE (8)
	db "NEAL@"
	db 0 ; normal

	; party
	db 17, CUBONE

	db $ff ; end

; ================

	; SAGE (9)
	db "LI@"
	db 0 ; normal

	; party
	db 16, TYROGUE
	db 17, SUDOWOODO
	db 18, MACHOP
	db 15, SNEASEL
	
	db $ff ; end

; ================

	; SAGE (10)
	db "GAKU@"
	db 0 ; normal

	; party
	db 32, NOCTOWL
	db 32, FLAREON

	db $ff ; end

; ================

	; SAGE (11)
	db "MASA@"
	db 0 ; normal

	; party
	db 32, NOCTOWL
	db 32, JOLTEON

	db $ff ; end

; ================

	; SAGE (12)
	db "KOJI@"
	db 0 ; normal

	; party
	db 32, NOCTOWL
	db 32, VAPOREON

	db $ff ; end

; ================
; ================================


MediumGroup:
; ================================
; ================

	; MEDIUM (1)
	db "MARTHA@" ;GYM3COOLTRAINERF
	db 0 ; normal

	; party
	db 18, PIDGEOTTO
	db 17, SKIPLOOM

	db $ff ; end

; ================

	; MEDIUM (2) ;GYM3COOLTRAINERF
	db "GRACE@"
	db 0 ; normal

	; party
	db 18, SKIPLOOM
	db 17, PIDGEOTTO

	db $ff ; end

; ================

	; MEDIUM (3)
	db "BETHANY@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (4)
	db "MARGRET@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (5)
	db "ETHEL@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (6)
	db "REBECCA@" ;LASS MANDIE
	db 0 ; normal

	; party
	db 35, ARCANINE
	db 34, NINETALES

	db $ff ; end

; ================

	; MEDIUM (7)
	db "DORIS@" ;LASS ADELINA
	db 0 ; normal

	; party
	db 34, NINETALES
	db 36, ARCANINE
	db 34, ARCANINE

	db $ff ; end

; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER (1)
	db "RONALD@"
	db 0 ; normal

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db $ff ; end

; ================

	; BOARDER (2) ;GYM6HIKER
	db "BRAD@"
	db 0 ; normal

	; party
	db 26, KABUTO
	db 27, OMANYTE

	db $ff ; end

; ================

	; BOARDER (3) ;GYM6HIKER
	db "DOUGLAS@"
	db 0 ; normal

	; party
	db 25, GEODUDE
	db 26, GRAVELER
	db 24, RHYHORN

	db $ff ; end
	
; ================
	
	; BOARDER (4) ;Cerulean Gym
	db "RONALD@" ;SKATER RONALD
	db 0 ; normal

	; party
	db 37, NIDORINA
	db 36, GOLBAT

	db $ff ; end

; ================
	
	; BOARDER (3) ;Cerulean Gym
	db "BRAD@" ;SNOWBORDER BRAD
	db 0 ; normal

	; party
	db 35, GOLBAT
	db 35, GRIMER

	db $ff ; end
	
; ================	
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM (1)
	db "WILLIAM@"
	db 2 ; item

	; party
	db 23, GROWLITHE, BERRY

	db $ff ; end

; ================

	; POKEFANM (2)
	db "DEREK@"
	db 0 ; normal

	; party
	db 20, PIKACHU
	db 22, MEOWTH

	db $ff ; end

; ================

	; POKEFANM (3)
	db "ROBERT@"
	db 2 ; item

	; party
	db 33, QUAGSIRE, BERRY

	db $ff ; end

; ================

	; POKEFANM (4)
	db "JOSHUA@"
	db 2 ; item

	; party
	db 32, PIKACHU, BERRY
	db 36, RAICHU, BERRY
	db 35, CLEFABLE, BERRY

	db $ff ; end

; ================

	; POKEFANM (5)
	db "CARTER@"
	db 2 ; item

	; party
	db 25, IVYSAUR, BERRY
	db 35, CHARMELEON, BERRY
	db 34, WARTORTLE, BERRY

	db $ff ; end

; ================

	; POKEFANM (6)
	db "TREVOR@"
	db 2 ; item

	; party
	db 38, RAICHU, SUPER_POTION
	db 38, RAICHU, HYPER_POTION

	db $ff ; end

; ================

	; POKEFANM (7)
	db "BRANDON@"
	db 0 ; normal

	; party
	db 9, PIKACHU

	db $ff ; end

; ================

	; POKEFANM (8)
	db "JEREMY@"
	db 2 ; item

	; party
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY

	db $ff ; end

; ================

	; POKEFANM (9)
	db "COLIN@"
	db 2 ; item

	; party
	db 32, DELIBIRD, BERRY

	db $ff ; end

; ================

	; POKEFANM (10)
	db "DEREK@"
	db 2 ; item

	; party
	db 19, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (11)
	db "DEREK@"
	db 2 ; item

	; party
	db 36, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (12)
	db "ALEX@"
	db 2 ; item

	; party
	db 33, NIDOKING, BERRY
	db 35, NIDOQUEEN, BERRY

	db $ff ; end

; ================

	; POKEFANM (13)
	db "REX@"
	db 2 ; item

	; party
	db 35, TEDDIURSA, BERRY
	db 36, GRANBULL, BERRY

	db $ff ; end

; ================

	; POKEFANM (14)
	db "ALLAN@"
	db 2 ; item

	; party
	db 35, TEDDIURSA, BERRY
	db 37, URSARING, MIRACLEBERRY
	db 37, URSARING, MIRACLEBERRY

	db $ff ; end

; ================
; ================================


KimonoGirlGroup:
; ================================
; ================

	; KIMONO_GIRL (1)
	db "NAOKO@"
	db 0 ; normal

	; party
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM

	db $ff ; end

; ================

	; KIMONO_GIRL (2)
	db "NAOKO@"
	db 0 ; normal

	; party
	db 17, FLAREON

	db $ff ; end

; ================

	; KIMONO_GIRL (3)
	db "SAYO@"
	db 0 ; normal

	; party
	db 17, ESPEON

	db $ff ; end

; ================

	; KIMONO_GIRL (4)
	db "ZUKI@"
	db 0 ; normal

	; party
	db 17, UMBREON

	db $ff ; end

; ================

	; KIMONO_GIRL (5)
	db "KUNI@"
	db 0 ; normal

	; party
	db 17, VAPOREON

	db $ff ; end

; ================

	; KIMONO_GIRL (6)
	db "MIKI@"
	db 0 ; normal

	; party
	db 17, JOLTEON

	db $ff ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS (1)
	db "AMY & MAY@" ;GYM2GUITARIST
	db 0 ; normal

	; party
	db 10, MAREEP
	db 13, MAREEP

	db $ff ; end

; ================

	; TWINS (2)
	db "ANN & ANNE@"
	db 0 ; normal

	; party

	db 20, STEELIX
	db 22, SCYTHER

	db $ff ; end

; ================

	; TWINS (3)
	db "ANN & ANNE@"
	db 0 ; normal

	; party

	db 23, MARILL
	db 22, GROWLITHE
	db 20, HOPPIP

	db $ff ; end

; ================

	; TWINS (4)
	db "AMY & MAY@"
	db 0 ; normal

	; party
	db 10, LEDYBA
	db 10, SPINARAK

	db $ff ; end

; ================

	; TWINS (5)
	db "JO & ZOE@" ;COOLTRAINER_F ROBINA
	db 0 ; normal

	; party
	db 35, PERSIAN
	db 36, PERSIAN

	db $ff ; end

; ================

	; TWINS (6)
	db "JO & ZOE@"
	db 0 ; normal

	; party
	db 35, VILEPLUME
	db 35, VICTREEBEL

	db $ff ; end

; ================

	; TWINS (7)
	db "MEG & PEG@"
	db 0 ; normal

	; party
	db 31, TEDDIURSA
	db 31, PHANPY

	db $ff ; end

; ================

	; TWINS (8)
	db "MEG & PEG@"
	db 0 ; normal

	; party
	db 31, PHANPY
	db 31, TEDDIURSA

	db $ff ; end

; ================

	; TWINS (9)
	db "LEA & PIA@"
	db 1 ; moves

	; party

	db 35, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db FLAMETHROWER
		db HEADBUTT

	db 35, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db ICE_BEAM
		db HEADBUTT

	db $ff ; end

; ================

	; TWINS (10)
	db "LEA & PIA@"
	db 1 ; moves

	; party

	db 38, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db ICE_BEAM
		db HEADBUTT

	db 38, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db FLAMETHROWER
		db HEADBUTT

	db $ff ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF (1)
	db "BEVERLY@"
	db 2 ; item

	; party
	db 22, VULPIX, BERRY
	db 21, VULPIX, BERRY

	db $ff ; end

; ================

	; POKEFANF (2)
	db "RUTH@"
	db 0 ; normal

	; party
	db 21, CLEFAIRY
	db 20, JIGGLYPUFF

	db $ff ; end

; ================

	; POKEFANF (3)
	db "BEVERLY@"
	db 2 ; item

	; party
	db 18, SNUBBULL, BERRY

	db $ff ; end

; ================

	; POKEFANF (4)
	db "BEVERLY@"
	db 2 ; item

	; party
	db 30, GRANBULL, BERRY

	db $ff ; end

; ================

	; POKEFANF (5)
	db "GEORGIA@"
	db 2 ; item

	; party
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 28, FURRET, BERRY
	db 23, SENTRET, BERRY

	db $ff ; end

; ================

	; POKEFANF (6)
	db "JAIME@"
	db 2 ; item

	; party
	db 16, MEOWTH, BERRY

	db $ff ; end

; ================
; ================================


RedGroup:
; ================================
; ================

	; RED (1)
	db "BRONZE@"
	db 1 ; moves

	; party

	db 74, RAICHU
		db CHARM
		db QUICK_ATTACK
		db THUNDERBOLT
		db THUNDER

	db 73, FERALIGATR
        db SCREECH
        db BITE
        db SURF
        db HYDRO_PUMP

	db 75, CHARIZARD
        db DRAGON_RAGE
        db FLY
        db FLAMETHROWER
        db FIRE_BLAST

	db 73, KANGASKHAN
        db REVERSAL
        db ENDURE
        db DIZZY_PUNCH
        db STRENGTH

	db 77, SUDOWOODO
        db MIMIC
        db LOW_KICK
        db SLAM
        db ROCK_SLIDE

	db 75, TOGETIC
        db SAFEGUARD
        db FLASH
        db METRONOME
        db DOUBLE_EDGE

	db $ff ; end

; ================
; ================================


BlueGroup:
; ================================
; ================

	; BLUE (1)
	db "SARAH@" ;SARAH
	db 1 ; moves

	; party

	db 42, QUAGSIRE
		db EARTHQUAKE
		db SLAM
		db AMNESIA
		db HEADBUTT

	db 47, BLASTOISE
		db SURF
		db WITHDRAW
		db HYDRO_PUMP
		db SKULL_BASH
		
	db 46, STARMIE
		db BUBBLEBEAM
		db RECOVER
		db CONFUSE_RAY
		db RAIN_DANCE

	db $ff ; end

; ================
; ================================


OfficerGroup:
; ================================
; ================

	; OFFICER (1)
	db "KEITH@"
	db 0 ; normal

	; party
	db 17, GROWLITHE

	db $ff ; end

; ================

	; OFFICER (2)
	db "DIRK@"
	db 0 ; normal

	; party
	db 14, GROWLITHE
	db 14, GROWLITHE

	db $ff ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF (1)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 10, HOUNDOUR

	db $ff ; end

; ================

	; GRUNTF (2) ;GAME CORNER HIDEOUT
	db "GRUNT@"
	db 0 ; normal

	; party
	db 18, EKANS

	db $ff ; end

; ================

	; GRUNTF (3)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, GLOOM
	db 25, GLOOM

	db $ff ; end

; ================

	; GRUNTF (4)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 18, EKANS
	db 17, GRIMER
	db 19, GLOOM

	db $ff ; end

; ================

	; GRUNTF (5)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 30, ARBOK
	db 27, GLOOM
	db 29, VILEPLUME

	db $ff ; end

; ================
; ================================


MysticalmanGroup:
; ================================
; ================

	; MYSTICALMAN (1)
	db "EUSINE@"
	db 1 ; moves

	; party

	db 23, DROWZEE
		db DREAM_EATER
		db HYPNOSIS
		db DISABLE
		db CONFUSION

	db 23, HAUNTER
		db LICK
		db HYPNOSIS
		db MEAN_LOOK
		db CURSE

	db 25, ELECTRODE
		db SCREECH
		db SONICBOOM
		db THUNDER
		db ROLLOUT

	db $ff ; end

; ================
; ================================

