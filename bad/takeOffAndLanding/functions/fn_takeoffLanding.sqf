#include "script_component.hpp"

/* 

FUNCTION : InitializeTOL - CBA Eventhandler

DESCRIPTION : Single function that calls the other functions when TOL practice is enabled when a player gets in a helicopter. 

INPUTS :

OUTPUTS : 

*/

_inHeliCheckTOL = ["vehicle", {
	if ((driver (vehicle player)) isEqualTo player && (vehicle player) isKindOf "Helicopter") then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		if (_practiceStatus == 1) then {
			["TOL"] call EFUNC(core,selectAO);
		};
	};
}] call CBA_fnc_addPlayerEventHandler;

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

*/

FUNC(landing) = {

	landed = [{ 
		params ["_veh"];
		private _velVeh = velocity _veh;
		private _marker = format ["LandingZone_%1",name Player];
		private _posMarker = getMarkerPos _marker;
		private _dist = [_veh,_posMarker] call CBA_fnc_getDistance;
		private _reqDist = 50;
		if(_type == "TLZ") then 
		{
			_reqDist = 20;
		} else {
		_reqDist = 100;
		};
		if (_dist < _reqDist && isTouchingGround (vehicle player)  && ( _velVeh select 0 < 0.01) && (_velVeh select 1 < 0.01) && (_velVeh select 2 < 0.01)) exitWith 
		{
			[_veh] call FUNC(takeoff);
		};	
	}, 0, _veh] call CBA_fnc_addPerFrameHandler;

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(takeoff) = {
	params["_veh"];
	hint "Now Take off and get out of the AO";
	[landed] call CBA_fnc_removePerFrameHandler;
	exitAO = [{
			params ["_veh"];
			private _marker = format ["LandingZone_%1",name Player];
			private _posMarker = getMarkerPos _marker;
			private _dist = [_veh,_posMarker] call CBA_fnc_getDistance;
			if (_dist > 500) exitWith 
			{
				[_posMarker,_marker] call EFUNC(core,CleanUpAO);
			};
	}, 0, _veh] call CBA_fnc_addPerFrameHandler;

};

