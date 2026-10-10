#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = CSTRING(component);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "CBA_main" };
		author = "snakebyte";
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};

#define BASE_PATH_FN MAINPREFIX\PREFIX\addons\COMPONENT\functions


class CfgFunctions {
    class PREFIX {
        
        class misc {
            file = QUOTE(BASE_PATH_FN\misc);
            class debug {};
            
        };
        
        class main {
            file = QUOTE(BASE_PATH_FN);
            class gpsEH {};   
        };
    };
};

class Extended_PreInit_EventHandlers {
    class NGM_pre_init {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};


class Extended_DisplayLoad_EventHandlers {
    class RscCustomInfoMiniMap {
       NGM_gpsEH = "_this call NGM_fnc_gpsEH";
    };
    class RscCustomInfoAirborneMiniMap {
       NGM_gpsAirEH = "_this call NGM_fnc_gpsEH";
    };
};

