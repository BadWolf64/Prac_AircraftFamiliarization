#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_gui_fnc_flightLeadList

Description:
    This function will check for all players in the server and add them to the Flight Lead List in the settings menu
Parameters:
    _target - The player that is calling for the menu to be opened.
Returns:

Examples:
    (begin example)

    (end)

Author: BadWolf

---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params ["_ctrl"];

// waitUntil {!isNull SETTINGS_DISPLAY;};

private _unit = [] call CFUNC(aceUnitSwitch);
private _playerName = [_unit] call CFUNC(getPlayerName);
private _allPLayers = allPlayers - entities "HeadlessClient_F";
private _hashMapStr = HASHMAP_STR(_playerName);
private _map = missionNamespace getVariable _hashMapStr;
private _currentFlightLead = _map get "fltLd";
lbClear _ctrl;

{
  private _playerName = [_x] call CFUNC(getPlayerName);
  _ctrl lbAdd _playerName;
  _ctrl lbSetData [_forEachIndex,str _x];
  if (_playerName == _currentFlightLead) then {
    _ctrl lbSetCurSel _forEachIndex;
  };
} forEach _allPlayers;
