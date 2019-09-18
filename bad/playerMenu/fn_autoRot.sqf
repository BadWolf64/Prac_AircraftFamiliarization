/*
######################################################################################
							Auto Rotation Practice Menu
######################################################################################
*/

//Init
params ["_case"];
	//Inputs
_case = (_this select 0);
	//Switches
_autoRotSwitchL = player getVariable "autoRotSwitch";
_soloSwitchL = player getVariable "autoRotSolo";
	//Variables
_playerVeh = vehicle Player;

//Functions

	// Create Functions to Enable/Disable Switches

autoRotActive = {
	params["_autoRotSwitchL"];

	private _active = (_this select 0);
	
	if (_active) then
	{
		player setVariable["autoRotSwitch", false];
		hint "Autorotaion Menu Disabled";
		player removeEventHandler ["GetInMan",0];
		player setVariable["autoRotSolo", false];	
	} else {
		player setVariable["autoRotSwitch", true];
		hint "Autorotaion Menu Enabled";
	};	
};
soloActive = {
	params["_autoRotSwitchL","_soloSwitchL"];

	private _active = (_this select 0);
	private _soloActive = (_this select 1);

	if (_active) then{
		if (_soloActive) then
		{
			player setVariable["autoRotSolo", false];
			hint "Solo Practice Disabled";
			player removeEventHandler ["GetInMan",0];
		} else {
			player setVariable["autoRotSolo", true];
			hint "Solo Practice Enabled";
			player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver")) then {[] call soloFunction;};}];
		};	
	} else{
		hint "Autorotation Practice is not Enabled";
	};
};

//Function that controls Solo Practice

soloFunction = {

	private _timeToWait = random [15, 30 ,90];
	private _selectDMG = selectRandom [1,2];
	// private _ATL = getPosATL vehicle player select 2;

	["bad_repair", [vehicle player], vehicle player] call CBA_fnc_targetEvent;

	hint "Get above 75m";
	
	[_selectDMG,_timeToWait] spawn {	
		params ["_selectDMG","_timeToWait"];
		waitUntil{
			private _alt = getPosATL vehicle player select 2;
			(_alt > 75)
			};
		sleep _timeToWait;
		if(_selectDMG == 1) then {
		["bad_engineDMG", [vehicle player], vehicle player] call CBA_fnc_targetEvent;
		} else {
		["bad_bothDMG", [vehicle player], vehicle player] call CBA_fnc_targetEvent;
		};
	};
};


//Create Event Handlers

	//These Events will only trigger if Auto Rotate is Active && are only called when a button is clicked in the menu. 

["bad_engineDMG", {
    params ["_playerVeh"];
		_playerVeh setHitPointDamage ["HitEngine",1];
}] call CBA_fnc_addEventHandler;
["bad_bothDMG", {
    params ["_playerVeh"];
		_playerVeh setHitPointDamage ["HitEngine",1];_playerVeh setHitPointDamage ["HitVRotor",1];
}] call CBA_fnc_addEventHandler;
	// This will heal the players in the vic and the A/C
["bad_repair", {
    params ["_playerVeh"];
		_playerVeh  setDamage 0; _playerVeh setFuel 1; [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
}] call CBA_fnc_addEventHandler;

/*
######################################################################################
	MAIN FUNCTION
######################################################################################
*/

// Switch Cases depending on what is passed into the function. 

switch _case do {
	case 1: {[_autoRotSwitchL] call autoRotActive;};
	case 2: {if (_autoRotSwitchL) then {["bad_engineDMG", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 3: {if (_autoRotSwitchL) then {["bad_bothDMG", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 4: {if (_autoRotSwitchL) then {["bad_repair", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 5: {[_autoRotSwitchL,_soloSwitchL] call soloActive;};
};


