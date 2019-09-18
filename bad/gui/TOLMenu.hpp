#define LINESPACING 1

#include "CustomControlClasses.hpp"
//Menu for TOL Practice.
class TOLMenu
{
	idd = 995;
	movingEnable = false;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.36375;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.2725;
			h = safeZoneH * 0.33444445;
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
		class _EIatLZ : MenuItem 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.37375;
			y = safeZoneY + safeZoneH * 0.32111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Enable Enemy Forces";
			onButtonClick = "if (player getVariable 'opposition') then {player setVariable ['opposition', false];} else {player setVariable ['opposition', true];}";
			onMouseButtonClick = "[] call bad_fnc_TOLMenu";
			
		};
		class _enableTP : MenuItem 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.37375;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Teleport to AO?";
			onButtonClick = "if (player getVariable 'TP') then {player setVariable ['TP', false];} else {player setVariable ['TP', true];}";
			onMouseButtonClick = "[] call bad_fnc_TOLMenu";
			
		};
		class _openLZ : MenuItem 
		{
			type = 1;
			idc = 12;
			x = safeZoneX + safeZoneW * 0.37375;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Open LZ";
			onButtonClick = player setVariable ["typeLZ","OLZ"];
			onMouseButtonClick = "[] call bad_fnc_TOLMenu";
			
		};
		class _tightLZ : MenuItem 
		{
			type = 1;
			idc = 13;
			x = safeZoneX + safeZoneW * 0.37375;
			y = safeZoneY + safeZoneH * 0.50111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Tight LZ";
			onButtonClick = player setVariable ["typeLZ","TLZ"];
			onMouseButtonClick = "[] call bad_fnc_TOLMenu";
			
		};
		class _enableDisable_Prac : MenuItem 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.37375;
			y = safeZoneY + safeZoneH * 0.56111112;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05;
			text = "Enable/Disable";
			onButtonClick = [] call bad_fnc_TOL;
			onMouseButtonClick = "[] call bad_fnc_TOLMenu";
			
		};
		class Control168012587 : MenuItem 
		{
			type = 13;
			idc = 20;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.32666667;
			w = safeZoneW * 0.1075;
			h = safeZoneH * 0.28111112;
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
