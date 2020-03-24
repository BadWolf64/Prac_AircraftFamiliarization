<<<<<<< HEAD

#define AO_ELIPSE "|AO_%1|%2|empty|ELLIPSE|[500,500]|0|DiagGrid|ColorRed|0.5|AO_%1"
#define MARKER_LZ "|Target_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|%3_%1"
#define TOL_SMOKE "SmokeShellBlue_Infinite"
#define SLING_SMOKE "SmokeShellGreen_Infinite"
#define CAS_SMOKE "SmokeShellRed_Infinite"
#define TOL_LIGHT "Chemlight_blue"
#define SLING_LIGHT "Chemlight_green"
#define CAS_LIGHT "Chemlight_red"
#define TELEPORT_DIST 2000
#define BASE_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_VDV_M_EMR")
#define MG_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_MG_VDV_M_EMR")
#define AA_EI ["CUP_O_RU_Soldier_AA_VDV_M_EMR","CUP_O_RU_Soldier_TL_M_EMR"],[],[],[],[],[],0
=======
// AO Settings

#define AO_ELIPSE "|AO_%1|%2|empty|ELLIPSE|[500,500]|0|DiagGrid|ColorRed|0.5|AO_%1"
#define MARKER_LZ "|Target_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|%3_%1"

#define TOL_SMOKE "SmokeShellBlue_Infinite"
#define SLING_SMOKE "SmokeShellGreen_Infinite"
#define CAS_SMOKE "SmokeShellRed_Infinite"

#define TOL_LIGHT "Chemlight_blue"
#define SLING_LIGHT "Chemlight_green"
#define CAS_LIGHT "Chemlight_red"

#define TELEPORT_DIST 2000

// EI Groups Setup
#define BASE_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_VDV_M_EMR")
#define MG_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_MG_VDV_M_EMR")
#define AA_EI ["CUP_O_RU_Soldier_AA_VDV_M_EMR","CUP_O_RU_Soldier_TL_M_EMR"],[],[],[],[],[],0

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
#define LIGHT_VIC "CUP_O_UAZ_MG_RU"
#define MEDIUM_VIC "CUP_O_BTR60_Green_RU"
#define AA_ZU_VIC "CUP_O_Ural_ZU23_RU"
#define AA_TUN_VIC "CUP_O_2S6_RU"
#define TANK_VIC CUP_O_T72_RU"
<<<<<<< HEAD
=======

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
#define SPAWN_RAD_MAX 1000
#define SPAWN_RAD_MEAN 750
#define SPAWN_RAD_MIN 400