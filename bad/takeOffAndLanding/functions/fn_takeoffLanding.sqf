#include "script_component.hpp"

/* 

FUNCTION : InitializeTOL - CBA Eventhandler

DESCRIPTION : Single function that calls the other functions when TOL practice is enabled when a player gets in a helicopter. 

INPUTS :

OUTPUTS : 

NOTE : This should be a switch and it can then be used to command any of the practices to work depending on what is selected. 

*/

_inHeliCheckTOL = ["vehicle", {
	if ((driver (vehicle player)) isEqualTo player && (vehicle player) isKindOf "Helicopter") then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		private _practiceMethod = EGVAR(core,PlayerSettingsTOL) select 0;
		if (_practiceStatus == 1) then {
			switch (_practiceMethod) do {
				case "CONTINIOUS": { 
					private _countAOs = count EGVAR(core,ActiveAOs);
					if (_countAOs == 0) then { 
						["TOL"] call EFUNC(core,selectAO);
					};
				};
				case "MISSION" : {

				};
				case "QUALIFICATION" : {

				};
			};
		};
	};
}] call CBA_fnc_addPlayerEventHandler;

_getOutHeliCheck = ["vehicle", {
	if (isNull objectParent player) then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		private _practiceMethod = EGVAR(core,PlayerSettingsTOL) select 0;
		if (_practiceStatus == 1) then {
			switch (_practiceMethod) do {
				case "CONTINIOUS": {
					private _AO = EGVAR(core,ActiveAOs) select 0;
					private _positionAO = getMarkerPOS _AO;
					private _dist = [position player,_positionAO] call CBA_fnc_getDistance;
					if (_dist > 500) then {
						[_positionAO] call EFUNC(core,CleanUpAO);
					};
				};
				case "MISSION" : {
					// This will fill the ACTIVEAO GVAR with the selected AOs for Missions and then setup the AO
				};
				case "QUALIFICATION" : {
					// This will fill the ACTIVEAO GVAR with the selected AOs for  and then setup the AO

				};
			};
			
		};
	};
}] call CBA_fnc_addPlayerEventHandler;

/* 

FUNCTION : landing : [_positionAO] call bad_core_fnc_landing

DESCRIPTION : 

INPUTS :

OUTPUTS : 

*/

FUNC(landing) = {
	params ["_positionAO"];

	TRACE_1("Starting Landing function at position ",_positionAO);
	hint "New LZ available. Check map.";

	landed = [{
		params ["_positionAO"];
		private _veh = vehicle player;
		private _velVeh = velocity _veh;
		private _dist = [_veh,_positionAO] call CBA_fnc_getDistance;
		private _reqDist = 20;
		if (_dist < _reqDist && isTouchingGround (vehicle player)  && ( _velVeh select 0 < 0.01) && (_velVeh select 1 < 0.01) && (_velVeh select 2 < 0.01)) exitWith 
		{
			[_positionAO] call FUNC(takeoff);
		};
	}, 0, _positionAO] call CBA_fnc_addPerFrameHandler;

};

/* 

FUNCTION :  landing : [_positionAO] call bad_core_fnc_landing

DESCRIPTION : This the function that handles the distance from the LZ that the vic is to end the exercise. This will also decide how to proceed from here. If continious then it will go back to the selectAO to start the process again. 

INPUTS : 

OUTPUTS : 

 */

FUNC(takeoff) = {
	params["_positionAO"];
	TRACE_1("Starting Takeoff function at position ",_positionAO);
	private _veh = vehicle player;
	private _methodPrac = EGVAR(core,PlayerSettingsTOL) select 0;
	hint "Now Take off and get out of the AO";
	[landed] call CBA_fnc_removePerFrameHandler;
	exitAO = [{
			_args = _this select 0;
			Private _veh = _args select 0;
			Private _positionAO = _args select 1;
			Private _methodPrac = _args select 2;
			private _dist = [_veh,_positionAO] call CBA_fnc_getDistance;
			if (_dist > 500) exitWith 
			{
				[_positionAO] call EFUNC(core,CleanUpAO);
				switch (_methodPrac) do {
					case "CONTINIOUS": {
						["TOL"] call EFUNC(core,selectAO);
					};
					case "MISSION": {

					};
					case "QUALIFICATION": {

					};
					
				};
			};
	}, 0,[_veh,_positionAO,_methodPrac]] call CBA_fnc_addPerFrameHandler;
};