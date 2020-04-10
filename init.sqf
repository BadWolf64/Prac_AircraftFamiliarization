setViewDistance 2500;
if (hasInterface) then {
    [] spawn {
        waitUntil {alive player};
        player addEventHandler ["Respawn", {
            [] spawn {
                sleep 0.5;
                [player] call potato_assignGear_fnc_assignGearMan;
                [] call potato_markers_initMarkerHash;
            };
        }];
    };
};
if(isNil "PV_playerPracticeStatus") then {
    PV_playerPracticeStatus = [];
    publicVariable "PV_playerPracticeStatus";
};
if(isNil "PV_flights") then {
    PV_flights = [];
    publicVariable "PV_flights";
};
["disconnect", "onPlayerDisconnected", {
    private _player = _this select 2;
    private _practiceStatus = missionNamespace getVariable "PV_playerPracticeStatus";
    _index = _practiceStatus findif {_x select 0 == _player};
    _practiceStatus deleteAt _index;
    PV_playerPracticeStatus = _practiceStatus;
    publicVariable "PV_playerPracticeStatus";
}] call BIS_fnc_addStackedEventHandler;