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

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(takeoff) = {

};

