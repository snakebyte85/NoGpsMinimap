
params ["_msg"];

    _finalMsg = format["[NoGpsMinimap]-> %1", _msg];
    systemChat _finalMsg;
    diag_log _finalMsg;

