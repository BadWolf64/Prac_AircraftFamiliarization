// AO Setup
#define AO_ELIPSE "|AO_%1|%2|empty|ELLIPSE|[500,500]|0|DiagGrid|ColorRed|0.5|AO_%1"
#define MARKER_LZ "|Target_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|%3_%1"
#define TELEPORT_DIST 2000

#define TOL_SMOKE "SmokeShellBlue_Infinite"
#define SLING_SMOKE "SmokeShellGreen_Infinite"
#define CAS_SMOKE "SmokeShellRed_Infinite"

#define TOL_LIGHT "Chemlight_blue"
#define SLING_LIGHT "Chemlight_green"
#define CAS_LIGHT "Chemlight_red"

// EI Groups Setup

#define BASE_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_VDV_M_EMR")
#define MG_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_MG_VDV_M_EMR")
#define AA_EI ["CUP_O_RU_Soldier_AA_VDV_M_EMR","CUP_O_RU_Soldier_TL_M_EMR"],[],[],[],[],[],0

//EI Settings 

#define BASE_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSquad_VDV_M_EMR")
#define MG_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_MG_VDV_M_EMR")
#define AA_EI (configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry" >> "CUP_O_RU_InfSection_AA_M_EMR")
#define LIGHT_VIC (configfile >> "CfgVehicles" >> "CUP_O_UAZ_MG_RU")
#define MEDIUM_VIC (configfile >> "CfgVehicles" >> "CUP_O_BTR60_Green_RU")
#define AA_ZU_VIC (configfile >> "CfgVehicles" >> "CUP_O_Ural_ZU23_RU")
#define AA_TUN_VIC (configfile >> "CfgVehicles" >> "CUP_O_2S6_RU")
#define TANK_VIC (configfile >> "CfgVehicles" >> "CUP_O_T72_RU")

#define LIGHT_VIC "CUP_O_UAZ_MG_RU"
#define MEDIUM_VIC "CUP_O_BTR60_Green_RU"
#define AA_ZU_VIC "CUP_O_Ural_ZU23_RU"
#define AA_TUN_VIC "CUP_O_2S6_RU"
#define TANK_VIC CUP_O_T72_RU"

#define SPAWN_RAD_MAX 1000
#define SPAWN_RAD_MEAN 750
#define SPAWN_RAD_MIN 400

// Autorotation Defaults

#define AUTOROTATION_DAMAGE_DEFAULT 2 // AUTOROTATION_DAMAGE_VALUES_ARRAY [0,0.25,0.5,0.75,1]
#define DAMAGE_TRIGGER_HEIGHT_DEFAULT 50
#define DAMAGE_TRIGGER_TIME_DEFAULT 30