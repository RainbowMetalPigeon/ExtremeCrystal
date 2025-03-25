	object_const_def
	const ROUTE107ROUTE123GATE_OFFICER
	const ROUTE107ROUTE123GATE_YOUNGSTER

Route107Route123Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route107Route123GateOfficerScript:
	jumptextfaceplayer Route107Route123GateOfficerText

Route107Route123GateYoungsterScript:
	jumptextfaceplayer Route107Route123GateYoungsterText

Route107Route123GateOfficerText:
	text "Be careful when on"
	line "ROUTE 123."

	para "It's a steep path,"
	line "with many debris"
	cont "on the ground."
	done

Route107Route123GateYoungsterText:
	text "Those rocks ahead"
	line "are so in the way!"

	para "If only there was"
;	xxxx "123456789012345678"
	line "a way to get rid"
	cont "of them."
	done

Route107Route123Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_123, 1
	warp_event  0,  5, ROUTE_123, 2
	warp_event  9,  4, ROUTE_107, 5
	warp_event  9,  5, ROUTE_107, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route107Route123GateOfficerScript, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route107Route123GateYoungsterScript, -1
