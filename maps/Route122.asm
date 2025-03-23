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

Route122_MapScripts:
	def_scene_scripts

	def_callbacks

;Route122PokefanMScript:
;	jumptextfaceplayer Route122PokefanMText

Route122PressAToInteractSign:
	jumptext Route122PressAToInteractSignText

Route122GreatBall:
	itemball GREAT_BALL

Route122MaxRevive:
	itemball MAX_REVIVE

Route122PPUp:
	itemball PP_UP

Route122MaxEther:
	itemball MAX_ETHER

Route122HiddenRareCandy1:
	hiddenitem RARE_CANDY, EVENT_ROUTE_122_HIDDEN_RARE_CANDY_1

Route122HiddenRareCandy2:
	hiddenitem RARE_CANDY, EVENT_ROUTE_122_HIDDEN_RARE_CANDY_2

Route122HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_122_HIDDEN_ETHER

Route122HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_122_HIDDEN_MAX_ELIXER

Route122HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_122_HIDDEN_ULTRA_BALL

Route122HiddenPPUP:
	hiddenitem PP_UP, EVENT_ROUTE_122_HIDDEN_PP_UP

Route122PressAToInteractSignText:
	text "To interact with"
	line "people, signs, and"
	cont "objects, press"
	cont "the A Button!"
;	xxxx "123456789012345678"
	done

Route122Rock:
	jumpstd SmashRockScript

Route122Boulder:
	jumpstd StrengthBoulderScript

Route122_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 45, PLAYERS_HOUSE_2F, 1 ; TBE, test

	def_coord_events

	def_bg_events
	bg_event 10, 24, BGEVENT_READ, Route122PressAToInteractSign
	bg_event 25, 27, BGEVENT_ITEM, Route122HiddenRareCandy1
	bg_event  5, 21, BGEVENT_ITEM, Route122HiddenEther
	bg_event  8, 42, BGEVENT_ITEM, Route122HiddenMaxElixer
	bg_event 14, 41, BGEVENT_ITEM, Route122HiddenRareCandy2
	bg_event 14, 19, BGEVENT_ITEM, Route122HiddenUltraBall
	bg_event  9, 14, BGEVENT_ITEM, Route122HiddenPPUP

	def_object_events
	object_event 21,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 11, 23, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 11, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 10, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 25, 43, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 17, 40, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 15, 41, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Rock, -1
	object_event 11, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Boulder, -1
	object_event 16, 39, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Boulder, -1
	object_event 15, 40, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Boulder, -1
	object_event 18, 40, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Boulder, -1
	object_event 17, 39, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route122Boulder, -1
	object_event  9, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route122GreatBall, EVENT_ROUTE_122_GREAT_BALL
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route122MaxRevive, EVENT_ROUTE_122_MAX_REVIVE
	object_event 13, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route122PPUp, EVENT_ROUTE_122_PP_UP
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route122MaxEther, EVENT_ROUTE_122_MAX_ETHER
;	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route122PokefanMScript, EVENT_ROUTE_122_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
