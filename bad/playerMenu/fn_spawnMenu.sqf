createDialog "spawnMenu";

waitUntil { !isNull findDisplay 998};

_kind = "Helicopter"; 
_cbo = ((findDisplay 998) displayCtrl (10020));

lbCLear _cbo;
_count =  count (configFile >> "cfgVehicles");
for "_x" from 0 to (_count-1) do
{
	//Search in Configfile Path [configFile >> "cfgVehicles"]
	_veh = ((configFile >> "cfgVehicles") select _x);
	if (isClass _veh) then
	{
		//Check if Vehicle is in scope	
		if (getNumber (_veh >> "scope") == 2) then
		{
			_class = configName _veh;
			if (_class isKindOf _kind) then
			{	
				//Check if the vehicle config contains the exception class and if does not then continue. 
				if (getText (_veh >> "vehicleClass") != "Autonomous") then
				{
					_index = _cbo lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
					_cbo lbSetData[(lbSize _cbo)-1,  _class];
					_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
					_cbo lbSetPicture[(lbSize _cbo)-1, _picture];
				};
			};
		};	
	};
};