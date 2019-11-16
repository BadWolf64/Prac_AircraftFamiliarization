#include "script_component.hpp"

["bad_engineDMG", {
    params ["_veh"];
		_veh setHitPointDamage ["HitEngine",1];
}] call CBA_fnc_addEventHandler;
["bad_tailRotDMG", {
    params ["_veh"];
		_veh setHitPointDamage ["HitVRotor",1];
}] call CBA_fnc_addEventHandler;
["bad_bothDMG", {
    params ["_veh"];
		_veh setHitPointDamage ["HitEngine",1];_veh setHitPointDamage ["HitVRotor",1];
}] call CBA_fnc_addEventHandler;

FUNC(autoRotActive) = {
	params["_autoRotSwitchL"];
	if (_autoRotSwitchL) then
	{
		player setVariable["autoRotSwitch", false];
		hint "Autorotaion Menu Disabled";
		player setVariable["autoRotSolo", false];	
		player removeEventHandler ["GetInMan",0];
	} else {
		player setVariable["autoRotSwitch", true];
		hint "Autorotaion Menu Enabled";
	};	
};

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