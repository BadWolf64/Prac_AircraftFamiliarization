#ifndef HG_CustomControlClasseshpp
#define HG_CustomControlClasseshpp 1
//Create a header guard to prevent duplicate include.

class MenuItem
{
	style = 192;
	borderSize = 0.01;
	colorBackground[] = {0.102,0.102,0.102,1};
	colorBackgroundActive[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,1};
	colorBorder[] = {0.6,0.6,0.6,1};
	colorDisabled[] = {0.2,0.2,0.2,1};
	colorFocused[] = {0.2,0.2,0.2,1};
	colorShadow[] = {0,0,0,0};
	colorText[] = {0.949,0.949,0.949,1};
	font = "PuristaMedium";
	offsetPressedX = 0.001;
	offsetPressedY = 0.001;
	offsetX = 0.01;
	offsetY = 0.01;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
	blinkingPeriod = 0;
	
};
class MainMenuShortcut : MenuItem 
{
	size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	color[] = {1,1,1,1};
	color2[] = {0,0,0,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	colorBackgroundFocused[] = {1,1,1,1};
	textureNoShortcut = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	periodFocus = 1.2;
	periodOver = 1.2;
	class HitZone
	{
		
	};
	class ShortcutPos
	{
		top = 0;
		left = 5.25 * (((safezoneW / safezoneH) min 1.2) / 40);
		w = 1 * (((safezoneW / safezoneH) min 1.2) / 40);
		h = 1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		
	};
	class TextPos
	{
		top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
		right = 0.005;
		bottom = 0;
		left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
		
	};
	
};
#endif
