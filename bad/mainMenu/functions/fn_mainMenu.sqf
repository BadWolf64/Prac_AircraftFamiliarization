#include "script_component.hpp"
GVAR(menus) = [
	"Home"
	,"SpawnAC"
	,"Autorotation"
	,"TakeOffLanding"
	,"SlingLoading"
	,"CAS"
	,"InstMenu"
];
/* 
FUNCTION : activeMenu : [_menu] call bad_mainMenu_fnc_activeMenu
DESCRIPTION : Used to active the desired menu
INPUTS : Desired menu called with an int. 
	0 - Home
	1 - AC Spawner
	2 - Auto Rotation
	3 - Take of and Landing
	4 - Sling Loading
	5 - CAS
	6 - Instructors Menu
OUTPUTS : 
 */
FUNC(activeMenu) = {
	params["_menu"];
	_active = GVAR(menus) select _menu;
	TRACE_1("Menu Selected ",_active);
	_display = findDisplay 9999;
	if (isNull _display) then {
		[] call FUNC(mainMenuFrame);
		};
	[] call FUNC(clearMenu);
	[_menu] call FUNC(contextualOk);
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
		case 3: {
			[3] call FUNC(TakeOffLanding);
		};
		case 4: {
			[4] call FUNC(SlingLoading);
		};
		case 5: {
			[5] call FUNC(CAS);
		};
		case 6: {
			[6] call FUNC(InstMenu);
		};
	};
};
/* 
FUNCTION : clearMenu : [] call bad_mainMenu_fnc_clearMenu
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
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
/* 
FUNCTION : playerList : [] call bad_mainMenu_fnc_playerList
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
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
/* 
FUNCTION : flightMembersMenuList :
DESCRIPTION : 
INPUTS :
OUTPUTS : 
*/
FUNC(flightMembersMenuList) = {
	params["_display","_idcLB","_idcHeader"];
	private _allFlights = missionNamespace getVariable "PV_flights";
	private _ctrlLB = _display displayCtrl _idcLB;
	if(count _allFlights == 0) exitWith {lbCLear _ctrlLB};
	private _ctrlHeader = _display displayCtrl _idcHeader;
	private _index = lbCurSel _ctrlHeader;
	private _flightArray = _allFlights select _index;
	private _playersInFlight = _flightArray select 3;
	if(count _playersInFlight == 0) then {
		lbCLear _ctrlLB;
		_ctrlLB lbAdd "Flight Empty";
	} else {
		lbCLear _ctrlLB;
		{
			_ctrlLB lbAdd _x;
			_ctrlLB lbSetData [_forEachIndex,_x];
		} forEach _playersInFlight;
	}; 
};
/* 
FUNCTION : contextualOk : [] call bad_mainMenu_fnc_contextualOk
DESCRIPTION : 
INPUTS :
OUTPUTS : 
 */
FUNC(contextualOk) = {
	params["_menu"];
	private _display = findDisplay 9999;
	private _menuOK = _display displayCtrl (9990);
	_menuOK ctrlSetText "Ok";
	_menuOK buttonSetAction "";
	_menuOK ctrlCommit 0;
		switch _menu do {
		case 0: {
		};
		case 1: {
			_menuOK ctrlSetText "Spawn";
			_menuOK buttonSetAction "[] call bad_mainmenu_fnc_SpawnVic;";
			_menuOK ctrlCommit 0;
		};
		case 2: {
			_menuOK ctrlSetText "Start";
			_menuOK buttonSetAction "bad_autorotation_damagevalues set [0,parseNumber ctrlText ((findDisplay 9999) displayCtrl (1032))];
			bad_autorotation_damagevalues set [1,parseNumber ctrlText ((findDisplay 9999) displayCtrl (1042))];
			bad_autorotation_damagevalues set [2,parseNumber ctrlText ((findDisplay 9999) displayCtrl (1081))];
			bad_autorotation_damagevalues set [3,parseNumber ctrlText ((findDisplay 9999) displayCtrl (1091))];
			[] call bad_autorotation_fnc_soloActive;";
			_menuOK ctrlCommit 0;
		};
		case 3: {
			_menuOK ctrlSetText "Save Settings";
			_menuOK buttonSetAction "[] call bad_core_fnc_writeToPSTOL;[] call bad_core_fnc_writeToPS";
			_menuOK ctrlCommit 0;
		};
	};
};
/* 
FUNCTION : mainMenuFrame : [] call bad_mainMenu_fnc_mainMenuFrame
DESCRIPTION : Creates the Tabs and OK/Cancel buttons and framing of the general menu. 
INPUTS :
OUTPUTS : 
 */
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
	_menuTOL ctrlAddEventHandler ["SetFocus",{[3] call FUNC(activeMenu)}];
	_menuTOL ctrlCommit 0;
	private _menuSlingLoading = _display ctrlCreate ["RscButtonMenu",-1];
	_menuSlingLoading ctrlSetPosition [0.5,-0.1,0.145,0.1];
	_menuSlingLoading ctrlSetText "Sling Loading";
	_menuSlingLoading ctrlCommit 0;
	private _menuSlingLoading = _display ctrlCreate ["RscButtonMenu",-1];
	_menuSlingLoading ctrlSetPosition [0.65,-0.1,0.145,0.1];
	_menuSlingLoading ctrlSetText "CAS";
	_menuSlingLoading ctrlCommit 0;
	private _menuSlingInstructor = _display ctrlCreate ["RscButtonMenu",-1];
	_menuSlingInstructor ctrlSetPosition [0.94,-0.1,0.16,0.1];
	_menuSlingInstructor ctrlSetText "Instructor Menu";
	_menuSlingInstructor ctrlCommit 0;
};
/* 
FUNCTION : Home : [] call bad_mainMenu_fnc_Home
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(Home) = {
	params["_menu"];
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
		,["_headerGroup","RscText",0.08,0.05,"Flight:",""]
		,["_headerSolo","RscText",0.08,0.05,"Solo:",""]
	];
	private _playerInfo2 = [
		["_playerNameTitle","RscText",0.2,0.05,profileName,""]
		,["_playerGroup","RscText",0.2,0.05,[name player] call EFUNC(core,getFlight),""]
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
	private _playerInfo5 = [
		["_headerCAS","RscText",0.2,0.05,"CAS:",""]
		,["_headerCAP","RscText",0.2,0.05,"CAP:",""]
		,["_headerUAV","RscText",0.2,0.05,"UAV:",""]
	];
	private _playerInfo6 = [
		["_playerCAS","RscCheckBox",0.05,0.05,"",""]
		,["_playerCAP","RscCheckBox",0.05,0.05,"",""]
		,["_playerUAV","RscCheckBox",0.05,0.05,"",""]
	];
	private _allPlayersInfo = [
		["_allPlayersInfoTitle","RscText",0.25,0.05,"Players",""]
		,["_allPlayersLB","RscListBoxMulti",0.25,0.4,[],""]
	];
	private _editGroupInfo = [
		["_flightList","RscXListBox",0.25,0.05,[] call EFUNC(core,allFlights),""]
		,["_playerInFlightLB","RscListBox",0.25,0.34,[],""]
		,["_playerToFlight","RscButton",0.25,0.05,"Move To Flight","[] call bad_core_fnc_moveToFlight"]
	];
	private _editGroupInfo2 = [
		["_editFlightNameTitle","RscText",0.25,0.05,"Create/Edit FLT",""]
		,["_editFlightName","RscEdit",0.25,0.05,"",""]
		,["_editFlightLeaderTitle","RscText",0.25,0.05,"FLT Leader",""]
		,["_editFlightLeader","RscCombo",0.25,0.05,[],""]
		,["_editFlightPracticeTitle","RscText",0.25,0.05,"FLT Active Practice",""]
		,["_flightPracticeListLB","RscCombo",0.25,0.05,["TOL","CAS"],""]
		,["_editFlightDelete","RscButton",0.25,0.05,"Delete Group","[] call bad_core_fnc_deleteFlight"]
		,["_editFlightConfirm","RscButton",0.25,0.05,"Confirm","[] call bad_core_fnc_createFlight"]
	];
	private _controlsButtons = [
		["_homeRepair","RscButton",0.33,0.09,"Repair Aircraft","[] call bad_core_fnc_repair;"]
		,["_homeRearm","RscButton",0.33,0.09,"Rearm Aircraft","[] call bad_core_fnc_rearm;"]
		,["_homeHeal","RscButton",0.33,0.09,"Full Heal","[] call bad_core_fnc_fullHeal;"]
		,["_homeSsOff","RscButton",0.33,0.12,"Turn Off SafeStart","[false] remoteExecCall ['potato_safeStart_fnc_toggleSafeStart', 2];"]
		,["_cleanUpWrecks","RscButton",0.33,0.09,"Clean up Wrecks and Empty Vics","[] call bad_core_fnc_cleanUpWrecks;"]
		,["_cleanUpWrecks","RscButton",0.33,0.09,"Leave Current Flight","[name player] call bad_core_fnc_leaveCurrentFlight"]
		,["_allowDamage","RscText",0.33,0.05,"God Mode (WIP)",""]
		,["_allowDamage","RscCombo",0.33,0.05,["DISABLED","ENABLED"],""]
		,["_endMission","RscButton",0.33,0.09,"End Mission","[west] remoteExecCall ['POTATO_adminMenu_fnc_endMission', 2];"]
	];
	[_menu,_controlsTitle,-0.08,0.01,1] call FUNC(Verticle);
	[_menu,_playerInfo1,-0.08,0.17,2] call FUNC(Verticle);
	[_menu,_playerInfo2,0.01,0.17,3] call FUNC(Verticle);
	[_menu,_playerInfo3,0.18,0.17,4] call FUNC(Verticle);
	[_menu,_playerInfo4,0.39,0.17,5] call FUNC(Verticle);
	[_menu,_allPlayersInfo,-0.08,0.4,6] call FUNC(Verticle);
	[_menu,_editGroupInfo,0.18,0.4,7] call FUNC(Verticle);
	[_menu,_editGroupInfo2,0.45,0.4,8] call FUNC(Verticle);
	[_menu,_controlsButtons,0.76,0.01,9] call FUNC(Verticle);
	[_menu,_playerInfo5,0.45,0.17,10] call FUNC(Verticle);
	[_menu,_playerInfo6,0.66,0.17,11] call FUNC(Verticle);
	[] call EFUNC(core,getPracticeStatusAll);
	private _display = findDisplay 9999;
	[_display,1071,1070] call FUNC(flightMembersMenuList);
	[_display,1061] call FUNC(playerList);
	private _ctrlLB = _display displayCtrl(1081);
	private _ctrlText = ctrlText _ctrlLB;
	private _flightMembers = [_ctrlText] call EFUNC(core,flightMembersFlight);
	{
		_ctrlLB lbAdd _x;
		_ctrlLB lbSetData [_forEachIndex,_x];
	}forEach _flightMembers;

	//Can be put in a forEach Loop. 
	private _checkBoxAuto = _display displayCtrl (1050);
	_checkBoxAuto ctrlAddEventHandler ["CheckedChanged",{[0,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxTOL = _display displayCtrl (1051);
	_checkBoxTOL ctrlAddEventHandler ["CheckedChanged",{[1,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxSling = _display displayCtrl (1052);
	_checkBoxSling ctrlAddEventHandler ["CheckedChanged",{[2,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxSolo = _display displayCtrl (1032);
	_checkBoxSolo ctrlAddEventHandler ["CheckedChanged",{[3,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxCAS = _display displayCtrl (1110);
	_checkBoxCAS ctrlAddEventHandler ["CheckedChanged",{[4,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxCAP = _display displayCtrl (1111);
	_checkBoxCAP ctrlAddEventHandler ["CheckedChanged",{[5,name player] call EFUNC(core,togglePractice);}];
	private _checkBoxUAV = _display displayCtrl (1112);
	_checkBoxUAV ctrlAddEventHandler ["CheckedChanged",{[6,name player] call EFUNC(core,togglePractice);}];
	private _flightNameEdit = _display displayCtrl (1081);
	_flightNameEdit ctrlAddEventHandler ["SetFocus",{(_this select 0) ctrlSetText "";}];
	private _flightMemberList = _display displayCtrl (1070);
	_flightMemberList ctrlAddEventHandler ["LBSelChanged",{[] call EFUNC(core,flightRefresh);}];
	[] call EFUNC(core,flightRefresh);
};

/* 
FUNCTION : SpawnAC : [] call bad_mainMenu_fnc_SpawnAC
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(SpawnAC) = {
	params["_menu"];
	private _display = findDisplay 9999;
	private _controlsListBox = [
		["_vicListTitle","RscXListBox",0.4,0.05,["Helicopter","Plane"],""]
		,["_vicListBox","RscListBox",0.4,1.01,[],""]
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
		["_spawnArea","RscText",0.33,0.05,"Select Spawn Area",""]
		,["_vicListBox","RscCombo",0.33,0.05,["AIRFIELD","RUNWAY END","PLAYER LOCATION"],""]
		,["_engineON","RscText",0.33,0.05,"Spawn with Engine Running?",""]
		,["_engineOnSelect","RscCombo",0.33,0.05,["YES","NO"],""]
	];
	[_menu,_controlsListBox,-0.08,0.01,1] call FUNC(Verticle);
	[_menu,_controlsVicInfo,0.33,0.01,2] call FUNC(Verticle);
	[_menu,_controlsButtons,0.76,0.01,3] call FUNC(Verticle);
	[1011] call FUNC(getTypeList);
	private _lb = _display displayCtrl (1011);
	_lb ctrlAddEventHandler ["LBSelChanged",{call FUNC(updateVicInformaiton)}];
	_lb lbSetCurSel 0;
	private _cb = _display displayCtrl (1010);
	_cb ctrlAddEventhandler ["LBSelChanged",{call FUNC(getTypeList)}];
	_cb lbSetCurSel 0;
};
/* 
FUNCTION : Autorotation : [] call bad_mainMenu_fnc_Autorotation
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(Autorotation) = {
	params["_menu"];
	private _practiceStatus = [
		["_practiceEnabled","RscText",0.34,0.05,"Autorotation Practice Enabled:",""]
		,["_playerAutoroation","RscCheckBox",0.05,0.05,"",""]
		,["_soloEnabled","RscText",0.34,0.05,"Solo Practice Enabled:",""]
		,["_playerSolo","RscCheckBox",0.05,0.05,"",""]
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
		,["_quickDamage","RscButton",0.33,0.09,"Apply Damage [Immediate]","[parseNumber ctrlText ((findDisplay 9999) displayCtrl (1032)),parseNumber ctrlText ((findDisplay 9999) displayCtrl (1042))] call bad_autorotation_fnc_execDamageToVic;"]
		,["_quickACE","RscText",0.33,0.09,"Enable ACE Self Interact quick trigger",""]
		,["_quickACECB","RscCheckBox",0.05,0.05,"",""]
	];
	private _soloTitleFrame = [
		["_soloTitle","RscText",0.15,0.05,"Solo Options:",""]
		,["_soloFrame","RscFrame",0.55,0.25,"",""]
	];
	private _soloOptions1 = [
		["_soloHeaderOption","RscText",0.2,0.05,"Option",""]
		,["_soloHeaderValue","RscText",0.15,0.05,"Value",""]
		,["_soloHeaderCB","RscText",0.15,0.05,"Randomized",""]
	];
	private _soloOptions2 = [
		["_soloHeightTriggerText","RscText",0.2,0.05,"Trigger Height:",""]
		,["_soloHeightTriggerValue","RscEdit",0.06,0.05,"",""]
		,["_soloHeightTriggerUnit","RscText",0.1,0.05,"m",""]
	];
	private _soloOptions3 = [
		["_soloTimeTriggerText","RscText",0.2,0.05,"Trigger Time:",""]
		,["_soloTimeTriggerValue","RscEdit",0.06,0.05,"",""]
		,["_soloTimeTriggerUnit","RscText",0.1,0.05,"secs",""]
		,["_soloTimeTriggerCB","RscCheckBox",0.05,0.05,"",""]
	];
	[_menu,_practiceStatus,-0.08,0.01,1] call FUNC(Horizontal);
	[_menu,_picture,0.035,0.11,2] call FUNC(Verticle);
	[_menu,_engineSlider,0,0.15,3] call FUNC(Horizontal);
	[_menu,_tailSlider,0.2,0.6,4] call FUNC(Horizontal);
	[_menu,_quickMenu,0.76,0.01,5] call FUNC(Verticle);
	[_menu,_soloTitleFrame,-0.08,0.75,6] call FUNC(Horizontal);
	[_menu,_soloOptions1,0.1,0.75,7] call FUNC(Horizontal);
	[_menu,_soloOptions2,0.1,0.825,8] call FUNC(Horizontal);
	[_menu,_soloOptions3,0.1,0.9,9] call FUNC(Horizontal);
	private _heliPic = ((findDisplay 9999) displayCtrl (1020));
	_pathPic =  (getText(configfile >> "CfgVehicles" >> "B_Heli_Light_01_F" >> "picture"));
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
	private _damageEng = EGVAR(autorotation,damageValues) select 0;
	private _damageTRot = EGVAR(autorotation,damageValues) select 1;
	private _soloHeightTriggerValue = EGVAR(autorotation,damageValues) select 2;
	private _soloTimeTriggerValue = EGVAR(autorotation,damageValues) select 3;
	private _soloTimeTriggerCB = EGVAR(autorotation,damageValues) select 4;
	private _soloTimeTriggerCtrl = ((findDisplay 9999) displayCtrl (1093));
	if (_soloTimeTriggerCB == 0) then {
			_soloTimeTriggerCtrl cbSetChecked false;
		} else {
			_soloTimeTriggerCtrl cbSetChecked true;
	};
	private _engineEdit = ((findDisplay 9999) displayCtrl (1032));
	_engineEdit ctrlSetText str _damageEng;
	private _tailEdit = ((findDisplay 9999) displayCtrl (1042));
	_tailEdit ctrlSetText str _damageTRot;
	private _triggerHeightEdit = ((findDisplay 9999) displayCtrl (1081));
	_triggerHeightEdit ctrlSetText str _soloHeightTriggerValue;
	private _triggerTimeEdit = ((findDisplay 9999) displayCtrl (1091));
	_triggerTimeEdit ctrlSetText str _soloTimeTriggerValue;
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
	_soloTimeTriggerCtrl ctrlAddEventHandler ["CheckedChanged",{
		private _soloTimeTriggerCB = EGVAR(autorotation,damageValues) select 4;
		if (_soloTimeTriggerCB == 0) then {
			EGVAR(autorotation,damageValues) set [4,1];
		} else {
			EGVAR(autorotation,damageValues) set [4,0];
		};
	}];
};
/* 
FUNCTION : TakeOffLanding : [] call bad_mainMenu_fnc_TakeOffLanding
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(TakeOffLanding) = {
	params["_menu"];
	private _takeoffLaningIntroST = "
	<t align='center'>
	<t valign='middle'>
	All LZ's will be marked with smoke.	All other options are as per settings. <br/>
	Some funcitons are not yet complete. Continious training is functional. 
	</t>
	</t>
	";
	private _practiceStatus = [
		["_practiceEnabled","RscText",0.34,0.05,"Takeoff Landing Practice Enabled:",""]
		,["_playerAutoroation","RscCheckBox",0.05,0.05,"",""]
		,["_soloEnabled","RscText",0.34,0.05,"Solo Practice Enabled:",""]
		,["_playerSolo","RscCheckBox",0.05,0.05,"",""]
	];
	private _AOSetupTitleFrame = [
		["_AOSetupTitle","RscText",0.15,0.05,"AO Options:",""]
		,["_AOSetupFrame","RscFrame",0.37,0.25,"",""]
		,["_AOSetupInfo","RscStructuredText",0.27,0.25,_takeoffLaningIntroST,""]
	];
	private _AOSetup = [
		["_difficultyTitle","RscText",0.35,0.05,"Select AO Type:",""]
		,["_difficulty","RscCombo",0.35,0.05,["OPEN","TIGHT","RANDOM"],""]
		,["_LZMarkersTitle","RscText",0.35,0.05,"LZ marked on map with:",""]
		,["_LZMarkers","RscCombo",0.35,0.05,["LZ EXACT + AO","LZ EXACT ONLY","AO ONLY"],""]
	];
	private _EISetupTitleFrame = [
		["_EISetupTitle","RscText",0.15,0.05,"EI Options:",""]
		,["_EISetupFrame","RscFrame",0.65,0.25,"",""]
	];
	private _EISetup1 = [
		["_EIPresenceTitle","RscText",0.3,0.05,"EI Presence in AO",""]
		,["_EIPresence","RscCombo",0.3,0.05,["DISABLED","ENABLED"],""]
		,["_EINumbersTitle","RscText",0.3,0.05,"Amount of EI in AO",""]
		,["_EINumbers","RscCombo",0.3,0.05,["LIGHT","MEDIUM","HEAVY"],""]
	];
	private _EISetup2 = [
		["_EIVicPresenceTitle","RscText",0.3,0.05,"Vehicle EI in AO",""]
		,["_EIVicPresence","RscCombo",0.3,0.05,["DISABLED","ENABLED"],""]
		,["_EISpawnRadiusTitle","RscText",0.3,0.05,"EI Difficulty",""]
		,["_EISpawnRadius","RscCombo",0.3,0.05,["EASY","MEDIUM","HARD"],""]
	];
	private _MissionSetupTitleFrame = [
		["_EISetupTitle","RscText",0.81,0.05,"Mission Setup [Options here will only apply if you have selected 'Mission' in Practice Type]",""]
		,["_EISetupFrame","RscFrame",0.81,0.4,"",""]
	];
	private _missionSetup1 = [
		["_placeholder","RscText",0.35,0.05,"Placeholder",""]
		,["_placeholder","RscText",0.35,0.05,"Placeholder",""]
	];
	private _missionSetup2 = [
		["_placeholder","RscText",0.35,0.05,"Placeholder",""]
		,["_placeholder","RscText",0.35,0.05,"Placeholder",""]
	];
	private _rightFrame = [
		["_practiceType","RscText",0.33,0.05,"Practice Type",""]
		,["_practiceTypeLB","RscCombo",0.33,0.05,["CONTINIOUS","MISSION","QUALIFICATION"],""]
		,["_teleportToAO","RscText",0.33,0.05,"Teleport to AO [Disabled for Mission]",""]
		,["_teleportToAOLB","RscCombo",0.33,0.05,["DISABLED","ENABLED"],""]
		,["_autoRepair","RscText",0.33,0.05,"Auto-repair/rearm exiting AO",""]
		,["_autoRepairLB","RscCombo",0.33,0.05,["ENABLED","DISABLED"],""]
	];
	[_menu,_practiceStatus,-0.08,0.01,1] call FUNC(Horizontal);
	[_menu,_AOSetupTitleFrame,-0.08,0.1,2] call FUNC(Horizontal);
	[_menu,_AOSetup,0.09,0.1,3] call FUNC(Verticle);
	[_menu,_EISetupTitleFrame,-0.08,0.38,4] call FUNC(Horizontal);
	[_menu,_EISetup1,0.09,0.38,5] call FUNC(Verticle);
	[_menu,_EISetup2,0.41,0.38,6] call FUNC(Verticle);
	[_menu,_MissionSetupTitleFrame,-0.08,0.63,7] call FUNC(Verticle);
	[_menu,_missionSetup1,-0.07,0.69,8] call FUNC(Verticle);
	[_menu,_missionSetup2,0.30,0.69,9] call FUNC(Verticle);
	[_menu,_rightFrame,0.76,0.01,10] call FUNC(Verticle);
	private _status = [1,name player] call EFUNC(core,practiceStatus);
	private _checkBoxTOL = ((findDisplay 9999) displayCtrl (1011));
	if (_status == 1) then {
		_checkBoxTOL cbSetChecked true;
	} else {
		_checkBoxTOL cbSetChecked false;
	};
	private _checkBoxSolo = ((findDisplay 9999) displayCtrl (1013));
	private _soloCurrentStatus = [3,name player] call EFUNC(core,practiceStatus);
	if (_soloCurrentStatus == 0) then {
			_checkBoxSolo cbSetChecked false;
		} else {
			_checkBoxSolo cbSetChecked true;
	};
	_checkBoxTOL ctrlAddEventHandler ["CheckedChanged",{[1,name player] call EFUNC(core,togglePractice);}];
	_checkBoxSolo ctrlAddEventHandler ["CheckedChanged",{[3,name player] call EFUNC(core,togglePractice);}];
};

/* 
FUNCTION : SlingLoading : [] call bad_mainMenu_fnc_SlingLoading
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(SlingLoading) = {
};
/* 
FUNCTION : CAS : [] call bad_mainMenu_fnc_CAS
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(CAS) = {
};
/* 
FUNCTION : CAS : [] call bad_mainMenu_fnc_CAS
DESCRIPTION : General menu setup for the given selected menu. Called by activeMenu. 
INPUTS :
OUTPUTS : 
 */
FUNC(InstMenu) = {
};