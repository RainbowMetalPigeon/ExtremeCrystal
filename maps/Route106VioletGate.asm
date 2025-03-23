	object_const_def
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F

Route106VioletGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route106VioletGateOfficerScript:
	jumptextfaceplayer Route106VioletGateOfficerText

Route106VioletGateCooltrainerFScript:
	jumptextfaceplayer Route106VioletGateCooltrainerFText

Route106VioletGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route106VioletGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route106VioletGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, VIOLET_CITY, 8
	warp_event  0,  5, VIOLET_CITY, 9
	warp_event  9,  4, ROUTE_106, 1
	warp_event  9,  5, ROUTE_106, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route106VioletGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route106VioletGateCooltrainerFScript, -1
