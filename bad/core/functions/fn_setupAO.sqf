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

	private _AOs = [];
	private _teleport = GVAR(PlayerSettingsTOL) select 1;

	if (_pracType == "TOL") then {
		private _AOtype = GVAR(PlayerSettingsTOL) select 3;
		private _type = nil;
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
		TRACE_1("Selected LZ Type",_type);
		_AOs = allMapMarkers select {_x find _type isEqualTo 0};
		TRACE_1("All MapMarkers ",_AOs);
		if (_teleport == "DISABLED") then {
			{
				private _distance = [Player, markerPos _x] call CBA_fnc_getDistance;
				if (_distance > 5000) then {
					_AOs set [_forEachIndex,""];
				};
				private _playerViewDir = getDir vehicle player;
				private _playerToMarkerDir = _posPlayer getDir markerPos _x;
				private _angleDifference = abs(_playerViewDir - _playerToMarkerDir); 
				if (_angleDifference > 90) then {
					_AOs set [_forEachIndex,""];
				};
			} forEach _AOs;
			_AOs sort false;
			private _emptyElements = _AOs find "";
			_AOs resize _emptyElements;
			if (count _AOs == 0) then {
				_AOs = allMapMarkers select {_x find _type isEqualTo 0};
			};
		};
	} else {
		hint "CAS not yet implemented";
	};
	private _AO = selectRandom _AOs;
	TRACE_1("LZ Selected ",_AO);
	private _positionAO = getMarkerPos _AO;
	[_positionAO,_pracType] call FUNC(setupAO);

	if (_teleport == "ENABLED") then {
		private _veh = vehicle player;
		_veh setVehiclePosition [[(_positionAO select 0) - TELEPORT_DIST * sin (random 359),(_positionAO select 1) - TELEPORT_DIST * cos (random 359),(_positionAO select 2)+100],[],100,"FLY"];
		private _dir = _veh getDir _positionAO;
		_veh setDir _dir;
		openMap true;
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

	params["_positionAO","_type"];
	
	TRACE_1("LZ Position ",_positionAO);

	private _suffix = nil;

	switch (_type) do {
		case "TOL": { 
			private _typeTOL = GVAR(PlayerSettingsTOL) select 0;
			private _teleport = GVAR(PlayerSettingsTOL) select 1;
			private _markersTOL = GVAR(PlayerSettingsTOL) select 4;
			private _ei = GVAR(PlayerSettingsTOL) select 5;
			private _text = [];
			_suffix = "LZ";

			//markers

			switch (_markersTOL) do {
				case "LZ EXACT + AO": {
					_text pushBack AO_ELIPSE;
					_text pushBack MARKER_LZ;
				};
				case "LZ EXACT ONLY": {
					_text pushBack MARKER_LZ;
				};
				case "AO ONLY": {
					_text pushBack AO_ELIPSE;
				};
			};
			TRACE_1("Text for str conversion ", _text);
			{
				private _str = format [_x,name player,_positionAO,_suffix];
				TRACE_1("String passed to stringToMarker Function",_str);
				[_str] call BIS_fnc_stringToMarker;
			} forEach _text;

			if (_ei == "ENABLED") then {
				[_positionAO,_type] call FUNC(oppositionEI);
			};
		};
		case "CAS": {Hint "CAS not yet implemented";};
	};
	[_positionAO,_type] call FUNC(createItems);
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

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(createItems) = {

	params["_positionAO","_type"];

	private _light = nil;
	private _smoke = nil;
	switch (_type) do {
		case "TOL": {
			_light = TOL_LIGHT;
			_smoke = TOL_SMOKE;
		};
		case "CAS": {hint "CAS not implemented yet"};
	};
	private _SmokeChemSpawn = [(_positionAO select 0),(_positionAO select 1),(_positionAO select 2)+50];
	private _smokeCreate = _smoke createVehicle _SmokeChemSpawn;
	private _lightCreate = _light createVehicle _SmokeChemSpawn;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

*/

FUNC(CleanUpAO) ={
	params ["_posMarker","_marker"];
	private _markerAO = format ["AO_%1",name Player];
//	player setVariable ["inProgress",false];
	_listObjectsLZ = _posMarker nearObjects["SmokeShell", 100];
	_ListObjectsAO = _posMarker nearObjects["Man", 500];
	{deleteVehicle _x} forEach _listObjectsLZ;
	{deletevehicle _x} forEach _ListObjectsAO;
	deleteMarker _marker;
	deleteMarker _markerAO;
	[exitAO] call CBA_fnc_removePerFrameHandler;
	[] call bad_LandingFunction;
};