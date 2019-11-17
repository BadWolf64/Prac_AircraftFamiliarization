#include "script_component.hpp"

["bad_applyDamage", {
    params ["_veh","_damageEng","_damageTRot"];
		_veh setHitPointDamage ["HitEngine",_damageEng];
		_veh setHitPointDamage ["HitVRotor",_damageTRot];
}] call CBA_fnc_addEventHandler;



FUNC(soloActive) = {
	params["_autoRotSwitchL","_soloSwitchL"];
	if (_autoRotSwitchL) then {
		if (_soloSwitchL) then
		{
			player setVariable["autoRotSolo", false];
			hint "Solo Practice Disabled";
			player removeEventHandler ["GetInMan",0];
		} else {
			player setVariable["autoRotSolo", true];
			hint "Solo Practice Enabled";
			player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver")) then {[player getVariable "autoRotSolo"] call soloFunction;};}];
		};	
	};
};

FUNC(soloFunction) = {
	params ["_soloSwitchL"];
	private _timeToWait = random [15, 30 ,90];
	private _selectDMG = selectRandom [1,2];
	["bad_repair", [vehicle player], vehicle player] call CBA_fnc_targetEvent;
	hint "Get above 75m";
	[_soloSwitchL,_selectDMG,_timeToWait] spawn {
		params ["_soloSwitchL","_selectDMG","_timeToWait"];
		if (_this select 0) then 
		{
				waitUntil{
				private _alt = getPosATL vehicle player select 2;
				(_alt > 75)
				};
					hint "AUTOROTATE ARMED";
					sleep _timeToWait;
					if(_selectDMG == 1) then {
					["bad_engineDMG", [vehicle player], vehicle player] call CBA_fnc_targetEvent;
					} else {
					["bad_bothDMG", [vehicle player], vehicle player] call CBA_fnc_targetEvent;
					};
		};
	};
};

FUNC(execDamageToVic) = {
	params["_damageEng","_damageTRot"];

	private _playerVic = vehicle player;

	if (_playerVic != player) then {
		
		private _veh = vehicle player;

		["bad_applyDamage", [_veh,_damageEng,_damageTRot], vehicle player] call CBA_fnc_targetEvent;

	} else {
		hint "You must be in a vehicle to apply damage.";
	}
};