 #include "script_component.hpp"

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

		_ctrlCreate ctrlCommit 0;

		_yCoord = _yCoord + _ctrlHeight + 0.01;

	} forEach _array;

};

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

		[_ctrlType,_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(ctrlSwitch);

		_ctrlCreate ctrlCommit 0;

		_xCoord = _xCoord + _ctrlWidth + 0.01;

	} forEach _array;

};

FUNC(ctrlSwitch) = {
	params["_ctrlType","_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];

	switch _ctrlType do {
		case "RscButton": {
			[_ctrlCreate,_ctrltext,_ctrlfunction] call FUNC(BadButton);
		};
		case "RscText": {
			[_ctrlCreate,_ctrltext,_ctrlfunction] call FUNC(BadText);
		};
		case "RscStructuredText": {
			[_ctrlCreate,_ctrltext,_ctrlfunction] call FUNC(BadTextStructured);
		};
		case "RscListBox": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadListbox);
		};
		case "RscPictureKeepAspect": {
			[_ctrlCreate,_ctrltext,_ctrlfunction] call FUNC(BadPicture);
		};
		case "RscCombo": {
			[_ctrlCreate,_ctrltext,_ctrlfunction] call FUNC(BadCombo);
		};
		case "RscEdit": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadEdit);
		};
		case "RscCheckBox": {
			[_ctrlCreate,_ctrltext,_ctrlfunction,_idc] call FUNC(BadCheckBox);
		};
	};
};


FUNC(BadButton) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction"];

	_ctrlCreate ctrlSetText _ctrltext;
	_ctrlCreate buttonSetAction _ctrlfunction;
};

FUNC(BadText) = {
	params["_ctrlCreate","_ctrltext"];

	_ctrlCreate ctrlSetText _ctrltext;
};

FUNC(BadTextStructured) = {
	params["_ctrlCreate","_ctrltext"];

	_ctrlCreate ctrlSetStructuredText parseText _ctrltext;
	_ctrlCreate ctrlSetBackgroundColor [1, 0, 0, 0.5];
};

FUNC(BadListbox) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

FUNC(BadPicture) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction"];
};

FUNC(BadCombo) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction"];

	lbCLear _ctrlCreate;
	{
		_ctrlCreate lbAdd _x;
	} forEach _ctrltext;
};

FUNC(BadEdit) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};

FUNC(BadCheckBox) = {
	params["_ctrlCreate","_ctrltext","_ctrlfunction","_idc"];
};