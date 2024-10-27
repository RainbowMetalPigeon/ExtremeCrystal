	object_const_def
	const ROUTE119_ROCK1
	const ROUTE119_ROCK2
	const ROUTE119_ROCK3
	const ROUTE119_ROCK4
	const ROUTE119_ROCK5
	const ROUTE119_ROCK6
	const ROUTE119_ROCK7
	const ROUTE119_BOULDER1
	const ROUTE119_BOULDER2
	const ROUTE119_BOULDER3
	const ROUTE119_BOULDER4
	const ROUTE119_BOULDER5
;	const ROUTE119_POKEFAN_M

Route119_MapScripts:
	def_scene_scripts

	def_callbacks

;Route119PokefanMScript:
;	jumptextfaceplayer Route119PokefanMText

Route119PressAToInteractSign:
	jumptext Route119PressAToInteractSignText

Route119GreatBall:
	itemball GREAT_BALL

Route119MaxRevive:
	itemball MAX_REVIVE

Route119PPUp:
	itemball PP_UP

Route119MaxEther:
	itemball MAX_ETHER

Route119HiddenRareCandy1:
	hiddenitem RARE_CANDY, EVENT_ROUTE_119_HIDDEN_RARE_CANDY_1

Route119HiddenRareCandy2:
	hiddenitem RARE_CANDY, EVENT_ROUTE_119_HIDDEN_RARE_CANDY_2

Route119HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_119_HIDDEN_REVIVE

Route119HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_119_HIDDEN_MAX_ELIXER

Route119HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_119_HIDDEN_ULTRA_BALL

Route119HiddenPPUP:
	hiddenitem PP_UP, EVENT_ROUTE_119_HIDDEN_PP_UP

Route119PressAToInteractSignText:
	text "To interact with"
	line "people, signs, and"
	cont "objects, press"
	cont "the A Button!"
;	xxxx "123456789012345678"
	done

Route119Rock:
	jumpstd SmashRockScript

Route119Boulder:
	jumpstd StrengthBoulderScript

Route119_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 45, PLAYERS_HOUSE_2F, 1 ; TBE, test

	def_coord_events

	def_bg_events
	bg_event 10, 24, BGEVENT_READ, Route119PressAToInteractSign
	bg_event 25, 27, BGEVENT_ITEM, Route119HiddenRareCandy1
	bg_event  5, 21, BGEVENT_ITEM, Route119HiddenRevive
	bg_event  8, 42, BGEVENT_ITEM, Route119HiddenMaxElixer
	bg_event 14, 41, BGEVENT_ITEM, Route119HiddenRareCandy2
	bg_event 14, 19, BGEVENT_ITEM, Route119HiddenUltraBall
	bg_event  9, 14, BGEVENT_ITEM, Route119HiddenPPUP

	def_object_events
	object_event 21,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 11, 23, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 11, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 10, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 25, 43, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 17, 40, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 15, 41, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rock, -1
	object_event 11, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Boulder, -1
	object_event 16, 39, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Boulder, -1
	object_event 15, 40, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Boulder, -1
	object_event 18, 40, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Boulder, -1
	object_event 17, 39, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Boulder, -1
	object_event  9, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119GreatBall, EVENT_ROUTE_119_GREAT_BALL
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119MaxRevive, EVENT_ROUTE_119_MAX_REVIVE
	object_event 13, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119PPUp, EVENT_ROUTE_119_PP_UP
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119MaxEther, EVENT_ROUTE_119_MAX_ETHER
;	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route119PokefanMScript, EVENT_ROUTE_119_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
