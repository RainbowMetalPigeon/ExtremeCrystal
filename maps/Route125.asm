	object_const_def
	const ROUTE125_BOULDER1
	const ROUTE125_FRUIT_TREE
;	const ROUTE125_POKEFAN_M
;	const ROUTE125_LASS

Route125_MapScripts:
	def_scene_scripts

	def_callbacks

Route125Boulder:
	jumpstd StrengthBoulderScript

;Route125LassScript:
;	jumptextfaceplayer Route125LassText

Route125Sign1:
	jumptext Route125Sign1Text

Route125Sign2:
	jumptext Route125Sign2Text

Route125FruitTree:
	fruittree FRUITTREE_ROUTE_125

;HikerAnthony2SeenTextA:
;	text "I came through the"
;	line "tunnel, but I"
;
;	para "still have plenty"
;	line "of energy left."
;	done

;Route125LassTextA:
;	text "Pant, pant…"
;
;	para "I finally got"
;	line "through that cave."
;
;	para "It was much bigger"
;	line "than I'd expected."
;
;	para "I got too tired to"
;	line "explore the whole"
;
;	para "thing, so I came"
;	line "outside."
;	done

Route125Sign1Text:
	text "ROUTE 125"
	
	para "ELDERFERN TOWN -"
	line "GOLDENROD CITY"
	done

Route125Sign2Text:
	text "ROUTE 125"
	
	para "GOLDENROD CITY -"
	line "ELDERFERN TOWN"
	done

Route125_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 10, GOLDENROD_CITY_ROUTE_125_GATE, 3
	warp_event  4, 11, GOLDENROD_CITY_ROUTE_125_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 24, 10, BGEVENT_READ, Route125Sign1
	bg_event  7,  9, BGEVENT_READ, Route125Sign2

	def_object_events
	object_event 10,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route125Boulder, -1
	object_event  6, 15, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route125FruitTree, -1
;	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route125LassScript, -1
