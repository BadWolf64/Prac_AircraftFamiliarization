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

INPUTS : Type of practice _pracType

OUTPUTS : 

*/

FUNC(selectAO) = {

	params["_pracType"];

	if (_pracType == "TOL") then {
		private _AOtype = GVAR(PlayerSettingsTOL) select 3;
		private _teleport = GVAR(PlayerSettingsTOL) select 1;
		private _type = null;
		private _posPlayer = getPosWorld Player;

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
		if (_teleport == "DISABLED") then {
			{
				private _distance = [Player, markerPos _x] call CBA_fnc_getDistance
				if (_distance > 2000) then {
					_LZs deleteAt _forEachIndex;
				};
				private _playerViewDir = getDirVisual player;
				Private _playerToMarkerDir = _posPlayer getDir markerPos _x;
				private _angleDifference = abs(_playerViewDir - _playerToMarkerDir); 
				if (_angleDifference > 90) then {
					_LZs deleteAt _forEachIndex;
				};
			} forEach _LZs;
		};
	} else {
		hint "CAS not yet implemented";
	}
	private _sortedLZs = [_LZs,[],{player distance getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy;
	private _indexLZ = round random[1,10,15];
	private _LZ = _sortedLZs select _indexLZ;
	[_LZ,_pracType] call FUNC(setupAO);
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

	private _position = getMarkerPos _posAO;
	private _light = nil;
	private _smoke = nil;

	switch (_type) do {
		case "TOL": { 
			private _typeTOL = GVAR(PlayerSettingsTOL) select 0;
			private _teleport = GVAR(PlayerSettingsTOL) select 1;
			private _markersTOL = GVAR(PlayerSettingsTOL) select 4;
			private _ei = GVAR(PlayerSettingsTOL) select 5;
			private _text = [];
			private _suffix = "LZ";
			_light = TOL_LIGHT;
			_smoke = TOL_SMOKE;

			//markers and items

			switch (_markersTOL) do {
				case "LZ EXACT + AO": {
					_text = [AO_ELIPSE,MARKER_LZ];
				};
				case "LZ EXACT ONLY": {
					_text = [MARKER_LZ];
				};
				case "AO ONLY": {
					_text = [AO_ELIPSE];
				};
			};

			{
				[
					private _strLZ = format [_x,name player,_posAO,_suffix];
				] call BIS_fnc_stringToMarker;
			} forEach _text;


			if (_ei == "ENABLED") then {
				[_posAO,_type] call FUNC(oppositionEI);
			};
		};
		case "CAS": {Hint "CAS not yet implemented";};
	};

	private _SmokeChemSpawn = [(_position select 0),(_position select 1),(_position select 2)+50];
	_smoke createVehicle _SmokeChemSpawn;
	_light createVehicle _SmokeChemSpawn;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(oppositionEI) = {

	params["_positionAO","_type"];
	
	private _eiAmount = GVAR(PlayerSettings) select 7;
	private _eiDifficulty = GVAR(PlayerSettings) select 8;

	switch (_type) do {
		case "TOL": {

		};
		default { };
	};

};

