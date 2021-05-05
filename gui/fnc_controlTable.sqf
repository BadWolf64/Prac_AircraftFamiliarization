#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: bad_gui_fnc_openGui

Description:
    This function will check for current task and then open the settings menu specific to that task in the map screen.
Parameters:
    _target - The player that is calling for the menu to be opened.
Returns:

Examples:
    (begin example)

    (end)

Author:

---------------------------------------------------------------------------- */


TRACE_1("Params",_this);

params ["_ctrl","_unit","_playerActiveTask"];

// Get the flight lead
private _fltLdCtrl = MAP_DIALOG displayCtrl FLIGHT_LEAD_IDC;
private _index = lbCurSel _fltLdCtrl;
private _unitFltLdStr = _fltLdCtrl lbData _index;
private _unitFltLd = missionNamespace getVariable [_unitFltLdStr, objNull];
private _fltLdName = _fltLdCtrl lbText _index;
private _activeTaskFltLd = [_unitFltLd] call CFUNC(checkActivePractice);
private _ctrlsArray = [];
private _hashMapStr = nil;

// If the flight lead has the same task enabled as the player then you are not able to change the settings and you will get the settings of the flight leader.
private _playerName = [_unit] call CFUNC(getPlayerName);
private _soloTask = (_playerActiveTask == _activeTaskFltLd);

ctClear _ctrl;

if (_soloTask) then {
  _hashMapStr = HASHMAP_STR(_playerName);
} else {
  _hashMapStr = HASHMAP_STR(_fltLdName);
};
_map = missionNamespace getVariable _hashMapStr;

switch (_playerActiveTask) do {
  case QUOTE(TASK_HELO_AUTOROTATION_ID) : {
    ctAddHeader _ctrl params ["_ind", "_header"];
    _header params ["_ctrlHeaderBackground", "_ctrlHeaderColumn1", "_ctrlHeaderColumn2"];
    _ctrlHeaderBackground ctrlSetBackgroundColor [0,0.3,0.6,1];
    _ctrlHeaderColumn1 ctrlSetText AUTOROTATION_ICON;
    _ctrlHeaderColumn2 ctrlSetText "AUTOROTATION: Practice Settings";
    _ctrlsArray = [
      [
        "RscCheckbox"
        , "Enable Damage to Tail Rotor"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arTailDmg",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arTailDmg"
        , "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa"
        , true
      ]
      ,[
        "RscXSliderH"
        , " >>>> How much Damage to be effected to the Tail Rotor"
        , [
          ["SliderPosChanged",{
            [[] call CFUNC(aceUnitSwitch),"arTailDmgVal",_this select 1] call CFUNC(setPlayerVar);
          }]
        ]
        ,"arTailDmgVal"
        , ""
        , 1
      ]
      ,[
        "RscCheckbox"
        , " >>>> Randomise Damage to Tail Rotor"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arTailDmgRand",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arTailDmgRand"
        , ""
        , false
      ]
      ,[
        "RscCheckbox"
        , "Enable Damage to Engine"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arEngDmg",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arEngDmg"
        , "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa"
        , true
      ]
      ,[
        "RscXSliderH"
        , " >>>> How much Damage to be effected to the Engine"
        , [
          ["SliderPosChanged",{
            [[] call CFUNC(aceUnitSwitch),"arEngDmgVal",_this select 1] call CFUNC(setPlayerVar);
          }]
        ]
        ,"arEngDmgVal"
        , ""
        , 1
      ]
      ,[
        "RscCheckbox"
        , " >>>> Randomise Damage to Engine"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arEngDmgRand",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arEngDmgRand"
        , ""
        , false
      ]
      ,[
        "RscCheckbox"
        , "Randomise Damage Location"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arLocDmgRand",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arLocDmgRand"
        , "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa"
        , false
      ]
      ,[
        "RscEdit"
        , "Height at which autorotation timer will trigger"
        , [
          ["KillFocus", {
            private _ctrl = _this select 0;
            private _newValue = parseNumber ctrlText _ctrl;
            [[] call CFUNC(aceUnitSwitch),"arTrigHeight",_newValue] call CFUNC(setPlayerVar);
          }]
        ]
        , "arTrigHeight"
        , "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa"
        , 50
      ]
      ,[
        "RscEdit"
        , "Time after triggering that the damage will be applied"
        , [
          ["KillFocus", {
            private _ctrl = _this select 0;
            private _newValue = parseNumber ctrlText _ctrl;
            [[] call CFUNC(aceUnitSwitch),"arTrigTime",_newValue] call CFUNC(setPlayerVar);
          }]
        ]
        , "arTrigTime"
        , "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa"
        , 60
      ]
      ,[
        "RscCheckbox"
        , " >>>> Randomise Timer"
        , [
          ["CheckedChanged", {
            private _value = if (_this select 1 == 0) then {false} else {true};
            [[] call CFUNC(aceUnitSwitch),"arTrigTimeRand",_value] call CFUNC(setPlayerVar);
          }]
        ]
        , "arTrigTimeRand"
        , ""
        , false
      ]
    ];
  };
  default {};
};
/*
Each Array will have the following in it.
[
  _type - Button, Checkbox, Slider, or Edit
  , _text - Text associated with the setting
  , [_eventhandlers] -  all eventhandlers that are to be added to the control. In the form ["eventhandlerType",{script}]
  , _key
  , _icon
  , _defaultValue
]
*/

{
  _x params ["_type","_text","_eventhandlers","_key","_icon","_defaultValue"];
  ctAddRow _ctrl params ["_ind", "_row"];
  _row params ["_ctrlBackground", "_ctrlColumn1", "_ctrlColumn2", "_ctrlColumn3","_ctrlColumn4","_ctrlColumn5","_ctrlColumn6"];
  {
    _x ctrlShow false;
  } ForEach [ _ctrlColumn3,_ctrlColumn4,_ctrlColumn5,_ctrlColumn6];
  private _rowCtrl = nil;
  private _value = nil;
  switch (_type) do {
    case "RscButton": {
      _rowCtrl = _ctrlColumn3;
    };
    case "RscCheckbox": {
      _rowCtrl = _ctrlColumn4;
      private _value = _map getOrDefault [_key,_defaultValue];
      _rowCtrl cbSetChecked _value;
    };
    case "RscXSliderH": {
      _rowCtrl = _ctrlColumn5;
      private _value = _map getOrDefault [_key,_defaultValue];
      _rowCtrl sliderSetRange [0,1];
      _rowCtrl sliderSetPosition _value;
      _rowCtrl sliderSetSpeed [0.1,0.1];
    };
    case "RscEdit": {
      _rowCtrl = _ctrlColumn6;
      private _value = _map getOrDefault [_key,_defaultValue];
      _rowCtrl ctrlSetText str _value;
    };
  };
  private _value = _map getOrDefault [_key,false];
  if ((_value isEqualTo false) && _soloTask) then {
    [_unit,_key,_defaultValue] call CFUNC(setPlayerVar);
    _value = _defaultValue;
  };
  _rowCtrl ctrlShow true;
  if !(_soloTask) then {
    _rowCtrl ctrlEnable false;
  };
  _ctrlBackground ctrlSetBackgroundColor [0.5,0.5,0.5,1];
  _ctrlColumn1 ctrlSetText _icon;
  _ctrlColumn2 ctrlSetText _text;
  {
    _rowCtrl ctrlAddEventHandler _x;
  } ForEach _eventhandlers;
}forEach _ctrlsArray;