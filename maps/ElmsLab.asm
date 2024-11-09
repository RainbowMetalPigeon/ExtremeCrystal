	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_OFFICER
	const ELMSLAB_OPAL

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script ElmsLabNoop1Scene,   SCENE_ELMSLAB_NOOP
	scene_script ElmsLabNoop2Scene,   SCENE_ELMSLAB_MEET_OFFICER
	scene_const SCENE_ELMSLAB_AIDE_GIVES_POTIONS_AND_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

;ElmsLabMeetElmScene:
;	sdefer ElmsLabWalkUpToElmScript
;	end

ElmsLabNoop1Scene:
	end

ElmsLabNoop2Scene:
	end

ElmsLabMoveElmCallback:
	checkscene
	ifequal SCENE_ELMSLAB_MEET_OFFICER, .Skip
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

;ElmsLabWalkUpToElmScript:
;	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
;	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
;	turnobject ELMSLAB_ELM, RIGHT
;	opentext
;	writetext ElmText_Intro
;.MustSayYes:
;	yesorno
;	iftrue .ElmGetsEmail
;	writetext ElmText_Refused
;	sjump .MustSayYes
;.ElmGetsEmail:
;	writetext ElmText_Accepted
;	promptbutton
;	writetext ElmText_ResearchAmbitions
;	waitbutton
;	closetext
;	playsound SFX_GLASS_TING
;	pause 30
;	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
;	turnobject ELMSLAB_ELM, DOWN
;	opentext
;	writetext ElmText_GotAnEmail
;	waitbutton
;	closetext
;	opentext
;	turnobject ELMSLAB_ELM, RIGHT
;	writetext ElmText_MissionFromMrPokemon
;	waitbutton
;	closetext
;	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
;	turnobject PLAYER, UP
;	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
;	turnobject PLAYER, RIGHT
;	opentext
;	writetext ElmText_ChooseAPokemon
;	waitbutton
;	setscene SCENE_ELMSLAB_CANT_LEAVE
;	closetext
;	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	; TBE into a badge counter
;	checkflag ENGINE_RISINGBADGE
;	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_WYNAUT_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_WYNAUT_OVER_THE_PHONE
	iffalse ElmCheckWynautEgg
	; TBE when I have added Wynaut
;	loadmonindex 1, WYNAUT
;	special FindPartyMonThatSpeciesYourTrainerID
;	iftrue ShowElmWynautScript
	loadmonindex 2, WOBBUFFET
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmWynautScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	; TBE when I have added Wynaut
;	loadmonindex 1, WYNAUT
;	special FindPartyMonThatSpeciesYourTrainerID
;	iftrue ShowElmWynautScript
	loadmonindex 2, WOBBUFFET
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmWynautScript
	sjump ElmCheckGotEggAgain

ElmCheckWynautEgg:
	checkevent EVENT_GOT_WYNAUT_EGG_FROM_MX_POKEMON
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_WYNAUT_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain: ; TBE
	checkevent EVENT_GOT_WYNAUT_EGG_FROM_MX_POKEMON ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
;	checkflag ENGINE_ZEPHYRBADGE
;	iftrue ElmAideHasEggScript
;	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
;	iftrue ElmStudyingEggScript
;	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
;	iftrue ElmAfterTheftScript
;	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
;	iftrue ElmDescribesMrPokemonScript
	checkevent EVENT_COP_AND_OPAL_LEFT_ELMS_LAB
	iftrue ElmTogeiFromOpalFromEggFromMxPokemonScript
	checkevent EVENT_GOT_TOGEPI_FROM_OPAL
	iftrue ElmHurriesYouToChaseThiefScript
	writetext ElmHurriesYouToGoToOpalText
	waitbutton
	closetext
	end

ElmDirectionsScript: ; TBE
	turnobject PLAYER, UP

	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext

	addcellnum PHONE_ELM

	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext

	turnobject ELMSLAB_ELM, LEFT

	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext

	turnobject ELMSLAB_ELM, DOWN

	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext

	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_TOGEPI_FROM_OPAL
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end
.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end
ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

;ElmLetYourMonBattleItScript:
;	writetext ElmText_LetYourMonBattleIt
;	waitbutton
;	closetext
;	end
	
ElmTogeiFromOpalFromEggFromMxPokemonScript:
	writetext ElmText_TogeiFromOpalFromEggFromMxPokemon
	waitbutton
	closetext
	end

ElmHurriesYouToChaseThiefScript:
	writetext ElmHurriesYouToChaseThiefText
	waitbutton
	closetext
	end
	
ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmWynautScript:
	writetext ShowElmWynautText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_WYNAUT_TO_ELM
	opentext
	writetext ShowElmWynautText2
	promptbutton
	writetext ShowElmWynautText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

AideScript_WalkPotionsBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouPotionsBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotionsBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouPotionsBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouPotionsBalls:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION, 1
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	writetext AideText_AfterTheft ; AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

;AideScript_GiveYouBalls:
;	opentext
;	writetext AideText_GiveYouBalls
;	promptbutton
;	getitemname STRING_BUFFER_4, POKE_BALL
;	scall AideScript_ReceiveTheBalls
;	giveitem POKE_BALL, 5
;	writetext AideText_ExplainBalls
;	promptbutton
;	itemnotify
;	closetext
;	setscene SCENE_ELMSLAB_NOOP
;	end

ElmsAideScript: ; TBE
	faceplayer
	simpletext AideText_AlwaysBusy ; AideText_AfterTheft
;	opentext
;	checkevent EVENT_GOT_WYNAUT_EGG_FROM_MX_POKEMON
;	iftrue AideScript_AfterTheft
;	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
;	iftrue AideScript_ExplainBalls
;	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
;	iftrue AideScript_TheftTestimony
;	writetext AideText_AlwaysBusy
;	waitbutton
;	closetext
	end

;AideScript_TheftTestimony:
;	writetext AideText_TheftTestimony
;	waitbutton
;	closetext
;	end

;AideScript_ExplainBalls:
;	writetext AideText_ExplainBalls
;	waitbutton
;	closetext
;	end

;AideScript_AfterTheft:
;	writetext AideText_AfterTheft
;	waitbutton
;	closetext
;	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft
MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT

	simpletext ElmsLabOfficerText1
;	special NameRival

	appear ELMSLAB_OPAL
	applymovement ELMSLAB_OPAL, OpalArrivesMovements
	simpletext ElmsLabOpalText1

	simpletext ElmsLabOfficerText2

	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER

	turnobject ELMSLAB_OPAL, DOWN
	simpletext ElmsLabOpalText2

	simpletext ElmsLab_ElmPostCopText1
	
	turnobject ELMSLAB_OPAL, UP
	simpletext ElmsLabOpalText3

	simpletext ElmsLab_ElmPostCopText2

	applymovement ELMSLAB_OPAL, OpalFacesElmMovements
	turnobject PLAYER, UP

	simpletext ElmsLab_ElmPostCopText3

	simpletext ElmsLabOpalText4

	simpletext ElmsLab_ElmPostCopText4

	opentext
	writetext ElmsLab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	waitbutton
	closetext
	
	simpletext ElmsLabOpalText5

	simpletext ElmsLab_ElmPostCopText5

	simpletext ElmsLabOpalText6
	turnobject ELMSLAB_OPAL, LEFT
	turnobject PLAYER, RIGHT
	simpletext ElmsLabOpalText7

	applymovement ELMSLAB_OPAL, OpalLeavesMovement1
	turnobject PLAYER, DOWN
	applymovement ELMSLAB_OPAL, OpalLeavesMovement2
	disappear ELMSLAB_OPAL

	setscene SCENE_ELMSLAB_AIDE_GIVES_POTIONS_AND_POKE_BALLS
	setevent EVENT_COP_AND_OPAL_LEFT_ELMS_LAB
	end

ElmsLabWindow:
	simpletext ElmsLabWindowText
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OpalArrivesMovements:
	step UP
	step UP
	step UP
	step UP
	step_end

OpalFacesElmMovements:
	step RIGHT
	step UP
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OpalLeavesMovement1:
	step DOWN
	step DOWN
	step_end

OpalLeavesMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I needed to ask"
	line "you a favor."

	para "I'm conducting new"
	line "#MON research"

	para "right now. I was"
	line "wondering if you"

	para "could help me with"
	line "it, <PLAY_G>."

	para "You see…"

	para "I'm writing a"
	line "paper that I want"

	para "to present at a"
	line "conference."

	para "But there are some"
	line "things I don't"

	para "quite understand"
	line "yet."

	para "So!"

	para "I'd like you to"
	line "raise a #MON"

	para "that I recently"
	line "caught."
	done

ElmText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "You're a great"
	line "help!"
	done

ElmText_Refused:
	text "But… Please, I"
	line "need your help!"
	done

ElmText_ResearchAmbitions:
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done

ElmText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

;ElmText_LetYourMonBattleIt:
;	text "If a wild #MON"
;	line "appears, let your"
;	cont "#MON battle it!"
;	done

ElmText_TogeiFromOpalFromEggFromMxPokemon:
	text "The TOGEPI you got"
	line "from OPAL hatched"
	cont "from an EGG that"
	cont "OPAL received from"
	cont "MX.#MON."

	para "Maybe you could"
	line "pay them a visit?"
	cont "They live north of"
	cont "CHERRYGROVE CITY."
	done

LabWhereGoingText:
	text "ELM: Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "ELM: You'll take"
	line "CYNDAQUIL, the"
	cont "fire #MON?"
	done

TakeTotodileText:
	text "ELM: Do you want"
	line "TOTODILE, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "ELM: So, you like"
	line "CHIKORITA, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR.#MON lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "MR.#MON goes"
	line "everywhere and"
	cont "finds rarities."

	para "Too bad they're"
	line "just rare and"
	cont "not very useful…"
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmHurriesYouToChaseThiefText: ; TBE
	text "Hurry! Go"
	line "chase thief!"
	done

ElmHurriesYouToGoToOpalText: ; TBE
	text "Hurry! Go"
	line "to OPAL!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "Didn't you meet my"
	cont "assistant?"

	para "He should have met"
	line "you with the EGG"

	para "at VIOLET CITY's"
	line "#MON CENTER."

	para "You must have just"
	line "missed him. Try to"
	cont "catch him there."
	done

ElmWaitingEggHatchText:
	text "ELM: Hey, has that"
	line "EGG changed any?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? I thought"
	line "the EGG hatched."

	para "Where is the"
	line "#MON?"
	done

ShowElmWynautText1:
	text "ELM: <PLAY_G>, you"
	line "look great!"
	done

ShowElmWynautText2:
	text "What?"
	line "That #MON!?!"
	done

ShowElmWynautText3:
	text "The EGG hatched!"
	line "So, #MON are"
	cont "born from EGGS…"

	para "No, perhaps not"
	line "all #MON are."

	para "Wow, there's still"
	line "a lot of research"
	cont "to be done."
	done

ElmGiveEverstoneText1:
	text "Thanks, <PLAY_G>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done

ElmGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done

AideText_AfterTheft:
	text "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"
	cont "person turns bad"
	cont "itself."
	done

ElmGiveMasterBallText1:
	text "ELM: Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done

ElmGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAY_G>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

ElmsLabMonEggText: ; unreferenced
	text "It's the #MON"
	line "EGG being studied"
	cont "by PROF.ELM."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have this"
	cont "for your errand."
	done

AideText_AlwaysBusy:
	text "There are only two"
	line "of us, so we're"
	cont "always busy."
	done

;AideText_TheftTestimony:
;	text "There was a loud"
;	line "noise outside…"
;
;	para "When we went to"
;	line "look, someone"
;	cont "stole a #MON."
;
;	para "It's unbelievable"
;	line "that anyone would"
;	cont "do that!"
;
;	para "…sigh… That"
;	line "stolen #MON."
;
;	para "I wonder how it's"
;	line "doing."
;
;	para "They say a #MON"
;	line "raised by a bad"
;
;	para "person turns bad"
;	line "itself."
;	done

;AideText_GiveYouBalls:
;	text "<PLAY_G>!"
;
;	para "Use these on your"
;	line "#DEX quest!"
;	done

AideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

ElmsLabOfficerText1:
	text "So some #MON"
	line "were stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.ELM."

	para "What?"
	line "You chased and met"
	cont "the culprit?"
	cont "But you couldn't"
	cont "stop them?"
	
	para "Did you at least"
	line "manage to get any"
	cont "info? Their name,"
	cont "hideout, motives,"
	cont "anything?"

	para "Nothing at all?"
	line "That's useless…"
	done

ElmsLabOpalText1:
	text "OPAL: Don't be so"
	line "harsh on <PLAYER>!"

	para "They got a #MON"
	line "just now and they"
	cont "got dragged into"
	cont "this mega mess out"
	cont "of the blue!"
	cont "They already did"
	cont "super great!"

	para "And their battle"
	line "with the thief"
	cont "gave me time to"
	cont "catch up."

	para "I investigated the"
	line "surroundings, and"
	cont "it seems the thief"
	cont "ran beyond"
	cont "CHERRYGROVE CITY."

	para "I couldn't catch up"
	line "to them anymore,"
	cont "so I came back to"
	cont "report."
	done

ElmsLabOfficerText2:
	text "Mh. I see. Better"
	line "than nothing."

	para "We will continue"
	line "our investigations"
	cont "from there, after"
	cont "verifying the"
	cont "correctedness of"
	cont "your statements."

	para "Do not get"
	line "more involved."
	cont "You may interfere"
	cont "with our job."
	cont "Leave this to us"
	cont "professionals."
	done

ElmsLabOpalText2:
	text "OPAL: 'Better"
	line "than nothing'..."
	cont "That means better"
	cont "than you did,"
	cont "'professionals'."

	para "If they'll be as"
	line "efficient as they"
	cont "were 3 years ago"
	cont "in stopping TEAM"
	cont "ROCKET, we're"
	cont "mega screwed."
	done

ElmsLab_ElmPostCopText1:
	text "ELM: OPAL! No need"
	line "to be so mean!"
	done

ElmsLabOpalText3:
	text "OPAL: Sorry PROF,"
	line "I overdid. But"
	cont "that attitude got"
	cont "on my nerves."
	done

ElmsLab_ElmPostCopText2:
	text "ELM: All good."
	line "Now, please come"
	cont "here."

	para "There's something"
	line "else I'd like to"
	cont "talk with you two."
;	xxxx "123456789012345678"
	done

ElmsLab_ElmPostCopText3:
	text "ELM: This should've"
	line "been a grand day."

	para "<PLAYER>, you were"
	line "meant to receive"
	cont "your starter."

	para "In a way, you did,"
	line "even if I couldn't"
	cont "offer you the"
	cont "usual choice."

	para "OPAL, if that is"
	line "okay for with you,"
	cont "I'd like to"
	cont "entrust TOGEPI to"
	cont "<PLAYER> as their"
	cont "starter #MON."
	done

ElmsLabOpalText4:
	text "OPAL: Of course!"
	line "I feel those two"
	cont "bonded already so"
	cont "much I'd feel mega"
	cont "bad in separating"
	cont "them now anyhow!"
	done

ElmsLab_ElmPostCopText4:
	text "ELM: Excellent."
	line "Thank you very"
	cont "much, OPAL."

	para "This said… I'd like"
	line "to thank you two"
	cont "for the great help"
	cont "you gave me today."

	para "These is an"
	line "incredibly rare"
	cont "and valuable tool."

	para "I'd be happy if"
	line "you accepted it"
	cont "and made good use"
	cont "of it!"
	done

ElmsLab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

ElmsLabOpalText5:
	text "OPAL: Wooow!!!"
	line "Is this really a"
	cont "#DEX?!"

	para "PROF, thank you"
	line "so super much!"
	cont "This is ultra"
	cont "cool! I know that"
	cont "very few selected"
	cont "trainers have it!"
	done

ElmsLab_ElmPostCopText5:
	text "ELM: That's quite"
	line "correct!"

	para "And I know just"
	line "how much you like"
	cont "rare and peculiar"
	cont "#MON, OPAL."
	cont "The #DEX should"
	cont "prove itself quite"
	cont "handy to you!"

	para "<PLAYER>, I'm sorry"
	line "your first day as"
	cont "a trainer has been"
	cont "so chaotic."

	para "I hope it will not"
	line "discourage you!"
	cont "If anything, it's"
	cont "a good training"
	cont "for the great,"
	cont "unpredictable"
	cont "adventure that is"
	cont "life itself!"

	para "What will be your"
	line "main objective?"
	cont "Encounter as many"
	cont "#MON as"
	cont "possible?"
	cont "Take on the GYM"
	cont "CHALLENGE to face"
	cont "the LEAGUE?"
	done

ElmsLabOpalText6:
	text "OPAL: I know!"
	line "I'll find all rare"
	cont "#MON, and I"
	cont "won't stop chasing"
	cont "that damned thief!"
	done

ElmsLabOpalText7:
	text "<PLAYER>! Enough"
	line "idling! Let's go!"
	cont "I look forward to"
	cont "cross our paths"
	cont "soon and see how"
	cont "we grew!"
;	xxxx "123456789012345678"
	done

ElmsLabWindowText:
	text "The thief broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"
	cont "A Button to switch"
	cont "moves."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.ELM"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTIONS_AND_POKE_BALLS, AideScript_WalkPotionsBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTIONS_AND_POKE_BALLS, AideScript_WalkPotionsBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	object_event  4,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_OPAL_IN_ELMS_LAB ; TBE, SPRITE_OPAL, PAL
