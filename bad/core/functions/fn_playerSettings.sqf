#include "script_component.hpp"

GVAR(eiForces) = [];

GVAR(playerSettings) = [
	"DISABLED"
	,"ENABLED"
];

GVAR(PlayerSettingsTOL) = [
	"CONTINIOUS"				
	,"OPEN"			
	,"LZ EXACT + AO"		
	,"DISABLED"				
	,"DISABLED" 				
	,"LIGHT" 		
	,"EASY"			
];
GVAR(playerSettingsCAS) =[
];
/* 
FUNCTION : writeToPSTOL : [] call bad_core_fnc_writeToPSTOL
DESCRIPTION : Take the settings that have ben set in the TOL menu and apply them to the GVAR(PlayerSettingsTOL)
INPUTS :	Taken from TOL menu:
	Practice Type : IDC = 1101
	Select AO Type : IDC = 1031
	LZ Marked on map with : IDC = 1033
	EI Presence : IDC = 1051
	Vehicle AI in AO : IDC = 1061
	Amount of EI in AO : IDC = 1053
	EI Difficulty : iDC = 1063
OUTPUTS : Write to GVAR(PlayerSettingsTOL)
*/
FUNC(writeToPSTOL) = {
	params[];
	private _display = findDisplay 9999;
	private _IDCarray = [
		1101
		,1031
		,1033
		,1051
		,1061
		,1053
		,1063
	];
	{
		private _index = lbCurSel (_display displayCtrl (_x));
		private _value =  lbText [_x,_index];
		GVAR(PlayerSettingsTOL) set [_forEachIndex,_value];
	} forEach _IDCarray;
};
/* 
FUNCTION : writeToPSTOL : [] call bad_core_fnc_writeToPSTOL
DESCRIPTION : Take the settings that have ben set in the TOL menu and apply them to the GVAR(PlayerSettingsTOL)
INPUTS :	Taken from TOL menu:
	Practice Type : IDC = 1101
	Select AO Type : IDC = 1031
	LZ Marked on map with : IDC = 1033
	EI Presence : IDC = 1051
	Vehicle AI in AO : IDC = 1061
	Amount of EI in AO : IDC = 1053
	EI Difficulty : iDC = 1063
OUTPUTS : Write to GVAR(PlayerSettingsTOL)
*/
FUNC(writeToPS) = {
	params[];
	private _display = findDisplay 9999;
	private _IDCarray = [
		1103
		,1105
	];
	{
		private _index = lbCurSel (_display displayCtrl (_x));
		private _value =  lbText [_x,_index];
		GVAR(PlayerSettings) set [_forEachIndex,_value];
	} forEach _IDCarray;
};