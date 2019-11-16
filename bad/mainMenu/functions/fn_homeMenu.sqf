#include "script_component.hpp"

FUNC(playerInfo) = {
	private _player = name player;
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    private _index = _practiceStatus findif {_x select 0 == _player};
	private _playerArray = _practiceStatus select _index;
	private _playerCurrentStatus = _playerArray select 2;

	
};