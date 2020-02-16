#include "script_component.hpp"
#include "eiForces.hpp"

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(cleanUpWrecks) = {
	{ deleteVehicle _x } forEach allDead;
	_vehicles = nearestObjects [player, ["helicopter","plane"], 9999]; 
	{ 
	if (count crew vehicle _x == 0) then {deleteVehicle _x}; 
	} forEach _vehicles;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(setupAO) ={

	params["_marker","_positionAO","_type"];

	// Need to fetch current activity. CAS and TOL cannot be on at the same time as each other.... will need to write this in to make sure that it doens't happen.



	if (_type==) then {

		
	} else {
		
	};

	private _strLZ = format ["|%3_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|%3_%1",name player,_positionAO,_type];
	private _strAO = format ["|AO_%1|%2|empty|ELLIPSE|[500,500]|0|border|ColorRed|1|",name player,_positionAO,_type];
	[_strLZ] call BIS_fnc_stringToMarker;
	[_strAO] call BIS_fnc_stringToMarker;
	private _SmokeChemSpawn = [(_positionLZ select 0),(_positionLZ select 1),(_positionLZ select 2)+50];
	private _smoke = "SmokeShellBlue_Infinite" createVehicle _SmokeChemSpawn;
	private _light = "Chemlight_green" createVehicle _SmokeChemSpawn;

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(oppositionEI) = {

	params["_positionAO","_type"];
	


	private _eiVicBOOL = GVAR(PlayerSettings) select 6;
	private _eiAmount = GVAR(PlayerSettings) select 7;
	private _eiDifficulty = GVAR(PlayerSettings) select 8;

	switch (_type) do {
		case "LZ": {

		};
		default { };
	};

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(itemSpawnAO) = {
		switch (_type) do {
		case "LZ": {

		};
		default { };
	};
};