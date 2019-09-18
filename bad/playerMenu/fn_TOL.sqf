/*
######################################################################################
						Take off and Landing Practice Menu
######################################################################################
*/
// INIT
	// Params

	// Variables
_enable = player getVariable "TOLSwitch";
private _veh = vehicle player;

// FUNCTIONS

	["bad_repair", {
	params ["_veh"];
	_veh  setDamage 0; _veh setFuel 1; [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
	}] call CBA_fnc_addEventHandler;

	// This function waits until the player is in a Heli, and then moves the Heli to the start of the landing run. Run's until the player lands and then passes off to the Take Off Function.
bad_LandingFunction = {
	player setVariable ["inProgress",true];
	private _veh = vehicle player;
	private _type = player getVariable "typeLZ";
	private _teleport = player getVariable "TP";
	private _LZs = allMapMarkers select {_x find _type isEqualTo 0};
	private _LZ = selectRandom _LZs;
	private _positionLZ = getMarkerPos _LZ;
	private _dirLZ = markerDir _LZ;
	private _initDist = 2000;
	private _sinLZ = sin _dirLZ;
	private _cosLZ = cos _dirLZ;

	[_positionLZ] call bad_setUpLZFunction;

	private _strLZ = format ["|LandingZone_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|LZ_%1",name player,_positionLZ];
	private _strAO = format ["|AO_%1|%2|empty|ELLIPSE|[500,500]|0|border|ColorRed|1|",name player,_positionLZ];
	
	[_strLZ] call BIS_fnc_stringToMarker;
	[_strAO] call BIS_fnc_stringToMarker;

	if (_teleport) then {
		_veh setVehiclePosition [[(_positionLZ select 0) - (_initDist*_sinLZ),(_positionLZ select 1) - (_initDist*_cosLZ),(_positionLZ select 2)+50],[],100,"FLY"];
		_veh setDir _dirLZ;
		openMap true;
		["bad_repair", [_veh], _veh] call CBA_fnc_targetEvent;
	};

	hint "New LZ can be found on your map";

	landed = [{ 
	  	params ["_veh"];
	  	private _velVeh = velocity _veh;
		private _atlVeh = getPos Vehicle Player select 2;
		private _marker = format ["LandingZone_%1",name Player];
		private _posMarker = getMarkerPos _marker;
		private _dist = [_veh,_posMarker] call CBA_fnc_getDistance;
		private _reqDist = 50;
		private _reqATL = 0.3;

	  if (_dist < _reqDist && _atlVeh < _reqATL  && ( _velVeh select 0 < 0.01) && (_velVeh select 1 < 0.01) && (_velVeh select 2 < 0.01)) exitWith {
			[_veh] call bad_TakeOffFunction;
		};
	}, 0, _veh] call CBA_fnc_addPerFrameHandler;
};

	//Take off function, once the player has landed, instructs to take off the get out of the LZ. This will 
bad_TakeOffFunction = {
	params["_veh"];
	
	hint "Now Take off and get out of the AO";

	[landed] call CBA_fnc_removePerFrameHandler;

	exitAO = [{
			params ["_veh"];
			private _marker = format ["LandingZone_%1",name Player];
		 	private _posMarker = getMarkerPos _marker;
			private _dist = [_veh,_posMarker] call CBA_fnc_getDistance;
			if (_dist > 500) exitWith {
			[_posMarker,_marker] call bad_CleanUpAO;
		};
	}, 0, _veh] call CBA_fnc_addPerFrameHandler;
};

	//Create Opposition Forces Function.
bad_setUpLZFunction = {
	params["_positionLZ"];

	_opposition = player getVariable "opposition";
	if (_opposition) then {
		private _spawnRad = 200;
		private _posEI = [(_positionLZ select 0) - _spawnRad * sin (random 359),(_positionLZ select 1) - _spawnRad * cos (random 359),0];
		_groupAI = [ _posEI, EAST, (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vmf" >> "rhs_group_rus_vmf_infantry" >> "rhs_group_rus_vmf_infantry_squad_2mg")] call BIS_fnc_spawnGroup;
		{_x setSkill 0.5;} foreach units _groupAI;
	} else {
		// systemChat "There is no opposition"
	};
	_SmokeChemSpawn = [(_positionLZ select 0),(_positionLZ select 1),(_positionLZ select 2)+50];
	_smoke = "SmokeShellBlue_Infinite" createVehicle _SmokeChemSpawn;
	_light = "Chemlight_green" createVehicle _SmokeChemSpawn;
};

	//Cleanup Function Removes opposition forces around LZ and cleans up the smoke and Chemlight
bad_CleanUpAO = {
	params ["_posMarker","_marker"];
	private _markerAO = format ["AO_%1",name Player];
	player setVariable ["inProgress",false];
	_listObjectsLZ = _posMarker nearObjects["SmokeShell", 20];
	_ListObjectsAO = _posMarker nearObjects["Man", 500];
	{deleteVehicle _x} forEach _listObjectsLZ;
	{deletevehicle _x} forEach _ListObjectsAO;
	deleteMarker _marker;
	deleteMarker _markerAO;

	[exitAO] call CBA_fnc_removePerFrameHandler;
	[] call bad_LandingFunction;
};

	// Will clean up after a player has disabled the practice. 
bad_generalCleanUp = {
	[exitAO] call CBA_fnc_removePerFrameHandler;
	[landed] call CBA_fnc_removePerFrameHandler;
	private _markerAO = format ["AO_%1",name Player];
	private _marker = format ["LandingZone_%1",name Player];
	private _posMarker = getMarkerPos _marker;
	player setVariable ["inProgress",false];
	_listObjectsLZ = _posMarker nearObjects["SmokeShell", 20];
	_ListObjectsAO = _posMarker nearObjects["Man", 500];
	{deleteVehicle _x} forEach _listObjectsLZ;
	{deletevehicle _x} forEach _ListObjectsAO;
	deleteMarker _marker;
	deleteMarker _markerAO;s
};


/*
######################################################################################
	MAIN FUNCTION
######################################################################################
*/

if (_enable) then {
	player setVariable ["TOLSwitch", false];
	player removeEventHandler ["GetInMan", 0];
	player removeEventHandler ["GetOutMan", 0];
	[] call bad_generalCleanUp;
} else 
{
	player setVariable ["TOLSwitch", true];
	hint "Get in a Heli to Start.";
	player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver") && !(player getVariable "inProgress")) then {[] call bad_LandingFunction;};}];
	player addEventHandler ["GetOutMan",{["bad_repair", [(_this select 2)], (_this select 2)] call CBA_fnc_targetEvent;}];
};

