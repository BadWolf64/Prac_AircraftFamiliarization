/*
######################################################################################
								Logistics Practice Menu
######################################################################################
*/

_enable = player getVariable "SLSwitch";
_active = player getVariable "inProgress";
["bad_repair", {
params ["_veh"];
_veh  setDamage 0; _veh setFuel 1; [_veh, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
}] call CBA_fnc_addEventHandler;

bad_SlingFunction = {

	player setVariable ["inProgress", true];

	[] call bad_setUpLZFunction;
	[] call bad_SpawnCargo;
};

bad_setUpLZFunction = {
	private _typeDZ = player getVariable "typeLZ";
	private _DZs = allMapMarkers select {_x find _typeDZ isEqualTo 0};
	private _DZ = selectRandom _DZs;
	private _positionDZ = getmarkerPos _DZ;
	private _strLZ = format ["|DropZone_%1|%2|mil_pickup|ICON|[1,1]|0|Solid|ColorBlue|1|DZ_%1",name player,_positionDZ];
	[_strLZ] call BIS_fnc_stringToMarker;
	_SmokeChemSpawn = [(_positionDZ select 0),(_positionDZ select 1),(_positionDZ select 2)+50];
	_smoke = "SmokeShellRed_Infinite" createVehicle _SmokeChemSpawn;
	_light = "Chemlight_green" createVehicle _SmokeChemSpawn;
};

bad_SpawnCargo = {
	private _exceptions = ["rhs_pchela1t_vvs","rhs_pchela1t_vvsc"];
	private _veh = vehicle player;
	private _vehType = typeOf _veh;
	private _maxLoad = getNumber(configfile >> "CfgVehicles" >> _vehType >> "slingLoadMaxCargoMass");
	private _list = [];
	private _count =  count (configFile >> "cfgVehicles");
	
	for "_x" from 0 to (_count-1) do 
	{ 
		private _vehSL = ((configFile >> "cfgVehicles") select _x);
		if (isClass _vehSL) then 
		{
			if (getNumber (_vehSL >> "scope") == 2) then
			{
				_class = configName _vehSL;
				if (_class isKindOf "AllVehicles" || _class isKindOf "Thing") then  
				{
					if (_class isKindOf "Ship") then {} else 
					{
						if (isArray (_vehSL >> "slingLoadCargoMemoryPoints")) then 
						{  
							_slingLoadArray = getArray (_vehSL >> "slingLoadCargoMemoryPoints");
							_slingLoadable = count _slingLoadArray;
							if (_slingLoadable == 4) then
							{ 
								if (_class in _exceptions) then {} else 
								{
								_list pushBack _class;
								};
							}; 
						};
					};	 
				};
			};	
		};
	};

	_listShuff = _list call BIS_fnc_arrayShuffle;

	[_listShuff,_maxLoad] spawn {
		params ["_listShuff","_maxLoad"];
		private _i = 0;
		private _objectSL = "";
		private _spawnedObjectSL = nil;
		private _massSpawnedObjectSL = 99999;
		while {_massSpawnedObjectSL > _maxLoad} do 
		{
			if (!isNil "_spawnedObjectSL") then 
			{
				deleteVehicle _spawnedObjectSL;
			};
			_objectSL = _listShuff select _i;
			_spawnedObjectSL = createVehicle [_objectSL, getMarkerPos "logi_0",["logi_1","logi_2"],0,"NONE"];
			_massSpawnedObjectSL = getMass _spawnedObjectSL;
			_i = _i + 1;
			_spawnedObjectSL;
		};
		private _classReadyVic = typeOf _spawnedObjectSL;
		private _nameSpawnedObjectSL = (getText(configFile >> "cfgVehicles" >> _classReadyVic >> "displayName"));

		hint format ["A %1 has been spawned at the Logistics Area at the airfield. A new DZ can be found on your map",_nameSpawnedObjectSL];

		[_classReadyVic] call bad_SlingProgress;
	};
};

bad_SlingProgress = {
	params ["_classReadyVic"];
	dropzone = [
	{
		params ["_classReadyVic"];
		private _objectArray = ropeAttachedObjects vehicle player;
		private _object = _objectArray select 0;
		private _classObject = typeOf _object;
		if (!isNil "_objectArray") then 
		{
			private _height = getPosATL _object select 2;
			private _marker = format ["DropZone_%1",name Player];
			private _posMarker = getMarkerPos _marker;
			private _dist = [_object,_posMarker] call CBA_fnc_getDistance;
			private _reqDist = 50;
			if (_classObject isEqualTo _classReadyVic) then 
			{
				if (_dist < _reqDist && (_height < 0.1 || isTouchingGround (_object))) exitWith 
				{
					hint "Successful delivery - RTB";
					[_posMarker,_marker] call bad_cleanUpDZ;
				};
			} else { systemChat "That is not the correct Vehicle";};
		};		
	},0.5,_classReadyVic] call CBA_fnc_addPerFrameHandler;
};

bad_CleanUpDZ = {
	params ["_posMarker","_marker"];
	[dropzone] call CBA_fnc_removePerFrameHandler;
	player setVariable ["inProgress",false];
	deleteMarker _marker;
	_marker = nil;
	rtb = [
	{
		private _dist = [vehicle player, markerPos "logiArea"] call CBA_fnc_getDistance;
		if (_dist < 1000) then 
		{
			_listObjectsDZ = _posMarker nearObjects["SmokeShell", 100];
			_objectsDZ = _posMarker nearSupplies 50;
			{_listObjectsDZ pushBack _x} forEach _objectsDZ;
			{deleteVehicle _x} forEach _listObjectsDZ;
			[] call bad_SlingFunction;
			[rtb] call CBA_fnc_removePerFrameHandler;
			_markerPos = nil;
		};
	},0.5,[_posMarker,_marker]] call CBA_fnc_addPerFrameHandler;
};

bad_generalCleanUp = {
	[dropzone] call CBA_fnc_removePerFrameHandler;
	private _marker = format ["DropZone_%1",name Player];
	private _posMarker = getMarkerPos _marker;
	player setVariable ["inProgress",false];
	_listObjectsDZ = _posMarker nearObjects["SmokeShell", 100];
	_objectsDZ = _posMarker nearSupplies 50;
	{_listObjectsDZ pushBack _x} forEach _objectsDZ;
	{deleteVehicle _x} forEach _listObjectsDZ;
	deleteMarker _marker;
};
/*
######################################################################################
	MAIN FUNCTION
######################################################################################
*/

if (_enable) then {
	player setVariable ["SLSwitch", false];
	player removeEventHandler ["GetInMan", 0];
	player removeEventHandler ["GetOutMan", 0];
	player removeEventHandler ["Killed",0];
	player setVariable ["inProgress", false];
	[] call bad_generalCleanUp;
} else 
{
	player setVariable ["SLSwitch", true];
	hint "Get in a Heli to Start.";
	player addEventHandler ["Killed",{[] call bad_generalCleanUp;}];
	player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver") && !(player getVariable "inProgress")) then {[] call bad_SlingFunction;};}];
	player addEventHandler ["GetOutMan",{["bad_repair", [(_this select 2)], (_this select 2)] call CBA_fnc_targetEvent;[] call bad_generalCleanUp;player setVariable ["inProgress", false];}];
};
