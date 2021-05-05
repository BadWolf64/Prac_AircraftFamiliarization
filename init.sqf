#include "script_macros.hpp"

// Adds Settings button to Map Dialog.

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if (_mapIsOpened) then {
    private _settingsButton = MAP_DIALOG ctrlCreate [QEGVAR(gui,mapSettingsButton),-1];
    private _spawnButton = MAP_DIALOG ctrlCreate [QEGVAR(gui,mapSpawnButton),-1];
	};
}];
