#define PREFIX BAD
#ifndef COMPONENT
  #define COMPONENT PRACTICE
#endif
#ifndef CUSTOM_FOLDER
  #define CUSTOM_FOLDER functions
#endif
#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#include "\x\cba\addons\main\script_macros_common.hpp"
#define ACE_PREFIX ace
#define ACEGVAR(module,var) TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var) QUOTE(ACEGVAR(module,var))
#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ACE_PREFIX,var1),fnc,var2)
#define DACEFUNC(var1,var2) TRIPLES(DOUBLES(ACE_PREFIX,var1),fnc,var2)
#define QACEFUNC(var1,var2) QUOTE(DACEFUNC(var1,var2))
#define ACECSTRING(var1,var2) QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,var1),var2))
#define ACELSTRING(var1,var2) QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,var1),var2))
#define CFUNC(var1) EFUNC(core,var1)
#ifdef CUSTOM_FOLDER
    #define PATHTO_SYS(var1,var2,var3) ##CUSTOM_FOLDER\##var3.sqf
    #define PATHTOF_SYS(var1,var2,var3) ##CUSTOM_FOLDER\##var3
    #define PATHTOF2_SYS(var1,var2,var3) ##CUSTOM_FOLDER\##var3
#else
    #define PATHTO_SYS(var1,var2,var3) ##var1\##var2\##var3.sqf
    #define PATHTOF_SYS(var1,var2,var3) ##var1\##var2\##var3
    #define PATHTOF2_SYS(var1,var2,var3) ##var1\##var2\##var3
#endif
/************************** REMOVAL OF MACROS ***********************/
#undef MAINPREFIX
#undef SUBPREFIX
#undef VERSION_AR
#undef VERSION_CONFIG
#undef VERSIONING_SYS
#undef VERSIONING
#undef PRELOAD_ADDONS
#undef BWC_CONFIG
#undef XEH_DISABLED
#undef XEH_PRE_INIT
#undef XEH_PRE_CINIT
#undef XEH_PRE_SINIT
#undef XEH_POST_INIT
#undef XEH_POST_CINIT
#undef XEH_POST_SINIT
#undef PATHTO_FNC
#define PATHTO_FNC(func) class func {\
    file = QUOTE(DOUBLES(fnc,func).sqf);\
    RECOMPILE;\
}

// General

#define DISABLED 0
#define ENABLED 1
#define ENABLED_DISABLED_STRINGS_ARRAY ["Disabled","Enabled"]
#define MAP_DIALOG findDisplay 12
#define MODS_TO_CHECK_FOR ["ace","ACRE2"]
#define ACE_ENABLED missionNamespace getVariable "bad_core_ace"

#define HASHMAP_STR(var) format ["bad_core_%1_vars",var]

// Task Defines

#define TASK_PARENT_HELO_ID 1
#define TASK_HELO_TOL_ID 10
#define TASK_HELO_AUTOROTATION_ID 11
#define TASK_PARENT_PLANE_ID 2

// Overall Settings

#define OVERALL_GUI_QUIET_STRINGS ENABLED_DISABLED_STRINGS_ARRAY

// GUI Defines
#define SETTINGS_DISPLAY_IDC 653
#define TASK_DESC_IDC 654
#define TASK_SETTINGS_CT_IDC 655
#define FLIGHT_LEAD_IDC 656

// Autorotation defines

#define AUTOROTATION_ICON "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa"
#define AUTOROTATION_DAMAGE_LOCATION_TAIL "HitVRotor"
#define AUTOROTATION_DAMAGE_LOCATION_ENGINE "HitEngine"
#define AUTOROTATION_WARNINGS_STRINGS ENABLED_DISABLED_STRINGS_ARRAY

// GUI Style Defines
#define ST_LEFT					0x00
#define ST_RIGHT				0x01
#define ST_CENTER				0x02
#define ST_DOWN					0x04
#define ST_UP					0x08
#define ST_VCENTER				0x0C
#define ST_SINGLE				0x00
#define ST_MULTI				0x10
#define ST_TITLE_BAR			0x20
#define ST_PICTURE				0x30
#define ST_FRAME				0x40
#define ST_BACKGROUND			0x50
#define ST_GROUP_BOX			0x60
#define ST_GROUP_BOX2			0x70
#define ST_HUD_BACKGROUND		0x80
#define ST_TILE_PICTURE			0x90
#define ST_WITH_RECT			0xA0
#define ST_LINE					0xB0
#define ST_UPPERCASE			0xC0
#define ST_LOWERCASE			0xD0
#define ST_ADDITIONAL_INFO		0x0F00
#define ST_SHADOW				0x0100
#define ST_NO_RECT				0x0200
#define ST_KEEP_ASPECT_RATIO	0x0800
#define ST_TITLE				ST_TITLE_BAR + ST_CENTER
#define SL_VERT					0
#define SL_HORZ					0x400
#define SL_TEXTURES				0x10
#define ST_VERTICAL				0x01
#define ST_HORIZONTAL			0
#define LB_TEXTURES				0x10
#define LB_MULTI				0x20
#define TR_SHOWROOT				1
#define TR_AUTOCOLLAPSE			2
// GUI Control Defines
#define CT_STATIC				  0
#define CT_BUTTON				  1
#define CT_EDIT					  2
#define CT_SLIDER				  3
#define CT_COMBO				  4
#define CT_LISTBOX				  5
#define CT_TOOLBOX				  6
#define CT_CHECKBOXES			  7
#define CT_PROGRESS				  8
#define CT_HTML					  9
#define CT_STATIC_SKEW			 10
#define CT_ACTIVETEXT			 11
#define CT_TREE					 12
#define CT_STRUCTURED_TEXT		 13
#define CT_CONTEXT_MENU			 14
#define CT_CONTROLS_GROUP		 15
#define CT_SHORTCUTBUTTON		 16
#define CT_HITZONES				 17
#define CT_VEHICLETOGGLES		 18
#define CT_CONTROLS_TABLE		 19
#define CT_XKEYDESC				 40
#define CT_XBUTTON				 41
#define CT_XLISTBOX				 42
#define CT_XSLIDER				 43
#define CT_XCOMBO				 44
#define CT_ANIMATED_TEXTURE		 45
#define CT_MENU					 46
#define CT_MENU_STRIP			 47
#define CT_CHECKBOX				 77
#define CT_OBJECT				 80
#define CT_OBJECT_ZOOM			 81
#define CT_OBJECT_CONTAINER		 82
#define CT_OBJECT_CONT_ANIM		 83
#define CT_LINEBREAK			 98
#define CT_USER					 99
#define CT_MAP					100
#define CT_MAP_MAIN				101
#define CT_LISTNBOX				102
#define CT_ITEMSLOT				103
#define CT_LISTNBOX_CHECKABLE	104
#define CT_VEHICLE_DIRECTION	105
