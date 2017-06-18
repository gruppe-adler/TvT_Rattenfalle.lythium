_this spawn {
    params [["_preparationTime",0]];

    while {_preparationTime > -1} do {
        [_preparationTime] remoteExec ["grad_sandstorm_fnc_sandStormTimerCountdown",0,false];
        _preparationTime = _preparationTime - 1;
        sleep 1;
    };
};