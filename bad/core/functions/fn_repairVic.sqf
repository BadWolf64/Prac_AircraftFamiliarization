#include "script_component.hpp"

FUNC(targetRepair) = {
	params["_target"];
	_target setDamage 0;
	_target setFuel 1;
};

FUNC(repair) = {

	private _playerVic = vehicle player;

	if (_playerVic != player) then {
				
		[_playerVic] call FUNC(targetRepair);

		TRACE_1("Vehicle Repaired: ", _playerVic);
	} else {

		TRACE_1("Repair attempted, not in vehicle", name player);

		False;
	};
};