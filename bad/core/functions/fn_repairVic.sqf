#include "script_component.hpp"

FUNC(targetRepair) = {
	params["_target"];
	private _playerVic = vehicle _target;
	_playerVic setDamage 0;
	_playerVic setFuel 1;
};

FUNC(repair) = {

	private _playerVic = vehicle player;

	if (_playerVic != player) then {
				
		[_playerVic] call FUNC(targetRepair);

		TRACE_1("Vehicle Repaired: ", _playerVic);
	} else {

		TRACE_1("Repair attempted, not in vehicle", name _player);
		False;
	};
};