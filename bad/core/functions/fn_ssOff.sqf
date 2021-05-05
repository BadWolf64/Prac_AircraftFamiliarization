#include "script_component.hpp"
/* 
FUNCTION : 
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
FUNC(SSoff) = {
	private _ssEnabled =  missionNamespace getVariable ["potato_safestart_enabled",-1];
	if (_ssEnabled) then {
		["potato_safeStartOff"] call CBA_fnc_globalEvent;
	};
};