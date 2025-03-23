Route103_MapScripts:
	def_scene_scripts

	def_callbacks

Route103Sign:
	jumptext Route103SignText

Route103HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_103_HIDDEN_RARE_CANDY

Route103SignText:
	text "ROUTE 103"
	done

Route103_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_103_STEEL_WING_HOUSE, 1
	warp_event 33,  5, VICTORY_ROAD_GATE, 7

	def_coord_events

	def_bg_events
	bg_event 31,  5, BGEVENT_READ, Route103Sign
	bg_event 25,  2, BGEVENT_ITEM, Route103HiddenRareCandy

	def_object_events
