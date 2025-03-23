	object_const_def
	const ROUTE111RUINSOFALPHGATE_OFFICER
	const ROUTE111RUINSOFALPHGATE_GRAMPS

Route111RuinsOfAlphGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route111RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route111RuinsOfAlphGateOfficerText

Route111RuinsOfAlphGateGrampsScript:
	jumptextfaceplayer Route111RuinsOfAlphGateGrampsText

Route111RuinsOfAlphGateOfficerText:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

Route111RuinsOfAlphGateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route111RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_111, 3
	warp_event  5,  0, ROUTE_111, 4
	warp_event  4,  7, RUINS_OF_ALPH_OUTSIDE, 9
	warp_event  5,  7, RUINS_OF_ALPH_OUTSIDE, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route111RuinsOfAlphGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route111RuinsOfAlphGateGrampsScript, -1
