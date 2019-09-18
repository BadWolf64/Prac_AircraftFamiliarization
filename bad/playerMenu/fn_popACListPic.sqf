_index = lbCurSel 10020;
_classVeh = lbData [10020, _index];
_cbo = ((findDisplay 998) displayCtrl (10010));
_vehPic = (getText(configFile >> "cfgVehicles" >> _classVeh>> "editorPreview"));
_cbo ctrlSetText format ["%1",_vehPic];