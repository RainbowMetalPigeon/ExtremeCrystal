	object_const_def
	const AZALEATOWNROUTE124GATE_OFFICER
	const AZALEATOWNROUTE124GATE_GRAMPS

AzaleaTownRoute124Gate_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaTownRoute124GateOfficerScript:
	jumptextfaceplayer AzaleaTownRoute124GateOfficerText

AzaleaTownRoute124GateGrampsScript:
	jumptextfaceplayer AzaleaTownRoute124GateGrampsText

AzaleaTownRoute124GateOfficerText:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

AzaleaTownRoute124GateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

AzaleaTownRoute124Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_124, 1
	warp_event  5,  0, ROUTE_124, 2
	warp_event  4,  7, AZALEA_TOWN, 9
	warp_event  5,  7, AZALEA_TOWN, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownRoute124GateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AzaleaTownRoute124GateGrampsScript, -1
