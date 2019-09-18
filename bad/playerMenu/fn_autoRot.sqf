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

	//Randomisers for Solo Practice

_engineDMGrand = {};
_bothDMGrand = {};

	// Create Functions to Enable/Disable Switches

_autoRotActive = {
	if (_autoRotSwitchL) then
	{
		player setVariable["autoRotSwitch", false];
		hint "Autorotaion Menu Disabled";
		player removeEventHandler ["GetInMan",0];
		player removeEventHandler ["GetOutMan",0];
		removeAllActions player;
	} else {
		player setVariable["autoRotSwitch", true];
		hint "Autorotaion Menu Enabled";
		player addEventHandler ["GetInMan",{if ((_this select 1) != ("driver")) then {(_this select 0) addAction ["Autorotation Menu", {createDialog "autoRotMenu"}];};}];
		player addEventHandler ["GetOutMan",{removeAllActions (_this select 0);}];
	};	
};
_soloActive = {
	if (_autoRotSwitchL && _soloSwitchL) then
	{
		player setVariable["autoRotSolo", false];
		hint "Solo Practice Disabled";
		player removeEventHandler ["GetInMan",1];
	} else {
		player setVariable["autoRotSwitch", true];
		hint "Solo Practice Enabled";
	// EH will trigger when player gets is the vehicle - it heals the player and repairs the vic and also triggers the timer for starting the autorotation.
		player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver")) then {};}];
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
	case 1: _autoRotActive;
	case 2: {if (_autoRotSwitchL) then {["bad_engineDMG", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 3: {if (_autoRotSwitchL) then {["bad_bothDMG", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 4: {if (_autoRotSwitchL) then {["bad_repair", [_playerVeh], _playerVeh] call CBA_fnc_targetEvent;};};
	case 5: _soloActive;
};
