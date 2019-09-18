createDialog "autoRotMenu";

waitUntil { !isNull findDisplay 997};

player addEventHandler ["GetInMan",{

if ((_this select 1) != ("driver")) then {
	
	player addAction ["Autorotation Menu", {createDialog "autoRotMenu"}];
};
}
];

player addEventHandler ["GetOutMan",{
	
	player removeAction 0;
}

];