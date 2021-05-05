#include "script_macros.hpp"

#undef COMPONENT
#define COMPONENT CORE
PREP(fullHeal);
PREP(checkMod);
PREP(createPlayerVarHashmap);
PREP(setPlayerVar);
PREP(getPlayerName);
PREP(checkActivePractice);
PREP(aceUnitSwitch);

#undef COMPONENT
#define COMPONENT GUI
#undef CUSTOM_FOLDER
#define CUSTOM_FOLDER GUI
PREP(openGUI);
PREP(controlTable);
PREP(flightLeadList);

