	object_const_def
	const ROUTE38ECRUTEAKGATE_OFFICER

Route113EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route113EcruteakGateOfficerScript:
	jumptextfaceplayer Route113EcruteakGateOfficerText

Route113EcruteakGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "NEW BARK TOWN?"

	para "PROF.ELM lives"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route113EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_113, 1
	warp_event  0,  5, ROUTE_113, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route113EcruteakGateOfficerScript, -1
