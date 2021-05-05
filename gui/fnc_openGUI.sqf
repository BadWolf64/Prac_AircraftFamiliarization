#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_gui_fnc_openGui

Description:
    This function will check for current task and then open the settings menu specific to that task in the map screen.
Parameters:
    _update - If is true then will update the currently displayed control group and related controls with the new task information.
Returns:

Examples:
    (begin example)

    (end)

Author:

---------------------------------------------------------------------------- */

TRACE_1("Params",_this);

params ["_update"];

private _ctrl = MAP_DIALOG displayCtrl SETTINGS_DISPLAY_IDC;
private _visible = ctrlShown _ctrl;
private _unit = [] call CFUNC(aceUnitSwitch);
private _update = if(_update isEqualTo 1) then {true} else {false};
if (!_visible && _update) exitWith {};
if (_visible && !_update) exitWith {ctrlDelete _ctrl;};
if (!_visible) then {MAP_DIALOG ctrlCreate [QGVAR(settings_gui),SETTINGS_DISPLAY_IDC];};
private _ctrlTable = MAP_DIALOG displayCtrl TASK_SETTINGS_CT_IDC;
private _ctrlDesc = MAP_DIALOG displayCtrl TASK_DESC_IDC;
private _activeTask = [_unit] call CFUNC(checkActivePractice);
switch (_activeTask) do {
  case QUOTE(TASK_HELO_AUTOROTATION_ID) : {
  _ctrlDesc ctrlSetText "Autorotation Practice";
  };
  default {
  _ctrlDesc ctrlSetText "You have not selected a task. Close this display and select a task before continuing.";
  };
};
[_ctrlTable, _unit,_activeTask] call FUNC(controlTable);

