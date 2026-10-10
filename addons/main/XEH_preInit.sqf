#include "script_mod.hpp"

private _category = 'No GPS Minimap VERSION';

[
    "NGM_hideGpsOnLandVehicles",
    "CHECKBOX",
    ["Hide GPS on Land Vehicles","Hide built-in GPS when you are on land vehicles"],
    _category,
    true
] call CBA_fnc_addSetting;


[
    "NGM_hideGpsOnAirVehicles",
    "CHECKBOX",
    ["Hide GPS on Air Vehicles","Hide built-in GPS when you are on helicopters or planes"],
    _category,
    false
] call CBA_fnc_addSetting;


[
    "NGM_hideGpsOnShipVehicles",
    "CHECKBOX",
    ["Hide GPS on Ship Vehicles","Hide built-in GPS when you are on boats"],
    _category,
    true
] call CBA_fnc_addSetting;


[
    "NGM_hideGpsForUAV",
    "CHECKBOX",
    ["Hide GPS when controlling UAV","Hide GPS minimap when remote controlling an UAV"],
    _category,
    false
] call CBA_fnc_addSetting;

// After loading a mission, the event handlers are lost so I need to add them again
addMissionEventHandler ["Loaded", {
    params ["_saveType"];
    waitUntil {!isNull (uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull])};
    _display = uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull];
    [_display] call NGM_fnc_gpsEH;
    _display = uiNamespace getVariable ["RscCustomInfoAirborneMiniMap", displayNull];
    [_display] call NGM_fnc_gpsEH;
}];