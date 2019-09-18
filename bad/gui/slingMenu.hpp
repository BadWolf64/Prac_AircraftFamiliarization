#define LINESPACING 1

#include "CustomControlClasses.hpp"
//Menu for Sling Loading Practice.
class slingMenu
{
	idd = 994;
	movingEnable = false;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.36354167;
			y = safeZoneY + safeZoneH * 0.39814815;
			w = safeZoneW * 0.27239584;
			h = safeZoneH * 0.20925926;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.25};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = true;
			
		};
		
	};
	class Controls
	{
		class _openLZ : MenuItem 
		{
			type = 1;
			idc = 12;
			x = safeZoneX + safeZoneW * 0.37395834;
			y = safeZoneY + safeZoneH * 0.41574075;
			w = safeZoneW * 0.13229167;
			h = safeZoneH * 0.05;
			text = "Open DZ";
			onButtonClick = player setVariable ["typeLZ","OLZ"];
			onMouseButtonClick = "[] call bad_fnc_logiMenu";
			
		};
		class _tightLZ : MenuItem 
		{
			type = 1;
			idc = 13;
			x = safeZoneX + safeZoneW * 0.37395834;
			y = safeZoneY + safeZoneH * 0.47592593;
			w = safeZoneW * 0.13229167;
			h = safeZoneH * 0.05;
			text = "Tight DZ";
			onButtonClick = player setVariable ["typeLZ","TLZ"];
			onMouseButtonClick = "[] call bad_fnc_logiMenu";
			
		};
		class _enableDisable_Prac : MenuItem 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.37395834;
			y = safeZoneY + safeZoneH * 0.53611112;
			w = safeZoneW * 0.13229167;
			h = safeZoneH * 0.05;
			text = "Enable/Disable";
			onButtonClick = [] call bad_fnc_logi;
			onMouseButtonClick = "[] call bad_fnc_logiMenu";
			
		};
		class Control168012587 : MenuItem 
		{
			type = 13;
			idc = 20;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.42222223;
			w = safeZoneW * 0.10729167;
			h = safeZoneH * 0.16111112;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		
	};
	
};
