#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_core_fnc_checkMods (ran by server only)

Description:
    Will check for the given mods and create a public variable for all clients.
Parameters:
    _mod - mod to check for.
Returns:
    Public Variable with either a true of false value.
Examples:
    (begin example)
      [ace] call bad_core_fnc_checkMods;
      // creates Public Variable named "bad_core_ace" with value true if ace is available.
    (end)

Author:
    BadWolf
---------------------------------------------------------------------------- */

if(!isServer) exitWith {};

params ["_mod"];

private _str = QUOTE(ADDON) + "_" + _mod;

if (isClass(configFile >> "CfgMods" >> _mod)) then {
  missionNamespace setVariable [_str, true];
} else {
  missionNamespace setVariable [_str, false];
};

publicVariable _str;
