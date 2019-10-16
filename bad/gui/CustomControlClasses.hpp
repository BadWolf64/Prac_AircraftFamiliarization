#ifndef HG_CustomControlClasseshpp
#define HG_CustomControlClasseshpp 1
//Create a header guard to prevent duplicate include.

class background_default
{
	style = 80;
	colorBackground[] = {0.098,0.098,0.098,0.5};
	colorText[] = {1,1,1,1};
	font = "EtelkaMonospacePro";
	
};
class button_default
{
	style = 2;
	colorBackground[] = {0.2431,0.2431,0.2431,1};
	colorBackgroundActive[] = {1,0.3647,0,1};
	colorBackgroundDisabled[] = {0.5098,0.5098,0.5098,1};
	colorFocused[] = {1,0.3647,0,1};
	colorText[] = {1,1,1,1};
	font = "EtelkaMonospacePro";
	
};
class menu_tabs
{
	style = 0+192;
	color[] = HIGHLIGHT;
	color2[] = LIGHT_GREY;
	colorBackground[] = {0,0,0,1};
	colorBackground2[] = DARK_GREY;
	colorBackgroundFocused[] = HIGHLIGHT;
	colorDisabled[] = {0.6,0,0,1};
	colorFocused[] = TEXT;
	font = "EtelkaMonospacePro";
	blinkingPeriod = 0;
	periodFocus = 2;
	periodOver = 2;
	class HitZone
	{
		
	};
	class ShortcutPos
	{
		
	};
	class TextPos
	{
		
	};
	
};
class combo_default
{
	style = 16;
	colorBackground[] = BACKGROUND;
	colorSelect[] = HIGHLIGHT;
	colorSelectBackground[] = LIGHT_GREY;
	colorText[] = TEXT;
	font = "EtelkaMonospacePro";
	class ComboScrollBar
	{
		
	};
	
};
#endif
