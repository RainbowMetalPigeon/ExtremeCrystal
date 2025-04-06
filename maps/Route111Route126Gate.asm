	object_const_def
	const ROUTE111ROUTE126GATE_OFFICER
	const ROUTE111ROUTE126GATE_GRAMPS

Route111Route126Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route111Route126GateOfficerScript:
	jumptextfaceplayer Route111Route126GateOfficerText

Route111Route126GateGrampsScript:
	jumptextfaceplayer Route111Route126GateGrampsText

Route111Route126GateOfficerText:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

Route111Route126GateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route111Route126Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_111, 1
	warp_event  5,  0, ROUTE_111, 2
	warp_event  4,  7, ROUTE_126, 1
	warp_event  5,  7, ROUTE_126, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route111Route126GateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route111Route126GateGrampsScript, -1
