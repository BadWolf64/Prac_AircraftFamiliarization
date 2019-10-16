#include "MainMenu_Macros.hpp"

#include "CustomControlClasses.hpp"
class MainMenu
{
	idd = 6969;
	
	class ControlsBackground
	{
		class background : background_default 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.2375;
			y = safeZoneY + safeZoneH * 0.12777778;
			w = safeZoneW * 0.52447917;
			h = safeZoneH * 0.72222223;
			style = 0;
			text = "";
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class controlPanel_right : background_default 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.621875;
			y = safeZoneY + safeZoneH * 0.20555556;
			w = safeZoneW * 0.13541667;
			h = safeZoneH * 0.57407408;
			style = 0;
			text = "";
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class controlPanel_left : background_default 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24427084;
			y = safeZoneY + safeZoneH * 0.1962963;
			w = safeZoneW * 0.36770834;
			h = safeZoneH * 0.63981482;
			style = 0;
			text = "";
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class Main : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24427084;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.04635417;
			h = safeZoneH * 0.05;
			text = "Main Menu";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Main_Spawn : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.04635417;
			h = safeZoneH * 0.05;
			text = "Spawn Vehicle";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Main_AutoRotation : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34322917;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.04635417;
			h = safeZoneH * 0.05;
			text = "Auto- Rotation";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Main_TakeOffLanding : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39270834;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.04635417;
			h = safeZoneH * 0.05;
			text = "Takeoff Landing";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Main_SlingLoading : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.4421875;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.04635417;
			h = safeZoneH * 0.05;
			text = "Sling Loading";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Main_Instructor : menu_tabs 
		{
			type = 16;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.69947917;
			y = safeZoneY + safeZoneH * 0.14166667;
			w = safeZoneW * 0.05625;
			h = safeZoneH * 0.05;
			text = "Instructor";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Cancel : button_default 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.690625;
			y = safeZoneY + safeZoneH * 0.79074075;
			w = safeZoneW * 0.065625;
			h = safeZoneH * 0.05;
			text = "Close";
			borderSize = 0;
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onMouseButtonClick = "closeDialog";
			
		};
		class Okay : button_default 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.61927084;
			y = safeZoneY + safeZoneH * 0.79074075;
			w = safeZoneW * 0.065625;
			h = safeZoneH * 0.05;
			text = "Okay";
			borderSize = 0;
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		class ModSelect : combo_default 
		{
			type = 4;
			idc = MOD_SELECT;
			x = safeZoneX + safeZoneW * 0.2640625;
			y = safeZoneY + safeZoneH * 0.23425926;
			w = safeZoneW * 0.33333334;
			h = safeZoneH * 0.02685186;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class vicList : combo_default 
		{
			type = 5;
			idc = VEHICLE_LIST;
			x = safeZoneX + safeZoneW * 0.2640625;
			y = safeZoneY + safeZoneH * 0.28981482;
			w = safeZoneW * 0.33333334;
			h = safeZoneH * 0.46018519;
			style = 16;
			colorDisabled[] = {0.2,0.2,0.2,1};
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			class ComboScrollBar
			{
				
			};
			
		};
		class Info : background_default 
		{
			type = 13;
			idc = VEHICLE_INFO;
			x = safeZoneX + safeZoneW * 0.63020834;
			y = safeZoneY + safeZoneH * 0.3962963;
			w = safeZoneW * 0.1203125;
			h = safeZoneH * 0.37407408;
			style = 0+2;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			class Attributes
			{
				
			};
			
		};
		class Vehicle_Image : background_default 
		{
			type = 0;
			idc = VEHICLE_IMAGE;
			x = safeZoneX + safeZoneW * 0.63072917;
			y = safeZoneY + safeZoneH * 0.225;
			w = safeZoneW * 0.11979167;
			h = safeZoneH * 0.16111112;
			style = 0+144;
			text = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Spawn_Location : combo_default 
		{
			type = 4;
			idc = SPAWN_LOCATION;
			x = safeZoneX + safeZoneW * 0.3828125;
			y = safeZoneY + safeZoneH * 0.78055556;
			w = safeZoneW * 0.21458334;
			h = safeZoneH * 0.03148149;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class Text_SpawnPosition : background_default 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.2640625;
			y = safeZoneY + safeZoneH * 0.78055556;
			w = safeZoneW * 0.10572917;
			h = safeZoneH * 0.03148149;
			style = 0;
			text = "Select Spawn Location:";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
