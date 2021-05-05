#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_core_fnc_fullHeal

Description:
    Determines if using ACE3 or not and then applies the a full heal to the targer.
    If the player is in a vehicle then it will full heal all in the vehicle.
Parameters:
    _target - Unit to which to apply full health
Returns:

Examples:
    (begin example)
      [player] call bad_core_fnc_fullHeal - will apply full health to player and if they are in a vic all others in that vic.
    (end)

Author:
    Badwolf
---------------------------------------------------------------------------- */

params ["_target"];

private _targetVic = vehicle _target;
TRACE_1("Player Vehicle: ", _targetVic);
if (_targetVic != player) then {
  private _listCrew = crew _targetVic;
  {
    [QACEGVAR(medical_treatment,fullHealLocal), [_target, _target], _target] call CBA_fnc_targetEvent;;
    TRACE_1("Unit Healed: ", _x);
  } forEach _listCrew;
} else {
  [QACEGVAR(medical_treatment,fullHealLocal), [_target, _target], _target] call CBA_fnc_targetEvent;;
  TRACE_1("Unit Healed: ", player);
};


