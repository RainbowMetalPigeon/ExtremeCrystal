	object_const_def
	const ROUTE109ILEXFORESTGATE_TEACHER1
	const ROUTE109ILEXFORESTGATE_BUTTERFREE
	const ROUTE109ILEXFORESTGATE_LASS
	const ROUTE109ILEXFORESTGATE_TEACHER2

Route109IlexForestGate_MapScripts:
	def_scene_scripts
	scene_const SCENE_ROUTE109ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route109IsForestRestlessCallback

Route109IsForestRestlessCallback:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE109ILEXFORESTGATE_TEACHER1
	appear ROUTE109ILEXFORESTGATE_TEACHER2
	endcallback

.Normal:
	disappear ROUTE109ILEXFORESTGATE_TEACHER2
	appear ROUTE109ILEXFORESTGATE_TEACHER1
	endcallback

Route109IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE109ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE109ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE109ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, Route109IlexForestGateTeacherBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route109IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE109ILEXFORESTGATE_TEACHER2, Route109IlexForestGateTeacherReturnsMovement
.skip:
	end

Route109IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route109IlexForestGateTeacherText
	promptbutton
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route109IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

.ForestIsRestless:
	writetext Route109IlexForestGateTeacher_ForestIsRestless
	promptbutton
	closetext
	end

Route109IlexForestGateButterfreeScript:
	opentext
	writetext Route109IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route109IlexForestGateLassScript:
	jumptextfaceplayer Route109IlexForestGateLassText

Route109IlexForestGateTeacherBlocksPlayerMovement:
	step UP
	step UP
	step_end

Route109IlexForestGateTeacherReturnsMovement:
	step DOWN
	step RIGHT
	step_end

Route109IlexForestGateTeacherText:
	text "Oh, honey. You're"
	line "making a #DEX?"

	para "It must be hard if"
	line "#MON won't"

	para "appear. Try using"
	line "this TM."
	done

Route109IlexForestGateTeacher_GotSweetScent:
	text "It's SWEET SCENT."

	para "Use it wherever"
	line "#MON appear."

	para "#MON will be"
	line "enticed by it."
	done

Route109IlexForestGateTeacher_ForestIsRestless:
	text "Something's wrong"
	line "in ILEX FOREST…"

	para "You should stay"
	line "away right now."
	done

Route109IlexForestGateButterfreeText:
	text "BUTTERFREE: Freeh!"
	done

Route109IlexForestGateLassText:
	text "Did you see the"
	line "shrine honoring"
	cont "the protector?"

	para "It watches over"
	line "the FOREST from"
	cont "across time."

	para "I think that it"
	line "must be a grass-"
	cont "type #MON."
	done

Route109IlexForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_109, 1
	warp_event  5,  0, ROUTE_109, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events
	coord_event  4,  7, SCENE_ROUTE109ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS, Route109IlexForestGateCelebiEvent

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route109IlexForestGateTeacherScript, EVENT_ROUTE_109_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route109IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route109IlexForestGateLassScript, EVENT_ROUTE_109_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route109IlexForestGateTeacherScript, EVENT_ROUTE_109_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
