	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route105BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route105BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_105_HOUSE
	iftrue .GotBerry
	writetext Route105BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_105_HOUSE
.GotBerry:
	writetext Route105BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route105BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route105BerrySpeechHouseMonEatBerriesText:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

Route105BerrySpeechHouseCheckTreesText:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route105BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_105, 1
	warp_event  3,  7, ROUTE_105, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route105BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route105BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route105BerryHousePokefanMScript, -1
