	object_const_def
	const ROUTE107RUINSOFALPHGATE_OFFICER
	const ROUTE107RUINSOFALPHGATE_POKEFAN_M
	const ROUTE107RUINSOFALPHGATE_YOUNGSTER

Route107RuinsOfAlphGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route107RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route107RuinsOfAlphGateOfficerText

Route107RuinsOfAlphGatePokefanMScript:
	jumptextfaceplayer Route107RuinsOfAlphGatePokefanMText

Route107RuinsOfAlphGateYoungsterScript:
	jumptextfaceplayer Route107RuinsOfAlphGateYoungsterText

Route107RuinsOfAlphGateOfficerText:
	text "RUINS OF ALPH"

	para "A Look-and-Touch"
	line "Tourist Site"

	para "Try the sliding"
	line "stone panels!"
	done

Route107RuinsOfAlphGatePokefanMText:
	text "You're studying"
	line "the RUINS?"

	para "I see a scientist"
	line "in the making."
	done

Route107RuinsOfAlphGateYoungsterText:
	text "There are drawings"
	line "on stone panels."

	para "I tried moving"
	line "them. I wonder"
	cont "what they are."
	done

Route107RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 10
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  9,  4, ROUTE_107, 2
	warp_event  9,  5, ROUTE_107, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route107RuinsOfAlphGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route107RuinsOfAlphGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route107RuinsOfAlphGateYoungsterScript, -1
