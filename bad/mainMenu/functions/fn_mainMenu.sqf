#include "script_component.hpp"

GVAR(menus) = [
	"Home"
	,"SpawnAC"
	,"Autorotation"
	,"TakeOffLanding"
	,"SlingLoading"
	,"InstMenu"
];

FUNC(activeMenu) = {
	params["_menu"];
	
	_active = GVAR(menus) select _menu;
	
	TRACE_1("Menu Selected ",_active);

	_display = findDisplay 9999;
	if (isNull _display) then {
		[] call FUNC(mainMenuFrame);
		};

	[] call FUNC(clearMenu);

	switch _menu do {
		case 0: {
			[0] call FUNC(Home);
		};
		case 1: {
			[1] call FUNC(SpawnAC);
		};
		case 2: {
			[2] call FUNC(Autorotation);
		};
	};
};

FUNC(clearMenu) = {
	private _ctrls = []; 
	for "_i" from 1000 to 2000 do {  
		with uiNamespace do { 
			_ctrl = findDisplay 9999 displayCtrl _i; 
			if (!isNull _ctrl) then { 
				_ctrls pushBack _i; 
			}; 
		}; 
	}; 
	{ctrlDelete ((findDisplay 9999) displayCtrl _x)} forEach _ctrls;
};

FUNC(contextualOk) = {

};

FUNC(mainMenuFrame) = {
	disableSerialization;

	createDialog "MainMenu";
	_display = findDisplay 9999; 
    if (isNull _display) exitWith { systemChat "bad display"; }; 

	private _ctrlBackground = _display ctrlCreate ["RscBackgroundGUI",-1];

	_ctrlBackground ctrlSetPosition [-0.1,-0.1,1.2,1.2];
	_ctrlBackground ctrlCommit 0;

	private _leftFrame = _display ctrlCreate ["RscFrame",-1];

	_leftFrame ctrlSetPosition [-0.1,0,0.85,1.1];
	_leftFrame ctrlCommit 0;

	private _rightFrame = _display ctrlCreate ["RscFrame",-1];

	_rightFrame ctrlSetPosition [0.75,0,0.35,1];
	_rightFrame ctrlCommit 0;

	private _menuOK = _display ctrlCreate ["RscButtonMenuOK",9990];

	_menuOK ctrlSetPosition [0.75,1,0.17,0.1];
	_menuOK ctrlCommit 0;

	private _menuCancel = _display ctrlCreate ["RscButtonMenuCancel",-1];

	_menuCancel ctrlSetPosition [0.93,1,0.17,0.1];
	_menuCancel buttonSetAction "closeDialog 2;";
	_menuCancel ctrlCommit 0;

	private _menuMain = _display ctrlCreate ["RscButtonMenu",-1];

	_menuMain ctrlSetPosition [-0.1,-0.1,0.145,0.1];
	_menuMain ctrlSetText "Home";
	_menuMain ctrlAddEventHandler ["SetFocus",{[0] call FUNC(activeMenu)}];
	_menuMain ctrlCommit 0;

	private _menuSpawnAC = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSpawnAC ctrlSetPosition [0.05,-0.1,0.145,0.1];
	_menuSpawnAC ctrlSetText "Aircraft Spawn";
	_menuSpawnAC ctrlAddEventHandler ["SetFocus",{[1] call FUNC(activeMenu)}];
	_menuSpawnAC ctrlCommit 0;

	private _menuAutoRotation = _display ctrlCreate ["RscButtonMenu",-1];

	_menuAutoRotation ctrlSetPosition [0.2,-0.1,0.145,0.1];
	_menuAutoRotation ctrlSetText "Auto Rotation";
	_menuAutoRotation ctrlAddEventHandler ["SetFocus",{[2] call FUNC(activeMenu)}];
	_menuAutoRotation ctrlCommit 0;

	private _menuTOL = _display ctrlCreate ["RscButtonMenu",-1];

	_menuTOL ctrlSetPosition [0.35,-0.1,0.145,0.1];
	_menuTOL ctrlSetText "Take Off Landing";
	_menuTOL ctrlCommit 0;

	private _menuSlingLoading = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSlingLoading ctrlSetPosition [0.5,-0.1,0.145,0.1];
	_menuSlingLoading ctrlSetText "Sling Loading";
	_menuSlingLoading ctrlCommit 0;

	private _menuSlingInstructor = _display ctrlCreate ["RscButtonMenu",-1];

	_menuSlingInstructor ctrlSetPosition [0.94,-0.1,0.16,0.1];
	_menuSlingInstructor ctrlSetText "Instructor Menu";
	_menuSlingInstructor ctrlCommit 0;
};

FUNC(Home) = {
	
	params["_menu"];

	private _allGroupsWithPlayers = []; 
	{_allGroupsWithPlayers pushBackUnique str group _x} forEach allPlayers;


	private _introST = "
	<t align='center'>
	<t valign='top'>
	Welcome to BadWolf's Heli Practice Mission <br/>
	Here you can set up your practices and group. <br/>
	</t>
	</t>
	";

	private _controlsTitle = [
		["_intro","RscStructuredText",0.8,0.15,_introST,""]
	];

	private _playerInfo1 = [
		["_headerPlayer","RscText",0.08,0.05,"Player:",""]
		,["_headerPlayer","RscText",0.08,0.05,"Group:",""]
	];

	private _playerInfo2 = [
		["_playerNameTitle","RscText",0.2,0.05,profileName,""]
		,["_playerGroup","RscText",0.2,0.05,"Current Group",""]
	];

	private _playerInfo3 = [
		["_headerAutorotation","RscText",0.2,0.05,"Autorotation",""]
		,["_headerTakeOffLanding","RscText",0.2,0.05,"Takeoff Landing",""]
		,["_headerSlingLoading","RscText",0.2,0.05,"Sling Loading",""]
	];

	private _playerInfo4 = [
		["_playerAutoroation","RscCheckBox",0.05,0.05,"",""]
		,["_playerTakeOffLanding","RscCheckBox",0.05,0.05,"",""]
		,["_playerSlingLoading","RscCheckBox",0.05,0.05,"",""]
	];
	
	private _allPlayersInfo = [
		["_allPlayersInfoTitle","RscText",0.4,0.05,"Players",""]
		,["_allPlayersLB","RscListBox",0.4,0.4,"",""]
	];

	private _editGroupInfo = [
		["_editGroupTitle","RscText",0.4,0.05,"Edit Current Group",""]
		,["_editGroupList","RscCombo",0.4,0.05,_allGroupsWithPlayers,""]
		,["_editGroupTitle","RscText",0.4,0.05,"Edit Current Group Name",""]
		,["_editGroupName","RscEdit",0.4,0.05,"",""]
		,["_editGroupConfirm","RscButton",0.4,0.05,"Confirm",""]
	];
	
		// [name,type,width,height,text,function]
	private _controlsButtons = [
		["_homeRepair","RscButton",0.33,0.09,"Repair Aircraft","[] call bad_core_fnc_repair;"]
		,["_homeRearm","RscButton",0.33,0.09,"Rearm Aircraft","[] call bad_core_fnc_rearm;"]
		,["_homeHeal","RscButton",0.33,0.09,"Full Heal","[] call bad_core_fnc_fullHeal;"]
		,["_homeSsOff","RscButton",0.33,0.12,"Turn Off SafeStart","[false] call bad_core_fnc_toggleSS;"]
		,["_homeSsOn","RscButton",0.33,0.05,"Turn On SafeStart","[true] call bad_core_fnc_toggleSS;"]
		,["_cleanUpWrecks","RscButton",0.33,0.09,"Clean up Wrecks and Empty Vics","[] call bad_core_fnc_cleanUpWrecks;"]
		,["_endMission","RscButton",0.33,0.09,"End Mission","[west] call POTATO_adminMenu_fnc_endMission;"]
	];

	[_menu,_controlsTitle,-0.08,0.01,1] call FUNC(Verticle);
	[_menu,_playerInfo1,-0.08,0.17,2] call FUNC(Verticle);
	[_menu,_playerInfo2,0.01,0.17,3] call FUNC(Verticle);
	[_menu,_playerInfo3,0.22,0.17,4] call FUNC(Verticle);
	[_menu,_playerInfo4,0.43,0.17,5] call FUNC(Verticle);
	[_menu,_allPlayersInfo,-0.08,0.4,6] call FUNC(Verticle);
	[_menu,_editGroupInfo,0.33,0.4,7] call FUNC(Verticle);
	[_menu,_controlsButtons,0.76,0.01,8] call FUNC(Verticle);

	/* _lb = _display displayCtrl (1051);
	_lb ctrlAddEventHandler ["LBSelChanged",{call FUNC(updateVicInformaiton)}]; */

};

FUNC(SpawnAC) = {

	params["_menu"];
	
	private _display = findDisplay 9999;

		// [name,type,width,height,text,function]
	private _controlsListBox = [
		["_vicListTitle","RscText",0.4,0.09,"Available Aircraft",""]
		,["_vicListBox","RscListBox",0.4,0.97,"",""]
	];

	private _controlsVicInfo = [
		["_vehiclePic","RscPictureKeepAspect",0.4,0.4,"",""]
		,["_title","RscText",0.4,0.07,"VEHICLE INFORMATION",""]
		,["_vicName","RscText",0.4,0.05,"",""]
		,["_vicModPack","RscText",0.4,0.05,"",""]
		,["_vicCrew","RscText",0.4,0.05,"",""]
		,["_vicSlingLoad","RscText",0.4,0.05,"",""]
		,["_vicMaxSpeed","RscText",0.4,0.05,"",""]
		,["_vicFastRope","RscText",0.4,0.05,"",""]
		
	];

	private _controlsButtons = [
		["_spawnArea","RscText",0.33,0.04,"Select Spawn Area",""]
		,["_vicListBox","RscCombo",0.33,0.04,["Airfield","Player Location"],""]
		,["_engineON","RscText",0.33,0.04,"Spawn with Engine Running?",""]
		,["_engineOnSelect","RscCombo",0.33,0.04,["Yes","No"],""]
	];

	[_menu,_controlsListBox,-0.08,0.01,1] call FUNC(Verticle);
	[_menu,_controlsVicInfo,0.33,0.01,2] call FUNC(Verticle);
	[_menu,_controlsButtons,0.76,0.01,3] call FUNC(Verticle);

	[1011] call FUNC(getTypeList);

	private _menuOK = ((findDisplay 9999) displayCtrl (9990));
	_menuOK ctrlSetText "Spawn";
	_menuOK buttonSetAction "[] call bad_mainmenu_fnc_SpawnVic;";
	_menuOK ctrlCommit 0;

	_lb = _display displayCtrl (1011);
	_lb ctrlAddEventHandler ["LBSelChanged",{call FUNC(updateVicInformaiton)}];

};

FUNC(Autorotation) = {

	params["_menu"];
	
	private _controlsButtons = [
		["_title","RscButton",0.4,0.07,"Toggle Practice On/Off","[0] call bad_core_fnc_togglePractice"]
		,["_title","RscButton",0.4,0.07,"Toggle Practice On/Off","[1] call bad_core_fnc_togglePractice"]
		,["_title","RscButton",0.4,0.07,"Toggle Practice On/Off","[2] call bad_core_fnc_togglePractice"]
		,["_title","RscButton",0.4,0.07,"Toggle Practice On/Off","[3] call bad_core_fnc_togglePractice"]
	];


	[_menu,_controlsButtons,-0.08,0.01,1] call FUNC(Verticle);
};


/*
FUNC(TakeOffLanding) = {

};

FUNC(SlingLoading) = {

};

FUNC(InstMenu) = {

}; */