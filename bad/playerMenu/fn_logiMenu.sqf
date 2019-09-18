_enabled = player getVariable "SLSwitch";
_typeLZ = player getVariable "typeLZ";
_textCbo = ((findDisplay 994) displayCtrl (20));
_separator = parseText "-------------------------------------";
_textCbo ctrlSetStructuredText parseText format 
	["<t align='left'>Practice Enabled:</t> <t align='right'>%1</t>
	<t align='left'>%3</t><br/>
	<t align='left'>Typle of DZ:</t> <t align='right'>%2</t>
	<t align='left'>%3</t><br/>",_enabled,_typeLZ, _separator];