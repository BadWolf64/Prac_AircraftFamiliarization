scopeName "main";
call
{
	_index = lbCurSel 10020;
	_classVeh = lbData [10020, _index];
	_i = 991;
	for "_i" from 991 to 996 do
	{
		_posId = str _i;
		_aircraftDir = markerDir _posId;
		_emptyPos = (getMarkerPos _posID) findEmptyPosition [0,5,_classVeh];
		if (count _emptyPos != 0) exitWith
		{
			_aircraft = createVehicle [_classVeh, _emptyPos, [], 0, "NONE"];
			_aircraft setDir _aircraftDir;
			_aircraft engineOn true;
			_vehName = (getText(configFile >> "cfgVehicles" >> _classVeh>> "displayName"));
			_posSTR = _i-990;
			hint format ["You spawned %1 on Pad %2", _vehName, _posSTR];
		};
	};
};
