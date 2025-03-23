	object_const_def
	const ROUTE101HEALHOUSE_TEACHER

Route101HealHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route101HealHouseTeacherScript:
	faceplayer
	opentext
	writetext Route101HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext Route101HealHouseKeepAtItText
	waitbutton
	closetext
	end

Route101HealHouseBookshelf:
	jumpstd PictureBookshelfScript

Route101HealHouseRestAWhileText:
	text "Your #MON look"
	line "a little tired."

	para "You should rest"
	line "them a while."
	done

Route101HealHouseKeepAtItText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Keep at it!"
	done

Route101HealHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_101, 2
	warp_event  3,  7, ROUTE_101, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route101HealHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route101HealHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101HealHouseTeacherScript, -1
