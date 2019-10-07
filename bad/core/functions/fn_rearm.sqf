#include "script_component.hpp"

FUNC(targetRearm) = {
	params ["_target","_value"];
	[_target setVehicleAmmoDef _value, [_target], _target] call CBA_fnc_targetEvent;
};

FUNC(rearm) = {
	params ["_value"];

	private _playerVic = vehicle player;

	if (_playerVic != player) then {
				
		[_playerVic,_value] call FUNC(targetRearm);

		TRACE_1("Vehicle Rearmed: ", _playerVic);
	} else {

		TRACE_1("Rearm attempted, not in vehicle", name player);

		False;
	}
};