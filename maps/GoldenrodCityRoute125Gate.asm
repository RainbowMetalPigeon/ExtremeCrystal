	object_const_def
	const GOLDENRODCITYROUTE125GATE_OFFICER
	const GOLDENRODCITYROUTE125GATE_YOUNGSTER

GoldenrodCityRoute125Gate_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodCityRoute125GateOfficerScript:
	jumptextfaceplayer GoldenrodCityRoute125GateOfficerText

GoldenrodCityRoute125GateYoungsterScript:
	jumptextfaceplayer GoldenrodCityRoute125GateYoungsterText

GoldenrodCityRoute125GateOfficerText:
	text "Be careful when on"
	line "ROUTE 123."

	para "It's a steep path,"
	line "with many debris"
	cont "on the ground."
	done

GoldenrodCityRoute125GateYoungsterText:
	text "Those rocks ahead"
	line "are so in the way!"

	para "If only there was"
;	xxxx "123456789012345678"
	line "a way to get rid"
	cont "of them."
	done

GoldenrodCityRoute125Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, GOLDENROD_CITY, 16
	warp_event  0,  5, GOLDENROD_CITY, 17
	warp_event  9,  4, ROUTE_125, 1
	warp_event  9,  5, ROUTE_125, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRoute125GateOfficerScript, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRoute125GateYoungsterScript, -1
