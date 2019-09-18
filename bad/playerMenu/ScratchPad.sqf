	trgLZ = createTrigger ["EmptyDetector", getMarkerPos "LandingZone", false];
	trgLZ setTriggerArea [10,10,0,false,5];
	trgLZ setTriggerActivation ["ANYPLAYER","PRESENT",true];
	trgLZ setTriggerStatements ["this","hint 'Congrats'","hint 'Oh just land FFS'"];
	[trgLZ] call BIS_fnc_drawAO;

if (player getVariable 'TP') then {
	player setVariable ['TP', false];
} else 
{
	player setVariable ['TP', true];
};[]


_enabled = player getVariable ["TOLSwitch"];
_teleport = player getVariable ["TP"];
_opposition = player getVariable ["opposition"];
_typeLZ = player getVariable ["typeLZ"];
_separator = parseText "-------------------------------------------------------------------------------------";
parseText format 
	["<t align='left'>Practice Enabled:</t> <t align='right'>%1</t>
	<t align='left'>%5</t><br/>
	<t align='left'>EI in AO:</t> <t align='right'>%2</t>
	<t align='left'>%5</t><br/>
	<t align='left'>Teleport to AO:</t> <t align='right'>%3</t>
	<t align='left'>%5</t><br/>
	<t align='left'>Typle of LZ:</t> <t align='right'>%4</t>
	<t align='left'>%5</t><br/>",_enabled,_opposition,_teleport,_typeLZ, _separator]

	ctrl 168012587