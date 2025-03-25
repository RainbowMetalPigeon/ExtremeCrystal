MACRO treemon_map
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ROUTE_101,                 TREEMON_SET_KANTO
	treemon_map ROUTE_102,                 TREEMON_SET_KANTO
	treemon_map ROUTE_103,                 TREEMON_SET_CITY
	treemon_map ROUTE_104,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_105,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_106,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_107,                 TREEMON_SET_KANTO
	treemon_map ROUTE_108,                 TREEMON_SET_TOWN
	treemon_map ROUTE_109,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_110,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_111,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_112,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_113,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_39,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_118,                 TREEMON_SET_LAKE
	treemon_map ROUTE_115,                 TREEMON_SET_CITY
	treemon_map ROUTE_116,                 TREEMON_SET_CITY
	treemon_map ROUTE_117,                 TREEMON_SET_TOWN
	treemon_map ROUTE_119,                  TREEMON_SET_CANYON
	treemon_map ROUTE_120,                 TREEMON_SET_CANYON
	treemon_map ROUTE_121,                 TREEMON_SET_CANYON
	treemon_map NEW_BARK_TOWN,             TREEMON_SET_CITY
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_CITY
	treemon_map VIOLET_CITY,               TREEMON_SET_CITY
	treemon_map AZALEA_TOWN,               TREEMON_SET_TOWN
	treemon_map CIANWOOD_CITY,             TREEMON_SET_CITY
	treemon_map GOLDENROD_CITY,            TREEMON_SET_CITY
	treemon_map OLIVINE_CITY,              TREEMON_SET_CITY
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_CITY
	treemon_map MAHOGANY_TOWN,             TREEMON_SET_CITY
	treemon_map LAKE_OF_RAGE,              TREEMON_SET_LAKE
	treemon_map BLACKTHORN_CITY,           TREEMON_SET_CITY
	treemon_map SILVER_CAVE_OUTSIDE,       TREEMON_SET_CITY
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map ROUTE_122,                 TREEMON_SET_ROUTE ; new
	treemon_map ROUTE_123,                 TREEMON_SET_ROUTE ; new
	db -1

RockMonMaps:
	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	treemon_map ROUTE_115,                 TREEMON_SET_ROCK
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, TREEMON_SET_ROCK
	treemon_map SLOWPOKE_WELL_B1F,         TREEMON_SET_ROCK
	treemon_map ROUTE_122,                 TREEMON_SET_ROCK ; new
	treemon_map ROUTE_123,                 TREEMON_SET_ROCK ; new
	db -1
