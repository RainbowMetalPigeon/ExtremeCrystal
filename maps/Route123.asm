	object_const_def
	const ROUTE123_ROCK1
	const ROUTE123_ROCK2
	const ROUTE123_ROCK3
;	const ROUTE123_POKEFAN_M
;	const ROUTE123_LASS
;	const ROUTE123_FRUIT_TREE

Route123_MapScripts:
	def_scene_scripts

	def_callbacks

Route123Rock:
	jumpstd SmashRockScript

;Route123LassScript:
;	jumptextfaceplayer Route123LassText

Route123Sign:
	jumptext Route123SignText

Route123FruitTree:
	fruittree FRUITTREE_ROUTE_123

;HikerAnthony2SeenTextA:
;	text "I came through the"
;	line "tunnel, but I"
;
;	para "still have plenty"
;	line "of energy left."
;	done

;Route123LassTextA:
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

Route123SignText:
	text "ROUTE 123"
	
	para "ROUTE 107 -"
	line "ELDERFERN TOWN"
	done

Route123_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 10, ROUTE_107_ROUTE_123_GATE, 1
	warp_event 23, 11, ROUTE_107_ROUTE_123_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 20, 12, BGEVENT_READ, Route123Sign

	def_object_events
	object_event 19,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123Rock, -1
	object_event 18,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123Rock, -1
	object_event  3,  2, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123Rock, -1
	object_event 18,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree, -1
;	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route123LassScript, -1
