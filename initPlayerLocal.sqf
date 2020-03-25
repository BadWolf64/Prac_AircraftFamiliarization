_openMenu = ["MainMenu", "<t color='#2eed15'>Main Menu</t>", "", {[0] call bad_mainMenu_fnc_activeMenu;}, {if ([player] call CBA_fnc_vehicleRole != "driver")then{true}else{false};}, {}, [], [], 0] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions"], _openMenu, true] call ace_interact_menu_fnc_addActionToClass;


_practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
_playerName = name player;
_group = str group player;
_practiceStatus pushBack [_playerName,_group,[0,0,0,0]];
PV_playerPracticeStatus = _practiceStatus;

publicVariable "PV_playerPracticeStatus";