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
	[] call FUNC(contextualOk);

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
	{
		private _ctrl = (findDisplay 9999) displayCtrl _x; 
		_ctrl ctrlRemoveAllEventHandlers "LBSelChanged";
		_ctrl ctrlRemoveAllEventHandlers "CheckedChanged";
		_ctrl ctrlRemoveAllEventHandlers "SliderPosChanged";
		ctrlDelete _ctrl;
	} forEach _ctrls;
};

FUNC(playerList) = {

	params["_display","_idc"];

	private _playerList = if (time > 120) then {
        (allPlayers - (entities "HeadlessClient_F"))
    } else {
        ((entities [["CAManBase"], ["HeadlessClient_F"], true, true]) select { isPlayer _x })
    };

	private _playersLB = _display displayCtrl (_idc);

	lbCLear _playersLB;
	{
		private _playerNameStr = name _x;
		private _index = _playersLB lbAdd _playerNameStr;
		_playersLB lbSetData [_index,[_x] call BIS_fnc_objectVar];
		_playersLB lbsetToolTip [_index,[_x] call BIS_fnc_objectVar];
	} forEach _playerList;

};

FUNC(contextualOk) = {
	params["_menu"];

	private _display = findDisplay 9999;
	private _menuOK = _display displayCtrl (9990);

	_menuOK ctrlSetText "Ok";
	_menuOK buttonSetAction "";
	_menuOK ctrlCommit 0;

		switch _menu do {
		case 0: {
			//do nothing for now.
		};
		case 1: {
			;
		};
		case 2: {
			//I will get to it. 
		};
	};

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
	UITOOLTIP(_menuOK,"9990");
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
	<t valign='middle'>
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
		,["_headerGroup","RscText",0.08,0.05,"Group:",""]
		,["_headerSolo","RscText",0.08,0.05,"Solo:",""]
	];

	private _playerInfo2 = [
		["_playerNameTitle","RscText",0.2,0.05,profileName,""]
		,["_playerGroup","RscText",0.2,0.05,"Current Group",""]
		,["_playerSolo","RscCheckBox",0.05,0.05,"",""]
	];

	private _playerInfo3 = [
		["_headerAutorotation","RscText",0.2,0.05,"Autorotation:",""]
		,["_headerTakeOffLanding","RscText",0.2,0.05,"Takeoff Landing:",""]
		,["_headerSlingLoading","RscText",0.2,0.05,"Sling Loading:",""]
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

	[] call EFUNC(core,getPracticeStatusAll);
	
	private _display = findDisplay 9999;

	[_display,1061] call FUNC(playerList);

	private _checkBoxAuto = _display displayCtrl (1050);
	_checkBoxAuto ctrlAddEventHandler ["CheckedChanged",{[0,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxTOL = _display displayCtrl (1051);
	_checkBoxTOL ctrlAddEventHandler ["CheckedChanged",{[1,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxSling = _display displayCtrl (1052);
	_checkBoxSling ctrlAddEventHandler ["CheckedChanged",{[2,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxSolo = _display displayCtrl (1032);
	_checkBoxSolo ctrlAddEventHandler ["CheckedChanged",{[3,name player] call EFUNC(core,togglePractice);}];
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

	private _lb = _display displayCtrl (1011);
	_lb ctrlAddEventHandler ["LBSelChanged",{call FUNC(updateVicInformaiton)}];
};

FUNC(Autorotation) = {

	params["_menu"];
	
	private _practiceStatus = [
		["_practiceEnabled","RscText",0.34,0.05,"Autorotation Practice Enabled:",""]
		,["_playerAutoroation","RscCheckBox",0.05,0.05,"",""]
		,["_soloEnabled","RscText",0.34,0.05,"Solo Practice Enabled:",""]
		,["_playerSolo","RscCheckBox",0.05,0.05,"",{[3,name player] call EFUNC(core,togglePractice);}]
	];

	private _picture =[
		["_heliPic","RscPictureKeepAspect",0.6,0.6,"",""]
	];
	
	private _engineSlider =[
		["_engineTitle","RscText",0.2,0.05,"Set Engine Damage:",""]
		,["_engineSlider","RscSlider",0.2,0.05,"",""]
		,["_engineEdit","RscEdit",0.075,0.05,"",""]
	];
	
	private _tailSlider =[
		["_tailTitle","RscText",0.23,0.05,"Set Tail Rotor Damage:",""]
		,["_tailSlider","RscSlider",0.2,0.05,"",""]
		,["_tailEdit","RscEdit",0.075,0.05,"",""]
	];

	private _quickMenu = [
		["_quickRepair","RscButton",0.33,0.09,"Repair Aircraft","[] call bad_core_fnc_repair;"]
		,["_quickHeal","RscButton",0.33,0.09,"Full Heal","[] call bad_core_fnc_fullHeal;"]
		,["_quickHeal","RscButton",0.33,0.09,"Apply Damage [Immediate]","[parseNumber ctrlText ((findDisplay 9999) displayCtrl (1032)),parseNumber ctrlText ((findDisplay 9999) displayCtrl (1042))] call bad_autorotation_fnc_execDamageToVic;"]
	];

//{parseText ctrlText ((findDisplay 9999) displayCtrl (1032));}

	[_menu,_practiceStatus,-0.08,0.01,1] call FUNC(Horizontal);
	[_menu,_picture,0.035,0.11,2] call FUNC(Verticle);
	[_menu,_engineSlider,0,0.15,3] call FUNC(Horizontal);
	[_menu,_tailSlider,0.2,0.6,4] call FUNC(Horizontal);
	[_menu,_quickMenu,0.76,0.01,5] call FUNC(Verticle);

	private _heliPic = ((findDisplay 9999) displayCtrl (1020));
	_pathPic =  (getText(configfile >> "CfgVehicles" >> "RHS_MELB_MH6M" >> "picture"));
	_heliPic ctrlSetText format ["%1",_pathPic];

	_player = name player;

	_practiceCurrentStatus = [0,_player] call EFUNC(core,practiceStatus);
	_soloCurrentStatus = [3,_player] call EFUNC(core,practiceStatus);

	private _checkBoxAuto = ((findDisplay 9999) displayCtrl (1011));

	if (_practiceCurrentStatus == 0) then {
			_checkBoxAuto cbSetChecked false;
		} else {
			_checkBoxAuto cbSetChecked true;
	};

	private _checkBoxSolo = ((findDisplay 9999) displayCtrl (1013));
	
	if (_soloCurrentStatus == 0) then {
			_checkBoxSolo cbSetChecked false;
		} else {
			_checkBoxSolo cbSetChecked true;
	};

	private _sliderEngine = ((findDisplay 9999) displayCtrl (1031));
	_sliderEngine sliderSetRange [0, 1];
	_sliderEngine sliderSetSpeed [0.1, 0.1];
	_sliderEngine ctrlAddEventHandler ["SliderPosChanged",{_value = str (_this select 1);ctrlSetText [1032, _value];}];

	private _sliderTRotor = ((findDisplay 9999) displayCtrl (1041));
	_sliderTRotor sliderSetRange [0, 1];
	_sliderTRotor sliderSetSpeed [0.1, 0.1];
	_sliderTRotor ctrlAddEventHandler ["SliderPosChanged",{_value = str (_this select 1);ctrlSetText [1042, _value];}];

	_checkBoxAuto ctrlAddEventHandler ["CheckedChanged",{[0,name player] call EFUNC(core,togglePractice);}];
	_checkBoxSolo ctrlAddEventHandler ["CheckedChanged",{[3,name player] call EFUNC(core,togglePractice);}];
};


/*
FUNC(TakeOffLanding) = {

};

FUNC(SlingLoading) = {

};

FUNC(InstMenu) = {

}; */