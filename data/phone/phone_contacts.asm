MACRO phone
; trainer class, trainer id, map, callee time, callee script, caller time, caller script
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	table_width PHONE_CONTACT_SIZE, PhoneContacts
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_ELM,      ELMS_LAB,                  ANYTIME, ElmPhoneCalleeScript,     0,       ElmPhoneCallerScript
	phone SCHOOLBOY,    JACK1,                 NATIONAL_PARK,             ANYTIME, JackPhoneCalleeScript,    ANYTIME, JackPhoneCallerScript
	phone POKEFANF,     BEVERLY1,              NATIONAL_PARK,             ANYTIME, BeverlyPhoneCalleeScript, ANYTIME, BeverlyPhoneCallerScript
	phone SAILOR,       HUEY1,                 OLIVINE_LIGHTHOUSE_2F,     ANYTIME, HueyPhoneCalleeScript,    ANYTIME, HueyPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,                ROUTE_101,                  ANYTIME, GavenPhoneCalleeScript,   ANYTIME, GavenPhoneCallerScript
	phone COOLTRAINERF, BETH1,                 ROUTE_101,                  ANYTIME, BethPhoneCalleeScript,    ANYTIME, BethPhoneCallerScript
	phone BIRD_KEEPER,  JOSE2,                 ROUTE_102,                  ANYTIME, JosePhoneCalleeScript,    ANYTIME, JosePhoneCallerScript
	phone COOLTRAINERF, REENA1,                ROUTE_102,                  ANYTIME, ReenaPhoneCalleeScript,   ANYTIME, ReenaPhoneCallerScript
	phone YOUNGSTER,    JOEY1,                 ROUTE_105,                  ANYTIME, JoeyPhoneCalleeScript,    ANYTIME, JoeyPhoneCallerScript
	phone BUG_CATCHER,  WADE1,                 ROUTE_106,                  ANYTIME, WadePhoneCalleeScript,    ANYTIME, WadePhoneCallerScript
	phone FISHER,       RALPH1,                ROUTE_107,                  ANYTIME, RalphPhoneCalleeScript,   ANYTIME, RalphPhoneCallerScript
	phone PICNICKER,    LIZ1,                  ROUTE_107,                  ANYTIME, LizPhoneCalleeScript,     ANYTIME, LizPhoneCallerScript
	phone HIKER,        ANTHONY2,              ROUTE_108,                  ANYTIME, AnthonyPhoneCalleeScript, ANYTIME, AnthonyPhoneCallerScript
	phone CAMPER,       TODD1,                 ROUTE_109,                  ANYTIME, ToddPhoneCalleeScript,    ANYTIME, ToddPhoneCallerScript
	phone PICNICKER,    GINA1,                 ROUTE_109,                  ANYTIME, GinaPhoneCalleeScript,    ANYTIME, GinaPhoneCallerScript
	phone JUGGLER,      IRWIN1,                ROUTE_110,                  ANYTIME, IrwinPhoneCalleeScript,   ANYTIME, IrwinPhoneCallerScript
	phone BUG_CATCHER,  ARNIE1,                ROUTE_110,                  ANYTIME, ArniePhoneCalleeScript,   ANYTIME, ArniePhoneCallerScript
	phone SCHOOLBOY,    ALAN1,                 ROUTE_111,                  ANYTIME, AlanPhoneCalleeScript,    ANYTIME, AlanPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone LASS,         DANA1,                 ROUTE_113,                  ANYTIME, DanaPhoneCalleeScript,    ANYTIME, DanaPhoneCallerScript
	phone SCHOOLBOY,    CHAD1,                 ROUTE_113,                  ANYTIME, ChadPhoneCalleeScript,    ANYTIME, ChadPhoneCallerScript
	phone POKEFANM,     DEREK1,                ROUTE_39,                  ANYTIME, DerekPhoneCalleeScript,   ANYTIME, DerekPhoneCallerScript
	phone FISHER,       TULLY1,                ROUTE_117,                  ANYTIME, TullyPhoneCalleeScript,   ANYTIME, TullyPhoneCallerScript
	phone POKEMANIAC,   BRENT1,                ROUTE_118,                  ANYTIME, BrentPhoneCalleeScript,   ANYTIME, BrentPhoneCallerScript
	phone PICNICKER,    TIFFANY3,              ROUTE_118,                  ANYTIME, TiffanyPhoneCalleeScript, ANYTIME, TiffanyPhoneCallerScript
	phone BIRD_KEEPER,  VANCE1,                ROUTE_119,                  ANYTIME, VancePhoneCalleeScript,   ANYTIME, VancePhoneCallerScript
	phone FISHER,       WILTON1,               ROUTE_119,                  ANYTIME, WiltonPhoneCalleeScript,  ANYTIME, WiltonPhoneCallerScript
	phone BLACKBELT_T,  KENJI3,                ROUTE_120,                  ANYTIME, KenjiPhoneCalleeScript,   ANYTIME, KenjiPhoneCallerScript
	phone HIKER,        PARRY1,                ROUTE_120,                  ANYTIME, ParryPhoneCalleeScript,   ANYTIME, ParryPhoneCallerScript
	phone PICNICKER,    ERIN1,                 ROUTE_121,                  ANYTIME, ErinPhoneCalleeScript,    ANYTIME, ErinPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_BUENA,    GOLDENROD_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneCalleeScript,   ANYTIME, BuenaPhoneCallerScript
	assert_table_length NUM_PHONE_CONTACTS + 1
