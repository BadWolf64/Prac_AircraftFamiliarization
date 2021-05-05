#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_core_fnc_createPlayerVarHashmap

Description:
    Initial creation of a players variables hashmap. This is ran by initPlayerLocal.sqf so that it runs for JIPS.
Parameters:
    _target - target player for which the hashmap is being generated
Returns:
    public hasmap named in the form bad_core_*_playerName*_vars with the following contents [["fltLd",_playerName],["actvTskID",0]]
Examples:
    (begin example)
      [player] call bad_core_fnc_createPlayerVarHashmap
        where player is named "BadWolf"
      // publicVariable called "bad_core_badwolf_vars" = [["fltLd","BadWolf"],["actvTskID",0]]
    (end)

Author:

---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params["_player"];

if(!hasInterface) exitWith {INFO("Cannot be ran on the server or HC")};
private _unit = nil;
private _hashMapStr = HASHMAP_STR(_player);
if (ACE_ENABLED) then {
  _unit = player;
} else {
  _unit = ACE_player;
};
missionNamespace setVariable [_hashMapStr, createHashMapFromArray [["fltLd",_player],["actvTskID",0],["unit",_unit]]];
publicVariable _hashMapStr;
