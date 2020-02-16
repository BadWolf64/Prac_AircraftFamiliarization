#include "script_component.hpp"

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(targetRearm) = {
	params ["_target"];
	[_target setVehicleAmmoDef 1, [_target], _target] call CBA_fnc_targetEvent;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(rearm) = {

	private _playerVic = vehicle player;

	if (_playerVic != player) then {
				
		[_playerVic] call FUNC(targetRearm);

		TRACE_1("Vehicle Rearmed: ", _playerVic);
	} else {

		TRACE_1("Rearm attempted, not in vehicle", name player);

		False;
	}
};