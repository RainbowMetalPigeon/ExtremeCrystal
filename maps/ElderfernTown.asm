	object_const_def
;	const ELDERFERNTOWN_SUPER_NERD1

ElderfernTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ElderfernTownFlypointCallback

ElderfernTownFlypointCallback:
	setflag ENGINE_FLYPOINT_ELDERFERN
	endcallback

ElderfernTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
;	warp_event 18, 11, ELDERFERN_GYM_1F, 1

	def_coord_events

	def_bg_events
;	bg_event 34, 24, BGEVENT_READ, ElderfernTownSign

	def_object_events
;	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ElderfernSuperNerdScript, EVENT_ELDERFERN_CITY_SUPER_NERD_BLOCKS_GYM
