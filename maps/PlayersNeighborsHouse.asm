	object_const_def
	const PLAYERSNEIGHBORSHOUSE_OPAL
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OpalScript:
	checkevent EVENT_RIVAL_ESCAPES_FROM_LAB
	iftrue .afterRivalEscapes
	jumptextfaceplayer OpalText_BeforeRivalEscapes
.afterRivalEscapes
; give Togepi
	faceplayer
	opentext
	writetext OpalText_AfterRivalEscapes1
	promptbutton
	waitsfx
	writetext OpalText_AfterRivalEscapes2
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOGEPI, 5, BERRY
	writetext OpalText_AfterRivalEscapes3
	promptbutton
	closetext
; also gives some items
	giveitem POTION, 3
	opentext
	writetext OpalText_AfterRivalEscapes4
	playsound SFX_ITEM
	waitsfx
	writetext OpalText_AfterRivalEscapes5
	promptbutton
	closetext
; move Opal
	readvar VAR_FACING
	ifequal UP, .OpalMovementsIfWeFaceUp
	applymovement PLAYERSNEIGHBORSHOUSE_OPAL, PlayersNeighborsHouse_OpalMovementNotUp
	sjump .conclude
.OpalMovementsIfWeFaceUp
	applymovement PLAYERSNEIGHBORSHOUSE_OPAL, PlayersNeighborsHouse_OpalMovementUp
.conclude
	playsound SFX_EXIT_BUILDING
	disappear PLAYERSNEIGHBORSHOUSE_OPAL
	setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_OPAL
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

PlayersNeighborsHouse_OpalMovementNotUp:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PlayersNeighborsHouse_OpalMovementUp:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

OpalText_BeforeRivalEscapes: ; TBE
	text "Hi <PLAYER>! How"
	line "are you?"

	para "Today is the grand"
	line "day, isn't it?!"
	cont "You're getting"
	cont "your starter"
	cont "#MON!"

	para "I'm so excited!"
	line "Soon we will be"
	cont "colleagues! We"
	cont "can improve"
	cont "together!"

	para "I look forward to"
	line "guide you and"
	cont "also learn from"
	cont "you!"
	done

OpalText_AfterRivalEscapes1:
	text "Hi <PLAYER>! How"
	line "are you doing?"

	para "...WHAT happened?!"

	para "This is super bad!"
	line "We need to help"
	cont "PROF. ELM"
	cont "right away!"

	para "Yes, the PROF was"
	line "right, the EGG I"
	cont "received from"
	cont "MX. #MON just"
	cont "hatched."

	para "I know it's sudden,"
	line "but you can have"
	cont "the newborn!"
	done

OpalText_AfterRivalEscapes2:
	text "<PLAYER> received"
	line "a newborn TOGEPI!"
	done

OpalText_AfterRivalEscapes3:
	text "And take these"
	line "too, they'll be"
	cont "helpful!"
;	xxxx "123456789012345678"
	done

OpalText_AfterRivalEscapes4:
	text "<PLAYER> received"
	line "3 POTIONs!"
	done

OpalText_AfterRivalEscapes5:
	text "Now let's hurry!"
	line "Let's chase that"
	cont "filthy thief and"
	cont "retrieve the"
	cont "stolen #MON!"
	done

PlayersNeighborText:
	text "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"

	para "But then, so do I!"
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OpalScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_OPAL ; TBE, will be SPRITE_OPAL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
