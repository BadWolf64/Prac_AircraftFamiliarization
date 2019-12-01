class cfgFunctions{
	class bad {
		class core{
			file = "bad\core\functions";
//			class createFlight{postInit = 1;};
			class fullHeal{postInit = 1;};
			class repairVic{postInit = 1;};
			class setupAO{postInit = 1;};
//			class teleport{postInit = 1;};
			class rearm{postInit = 1;};
			class ssOff{postInit = 1;};
			class playerPracticeStatus{postInit = 1;};
		};
		class autoRotation{
			file = "bad\autoRotation\functions";
			class autorotation{postInit = 1;};
		};
//		class missionCreation{
//			file = "bad\missionCreation\functions";
//			class template{postInit = 1;};
//		};
//		class slingLoading{
//			file = "bad\slingLoading\functions";
//			class template{postInit = 1;};
//		};
		class takeOffAndLanding{
			file = "bad\takeOffAndLanding\functions";
			class takeoffLanding{postInit = 1;};
		};
		class mainMenu{
			file = "bad\mainMenu\functions";
			class mainMenu{postInit = 1;};
			class guiComponents{postInit = 1;};
			class spawnMenu{postInit = 1;};
		};
	};
};