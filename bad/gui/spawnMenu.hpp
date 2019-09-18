#define LINESPACING 1

//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hpp"
//Menu for spawning aircraft into Mission.
class spawnMenu
{
	idd = 998;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 0;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.25};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Info : MenuItem 
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.54270834;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.153125;
			h = safeZoneH * 0.17685186;
			text = "Place Holder Text for now. ";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class Title : MenuItem 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.23888889;
			w = safeZoneW * 0.228125;
			h = safeZoneH * 0.03611112;
			text = "~Helicopter Spawn Menu";
			
		};
		
	};
	class Controls
	{
		class AircraftList : MenuItem 
		{
			type = 5;
			idc = 10020;
			x = safeZoneX + safeZoneW * 0.29895834;
			y = safeZoneY + safeZoneH * 0.28888889;
			w = safeZoneW * 0.23333334;
			h = safeZoneH * 0.4675926;
			style = 16;
			colorSelect[] = {1,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBSelChanged = "[] call bad_fnc_popACListPic";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class Spawn : MenuItem 
		{
			type = 1;
			idc = 10005;
			x = safeZoneX + safeZoneW * 0.54114584;
			y = safeZoneY + safeZoneH * 0.71574075;
			w = safeZoneW * 0.15520834;
			h = safeZoneH * 0.03148149;
			text = "Spawn";
			onButtonClick = [] call bad_fnc_spawnAC;
			
		};
		class img : MenuItem 
		{
			type = 0;
			idc = 10010;
			x = safeZoneX + safeZoneW * 0.54114584;
			y = safeZoneY + safeZoneH * 0.44537038;
			w = safeZoneW * 0.15520834;
			h = safeZoneH * 0.24444445;
			style = 48;
			text = "";
			
		};
		
	};
	
};
