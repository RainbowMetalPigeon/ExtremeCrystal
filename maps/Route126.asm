	object_const_def
	const ROUTE126_ROCK1
	const ROUTE126_FRUIT_TREE
;	const ROUTE126_POKEFAN_M
;	const ROUTE126_LASS

Route126_MapScripts:
	def_scene_scripts

	def_callbacks

Route126Rock:
	jumpstd SmashRockScript

Route126Boulder:
	jumpstd StrengthBoulderScript

;Route126LassScript:
;	jumptextfaceplayer Route126LassText

Route126Sign1:
	jumptext Route126Sign1Text

Route126Sign2:
	jumptext Route126Sign2Text

Route126FruitTree:
	fruittree FRUITTREE_ROUTE_126

;HikerAnthony2SeenTextA:
;	text "I came through the"
;	line "tunnel, but I"
;
;	para "still have plenty"
;	line "of energy left."
;	done

;Route126LassTextA:
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

Route126Sign1Text:
	text "ROUTE 126"
	
	para "ELDERFERN TOWN -"
	line "ROUTE 111"
	done

Route126Sign2Text:
	text "ROUTE 126"
	
	para "ROUTE 111 -"
	line "ELDERFERN TOWN"
	done

Route126_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  1, ROUTE_111_ROUTE_126_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 10, 38, BGEVENT_READ, Route126Sign1
	bg_event  8,  4, BGEVENT_READ, Route126Sign2

	def_object_events
	object_event 17,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route126Rock, -1
	object_event  2,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route126FruitTree, -1
;	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route126LassScript, -1
