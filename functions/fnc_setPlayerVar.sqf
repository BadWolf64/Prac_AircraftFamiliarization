#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_core_fnc_setPlayerVar

Description:
    Will update the given variable in the players hashmap and publish it to all connected clients.
    If the variable does not exist in the hashmap then will create a new one.
Parameters:
    _target - target player for which the hashmap is being updated
    _varKey - hashmap key for the given variable
    _value - the new value for the given variable
Returns:

Examples:
    (begin example)

    (end)

Author:
    BadWolf
---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params ["_target","_varKey","_value"];

// Get player variables hashmap

private _player = [_target] call CFUNC(getPlayerName);
private _hashMapStr = HASHMAP_STR(_player);
private _map = missionNamespace getVariable _hashMapStr;

// Either add element to new value or overwrite element with new value value;

_map set [_varKey, _value];

// Make changes Public

publicVariable _hashMapStr;
