params["_player"];

_role = [player] call CBA_fnc_vehicleRole;
_return = "";

if (vehicle player != player) then{
	if ((_role) == ("driver")) then{	
		_return = 1;
	} else {
		_return = 2;
	};
} else {
	_return = 3;
};

_return;