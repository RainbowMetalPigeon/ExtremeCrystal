	object_const_def
;	const ROUTE124_ROCK1
;	const ROUTE124_BOULDER1
	const ROUTE124_FRUIT_TREE
;	const ROUTE124_POKEFAN_M
;	const ROUTE124_LASS

Route124_MapScripts:
	def_scene_scripts

	def_callbacks

Route124Rock:
	jumpstd SmashRockScript

Route124Boulder:
	jumpstd StrengthBoulderScript

;Route124LassScript:
;	jumptextfaceplayer Route124LassText

Route124Sign1:
	jumptext Route124Sign1Text

Route124Sign2:
	jumptext Route124Sign2Text

Route124FruitTree:
	fruittree FRUITTREE_ROUTE_124

;HikerAnthony2SeenTextA:
;	text "I came through the"
;	line "tunnel, but I"
;
;	para "still have plenty"
;	line "of energy left."
;	done

;Route124LassTextA:
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

Route124Sign1Text:
	text "ROUTE 124"
	
	para "AZALEA TOWN -"
	line "ELDERFERN TOWN"
	done

Route124Sign2Text:
	text "ROUTE 124"
	
	para "ELDERFERN TOWN -"
	line "AZALEA TOWN"
	done

Route124_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 41, AZALEA_TOWN_ROUTE_124_GATE, 1
	warp_event 10, 41, AZALEA_TOWN_ROUTE_124_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  8, 38, BGEVENT_READ, Route124Sign1
	bg_event 10,  4, BGEVENT_READ, Route124Sign2

	def_object_events
;	object_event 19,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route124Rock, -1
;	object_event  9,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route124Boulder, -1
	object_event 17, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route124FruitTree, -1
;	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route124LassScript, -1
