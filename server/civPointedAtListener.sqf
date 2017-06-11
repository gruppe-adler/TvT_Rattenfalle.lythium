GRAD_civInterrogationAnimations = [
    "AidlPercSnonWnonDnon_talk1"
];

GRAD_fnc_stopCiv = {
    _civ = _this select 0;
    // diag_log format ["GRAD_fnc_stopCiv executed"];
    doStop _civ;

    _civ leaveVehicle (vehicle _civ);
    // waitUntil {vehicle _civ == _civ};


    _civ switchmove (selectRandom GRAD_civInterrogationAnimations);
    sleep 0.1;
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    _civ disableAI "ANIM";
    diag_log format ["disabling AI"];
    
    [{count ((_this select 0) getVariable ["GRAD_isPointedAtBy",[]]) isEqualTo 0}, {
            _civ = _this select 0;
            _civ switchMove "";
            diag_log format ["reenabling AI"];
            _civ enableAI "MOVE";
            _civ enableAI "FSM";
            _civ enableAI "CHECKVISIBLE";
            _civ enableai "ANIM";
    }, [_civ]] call CBA_fnc_waitUntilAndExecute;
};
