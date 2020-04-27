#include "script_component.hpp"
/* 
FUNCTION : createFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : PV_flights = [["flight1Name","flight1Leader","flight1Practice",["flight1member1","flight1member2"]],["flight2Name","flight2Leader","flight2Practice",["flight2member1","flight2member2"]]]
*/
FUNC(createFlight) = {
	private _display = findDisplay 9999;
	private _ctrlFLTName = _display displayCtrl (1081);
	private _ctrlFLTLeader = _display displayCtrl (1083);
	private _ctrlFLTPractice = _display displayCtrl (1085);
	private _varFLTName = ctrlText _ctrlFLTName; 
	private _indexFLTLeader = lbCurSel _ctrlFLTLeader;
	private _varFLTLeader = _ctrlFLTLeader lbText _indexFLTLeader;
	private _indexFLTPractice = lbCurSel _ctrlFLTPractice;
	private _varFLTPractice = _ctrlFLTPractice lbText _indexFLTPractice;
	private _flights = missionNamespace getVariable "PV_flights";
	private _index = _flights findif {_x select 0 == _varFLTName};

	if(_varFLTName == "") exitWith {hint "Empty Flight Name"};
	if(_index == -1) then {
		_flights pushBack [_varFLTName,_varFLTLeader,_varFLTPractice,[]];
	} else {
		_flightDetails = _flights select _index;
		_flightDetails set [0,_varFLTName];
		_flightDetails set [1,_varFLTLeader];
		_flightDetails set [2,_varFLTPractice];
		_flights set [_index,_flightDetails];
	};
	PV_flights = _flights;
	publicVariable "PV_flights";
	[] call FUNC(flightRefresh);
};
/* 
FUNCTION : getFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(getFlight) = {
	params["_player"];
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentFlight = _playerArray select 3;
	_playerCurrentFlight;
};
/* 
FUNCTION : moveToFlight :
DESCRIPTION : This will move a player into the flight player array in PV_flights
INPUTS :
OUTPUTS : 
*/
FUNC(moveToFlight) = {
	private _display = findDisplay 9999;
	private _ctrlSelectMemberList = _display displayCtrl (1061);
	private _selectedUnits = lbSelection _ctrlSelectMemberList;
	private _ctrlFlightMembersHeader = _display displayCtrl(1070);
	private _flight = _ctrlFlightMembersHeader lbText lbCurSel _ctrlFlightMembersHeader;
	private _currentFlights = missionNamespace getVariable "PV_flights";
	if (count _currentFlights == 0) exitWith {};
	private _flightArrayindex = _currentFlights findif {_x select 0 == _flight};
	private _flightArray = _currentFlights select _flightArrayindex;
	private _flightMemberArray = _flightArray select 3;
	private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
	{
		private _unit = _ctrlSelectMemberList lbText _x;
		private _playerPracticeArrayindex = _practiceStatus findIf {_x select 0 == _unit};
		private _playerPracticeArray = _practiceStatus select _playerPracticeArrayindex;
		private _unitGroup = _playerPracticeArray select 3;
		private _inGroup = _flightMemberArray findIf { _x == _unit} > -1;
		if (_unitGroup == "") then {
			if(!_inGroup) then {
			_flightMemberArray pushback _unit;
			_playerPracticeArray set [3,_flight];
			_practiceStatus set [_playerPracticeArrayindex,_playerPracticeArray];
			};
		} else {systemChat format ["%1 is already in a group",_unit]};
	} forEach _selectedUnits;
	_flightArray set [3,_flightMemberArray];
	_currentFlights set [_flightArrayindex,_flightArray];
	PV_flights = _currentFlights;
	publicVariable "PV_flights";
	PV_playerPracticeStatus = _practiceStatus;
	publicVariable "PV_playerPracticeStatus";
	[] call FUNC(flightRefresh);
};
/* 
FUNCTION : activateFlightPractice :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(activateFlightPractice) = {

};
/* 
FUNCTION : flightMembersPlayer :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(flightMembersPlayer) = {
	params["_player"];
	private _currentFlights = missionNamespace getVariable "PV_flights";
	if (count _currentFlights == 0) exitWith {};
	private _playerFlight = [_player] call FUNC(getFlight);
	private _currentFlightIndex = _currentFlights findif {_x select 0 == _playerFlight};
	private _currentFlightArray = _currentFlights select _currentFlightIndex;
	private _memberArray = _currentFlightArray select 3;
	_memberArray;
};
/* 
FUNCTION : flightMembersFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(flightMembersFlight) = {
	params["_flight"];
	private _currentFlights = missionNamespace getVariable "PV_flights";
	if (count _currentFlights == 0) exitWith {[]};
	private _currentFlightIndex = _currentFlights findif {_x select 0 == _flight};
	private _currentFlightArray = _currentFlights select _currentFlightIndex;
	private _memberArray = _currentFlightArray select 3;
	_memberArray;
};
/* 
FUNCTION : flightRefresh :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(flightRefresh) = {
	Private _display = findDisplay 9999;
	private _ctrlFlightMembersHeader = _display displayCtrl(1070);
	private _ctrlFightNameEditBox = _display displayCtrl(1081);
	private _ctrlFightLeaderListBox = _display displayCtrl(1083);
	private _flightList = [] call FUNC(allFlights);
	lbCLear _ctrlFlightMembersHeader;
	{
		_ctrlFlightMembersHeader lbAdd _x;
	} forEach _flightList;
	private _ctrlFlightMembersHeaderText = _ctrlFlightMembersHeader lbText lbCurSel _ctrlFlightMembersHeader;
	_ctrlFightNameEditBox ctrlSetText _ctrlFlightMembersHeaderText;
	[_display,1071,1070] call EFUNC(mainMenu,flightMembersMenuList);
	private _playerFlightCtrl = _display displayCtrl 1031;
	private _playerFlight = [name player] call FUNC(getFlight);
	_playerFlightCtrl ctrlSetText _playerFlight;
	private _memberListEditFLightLeader = [_ctrlFlightMembersHeaderText] call EFUNC(core,flightMembersFlight);
	// Add if check in here to see if the list has any members if not exit. 
	if(count _memberListEditFLightLeader != 0) then {
		lbCLear _ctrlFightLeaderListBox;
		{
			_ctrlFightLeaderListBox lbAdd _x;
		} forEach _memberListEditFLightLeader;
	};
};
/* 
FUNCTION : allFlights :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(allFlights) = {
	private _flights = missionNamespace getVariable "PV_flights";
	private _allFlights = [];
	if(count _flights == 0) then {
		_allFlights = ["New Flight"];
	} else {
		{
			_flightName = _x select 0; 
			_allFlights pushBack _flightName;
		} forEach _flights;
	};
	_allFlights;
};
/* 
FUNCTION : deleteFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(deleteFlight) = {
	private _display = findDisplay 9999;
	private _flightNameCtrl = _display displayctrl 1070;
	private _flights = missionNamespace getVariable "PV_flights";
	if (count _flights == 0) exitWith {};
	private _flightNameCtrlCurrenIndex = lbCurSel _flightNameCtrl;
	private _flightName =_flightNameCtrl lbText _flightNameCtrlCurrenIndex;
	TRACE_1("Flight",_flightName);
	private _flightMembersCtrl = _display displayctrl 1071;
	private _flightMemberEmpty = _flightMembersCtrl lbText 0;
	if (_flightMemberEmpty == "Flight Empty") then {
		private _flightArrayindex = _flights findif {_x select 0 == _flightName};
		_flights deleteAt _flightArrayindex;
		PV_flights = _flights;
		TRACE_1("New FLights PV",PV_flights);
		publicVariable "PV_flights";
		_flightNameCtrl lbSetCurSel 0;
	} else {
		hint "Flight is not empty, cannot delete.";
	};
	[] call FUNC(flightRefresh);
};
/* 
FUNCTION : leaveCurrentFlight :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(leaveCurrentFlight) = {
	params["_player"];
	TRACE_1("params",_this);
	private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
	private _playerPracticeStatusindex = _practiceStatus findif {_x select 0 == _player};
	private _playerPracticeStatusArray = _practiceStatus select _playerPracticeStatusindex;
	private _playerCurrentFlight = _playerPracticeStatusArray select 3;
	_playerPracticeStatusArray set [3,""];
	TRACE_1("new player status array",_playerPracticeStatusArray);
	_practiceStatus set [_playerPracticeStatusindex,_playerPracticeStatusArray];
	PV_playerPracticeStatus = _practiceStatus;
	publicVariable "PV_playerPracticeStatus";
	private _currentFlights = missionNamespace getVariable "PV_flights";
	private _currentFlightIndex = _currentFlights findif {_x select 0 == _playerCurrentFlight};
	private _currentFlightArray = _currentFlights select _currentFlightIndex;
	private _currentFlightMemeberArray = _currentFlightArray select 3;
	private _currentFlightMemeberArrayindex = _currentFlightMemeberArray findIf {_x == _player};
	_currentFlightMemeberArray deleteAt _currentFlightMemeberArrayindex;
	_currentFlightArray set [3,_currentFlightMemeberArray];
	TRACE_1("new flight array",_currentFlightArray);
	_currentFlights set [_currentFlightMemeberArrayindex,_currentFlightArray];
	PV_flights = _currentFlights;
	publicVariable "PV_flights";
	[] call FUNC(flightRefresh);
};


/* 
	private _playerCurrentFlight = _playerArray select 3;
	private _ctrl = ((findDisplay 9999) displayCtrl (1031));
	_ctrl ctrlSetText _playerCurrentFlight;
 */