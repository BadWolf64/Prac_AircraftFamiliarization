#include "script_component.hpp"

GVAR(eiForces) = [];

GVAR(PlayerSettingsTOL) = [
	"CONTINIOUS" 	// TOL Practice Type
	,"DISABLED" 				// TOL TP Setting 
	,"ENABLED" 				// TOL Auto-Repair Setting 
	,"OPEN"			// TOL LZ type
	,"LZ EXACT + AO"		// TOL AO marking
	,"DISABLED"				// TOL EI Presence
	,"DISABLED" 				// TOL EI Vics?
	,"LIGHT" 		// TOL EI Amount
	,"EASY"			// EI difficulty
];

GVAR(playerSettingsCAS) =[


];

/* 

FUNCTION : writeToPSTOL : [] call bad_core_fnc_writeToPSTOL

DESCRIPTION : Take the settings that have ben set in the TOL menu and apply them to the GVAR(PlayerSettingsTOL)

INPUTS :	Taken from TOL menu:
	Practice Type : IDC = 1101
	Teleport to AO : IDC = 1103
	Auto Repair : IDC = 1105
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
		,1103
		,1105
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