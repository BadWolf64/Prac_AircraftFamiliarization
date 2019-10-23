#include "script_component.hpp"

FUNC(toggleSS) = {

	params ["_value"];

	if !(isServer) exitWith {};

	private _ssEnabled =  missionNamespace getVariable ["potato_safestart_enabled",-1];

	if (_ssEnabled) then {
		[_value] call potato_safestart_fnc_togglesafestart;
	};
};