disableSerialization;
if (!hasInterface) exitWith {};
private _display = _this select 0;
private _miniMapControlGroup = _display displayCtrl 13301;
private _miniMap = _miniMapControlGroup controlsGroupCtrl 101;
_positionH = ctrlPosition _miniMap;

NGM_original_positionH = _positionH select 3;

_miniMap ctrlAddEventHandler ["Draw", {
    //systemChat "DRAW NO GPS MINIMAP!!!";
    _map = _this select 0;
    _target = _this select 1;
    _display = ctrlparent _map;
    
    _showGpsUAV = isRemoteControlling player && !NGM_hideGpsForUAV;
    
    _showBuiltInGps = vehicle player != player && ( 
        ( vehicle player isKindOf "LandVehicle" && !NGM_hideGpsOnLandVehicles ) ||
        ( vehicle player isKindOf "Air" && !NGM_hideGpsOnAirVehicles ) || 
        ( vehicle player isKindOf "Ship" && !NGM_hideGpsOnShipVehicles )
        );

    if( _showGpsUAV || _showBuiltInGps ) then {    
        _map ctrlSetPositionH NGM_original_positionH;
    } else {
        _map ctrlSetPositionH 0;
    };
    _map ctrlCommit 0;

    _ctrlHeading = _display displayctrl 1973198;
    _ctrlHeading ctrlsettext str (floor direction _target);

    _ctrlGrid = _display displayctrl 1973197;
    _ctrlGrid ctrlsettext (mapgridposition _target);
            
    _ctrlTime = _display displayctrl 1973199;
    _ctrlTime ctrlsettext ([daytime,'HH:MM:SS'] call bis_fnc_timetostring);
        
    _backgroundText = _display displayctrl 15111;
    _backgroundText ctrlsettext "";
    
    
}];