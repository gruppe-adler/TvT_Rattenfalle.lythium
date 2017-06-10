params [["_changeTime",30],["_fogValue",0.5],["_rainValue",0.4], ["_windStrength", 10]];

// server shit
_changeTime setFog _fogValue;
setWind [random _windStrength, random _windStrength, true];

[0, 1] remoteExec ["setGusts",0,true];
[_changeTime,_rainValue] remoteExec ["setOvercast",0,true];
/*[] remoteExec ["simulWeatherSync",0,false];
24 remoteExec ["skipTime",0,false];*/




_loop = [{
    params ["_args", "_handle"];
    _args params [];

    // move _0 by _1 per second
    [ceil (random 5), GRAD_SANDSTORM_CHANCE_TO_MOVE] call grad_sandstorm_fnc_syncSandWall;
   

    GRAD_SANDSTORM_COUNTER = GRAD_SANDSTORM_COUNTER + 1;

    if (GRAD_SANDSTORM_COUNTER > OVERALL_SANDSTORM_DURATION) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;

        120 setFog 0;
        setWind [random 1, random 1, true];

        [0, 0] remoteExec ["setGusts",0,true];
        [120,0] remoteExec ["setOvercast",0,true];
        [] remoteExec ["simulWeatherSync",0,false];
        24 remoteExec ["skipTime",0,false];

        setViewDistance 3500;

        GRAD_SANDSTORM_ACTIVE = false;
        publicVariable "GRAD_SANDSTORM_ACTIVE";
   
    };
   
},1,[]] call CBA_fnc_addPerFrameHandler;

_syncSandstormLoop = [{
    params ["_args", "_handle"];
    _args params [];

    publicVariable "GRAD_SANDSTORM_COUNTER";

    if (GRAD_SANDSTORM_COUNTER > OVERALL_SANDSTORM_DURATION) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   
    };
   
},10,[]] call CBA_fnc_addPerFrameHandler;