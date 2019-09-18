/*
Auto Rotation Practice Menu
1. Menu is activated from the Laptop - Opens Manu>>> Click Activate and Options are available. 
2. Check if the pilot has the Autorotation Practice Enabled. 
3. Menu can be opened only if you are not the pilot. 

 */
params ["_case"];
_autoRotSwitchL = player getVariable "autoRotSwitch";
// _posPlayer = [player] call bad_fnc_isPilot;
_playerVeh = vehicle Player;
_case = (_this select 0);

_engineDMG = { if (_autoRotSwitchL) then {_playerVeh setHitPointDamage ["HitEngine",1];};};
_bothDMG = { if (_autoRotSwitchL) then {_playerVeh setHitPointDamage ["HitEngine",1];_playerVeh setHitPointDamage ["HitVRotor",1];};};
_repair = { if (_autoRotSwitchL) then {_playerVeh  setDamage 0; _playerVeh setFuel 1;};};
_autoRotActive = {
	if (_autoRotSwitchL) then
	{
		player setVariable["autoRotSwitch", false];
		hint "Autorotaion Menu Disabled";
		player removeEventHandler ["GetInMan",0];
		removeAllActions player;
	} else {
		player setVariable["autoRotSwitch", true];
		hint "Autorotaion Menu Enabled";
		player addEventHandler ["GetInMan",{if ((_this select 1) != ("driver")) then {(_this select 0) addAction ["Autorotation Menu", {createDialog "autoRotMenu"}];};}];
		player addEventHandler ["GetOutMan",{removeAllActions (_this select 0);}];
	};	
};

switch _case do {
	case 1: _autoRotActive;
	case 2: _engineDMG;
	case 3: _bothDMG;
	case 4: _repair;
};