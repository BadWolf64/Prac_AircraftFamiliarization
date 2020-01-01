#include "script_component.hpp"

FUNC(getTypeList) = {

	waitUntil { !isNull findDisplay 9999};
	_kindCtrl = ((findDisplay 9999) displayCtrl (1010));
	_cbIndex = lbCurSel _kindCtrl;
	_kind = _kindCtrl lbText _cbIndex;
	_idc = ((findDisplay 9999) displayCtrl (1011));
	lbCLear _idc;

	_count =  count (configFile >> "cfgVehicles");
	for "_x" from 0 to (_count-1) do
	{
		_veh = ((configFile >> "cfgVehicles") select _x);
		if (isClass _veh) then
		{
			if (getNumber (_veh >> "scope") == 2) then
			{
				_class = configName _veh;
				if (_class isKindOf _kind) then
				{	
					if (getText (_veh >> "vehicleClass") != "Autonomous") then
					{
						_index = _idc lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
						_idc lbSetData[(lbSize _idc)-1,  _class];
						_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
						_idc lbSetPictureRight[(lbSize _idc)-1, _picture];
					};
				};
			};	
		};
	};
};

FUNC(updateVicInformaiton) = {

	private _index = lbCurSel 1011;
	private _classVeh = lbData [1011, _index];
	
	private _idc_vehPic = ((findDisplay 9999) displayCtrl (1020));
	private _vehPic = (getText(configFile >> "cfgVehicles" >> _classVeh>> "editorPreview"));
	_idc_vehPic ctrlSetText format ["%1",_vehPic];
	
	private _idc_vehName = ((findDisplay 9999) displayCtrl (1022));
	private _vehName = (getText(configFile >> "cfgVehicles" >> _classVeh>> "displayName"));
	_idc_vehName ctrlSetText format ["Name:   %1",_vehName];
	
	private _idc_modPack = ((findDisplay 9999) displayCtrl (1023));
	private _modPack = (getText(configFile >> "cfgVehicles" >> _classVeh>> "author"));
	_idc_modPack ctrlSetText format ["Modpack:   %1",_modPack];

	private _idc_crewCap = ((findDisplay 9999) displayCtrl (1024));
	private _crewCap = [_classVeh, true]call BIS_fnc_crewCount;
	_idc_crewCap ctrlSetText format ["Crew Capacity:   %1",_crewCap];

	private _idc_slignLoadCap = ((findDisplay 9999) displayCtrl (1025));
	private _slignLoadCap = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "slingLoadMaxCargoMass"));
	_idc_slignLoadCap ctrlSetText format ["Slingload Max Load:   %1",_slignLoadCap];

	private _idc_maxSpeed = ((findDisplay 9999) displayCtrl (1026));
	private _maxSpeed = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "maxSpeed"));
	_idc_maxSpeed ctrlSetText format ["Max Speed:   %1",_maxSpeed];

	private _fastRope = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "ace_fastroping_enabled"));
	private _idcfast_fastRopeEnabled = ((findDisplay 9999) displayCtrl (1027));
	private _fastRopeEnabled = if(_fastRope > 0) then {"Yes"} else {"No"};
	_idcfast_fastRopeEnabled ctrlSetText format ["Fastrope Enabled: %1",_fastRopeEnabled];
};

// This requires ebing reworked once I have the ComboBoxes figured out. 

FUNC(SpawnVic) = {
	private _index = lbCurSel 1011;
	private _classVeh = lbData [1011, _index];
	private _location_index = lbCurSel 1031;
	private _location = lbText [1031, _location_index];
	private _engineState_index = lbCurSel 1033;
	private _engineState = lbText [1033, _engineState_index];

	private _spawnPads = allMapMarkers select {_x find "pad" isEqualTo 0};
	private _aircraftDir = (getDir Player) - 180;
	private	_emptyPos = (getPos player) findEmptyPosition [10,50,_classVeh];
	private _runwayEnd = allMapMarkers select {_x find "runway" isEqualTo 0};

	TRACE_1("Spawn vehicle",_classVeh);
	TRACE_1("Spawn in",_location);
	TRACE_1("Spawn with engine running",_engineState);

	if (_location == "Airfield") then {
		{
			_emptyPos = (getMarkerPos _x) findEmptyPosition [0,5,_classVeh];
			if (count _emptyPos != 0) exitWith {
				private _selectedPos = _emptyPos;
				private _aircraftDir = markerDir _x;
				[_classVeh,_selectedPos,_aircraftDir,_engineState] call FUNC(placeVic);
			};
		} forEach _spawnPads;
	} else {
		if (_location == "Runway End") then {
			_emptyPos = getMarkerPos "runwayEnd";
			[_classVeh,_emptyPos,_aircraftDir,_engineState] call FUNC(placeVic);
		} else {
			[_classVeh,_emptyPos,_aircraftDir,_engineState] call FUNC(placeVic);
		};
	};
};

FUNC(placeVic) = {
	params["_classVeh","_emptyPos","_aircraftDir","_engineState"];
	private _aircraft = createVehicle [_classVeh, _emptyPos, [], 0, "NONE"];
	_aircraft setDir _aircraftDir;
	if (_engineState == "Yes") then {
		_aircraft engineOn true;
	};
};