#include "script_component.hpp"
/* 
FUNCTION : 
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
FUNC(togglePractice) = {
	params["_practice","_player"];
	TRACE_2("Selected CB State Changed",_player,_practice);
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;
	private _practiceCurrentStatus = _playerCurrentStatus select _practice;
	if (_practiceCurrentStatus == 0) then {
		_playerCurrentStatus set [_practice,1];
		hint "ENABLED";
	} else {
		_playerCurrentStatus set [_practice,0];
		hint "DISABLED";
		private _AO = EGVAR(core,ActiveAOs) select 0;
		private _positionAO = getMarkerPOS _AO;
		[_positionAO] call FUNC(CleanUpAO);
		GVAR(ActiveAOs) = [];
	};
	_playerArray set [2,_playerCurrentStatus];
	_practiceStatus set [_index,_playerArray];
    PV_playerPracticeStatus = _practiceStatus;
    publicVariable "PV_playerPracticeStatus";
};
/* 
FUNCTION : 
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
FUNC(getPracticeStatusAll) = {
	private _availablePractices = [
		1050 
		,1051 
		,1052 
		,1032
		];
	private _player = name player;
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;
	private _playerCurrentFlight = _playerArray select 3;
	{
		private _checkBox = ((findDisplay 9999) displayCtrl (_x));
		private _selectedPractice = _availablePractices select _forEachIndex;
		private _practiceCurrentStatus = _playerCurrentStatus select _forEachIndex;
			if (_practiceCurrentStatus == 0) then {
			_checkBox cbSetChecked false;
		} else {
			_checkBox cbSetChecked true;
		};
	} forEach _availablePractices;
	private _ctrl = ((findDisplay 9999) displayCtrl (1031));
	_ctrl ctrlSetText _playerCurrentFlight;
};
/* 
FUNCTION : 
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
FUNC(practiceStatus) = {
	params["_practice","_player"];
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;
	private _practiceCurrentStatus = _playerCurrentStatus select _practice;
	_practiceCurrentStatus;
};