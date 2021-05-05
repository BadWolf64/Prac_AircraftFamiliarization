#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_corefnc_checkActivePractice

Description:
    Gets the active practice of the player
Parameters:
    _target - target player for which the hashmap is being updated (TYPE OBJECT)
Returns:
    _taskID
Examples:
    (begin example)

    (end)

Author:
    BadWolf
---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params ["_target"];

private _task = [_target] call BIS_fnc_taskCurrent;
TRACE_2("Active Task",_target,_task);
_task;
