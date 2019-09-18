_enabled = player getVariable "TOLSwitch";
_teleport = player getVariable "TP";
_opposition = player getVariable "opposition";
_typeLZ = player getVariable "typeLZ";

_textCbo = ((findDisplay 995) displayCtrl (20));

_separator = parseText "-------------------------------------";
_textCbo ctrlSetStructuredText parseText format 
	["<t align='left'>Practice Enabled:</t> <t align='right'>%1</t>
	<t align='left'>%5</t><br/>
	<t align='left'>EI in AO:</t> <t align='right'>%2</t>
	<t align='left'>%5</t><br/>
	<t align='left'>Teleport to AO:</t> <t align='right'>%3</t>
	<t align='left'>%5</t><br/>
	<t align='left'>Typle of LZ:</t> <t align='right'>%4</t>
	<t align='left'>%5</t><br/>",_enabled,_opposition,_teleport,_typeLZ, _separator];