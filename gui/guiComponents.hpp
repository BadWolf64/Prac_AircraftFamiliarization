#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineCommon.inc"

#define GUI_GRID_CTRLGROUP_X	(0)
#define GUI_GRID_CTRLGROUP_Y	(0)
#define GUI_GRID_CTRLGROUP_W	((((safezoneW / safezoneH) min 1.2) / 40))
#define GUI_GRID_CTRLGROUP_H	(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))
#define GUI_GRID_CTRLGROUP_WAbs	(safeZoneW)
#define GUI_GRID_CTRLGROUP_HAbs	(safeZoneH)

#define CT_CONTROLS_TABLE 19

import RscText;
import RscCombo;
import RscCheckbox;
import RscControlsGroup;
import RscStructuredText;
import RscPictureKeepAspect;
import RscButtonMenu;
import RscDisplayEmpty;
import RscFrame;
import RscPicture;
import RscControlsTable;
import RscXSliderH;

class GVAR(mapSettingsButton) : RscButtonMenu {
	x = 0.0088372 * safezoneW + safezoneX;
	y = 0.192 * safezoneH + safezoneY;
	w = 0.0537209 * safezoneW;
	h = 0.033 * safezoneH;
  text = "Settings";
  action = QUOTE([0] call FUNC(openGui););
};
class GVAR(mapSpawnButton) : GVAR(mapSettingsButton) {
	y = 0.23 * safezoneH + safezoneY;
  text = "Spawn Vic";
  action = QUOTE(hint 'Spawn Menu';);
};
class GVAR(structuredText): RscStructuredText {
  colorBackground[] = IGUI_BCG_COLOR;
};

// Main Settings Control Group

class GVAR(settings_gui): RscControlsGroup {
  deletable = 1;
  x = 1 * GUI_GRID_W + GUI_GRID_X;
  y = -1 * GUI_GRID_H + GUI_GRID_Y;
  w = 40 * GUI_GRID_W;
  h = 25 * GUI_GRID_H;
  class VScrollbar: ScrollBar
	{
		color[] = {1,1,1,1};
		width = 0.021;
		autoScrollEnabled = 1;
	};
	class HScrollbar: ScrollBar
	{
		color[] = {1,1,1,1};
		height = 0.028;
	};
	class Controls {
		//Controls
    class GVAR(settingsBackground): RscText {
      idc = -1;
	x = 0 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 0 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 40 * GUI_GRID_CTRLGROUP_W;
	h = 25 * GUI_GRID_CTRLGROUP_H;
      text = "";
      colorBackground[] = {IGUI_BCG_RGB,0.75};
    };
    class GVAR(SettingHeader): GVAR(structuredText) {
      idc = TASK_DESC_IDC;
	x = 0.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 0.5 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 32 * GUI_GRID_CTRLGROUP_W;
	h = 4.5 * GUI_GRID_CTRLGROUP_H;
      style = ST_VCENTER;
      text = QUOTE(This will be filled with interesting and useful information eventually.);
    };
    class GVAR(bwLogo): RscPictureKeepAspect {
      idc = -1;
      text = "logo.paa";
	x = 33 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 0.5 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 6 * GUI_GRID_CTRLGROUP_W;
	h = 4.5 * GUI_GRID_CTRLGROUP_H;
    };
    class GVAR(flightLeadText): RscText {
      idc = -1;
	x = 0.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 5.4 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 27.6 * GUI_GRID_CTRLGROUP_W;
	h = 1.2 * GUI_GRID_CTRLGROUP_H;
      text = QUOTE(Flight Lead);
      colorBackground[] = IGUI_BCG_COLOR;
    };
    class GVAR(flightLeadSelect): RscCombo {
      idc = FLIGHT_LEAD_IDC;
	x = 28.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 5.4 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 11 * GUI_GRID_CTRLGROUP_W;
	h = 1.2 * GUI_GRID_CTRLGROUP_H;
      onLoad = QUOTE(_this spawn FUNC(flightLeadList));
      onLBSelChanged = ; // Save the changed value and refresh the settings based on the new selection.
    };
    class GVAR(toggleVisHintsText): GVAR(flightLeadText) {
      idc = -1;
	x = 0.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 7.1 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 36 * GUI_GRID_CTRLGROUP_W;
	h = 1 * GUI_GRID_CTRLGROUP_H;
      text = QUOTE(Toggle Hints and Helpful information.);
    };
    class GVAR(toggleVisHintsCheckbox): RscCheckbox {
      idc = -1;
	x = 37.3 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 6.9 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 2 * GUI_GRID_CTRLGROUP_W;
	h = 1.2 * GUI_GRID_CTRLGROUP_H;
      checked = 1;
    };
    class GVAR(Frame): RscFrame {
      idc = -1;
	x = 0.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 8.5 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 39 * GUI_GRID_CTRLGROUP_W;
	h = 16 * GUI_GRID_CTRLGROUP_H;
    };
    class GVAR(CtrlTable) {
			idc = TASK_SETTINGS_CT_IDC;
	x = 0.5 * GUI_GRID_CTRLGROUP_W + GUI_GRID_CTRLGROUP_X;
	y = 8.5 * GUI_GRID_CTRLGROUP_H + GUI_GRID_CTRLGROUP_Y;
	w = 39 * GUI_GRID_CTRLGROUP_W;
	h = 16 * GUI_GRID_CTRLGROUP_H;

			type = CT_CONTROLS_TABLE;
			style = SL_TEXTURES;

			lineSpacing = 0.1 * GUI_GRID_H;
			rowHeight = 1.2 * GUI_GRID_H;
			headerHeight = 1.2 * GUI_GRID_H;

			firstIDC = 42000;
			lastIDC = 44999;

			// Colours which are used for animation (i.e. change of colour) of the selected line.
			selectedRowColorFrom[]  = {0.7, 0.85, 1, 0.25};
			selectedRowColorTo[]    = {0.7, 0.85, 1, 0.5};
			// Length of the animation cycle in seconds.
			selectedRowAnimLength = 1.2;

			class VScrollBar: ScrollBar {
				width = 0.021;
				autoScrollEnabled = 0;
				autoScrollDelay = 1;
				autoScrollRewind = 1;
				autoScrollSpeed = 1;
			};

			class HScrollBar: ScrollBar {
				height = 0.028;
			};

			// Template for selectable rows
			class RowTemplate {
				class RowBackground {
					controlBaseClassPath[] = {"RscText"};
					columnX = 0;
					columnW = 39 * GUI_GRID_W;
					controlOffsetY = 0;
					controlH = 1.2 * GUI_GRID_H;
				};
				class Column1 {
					controlBaseClassPath[] = {"RscPictureKeepAspect"};
					columnX = 0;
					columnW = 2 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column2 {
					controlBaseClassPath[] = {"RscText"};
					columnX = 2 * GUI_GRID_W;
					columnW = 20 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column3 {
					controlBaseClassPath[] = {"RscButton"};
					columnX = 28.5 * GUI_GRID_W;
					columnW = 10 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column4 {
					controlBaseClassPath[] = {"RscCheckbox"};
					columnX = 28.5 * GUI_GRID_W;
					columnW = 1.3 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column5 {
					controlBaseClassPath[] = {"RscXSliderH"};
					columnX = 28.5 * GUI_GRID_W;
					columnW = 10 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column6 {
					controlBaseClassPath[] = {"RscEdit"};
					columnX = 28.5 * GUI_GRID_W;
					columnW = 3 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
			};

			// Template for headers (unlike rows, cannot be selected)
			class HeaderTemplate {
				class HeaderBackground {
					controlBaseClassPath[] = {"RscText"};
					columnX = 0;
					columnW = 39 * GUI_GRID_W;
					controlOffsetY = 0;
					controlH = 1.5 * GUI_GRID_H;
				};
				class Column1 {
					controlBaseClassPath[] = {"RscPictureKeepAspect"};
					columnX = 0.2 * GUI_GRID_W;
					columnW = 1.2 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1.2 * GUI_GRID_H;
				};
				class Column2 {
					controlBaseClassPath[] = {"RscText"};
					columnX = 2.2 * GUI_GRID_W;
					columnW = 20 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1.3 * GUI_GRID_H;
				};
			};
		};
	};
};

class GVAR(spawnVic_gui) : GVAR(settings_gui) {
  x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
  y = -1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
  w = 40 * GUI_GRID_CENTER_W;
  h = 25 * GUI_GRID_CENTER_H;

  class controls {};

};



/* class GVAR(test)
{
	idd = -1;
	access = 0;
	movingEnable = true;
	onLoad = "hint str _this";
	onUnload  = "hint str _this";
	enableSimulation = false;
	class ControlsBackground
	{
		//Background controls
	};
	class Controls
	{
		//Controls
    class GVAR(settingsBackground): RscText {
      idc = -1;
      x = 0 * GUI_GRID_W + GUI_GRID_X;
      y = 0 * GUI_GRID_H + GUI_GRID_Y;
      w = 40 * GUI_GRID_W;
      h = 25 * GUI_GRID_H;
      text = "";
      colorBackground[] = {IGUI_BCG_RGB,0.75};
    };
    class GVAR(SettingHeader): GVAR(structuredText) {
      idc = TASK_DESC_IDC;
      x = 0.5 * GUI_GRID_W + GUI_GRID_X;
      y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
      w = 31.5 * GUI_GRID_W;
      h = 4.5 * GUI_GRID_H;
      style = ST_VCENTER;
      text = QUOTE(This will be filled with interesting and useful information eventually.);
    };
    class GVAR(bwLogo): RscPictureKeepAspect {
      idc = -1;
      text = "logo.paa";
      x = 33 * GUI_GRID_W + GUI_GRID_X;
      y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
      w = 6 * GUI_GRID_W;
      h = 4.5 * GUI_GRID_H;
    };
    class GVAR(flightLeadText): RscText {
      idc = -1;
      x = 0.5 * GUI_GRID_W + GUI_GRID_X;
      y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
      w = 27.6 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
      text = QUOTE(Flight Lead);
      colorBackground[] = IGUI_BCG_COLOR;
    };
    class GVAR(flightLeadSelect): RscCombo {
      idc = FLIGHT_LEAD_IDC;
      x = 29.5 * GUI_GRID_W + GUI_GRID_X;
      y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
      w = 10 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
      onLoad = QUOTE(_this spawn FUNC(flightLeadList));
      onLBSelChanged = ; // Save the changed value and refresh the settings based on the new selection.
    };
    class GVAR(toggleVisHintsText): GVAR(flightLeadText) {
      idc = -1;
      x = 0.5 * GUI_GRID_W + GUI_GRID_X;
      y = 7 * GUI_GRID_H + GUI_GRID_Y;
      w = 36 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
      text = QUOTE(Toggle Hints and Helpful information.);
    };
    class GVAR(toggleVisHintsCheckbox): RscCheckbox {
      idc = -1;
      x = 38 * GUI_GRID_W + GUI_GRID_X;
      y = 7 * GUI_GRID_H + GUI_GRID_Y;
      w = 1.5 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
      checked = 1;
    };
    class GVAR(Frame): RscFrame {
      idc = -1;
      x = 0.5 * GUI_GRID_W + GUI_GRID_X;
      y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
      w = 39 * GUI_GRID_W;
      h = 16 * GUI_GRID_H;
    };
    class GVAR(CtrlTable) {
			idc = TASK_SETTINGS_CT_IDC;
      x = 1 * GUI_GRID_W + GUI_GRID_X;
      y = 9 * GUI_GRID_H + GUI_GRID_Y;
      w = 38 * GUI_GRID_W;
      h = 15 * GUI_GRID_H;

			type = CT_CONTROLS_TABLE;
			style = SL_TEXTURES;

			lineSpacing = 0.1 * GUI_GRID_H;
			rowHeight = 1.2 * GUI_GRID_H;
			headerHeight = 1.2 * GUI_GRID_H;

			firstIDC = 42000;
			lastIDC = 44999;

			// Colours which are used for animation (i.e. change of colour) of the selected line.
			selectedRowColorFrom[]  = {0.7, 0.85, 1, 0.25};
			selectedRowColorTo[]    = {0.7, 0.85, 1, 0.5};
			// Length of the animation cycle in seconds.
			selectedRowAnimLength = 1.2;

			class VScrollBar: ScrollBar {
				width = 0.021;
				autoScrollEnabled = 0;
				autoScrollDelay = 1;
				autoScrollRewind = 1;
				autoScrollSpeed = 1;
			};

			class HScrollBar: ScrollBar {
				height = 0.028;
			};

			// Template for selectable rows
			class RowTemplate {
				class RowBackground {
					controlBaseClassPath[] = {"RscText"};
					columnX = 0;
					columnW = 37.2 * GUI_GRID_W;
					controlOffsetY = 0;
					controlH = 1.2 * GUI_GRID_H;
				};
				class Column1 {
					controlBaseClassPath[] = {"RscPictureKeepAspect"};
					columnX = 0;
					columnW = 2 * GUI_GRID_W;
					controlOffsetY = 0;
					controlH = 1 * GUI_GRID_H;
				};
				class Column2 {
					controlBaseClassPath[] = {"RscText"};
					columnX = 2 * GUI_GRID_W;
					columnW = 20 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column3 {
					controlBaseClassPath[] = {"RscButton"};
					columnX = 27 * GUI_GRID_W;
					columnW = 10 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column4 {
					controlBaseClassPath[] = {"RscCheckbox"};
					columnX = 27 * GUI_GRID_W;
					columnW = 1.3 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column5 {
					controlBaseClassPath[] = {"RscXSliderH"};
					columnX = 27 * GUI_GRID_W;
					columnW = 10 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
				class Column6 {
					controlBaseClassPath[] = {"RscEdit"};
					columnX = 27 * GUI_GRID_W;
					columnW = 3 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1 * GUI_GRID_H;
				};
			};

			// Template for headers (unlike rows, cannot be selected)
			class HeaderTemplate {
				class HeaderBackground {
					controlBaseClassPath[] = {"RscText"};
					columnX = 0;
					columnW = 37.2 * GUI_GRID_W;
					controlOffsetY = 0;
					controlH = 1.5 * GUI_GRID_H;
				};
				class Column1 {
					controlBaseClassPath[] = {"RscPictureKeepAspect"};
					columnX = 0.2 * GUI_GRID_W;
					columnW = 1.2 * GUI_GRID_W;
					controlOffsetY = 0.2 * GUI_GRID_H;
					controlH = 1.2 * GUI_GRID_H;
				};
				class Column2 {
					controlBaseClassPath[] = {"RscText"};
					columnX = 2.2 * GUI_GRID_W;
					columnW = 20 * GUI_GRID_W;
					controlOffsetY = 0.1 * GUI_GRID_H;
					controlH = 1.3 * GUI_GRID_H;
				};
			};
		};
	};
	class Objects
	{
		//Objects
	};
};
 */
