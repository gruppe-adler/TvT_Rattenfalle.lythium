params ["_civ"];

if (_civ getVariable ["GRAD_civs_stopScriptRunning", false]) exitWith {
    diag_log format ["already one instance of stopciv running"];
};



diag_log format ["stopping civ"];

_civ setVariable ["GRAD_civs_stopScriptRunning", true];


_vehicle = vehicle _civ;
_isCarOwner = _vehicle isKindOf 'LandVehicle';
_grp = group _civ;


if (_isCarOwner) then {
    _civ setVariable ["GRAD_civs_currentlyThinking", "aaaah i need to stop the car"];
    doStop _civ;
    
    waitUntil {speed vehicle _civ < 1};
    { 
        {unassignvehicle _vehicle} forEach units _grp;

        doGetOut _x;
    } forEach crew _vehicle;
    waitUntil {vehicle _civ == _civ};
    waitUntil {isTouchingGround _civ};
    sleep 1;
} else {
    doStop _civ;
};


[_civ, true] call ACE_captives_fnc_setSurrendered;
sleep 1;
_civ disableAI "MOVE";
_civ disableAI "ANIM";


diag_log format ["disabling AI"];
_civ setVariable ["GRAD_civs_currentlyThinking", "cant run away or i will be shot"];

waitUntil {sleep 3; count (_civ getVariable ["GRAD_civs_isPointedAtBy",[]]) == 0};

_civ setVariable ["GRAD_civs_currentlyThinking", "he doesnt target me anymore, i can goooo"];
_civ enableAI "MOVE";
_civ enableai "ANIM";
[_civ, false] call ACE_captives_fnc_setSurrendered;

if (_isCarOwner && {(canMove _vehicle)}) then {         

        /* 
        dofollow again to move on to old waypoints from engima
        leader is safer, as driver could be dead already 
        */
       

        (leader _grp) assignAsDriver _vehicle;
        {
            if (_x != leader _grp) then {
                _x assignAsCargo _vehicle;
            }
        } forEach units _grp;

        units _grp orderGetIn true;
        diag_log format ["%1 ordered to get in", leader _grp];
        (leader _grp) setVariable ["GRAD_civs_currentlyThinking", "lets get in"];
        units _grp doFollow leader _grp;

} else {

    (leader _grp) setVariable ["GRAD_civs_currentlyThinking", "lets patrol around"];
    diag_log format ["%1 ordered to patrol", leader _grp];
    [_grp, position (leader _grp), 400 - (random 300), [3,6], [0,2,10]] call GRAD_civs_fnc_taskPatrol;

};

_civ setVariable ["GRAD_civs_stopScriptRunning", false];