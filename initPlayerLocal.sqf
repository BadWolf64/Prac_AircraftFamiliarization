#include "script_macros.hpp"
// _openMenu = ["MainMenu", "<t color='#2eed15'>Main Menu</t>", "", {[0] call bad_mainMenu_fnc_activeMenu;}, {if ([player] call CBA_fnc_vehicleRole != "driver")then{true}else{false};}, {}, [], [], 0] call ace_interact_menu_fnc_createAction;
// ["CAManBase", 1, ["ACE_SelfActions"], _openMenu, true] call ace_interact_menu_fnc_addActionToClass;
// _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
// _playerName = name player;
// _group = str group player;
// _practiceStatus pushBack [_playerName,_group,[0,0,0,0,0,0,0],""];
// PV_playerPracticeStatus = _practiceStatus;
// publicVariable "PV_playerPracticeStatus";

// If the server, will create and broadcast the mod public variables so that they can be used by all clients.
{
[_x] call CFUNC(checkMod);
} forEach MODS_TO_CHECK_FOR;

// Check if ACE available. If so then use ACE_Player rather than player

private _unit = [] call CFUNC(aceUnitSwitch);
private _player = [_unit] call CFUNC(getPlayerName);

// Call create hashmap for player variables.

[_player] call CFUNC(createPlayerVarHashmap);

// Create a hashmap of taskIDs against IDCs for quick reference of tasks to BIS_fnc_setIDCStreamFriendly

missionNamespace setVariable ["bad_core_taskIDCsHashMap", createHashMap];
private _map = missionNamespace getVariable "bad_core_taskIDCsHashMap";

// Add eventhandler to all player unit for task settings to update when changed to new task.

_unit addEventHandler ["TaskSetAsCurrent", {
  TRACE_1("Params",_this);
  [1,_unit] call EFUNC(gui,openGui);
}];

