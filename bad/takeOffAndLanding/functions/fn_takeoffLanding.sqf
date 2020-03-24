#include "script_component.hpp"
<<<<<<< HEAD
=======

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
_waveOff = ["Wave Off", "<t color='#E70000'>Wave Off LZ</t>", "", {
			private _AO = EGVAR(core,ActiveAOs) select 0;
			private _positionAO = getMarkerPOS _AO;
			[_positionAO] call bad_takeOffAndLanding_fnc_takeoff;
		}, {if ([player] call CBA_fnc_vehicleRole == "driver" && [1,name player] call bad_core_fnc_practiceStatus == 1)then{true}else{false};}, {}, [], [], 0] call ace_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_SelfActions"], _waveOff, true] call ace_interact_menu_fnc_addActionToClass;
<<<<<<< HEAD
=======

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
/* 
FUNCTION : InitializeTOL - CBA Eventhandler
DESCRIPTION : Single function that calls the other functions when TOL practice is enabled when a player gets in a helicopter. 
INPUTS :
OUTPUTS : 
<<<<<<< HEAD
NOTE : This should be a switch and it can then be used to command any of the practices to work depending on what is selected. 
=======

NOTE : This should be a switch and it can then be used to command any of the practices to work depending on what is selected. 

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
*/
_inHeliCheckTOL = ["vehicle", {
	if ((driver (vehicle player)) isEqualTo player && (vehicle player) isKindOf "Helicopter") then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		private _practiceMethod = EGVAR(core,PlayerSettingsTOL) select 0;
<<<<<<< HEAD
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
_playerDeath = ["unit", {
	if (!Alive player) then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		private _practiceMethod = EGVAR(core,PlayerSettingsTOL) select 0;
		if (_practiceStatus == 1) then {
			switch (_practiceMethod) do {
				case "CONTINIOUS": { 
					private _countAOs = count EGVAR(core,ActiveAOs);
					private _AO = EGVAR(core,ActiveAOs) select 0;
					private _positionAO = getMarkerPOS _AO;
					if (_countAOs == 0) then { 
						["TOL"] call EFUNC(core,selectAO);
					} else {
						["_positionAO"] call EFUNC(core,CleanUpAO);
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
=======
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

_playerDeath = ["unit", {
	if (!Alive player) then {
		private _practiceStatus = [1,name player] call EFUNC(core,practiceStatus);
		private _practiceMethod = EGVAR(core,PlayerSettingsTOL) select 0;
		if (_practiceStatus == 1) then {
			switch (_practiceMethod) do {
				case "CONTINIOUS": { 
					private _countAOs = count EGVAR(core,ActiveAOs);
					private _AO = EGVAR(core,ActiveAOs) select 0;
					private _positionAO = getMarkerPOS _AO;
					if (_countAOs == 0) then { 
						["TOL"] call EFUNC(core,selectAO);
					} else {
						["_positionAO"] call EFUNC(core,CleanUpAO);
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
>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
				case "CONTINIOUS": {
					private _AO = EGVAR(core,ActiveAOs) select 0;
					private _positionAO = getMarkerPOS _AO;
					private _dist = [position player,_positionAO] call CBA_fnc_getDistance;
					if (_dist > 500) then {
						[_positionAO] call EFUNC(core,CleanUpAO);
					};
				};
				case "MISSION" : {
<<<<<<< HEAD
				};
				case "QUALIFICATION" : {
				};
			};
=======
					// This will fill the ACTIVEAO GVAR with the selected AOs for Missions and then setup the AO
				};
				case "QUALIFICATION" : {
					// This will fill the ACTIVEAO GVAR with the selected AOs for  and then setup the AO

				};
			};
			
>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
		};
	};
}] call CBA_fnc_addPlayerEventHandler;
/* 
<<<<<<< HEAD
FUNCTION : landing : [_positionAO] call bad_takeOffAndLanding_fnc_landing
=======

FUNCTION : landing : [_positionAO] call bad_takeOffAndLanding_fnc_landing

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
DESCRIPTION : 
INPUTS :
OUTPUTS : 
<<<<<<< HEAD
*/
FUNC(landing) = {
	params ["_positionAO"];
	TRACE_1("Starting Landing function at position ",_positionAO);
	hint "New LZ available. Check map.";
=======

*/

FUNC(landing) = {
	params ["_positionAO"];

	TRACE_1("Starting Landing function at position ",_positionAO);
	hint "New LZ available. Check map.";

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
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
<<<<<<< HEAD
=======

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
};
/* 
<<<<<<< HEAD
FUNCTION :  landing : [_positionAO] call bad_takeOffAndLanding_fnc_takeoff
DESCRIPTION : This the function that handles the distance from the LZ that the vic is to end the exercise. This will also decide how to proceed from here. If continious then it will go back to the selectAO to start the process again. 
INPUTS : 
=======

FUNCTION :  landing : [_positionAO] call bad_takeOffAndLanding_fnc_takeoff

DESCRIPTION : This the function that handles the distance from the LZ that the vic is to end the exercise. This will also decide how to proceed from here. If continious then it will go back to the selectAO to start the process again. 

INPUTS : 

>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
OUTPUTS : 
 */
FUNC(takeoff) = {
	params["_positionAO"];
	TRACE_1("Starting Takeoff function at position ",_positionAO);
	private _veh = vehicle player;
	private _methodPrac = EGVAR(core,PlayerSettingsTOL) select 0;
	hint "Get clear of the AO";
	[landed] call CBA_fnc_removePerFrameHandler;
	exitAO = [{
			_args = _this select 0;
			Private _veh = _args select 0;
			Private _positionAO = _args select 1;
			Private _methodPrac = _args select 2;
			private _dist = [_veh,_positionAO] call CBA_fnc_getDistance;
			if (_dist > 750) exitWith 
			{
				[_positionAO] call EFUNC(core,CleanUpAO);
				switch (_methodPrac) do {
					case "CONTINIOUS": {
						["TOL"] call EFUNC(core,selectAO);
					};
					case "MISSION": {
<<<<<<< HEAD
					};
					case "QUALIFICATION": {
					};
=======

					};
					case "QUALIFICATION": {

					};
					
>>>>>>> fff42cf0644dd53b6401f5305a487d99044e3beb
				};
			};
	}, 0,[_veh,_positionAO,_methodPrac]] call CBA_fnc_addPerFrameHandler;
};