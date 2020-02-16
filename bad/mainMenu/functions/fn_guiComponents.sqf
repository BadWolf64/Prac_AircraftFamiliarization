 #include "script_component.hpp"

 /* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(Verticle) = {
	
	params["_menu","_array","_xStartPos","_yStartPos","_index"];
	
	private _display = findDisplay 9999;
	private _yCoord = _yStartPos;

	{
		_yCoord;
		_ctrlName = _x select 0;
		_ctrlType = _x select 1;
		_ctrlWidth = _x select 2;
		_ctrlHeight = _x select 3;
		_ctrltext = _x select 4;
		_ctrlfunction = _x select 5;
		_idc = _forEachIndex + (10 * _index) + 1000;
		_xCoord = _xStartPos;
		
		_ctrlCreate = _display ctrlCreate [_ctrlType,_idc];

		_ctrlCreate ctrlSetPosition [_xCoord,_yCoord,_ctrlWidth,_ctrlHeight];

		[_ctrlType,_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(ctrlSwitch);
		
		_ctrlPosition = ctrlPosition _ctrlCreate;

		_stridc = str _idc + " at Position " + str _ctrlPosition;

		UITOOLTIP(_ctrlCreate,_stridc);

		_ctrlCreate ctrlCommit 0;

		_yCoord = _yCoord + _ctrlHeight + 0.01;

	} forEach _array;

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(Horizontal) = {

	params["_menu","_array","_xStartPos","_yStartPos","_index"];
	
	private _display = findDisplay 9999;
	private _xCoord = _xStartPos;

		{
		_xCoord;
		_ctrlName = _x select 0;
		_ctrlType = _x select 1;
		_ctrlWidth = _x select 2;
		_ctrlHeight = _x select 3;
		_ctrltext = _x select 4;
		_ctrlfunction = _x select 5;
		_idc = _forEachIndex + (10 * _index) + 1000;
		_yCoord = _yStartPos;
		
		_ctrlCreate = _display ctrlCreate [_ctrlType,_idc];

		_ctrlCreate ctrlSetPosition [_xCoord,_yCoord,_ctrlWidth,_ctrlHeight];

		_ctrlPosition = ctrlPosition _ctrlCreate;

		[_ctrlType,_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(ctrlSwitch);

		_stridc = str _idc + " at Position " + str _ctrlPosition;

		UITOOLTIP(_ctrlCreate,_stridc);

		_ctrlCreate ctrlCommit 0;

		_xCoord = _xCoord + _ctrlWidth + 0.01;

	} forEach _array;

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(ctrlSwitch) = {
	params["_ctrlType","_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	switch _ctrlType do {
		case "RscButton": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadButton);
		};
		case "RscText": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadText);
		};
		case "RscStructuredText": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadTextStructured);
		};
		case "RscListBox": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadListbox);
		};
		case "RscPictureKeepAspect": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadPicture);
		};
		case "RscCombo": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadCombo);
		};
		case "RscEdit": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadEdit);
		};
		case "RscCheckBox": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadCheckBox);
		};
		case "RscSlider": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadCheckBox);
		};
		case "RscFrame": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadFrame);
		};
		case "RscXListBox": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadXListBox);
		};
	};
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadButton) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	_ctrlCreate ctrlSetText _ctrltext;
	_ctrlCreate buttonSetAction _ctrlfunction;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadText) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	_ctrlCreate ctrlSetText _ctrltext;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadTextStructured) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	_ctrlCreate ctrlSetStructuredText parseText _ctrltext;
	_ctrlCreate ctrlSetBackgroundColor [1, 1, 1, 0.25];
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadListbox) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadPicture) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadCombo) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	lbCLear _ctrlCreate;
	{
		_ctrlCreate lbAdd _x;
	} forEach _ctrltext;
	_ctrlCreate lbSetCurSel 0;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadEdit) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
	_ctrlCreate ctrlSetText _ctrltext;
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadCheckBox) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadSlider) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadFrame) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

/* 

FUNCTION : 

DESCRIPTION : 

INPUTS :

OUTPUTS : 

 */

FUNC(BadXListBox) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	lbCLear _ctrlCreate;
	{
		_ctrlCreate lbAdd _x;
	} forEach _ctrltext;
	_ctrlCreate lbSetCurSel 0;
};
