_index = lbCurSel 10020;
_classVeh = lbData [10020, _index];
_cbo = ((findDisplay 998) displayCtrl (10010));
_vehPic = (getText(configFile >> "cfgVehicles" >> _classVeh>> "editorPreview"));
_cbo ctrlSetText format ["%1",_vehPic];
_modPack = (getText(configFile >> "cfgVehicles" >> _classVeh>> "author"));
_crewCap = [_classVeh, true]call BIS_fnc_crewCount;
_slignLoadCap = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "slingLoadMaxCargoMass"));
_fastRope = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "ace_fastroping_enabled"));
_maxSpeed = (getNumber(configFile >> "cfgVehicles" >> _classVeh>> "maxSpeed"));

_fastRopeEnabled = if(_fastRope > 0) then {"true"} else {"false"};

_textCbo = ((findDisplay 998) displayCtrl (10015));
_textCbo ctrlSetStructuredText parseText format 
	["<t align='left'> VEHICLE INFORMATION<br/><br/>
	<t align='left'>Mod Pack:</t> <t align='right'>%1</t><br/>
	<t align='left'>Crew Capcity:</t> <t align='right'>%2</t><br/>
	<t align='left'>Sling Load Lift Limit:</t> <t align='right'>%3</t><br/>
	<t align='left'>Fast Rope Enabled:</t> <t align='right'>%4</t><br/>
	<t align='left'>Max Speed:</t> <t align='right'>%5</t>",_modPack,_crewCap,_slignLoadCap,_fastRopeEnabled,_maxSpeed];