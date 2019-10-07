#include "script_component.hpp"

FUNC(targetHeal) = {
	params ["_target"];
	[QACEGVAR(medical_treatment,fullHealLocal), [_target, _target], _target] call CBA_fnc_targetEvent;
};


FUNC(fullHeal) = {
	private _playerVic = vehicle player;

	TRACE_1("Player Vehicle: ", _playerVic);

	if (_playerVic != player) then {
		private _listCrew = crew _playerVic;
		{
			[_x] call FUNC(targetHeal);
			
			TRACE_1("Unit Healed: ", _x);

		} forEach _listCrew;
	} else {
		[player] call FUNC(targetHeal);

		TRACE_1("Unit Healed: ", player);
	};
};