MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4, Landmarks
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route104Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route105Name
	landmark  96,  60, Route106Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route107Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route108Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route109Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route110Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route111Name
	landmark  68,  52, Route112Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route113Name
	landmark  36,  48, Route114Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route115Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route116Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route117Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route118Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route119Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route120Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route121Name
	landmark 148,  68, SilverCaveName
	landmark 140, 124, Route122Name ; new

	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route101Name
	landmark  20, 100, Route102Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route103Name
	landmark 140, 116, FastShipName
	assert_table_length NUM_LANDMARKS

NewBarkTownName:     db "NEW BARK<BSP>TOWN@"
CherrygroveCityName: db "CHERRYGROVE<BSP>CITY@"
VioletCityName:      db "VIOLET CITY@"
AzaleaTownName:      db "AZALEA TOWN@"
GoldenrodCityName:   db "GOLDENROD<BSP>CITY@"
EcruteakCityName:    db "ECRUTEAK<BSP>CITY@"
OlivineCityName:     db "OLIVINE<BSP>CITY@"
CianwoodCityName:    db "CIANWOOD<BSP>CITY@"
MahoganyTownName:    db "MAHOGANY<BSP>TOWN@"
BlackthornCityName:  db "BLACKTHORN<BSP>CITY@"
LakeOfRageName:      db "LAKE OF<BSP>RAGE@"
SilverCaveName:      db "SILVER CAVE@"
SproutTowerName:     db "SPROUT<BSP>TOWER@"
RuinsOfAlphName:     db "RUINS<BSP>OF ALPH@"
UnionCaveName:       db "UNION CAVE@"
SlowpokeWellName:    db "SLOWPOKE<BSP>WELL@"
RadioTowerName:      db "RADIO TOWER@"
PowerPlantName:      db "POWER PLANT@"
NationalParkName:    db "NATIONAL<BSP>PARK@"
TinTowerName:        db "TIN TOWER@"
LighthouseName:      db "LIGHTHOUSE@"
WhirlIslandsName:    db "WHIRL<BSP>ISLANDS@"
MtMortarName:        db "MT.MORTAR@"
DragonsDenName:      db "DRAGON'S<BSP>DEN@"
IcePathName:         db "ICE PATH@"
NotApplicableName:   db "N/A@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "PALLET TOWN@"
ViridianCityName:    db "VIRIDIAN<BSP>CITY@"
PewterCityName:      db "PEWTER CITY@"
CeruleanCityName:    db "CERULEAN<BSP>CITY@"
LavenderTownName:    db "LAVENDER<BSP>TOWN@"
VermilionCityName:   db "VERMILION<BSP>CITY@"
CeladonCityName:     db "CELADON<BSP>CITY@"
SaffronCityName:     db "SAFFRON<BSP>CITY@"
FuchsiaCityName:     db "FUCHSIA<BSP>CITY@"
CinnabarIslandName:  db "CINNABAR<BSP>ISLAND@"
IndigoPlateauName:   db "INDIGO<BSP>PLATEAU@"
VictoryRoadName:     db "VICTORY<BSP>ROAD@"
MtMoonName:          db "MT.MOON@"
RockTunnelName:      db "ROCK TUNNEL@"
LavRadioTowerName:   db "LAV<BSP>RADIO TOWER@"
SilphCoName:         db "SILPH CO.@" ; unreferenced
SafariZoneName:      db "SAFARI ZONE@" ; unreferenced
SeafoamIslandsName:  db "SEAFOAM<BSP>ISLANDS@"
PokemonMansionName:  db "#MON<BSP>MANSION@" ; unreferenced
CeruleanCaveName:    db "CERULEAN<BSP>CAVE@" ; unreferenced
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "ROUTE 24@"
Route25Name:         db "ROUTE 25@"
Route101Name:         db "ROUTE 101@"
Route102Name:         db "ROUTE 102@"
Route103Name:         db "ROUTE 103@"
Route104Name:         db "ROUTE 104@"
Route105Name:         db "ROUTE 105@"
Route106Name:         db "ROUTE 106@"
Route107Name:         db "ROUTE 107@"
Route108Name:         db "ROUTE 108@"
Route109Name:         db "ROUTE 109@"
Route110Name:         db "ROUTE 110@"
Route111Name:         db "ROUTE 111@"
Route112Name:         db "ROUTE 37@"
Route113Name:         db "ROUTE 113@"
Route114Name:         db "ROUTE 114@"
Route115Name:         db "ROUTE 115@"
Route116Name:         db "ROUTE 116@"
Route117Name:         db "ROUTE 117@"
Route118Name:         db "ROUTE 118@"
Route119Name:         db "ROUTE 119@"
Route120Name:         db "ROUTE 120@"
Route121Name:         db "ROUTE 121@"
DarkCaveName:        db "DARK CAVE@"
IlexForestName:      db "ILEX<BSP>FOREST@"
BurnedTowerName:     db "BURNED<BSP>TOWER@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN<BSP>FOREST@" ; unreferenced
DiglettsCaveName:    db "DIGLETT'S<BSP>CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
BattleTowerName:     db "BATTLE<BSP>TOWER@"
SpecialMapName:      db "SPECIAL@"

; new -----------------------------------------------------

Route122Name:        db "ROUTE 122@"
