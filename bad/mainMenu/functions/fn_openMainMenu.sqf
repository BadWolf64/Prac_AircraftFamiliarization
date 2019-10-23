#include "script_component.hpp"

FUNC(mainMenu) = {

	disableSerialization;

	_display = finddisplay 46 createDisplay "RscDisplayEmpty";

	_ctrlBackground = _display ctrlCreate ["RscBackgroundGUI",-1];

	_ctrlBackground ctrlSetPosition [-0.1,-0.1,1.2,1.2]; 
	_ctrlBackground ctrlCommit 0;

	_leftFrame = _display ctrlCreate ["RscFrame",-1];

	_leftFrame ctrlSetPosition [-0.1,0,0.85,1.1];
	_leftFrame ctrlCommit 0;

	_rightFrame = _display ctrlCreate ["RscFrame",-1];

	_rightFrame ctrlSetPosition [0.75,0,0.35,1];
	_rightFrame ctrlCommit 0;

	_menuOK = _display ctrlCreate ["RscButtonMenuOK",-1];

	_menuOK ctrlSetPosition [0.75,1,0.17,0.1];
	_menuOK ctrlCommit 0;

	_menuCancel = _display ctrlCreate ["RscButtonMenuCancel",-1];

	_menuCancel ctrlSetPosition [0.93,1,0.17,0.1];
	_menuCancel ctrlCommit 0;

	_menuMain = _display ctrlCreate ["RscButtonMenu",-1];

	_menuMain ctrlSetPosition [-0.1,-0.1,0.145,0.1];
	_menuMain ctrlSetText "Home";
	_menuMain ctrlCommit 0;

	_menuSpawnAC = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSpawnAC ctrlSetPosition [0.05,-0.1,0.145,0.1];
	_menuSpawnAC ctrlSetText "Aircraft Spawn";
	_menuSpawnAC ctrlCommit 0;

	_menuAutoRotation = _display ctrlCreate ["RscButtonMenu",-1];

	_menuAutoRotation ctrlSetPosition [0.2,-0.1,0.145,0.1];
	_menuAutoRotation ctrlSetText "Auto Rotation";
	_menuAutoRotation ctrlCommit 0;

	_menuTOL = _display ctrlCreate ["RscButtonMenu",-1];

	_menuTOL ctrlSetPosition [0.35,-0.1,0.145,0.1];
	_menuTOL ctrlSetText "Take Off Landing";
	_menuTOL ctrlCommit 0;

	_menuSlingLoading = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSlingLoading ctrlSetPosition [0.5,-0.1,0.145,0.1];
	_menuSlingLoading ctrlSetText "Sling Loading";
	_menuSlingLoading ctrlCommit 0;

	_menuSlingInstructor = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSlingInstructor ctrlSetPosition [0.94,-0.1,0.16,0.1];
	_menuSlingInstructor ctrlSetText "Instructor Menu";
	_menuSlingInstructor ctrlCommit 0;

	_homeRepair = _display ctrlCreate ["RscButton",-1];

	_homeRepair ctrlSetPosition [-0.08,0.01,0.3,0.09];
	_homeRepair ctrlSetText "Repair Aircraft";
	_homeRepair buttonSetAction QUOTE([] call EFUNC(core,repair););
	_homeRepair ctrlCommit 0;

	_homeRearm = _display ctrlCreate ["RscButton",-1];

	_homeRearm ctrlSetPosition [-0.08,0.11,0.3,0.09];
	_homeRearm ctrlSetText "Rearm Aircraft";
	_homeRearm buttonSetAction QUOTE([] call EFUNC(core,rearm););
	_homeRearm ctrlCommit 0;

	_homeSsOff = _display ctrlCreate ["RscButton",-1];

	_homeSsOff ctrlSetPosition [-0.08,0.21,0.3,0.09];
	_homeSsOff ctrlSetText "Turn Off SafeStart";
	_homeSsOff buttonSetAction QUOTE([false] call EFUNC(core,toggleSS););
	_homeSsOff ctrlCommit 0;

};