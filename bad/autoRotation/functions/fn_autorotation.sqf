#include "script_component.hpp"
["bad_applyDamage", {
    params ["_veh","_damageEng","_damageTRot"];
		_veh setHitPointDamage ["HitEngine",_damageEng];
		_veh setHitPointDamage ["HitVRotor",_damageTRot];
}] call CBA_fnc_addEventHandler;
GVAR(damageValues) = [1,0,50,30,0,0];
/* 
FUNCTION : soloActive - [] call bad_autorotation_fnc_soloActive;
DESCRIPTION : Activates solo training for autorotation practice. 
			Called by bad_mainmenu_fnc_contextualOk when on the Autorotation menu. 
INPUTS : NA
OUTPUTS :	Calls eventhandler that is activated by the player getting into the pilot seat of a helicopter.
			The eventhandler calls bad_mainmenu_fnc_solo when it is triggered. 
 */
FUNC(soloActive) = {
	TRACE_1("Solo activated for",player);
	private _practiceEnabled =[3,name player] call EFUNC(core,practiceStatus);
	if (_practiceEnabled == 0) then
	{
		player removeEventHandler ["GetInMan",0];
	} else {
	hint "Get in a Heli to start";
		player removeEventHandler ["GetInMan",0];
		player addEventHandler ["GetInMan",{if ((_this select 1) == ("driver")) then {[] call FUNC(solo);};}];
	};	
};
/* 
FUNCTION : solo - [] call bad_mainmenu_fnc_solo;
DESCRIPTION : Starts by making sure that the vic entered is fully repaired and that the player is healed. 
			Instructs the player to get above the desired hight and wait the time required to execute the damage to the vic. 
			Once damage has been applied the function has finished and will only the work again after the players has got out of the 
			vic at which point the event handler will take over. 
INPUTS : GVAR(damageValues)
OUTPUTS : 	Damage to vic using : FUNC(execDamageToVic)
			Repair AC with EFUNC(core,repair)
			Heal PLayer using EFUNC(fullHeal)
 */
FUNC(solo) = {
	TRACE_1("Solo autorotation started for",player);
	private _damageEng = GVAR(damageValues) select 0;
	private _damageTRot = GVAR(damageValues) select 1;
	private _soloHeightTriggerValue = GVAR(damageValues) select 2;
	private _soloTimeTriggerValue = GVAR(damageValues) select 3;
	[] call EFUNC(core,repair);
	[] call EFUNC(core,fullHeal);
	hint format ["Get above %1m",_soloHeightTriggerValue];
	TRACE_1("Height required is ",_soloHeightTriggerValue);
	[_damageEng,_damageTRot,_soloTimeTriggerValue] spawn {
		params ["_damageEng","_damageTRot","_soloTimeTriggerValue"];
		private _soloHeightTriggerValue = GVAR(damageValues) select 2;
		private _soloTimeTriggerCB = GVAR(damageValues) select 4;
		if (_soloTimeTriggerCB == 1) then {
			_soloTimeTriggerValue = random [_soloTimeTriggerValue-_soloTimeTriggerValue,_soloTimeTriggerValue,_soloTimeTriggerValue+30];
		};
		TRACE_1("Time until Trigger is ",_soloTimeTriggerValue);
		waitUntil{
		private _alt = getPosATL vehicle player select 2;
		(_alt > _soloHeightTriggerValue)
		};
		hint "AUTOROTATE ARMED";
		sleep _soloTimeTriggerValue;
		[_damageEng,_damageTRot] call FUNC(execDamageToVic);
	};
};
/* 
FUNCTION : execDamageToVic : ['damage to Engine','damage to tail rotor'] call bad_autorotation_fnc_execDamageToVic
DESCRIPTION : This executes that damage pass through to the function on the engine and the tail rotor of the helicopter in question. 
INPUTS : _damageEng - damage value to be set on Engine [DOUBLE 0-1]
	_damageTRot - damage value to be set on Tail Rotor [DOUBLE 0-1]
OUTPUTS : Damage to the Helicopter object. 
 */
FUNC(execDamageToVic) = {
	params["_damageEng","_damageTRot"];
	private _practiceEnabled =[0,name player] call EFUNC(core,practiceStatus);
	private _playerVic = vehicle player;
	if (_playerVic != player && _practiceEnabled == 1) then {
		private _veh = vehicle player;
		["bad_applyDamage", [_veh,_damageEng,_damageTRot], vehicle player] call CBA_fnc_targetEvent;
	} else {
		hint "You must be in a Helicopter with autrotation ENABLED to apply damage.";
	}
};