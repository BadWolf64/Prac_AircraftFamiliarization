#include "script_component.hpp"

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
	};
	_playerArray set [2,_playerCurrentStatus];
	_practiceStatus set [_index,_playerArray];

    PV_playerPracticeStatus = _practiceStatus;
    publicVariable "PV_playerPracticeStatus";
};

FUNC(getPracticeStatusAll) = {

	private _availablePractices = [
		1050 // Autorotation
		,1051 // Takeoff landing
		,1052 // Sling Loading
		,1032
		];
	private _player = name player;
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;

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
};

FUNC(practiceStatus) = {

	params["_practice","_player"];

    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;
	private _practiceCurrentStatus = _playerCurrentStatus select _practice;
	_practiceCurrentStatus;
};