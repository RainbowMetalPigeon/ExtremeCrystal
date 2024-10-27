	object_const_def
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_RIVAL ; new
	const ROUTE29_OPAL_1 ; new
	const ROUTE29_OPAL_2 ; new
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	def_scene_scripts
	scene_script Route29Noop3Scene, SCENE_ROUTE29_RIVAL_FACE_OFF ; new
	scene_script Route29Noop4Scene, SCENE_ROUTE29_OPAL_BLOCKS_WAY ; new
	scene_script Route29Noop1Scene, SCENE_ROUTE29_NOOP
	scene_script Route29Noop2Scene, SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29TuscanyCallback

Route29Noop1Scene:
	end

Route29Noop2Scene:
	end

Route29Noop3Scene: ; new
	end

Route29Noop4Scene: ; new
	end

Route29TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE29_NOOP
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE29_NOOP
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29RivalFaceOff: ; new
	turnobject ROUTE29_RIVAL, DOWN
	pause 7
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	simpletext Route29RivalText1
	applymovement ROUTE29_RIVAL, Route29_RivalMovement1
	simpletext Route29RivalText2
; start the battle
	winlosstext RivalRoute29WinText, RivalRoute29LossText
	setlasttalked ROUTE29_RIVAL
	loadtrainer RIVAL1, RIVAL1_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
    readvar VAR_BATTLERESULT ; WIN=0, LOSE=1
    ifnotequal $0, .AfterYourDefeat
.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	simpletext Route29RivalText_YouWon
	sjump .FinishRival
.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	simpletext Route29RivalText_YouLost
.FinishRival:
	applymovement ROUTE29_RIVAL, Route29_RivalMovement2
	disappear ROUTE29_RIVAL
	special HealParty
	playmapmusic
; Opal arrival
	appear ROUTE29_OPAL_1
	pause 10
	simpletext Route29Opal1Text1
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	applymovement ROUTE29_OPAL_1, Route29_Opal1Movement1
	turnobject PLAYER, DOWN
	applymovement ROUTE29_OPAL_1, Route29_Opal1Movement2
; Opal goes searching for Silver
	simpletext Route29Opal1Text2
	applymovement PLAYER, Route29_PlayerMovesAwayMovement1
	applymovement ROUTE29_OPAL_1, Route29_Opal1Movement3
	disappear ROUTE29_OPAL_1
	setscene SCENE_ROUTE29_OPAL_BLOCKS_WAY
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
; end of Opal part
	end

Route29RivalText1:
	text "You again?!"
;	xxxx "123456789012345678"
	done

Route29RivalText2:
	text "I'll get rid of ya"
;	xxxx "123456789012345678"
	done

RivalRoute29WinText:
	text "WHAT?!"
;	xxxx "123456789012345678"
	done

RivalRoute29LossText:
	text "Tsk, ofc."
;	xxxx "123456789012345678"
	done

Route29RivalText_YouWon:
	text "How did you win?!"
	line "Gotta run!"
;	xxxx "123456789012345678"
	done

Route29RivalText_YouLost:
	text "Ahah, pathetic."
	line "Farewell loser!"
;	xxxx "123456789012345678"
	done

Route29_RivalMovement1: ; new
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

Route29_RivalMovement2: ; new
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

Route29Opal1Text1:
	text "<PLAYER>!"
	done

Route29_Opal1Movement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route29_Opal1Movement2:
	step UP
	step UP
	step_end

Route29Opal1Text2:
	text "Go to ELM"
	line "I search here"
	done

Route29_PlayerMovesAwayMovement1:
	step UP
	step LEFT
	turn_head RIGHT
	step_end

Route29_Opal1Movement3:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route29OpalBlocksWay: ; new
	turnobject ROUTE29_OPAL_2, RIGHT
	showemote EMOTE_SHOCK, ROUTE29_OPAL_2, 15
	simpletext Route29OpalBlocksWayText
	applymovement PLAYER, Route29_OpalBlocksWayPlayerMovement
	end

Route29OpalBlocksWayText:
	text "Go back to"
	line "New Bark Town!"
	done

Route29_OpalBlocksWayPlayerMovement:
	step RIGHT
	step_end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29RivalScript: ; new
Route29OpalScript: ; new
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route29YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route29TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

Route29FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

Route29CooltrainerMText_WaitingForDay: ; unreferenced
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route29CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29Sign2Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2
	coord_event 31, 13, SCENE_ROUTE29_RIVAL_FACE_OFF, Route29RivalFaceOff ; new
	coord_event 30,  6, SCENE_ROUTE29_OPAL_BLOCKS_WAY, Route29OpalBlocksWay ; new
	coord_event 30,  7, SCENE_ROUTE29_OPAL_BLOCKS_WAY, Route29OpalBlocksWay ; new

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 36,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29RivalScript, EVENT_ROUTE_29_RIVAL ; new, script is useless
	object_event 36, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29OpalScript, EVENT_ROUTE_29_OPAL_1 ; new, TBE with SPRITE_OPAL
	object_event 26,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29OpalScript, EVENT_ROUTE_29_OPAL_2 ; new, TBE with SPRITE_OPAL
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
