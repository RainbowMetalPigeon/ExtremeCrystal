	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route110NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route110NationalParkGateNoop1Scene,             SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script Route110NationalParkGateNoop2Scene,             SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route110NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route110NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route110NationalParkGateCheckIfContestAvailableCallback

Route110NationalParkGateNoop1Scene:
	end

Route110NationalParkGateNoop2Scene:
	end

Route110NationalParkGateLeaveContestEarlyScene:
	sdefer Route110NationalParkGateLeavingContestEarlyScript
	end

Route110NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route110NationalParkBugContestIsRunningScript
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route110NationalParkBugContestIsRunningScript:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route110NationalParkGateCheckIfContestAvailableCallback:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route110NationalParkBugContestIsRunningScript
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route110NationalParkGateLeavingContestEarlyScript:
	applymovement PLAYER, Route110NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route110NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route110NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route110NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route110NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route110OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route110NationalParkGate_NoContestToday
	ifequal MONDAY, Route110NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route110NationalParkGate_NoContestToday
	ifequal FRIDAY, Route110NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route110NationalParkGate_ContestIsOver
	scall Route110NationalParkGate_GetDayOfWeek
	writetext Route110NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route110NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route110NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route110NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route110NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route110NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route110NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route110NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route110NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route110NationalParkGate_FacingLeft
	applymovement PLAYER, Route110NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route110NationalParkGate_FacingLeft:
	applymovement PLAYER, Route110NationalParkGatePlayerEnterParkMovement
	end

Route110NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route110NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route110NationalParkGate_NoRoomInBox

Route110NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route110NationalParkGate_FirstMonIsEgg
	writetext Route110NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route110NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route110NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route110NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route110NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route110NationalParkGate_OkayToProceed

Route110NationalParkGate_DeclinedToParticipate:
	writetext Route110NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route110NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route110NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route110NationalParkGate_FirstMonIsFainted:
	writetext Route110NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route110NationalParkGate_NoRoomInBox:
	writetext Route110NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route110NationalParkGate_FirstMonIsEgg:
	writetext Route110NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route110NationalParkGate_ContestIsOver:
	writetext Route110NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route110NationalParkGate_NoContestToday:
	jumptextfaceplayer Route110NationalParkGateOfficer1WeHoldContestsText

Route110NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route110NationalParkGate_ContestIsOver
	writetext Route110NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route110NationalParkGateYoungsterScript:
	jumptextfaceplayer Route110NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route110NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route110NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route110NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route110NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route110NationalParkGateOfficer1AskToParticipateText:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

Route110NationalParkGateOfficer1GiveParkBallsText:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

Route110NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> received"
	line "{d:BUG_CONTEST_BALLS} PARK BALLS."
	done

Route110NationalParkGateOfficer1ExplainsRulesText:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have {d:BUG_CONTEST_MINUTES}"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

Route110NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_ram wStringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

Route110NationalParkGateOfficer1WellHoldYourMonText:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

Route110NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

Route110NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

Route110NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

Route110NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

Route110NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

Route110NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

Route110NationalParkGateOfficer1WantToFinishText:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

Route110NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done

Route110NationalParkGateOfficer1OkGoFinishText:
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done

Route110NationalParkGateOfficer1ContestIsOverText:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

Route110NationalParkGateOfficer1WeHoldContestsText:
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done

Route110NationalParkGateYoungsterText:
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done

BugCatchingContestExplanationText:
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done

Route110NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_110, 3
	warp_event  4,  7, ROUTE_110, 3

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route110OfficerScriptContest, EVENT_ROUTE_110_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route110NationalParkGateYoungsterScript, EVENT_ROUTE_110_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route110NationalParkGateOfficerScript, EVENT_ROUTE_110_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
