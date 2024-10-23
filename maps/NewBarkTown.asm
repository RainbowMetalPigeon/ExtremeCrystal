	object_const_def
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_RIVAL
	const NEWBARKTOWN_ELM

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script NewBarkTownNoop1Scene, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_script NewBarkTownNoop2Scene, SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlypointCallback

NewBarkTownNoop1Scene:
	end

NewBarkTownNoop2Scene:
	end

NewBarkTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouScene1: ; edited
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	simpletext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement1
	simpletext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement1
	stopfollow
	simpletext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouScene2: ; edited
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	simpletext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	simpletext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement2
	stopfollow
	simpletext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

NewBarkTownFisherScript:
	jumptextfaceplayer Text_ElmDiscoveredNewMon

NewBarkTown_RivalExitsLabScene: ; new
	checkevent EVENT_RIVAL_ESCAPES_FROM_LAB
	iftrue .done
	setevent EVENT_RIVAL_ESCAPES_FROM_LAB
; rival appears and run away
	playsound SFX_EXIT_BUILDING
	special FadeOutMusic
	appear NEWBARKTOWN_RIVAL
	turnobject PLAYER, UP
	pause 7
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, PLAYER, 15
	simpletext NewBarkTownRivalText1
	playsound SFX_TACKLE
	applymovement PLAYER, NewBarkTown_RivalShovesYouOutMovement
	applymovement NEWBARKTOWN_RIVAL, NewBarkTown_RivalEscapesOutMovement1
	turnobject PLAYER, LEFT
	applymovement NEWBARKTOWN_RIVAL, NewBarkTown_RivalEscapesOutMovement2
	disappear NEWBARKTOWN_RIVAL
	special FadeOutMusic
	pause 7
	special RestartMapMusic
; Elm appears
	playsound SFX_EXIT_BUILDING
	appear NEWBARKTOWN_ELM
	turnobject PLAYER, UP
	simpletext NewBarkTownElmText1
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement1 ; down x2
	simpletext NewBarkTownElmText2
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement2 ; left x2
	turnobject PLAYER, LEFT
	simpletext NewBarkTownElmText3
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement3 ; right x5
	turnobject PLAYER, RIGHT
	simpletext NewBarkTownElmText4
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement4 ; left x3
	turnobject PLAYER, UP
	simpletext NewBarkTownElmText5
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement5 ; up x1
	simpletext NewBarkTownElmText6
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement6 ; down x2
	simpletext NewBarkTownElmText7
	applymovement NEWBARKTOWN_ELM, NewBarkTown_ElmMovement7 ; up x2
	playsound SFX_ENTER_DOOR
	disappear NEWBARKTOWN_ELM
.done
	end
NewBarkTownRivalScript: ; unused
	simpletext NewBarkTownRivalText1
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign:
	jumptext NewBarkTownElmsHouseSignText

NewBarkTownOpalHouseSign: ; new
	jumptext NewBarkTownOpalHouseSignText

NewBarkTownElmsLabWindow: ; new
	checkevent EVENT_RIVAL_ESCAPES_FROM_LAB
	iftrue .postTheft
	simpletext NewBarkTownElmsLabWindowText_PreTheft
	end
.postTheft
	simpletext NewBarkTownElmsLabWindowText_PostTheft
	end
NewBarkTown_TeacherRunsToYouMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTown_TeacherRunsToYouMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

NewBarkTown_TeacherBringsYouBackMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_TeacherBringsYouBackMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_RivalShovesYouOutMovement:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

NewBarkTown_RivalEscapesOutMovement1: ; new
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

NewBarkTown_RivalEscapesOutMovement2: ; new
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTown_ElmMovement1: ; new
	step DOWN
	step DOWN
	step_end

NewBarkTown_ElmMovement2: ; new
	step LEFT
	step LEFT
	step_end

NewBarkTown_ElmMovement3: ; new
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

NewBarkTown_ElmMovement4: ; new
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN ; TBV
	step_end

NewBarkTown_ElmMovement5: ; new
	step UP
	step_end

NewBarkTown_ElmMovement6: ; new
	step DOWN
	step_end

NewBarkTown_ElmMovement7: ; new
	step UP
	step UP
	step_end
	
Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_ElmDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "I hear PROF.ELM"
	line "discovered some"
	cont "new #MON."
	done

NewBarkTownRivalText1: ; edited
	text "GET THE FUCK OUT!"
	done

NewBarkTownElmText1: ; new
	text "SOMEBODY STOP"
	line "THEM!"
	done

NewBarkTownElmText2: ; new
	text "Where did they"
	line "go?!"
	done

NewBarkTownElmText3: ; new
	text "They stole all of"
	line "my #MON!!!"
	done

NewBarkTownElmText4: ; new
	text "This is a"
	line "disaster!"

	para "They where the"
	line "starter #MON"
	cont "for new trainers!"

	para "What do I do now?!"
	done

NewBarkTownElmText5: ; new
	text "You are <PLAYER>,"
	line "aren't you?"

	para "You too had to get"
	line "your starter"
	cont "today!"

	para "What now?! You"
	line "can't leave the"
	cont "town without a"
	cont "#MON, I can't"
	cont "ask your help!"
	done

NewBarkTownElmText6: ; new
	text "I have to call the"
	line "police"
	cont "immediately!"

	para "Maybe they can"
	line "still catch the"
	cont "thief!"
	done

NewBarkTownElmText7: ; new
	text "I know!"

	para "OPAL, your"
	line "neighbour,"
	cont "recently got"
	cont "an EGG from"
	cont "MX. #MON."
	cont "It should have"
	cont "hatched by now!"

	para "Run to OPAL, tell"
	line "them the"
	cont "situation, and"
	cont "ask them to give"
	cont "you the newborn!"

	para "Then the two of"
	line "you can help me"
	cont "by chasing the"
	cont "thief!"

	para "I'm sorry I'm"
	line "asking all of"
	cont "this so suddenly,"
	cont "but it's an"
	cont "emergency!"
	done

NewBarkTownSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTownOpalHouseSignText: ; new
	text "OPAL'S HOUSE"
	done

NewBarkTownElmsLabWindowText_PreTheft: ; new
	text "Uh? A suspicious"
	line "person is nearing"
	cont "a table with"
	cont "three # BALLs"
	cont "on it..."
	done

NewBarkTownElmsLabWindowText_PostTheft: ; new
	text "It's the inside of"
	line "PROF. ELM's LAB!"

	para "It looks chaotic,"
	line "busy, and a bit"
	cont "old-style. In a"
	cont "word, scientific!"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1 ; edited, this is now Opal's house
	warp_event 11, 13, ELMS_HOUSE, 1

	def_coord_events
	coord_event  1,  8, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene1
	coord_event  1,  9, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene2
	coord_event  6,  4, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_RivalExitsLabScene ; TBE

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign
	bg_event  6, 11, BGEVENT_READ, NewBarkTownOpalHouseSign ; new
	bg_event  4,  2, BGEVENT_READ, NewBarkTownElmsLabWindow ; new

	def_object_events
	object_event  6,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 12,  9, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	object_event  6,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN ; edited, TBE?
	object_event  6,  3, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN ; new, TBE?
