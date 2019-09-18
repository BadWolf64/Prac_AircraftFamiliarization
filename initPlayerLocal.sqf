player setVariable ["autoRotSwitch", false];
player setVariable ["autoRotSolo", false];
player setVariable ["TOLSwitch", false];
player setVariable ["opposition", false];
player setVariable ["typeLZ","OLZ"];
player setVariable ["TP",false];
player setVariable ["inProgress",false];
	//Create ACEaddAction
_openMenu = ["AutorotationMenu", "<t color='#2eed15'>Autorotation Menu</t>", "", {createDialog "autoRotMenu";}, {if (player getVariable "autoRotSwitch" && [player] call CBA_fnc_vehicleRole != "driver")then{true}else{false};}, {}, [], [], 0] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions"], _openMenu, true] call ace_interact_menu_fnc_addActionToClass;

