#include "script_component.hpp"
#include "settingsTOL.hpp"

GVAR(ActiveAOs) = [

];

/* 

FUNCTION : cleanUpWrecks : [] call bad_core_fnc_cleanUpWrecks

DESCRIPTION : Cleans up the wrecks and empty helicopters and plans on the server. 

INPUTS : NA

OUTPUTS : NA

 */

FUNC(cleanUpWrecks) = {
	{ deleteVehicle _x } forEach allDead;
	_vehicles = nearestObjects [player, ["helicopter","plane"], 9999]; 
	{ 
	if (count crew vehicle _x == 0) then {deleteVehicle _x}; 
	} forEach _vehicles;
};

/* 

FUNCTION : selectAO : [] call bad_core_fnc_selectAO

DESCRIPTION : Will find the LZ that is within a certain range and also within a certain directional arch of the player position once they exit the AO. 
	

INPUTS :

OUTPUTS : 

*/

FUNC(selectAO) = {

	params["_pracType"];

	if (_pracType == "TOL") then {
		private _AOtype = GVAR(PlayerSettingsTOL) select 3;
		private _type = null;

			switch (_AOtype) do {
				case "OPEN": {
					_type = "LZ_OPEN"
				};
				case "TIGHT"; {
					_type = "LZ_TIGHT"
				};
				default {
					_type = "LZ"
				};
			};
		private _LZs = allMapMarkers select {_x find _type isEqualTo 0};
		{
			private _distance = [Player, markerPos _x] call CBA_fnc_getDistance
			if (_distance > 200) then {
				_LZs deleteAt _forEachIndex;
			};
			private _playerViewDir = getDirVisual player;
			Private _playerToMarkerDir = position player getDir markerPos _x;
			private _angleDifference = abs(_playerViewDir - _playerToMarkerDir); 
			if (_angleDifference > 90) then {
				_LZs deleteAt _forEachIndex;
			};
		} forEach _LZs;
		private _LZ = selectRandom _LZs;
		[_LZ,_pracType] call FUNC(setupAO);
	};
};


/* 

FUNCTION : setupAO : ['_type'] call bad_core_fnc_setupAO

DESCRIPTION :  Sets up the AO for the take off and landing system, the CAS system and the mission system. 
	Depending on the type of AO the options for how the AO will be configured are determined by GVAR
		In the case of TOL - GVAR(PlayerSettingsTOL)
		In the case of CAS - GVAR(playerSettingsCAS)

INPUTS : _type - CAS or TOL 

OUTPUTS : 

 */

FUNC(setupAO) ={

	params["_posAO","_type"];
	

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