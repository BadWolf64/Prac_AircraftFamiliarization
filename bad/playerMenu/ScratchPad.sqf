

//AutoRotate Auto hide    
ctrlShow[11,false],ctrlShow[12,false],ctrlShow[13,false],ctrlShow[14,false],ctrlShow[15,false]
//AutoRotate Show         
ctrlShow[11,true],ctrlShow[12,true],ctrlShow[13,true],ctrlShow[14,true],ctrlShow[15,true],ctrlShow[111,true]


//Open HeliMenu Hide all 
createDialog "heliMenu",[]call bad_fnc_isPilot,ctrlShow[11,false],ctrlShow[12,false],ctrlShow[13,false],ctrlShow[14,false],ctrlShow[15,false],ctrlShow[112,false],ctrlShow[113,false],ctrlShow[114,false],ctrlShow[115,false],ctrlShow[116,false]

//If not Pilot - Auto Rotation Options
ctrlShow[112,true],ctrlShow[113,true],ctrlShow[114,true],ctrlShow[115,true],ctrlShow[116,true]