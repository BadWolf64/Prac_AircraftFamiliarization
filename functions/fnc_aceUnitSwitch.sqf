#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_core_fnc_aceUnitSwitch

Description:
    Will check if ACE is enabled and then select the best variable for unit variable.
Parameters:
    _target - The player that is calling for the menu to be opened.
Returns:

Examples:
    (begin example)

    (end)

Author:

---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

private _unit = nil;
if(ACE_ENABLED) then {
  _unit = ACE_player;
  } else {
  _unit = player;
};
_unit;
