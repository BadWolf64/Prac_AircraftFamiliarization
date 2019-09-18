#define LINESPACING 1

#include "CustomControlClasses.hpp"
//Passenger auto rotation activation menu. 
class autoRotMenu
{
	idd = 997;
	movingEnable = true;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.79875;
			y = safeZoneY + safeZoneH * 0.56777778;
			w = safeZoneW * 0.1475;
			h = safeZoneH * 0.34444445;
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
		class _enableDisable : MenuItem 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.80875;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Enable/Disable";
			onButtonClick = "[1] call bad_fnc_autoRot";
			
		};
		class _engineOnly : MenuItem 
		{
			type = 1;
			idc = 12;
			x = safeZoneX + safeZoneW * 0.80875;
			y = safeZoneY + safeZoneH * 0.66111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Engine Only";
			onButtonClick = "[2] call bad_fnc_autoRot";
			
		};
		class _engineTR : MenuItem 
		{
			type = 1;
			idc = 13;
			x = safeZoneX + safeZoneW * 0.80875;
			y = safeZoneY + safeZoneH * 0.72111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Engine & Tail Rotor Loss";
			onButtonClick = "[3] call bad_fnc_autoRot";
			
		};
		class _repair : MenuItem 
		{
			type = 1;
			idc = 14;
			x = safeZoneX + safeZoneW * 0.80875;
			y = safeZoneY + safeZoneH * 0.78111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.12;
			text = "Repair";
			onButtonClick = "[4] call bad_fnc_autoRot";
			
		};
		
	};
	
};
