; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 40 and Route 41, which are water routes.

MACRO roam_map
	map_id \1
	db _NARG - 1
	rept _NARG - 1
		map_id \2
		shift
	endr
	db 0
	DEF list_index += 1
ENDM

RoamMaps:
	list_start RoamMaps
	; start map, ...other maps
	roam_map ROUTE_104, ROUTE_105, ROUTE_121
	roam_map ROUTE_105, ROUTE_104, ROUTE_106
	roam_map ROUTE_106, ROUTE_105, ROUTE_107, ROUTE_111
	roam_map ROUTE_107, ROUTE_111, ROUTE_106, ROUTE_108
	roam_map ROUTE_108, ROUTE_107, ROUTE_109
	roam_map ROUTE_109, ROUTE_108, ROUTE_110
	roam_map ROUTE_110, ROUTE_109, ROUTE_111
	roam_map ROUTE_111, ROUTE_110, ROUTE_106, ROUTE_107, ROUTE_112
	roam_map ROUTE_112, ROUTE_111, ROUTE_113, ROUTE_117
	roam_map ROUTE_113, ROUTE_112, ROUTE_39, ROUTE_117
	roam_map ROUTE_39, ROUTE_113
	roam_map ROUTE_117, ROUTE_118, ROUTE_44, ROUTE_112, ROUTE_113
	roam_map ROUTE_118, ROUTE_117, ROUTE_44
	roam_map ROUTE_44, ROUTE_117, ROUTE_118, ROUTE_120
	roam_map ROUTE_120, ROUTE_44, ROUTE_121
	roam_map ROUTE_121, ROUTE_120, ROUTE_104
	assert_list_length NUM_ROAMMON_MAPS
	db -1 ; end
