#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_gui_fnc_getPlayerName

Description:
    Will check if ACE is enabled and then select the best variable for player name.
Parameters:
    _target - The player that is calling for the menu to be opened.
Returns:

Examples:
    (begin example)

    (end)

Author:

---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params ["_target"];

private _player = nil;

if (ACE_ENABLED) then {
    _player = [_target] call ACEFUNC(common,getName);
  } else {
    _player = name _target;
};
TRACE_2("Player Name",_target,_player);
_player;
