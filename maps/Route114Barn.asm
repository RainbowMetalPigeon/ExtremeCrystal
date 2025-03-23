	object_const_def
	const ROUTE114BARN_TWIN1
	const ROUTE114BARN_TWIN2
	const ROUTE114BARN_MOOMOO

Route114Barn_MapScripts:
	def_scene_scripts

	def_callbacks

Route114BarnTwin1Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route114BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE114BARN_TWIN1, RIGHT
	end

.FeedingMooMoo:
	writetext Route114BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE114BARN_TWIN1, RIGHT
	end

Route114BarnTwin2Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route114BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE114BARN_TWIN2, LEFT
	end

.FeedingMooMoo:
	writetext Route114BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE114BARN_TWIN2, LEFT
	end

MoomooScript:
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .HappyCow
	writetext MoomooWeakMooText
	loadmonindex 1, MILTANK
	special PlaySlowCry
	promptbutton
	writetext Route114BarnItsCryIsWeakText
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue .GiveBerry
	waitbutton
	closetext
	end

.GiveBerry:
	promptbutton
	writetext Route114BarnAskGiveBerryText
	yesorno
	iffalse .Refused
	checkitem BERRY
	iffalse .NoBerriesInBag
	takeitem BERRY
	readmem wMooMooBerries
	addval 1
	writemem wMooMooBerries
	ifequal 3, .ThreeBerries
	ifequal 5, .FiveBerries
	ifequal 7, .SevenBerries
	writetext Route114BarnGaveBerryText
	waitbutton
	closetext
	end

.ThreeBerries:
	writetext Route114BarnGaveBerryText
	promptbutton
	writetext Route114BarnLittleHealthierText
	waitbutton
	closetext
	end

.FiveBerries:
	writetext Route114BarnGaveBerryText
	promptbutton
	writetext Route114BarnQuiteHealthyText
	waitbutton
	closetext
	end

.SevenBerries:
	playmusic MUSIC_HEAL
	writetext Route114BarnGaveBerryText
	pause 60
	promptbutton
	special RestartMapMusic
	writetext Route114BarnTotallyHealthyText
	waitbutton
	closetext
	setevent EVENT_HEALED_MOOMOO
	end

.NoBerriesInBag:
	writetext Route114BarnNoBerriesText
	waitbutton
	closetext
	end

.Refused:
	writetext Route114BarnRefusedBerryText
	waitbutton
	closetext
	end

.HappyCow:
	writetext MoomooHappyMooText
	cry MILTANK
	waitbutton
	closetext
	end

Route114BarnTwinMoomooIsSickText:
	text "MOOMOO is sick…"

	para "She needs lots of"
	line "BERRIES."
	done

Route114BarnTwinWereFeedingMoomooText:
	text "We're feeding"
	line "MOOMOO!"
	done

MoomooWeakMooText:
	text "MILTANK: …Moo…"
	done

Route114BarnItsCryIsWeakText:
	text "Its cry is weak…"
	done

MoomooHappyMooText:
	text "MILTANK: Mooo!"
	done

Route114BarnAskGiveBerryText:
	text "Give a BERRY to"
	line "MILTANK?"
	done

Route114BarnGaveBerryText:
	text "<PLAYER> gave a"
	line "BERRY to MILTANK."
	done

Route114BarnLittleHealthierText:
	text "MILTANK became a"
	line "little healthier!"
	done

Route114BarnQuiteHealthyText:
	text "MILTANK became"
	line "quite healthy!"
	done

Route114BarnTotallyHealthyText:
	text "MILTANK became"
	line "totally healthy!"
	done

Route114BarnNoBerriesText:
	text "<PLAYER> has no"
	line "BERRIES…"
	done

Route114BarnRefusedBerryText:
	text "<PLAYER> wouldn't"
	line "give a BERRY."

	para "MILTANK looks sad."
	done

Route114Barn_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_39, 1
	warp_event  4,  7, ROUTE_39, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114BarnTwin1Script, -1
	object_event  4,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route114BarnTwin2Script, -1
	object_event  3,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
