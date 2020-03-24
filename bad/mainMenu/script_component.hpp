#include "..\core\script_bad.hpp"
#define COMPONENT MAINMENU
#ifdef DEBUG_ENABLED_MAINMENU
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_MODE_FULL
    #define UITOOLTIP(CTRLCREATE,IDC) CTRLCREATE ctrlSetTooltip IDC
#else
    #define UITOOLTIP(CTRLCREATE,IDC)
#endif
#include "..\core\script_macros.hpp"