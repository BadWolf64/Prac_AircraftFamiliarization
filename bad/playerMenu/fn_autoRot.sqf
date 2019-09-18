/*
######################################################################################
								 Auto Rotation Practice Menu
######################################################################################
*/
// INIT
params ["_case"];
	// Inputs
Private _case = (_this select 0);
	// Switches
Private _autoRotSwitchL = player getVariable "autoRotSwitch";
Private _soloSwitchL = player getVariable "autoRotSolo";
	// Variables
Private _veh = vehicle Player;

// FUNCTIONS

	// Create Functions to Enable/Disable Switches

autoRotActive = {
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
soloActive = {
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

// Function that controls Solo Practice

soloFunction = {
	params ["_soloSwitchL"];

	// private _soloSwitchL = _this select 0;
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


// EVENT HANDLERS

	// These Events will only trigger if Auto Rotate is Active && are only called when a button is clicked in the menu. 

["bad_engineDMG", {
    params ["_veh"];
		_veh setHitPointDamage ["HitEngine",1];
}] call CBA_fnc_addEventHandler;
["bad_bothDMG", {
    params ["_veh"];
		_veh setHitPointDamage ["HitEngine",1];_veh setHitPointDamage ["HitVRotor",1];
}] call CBA_fnc_addEventHandler;
	// This will heal the players in the vic and the A/C
["bad_repair", {
    params ["_veh"];
		_veh  setDamage 0; _veh setFuel 1; [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
}] call CBA_fnc_addEventHandler;

/*
######################################################################################
	MAIN FUNCTION
######################################################################################
*/

// Switch Cases depending on what is passed into the function. 

switch _case do {
	case 1: {[_autoRotSwitchL] call autoRotActive;};
	case 2: {if (_autoRotSwitchL) then {["bad_engineDMG", [_veh], _veh] call CBA_fnc_targetEvent;};};
	case 3: {if (_autoRotSwitchL) then {["bad_bothDMG", [_veh], _veh] call CBA_fnc_targetEvent;};};
	case 4: {if (_autoRotSwitchL) then {["bad_repair", [_veh], _veh] call CBA_fnc_targetEvent;};};
	case 5: {[_autoRotSwitchL,_soloSwitchL] call soloActive;};
};


