setViewDistance 2500;

if (hasInterface) then {
    [] spawn {
        waitUntil {alive player};
        player addEventHandler ["Respawn", {
            [] spawn {
                sleep 0.5;
                [player] call potato_assignGear_fnc_assignGearMan;
            };
        }];
    };
};