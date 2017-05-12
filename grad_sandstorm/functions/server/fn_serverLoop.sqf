params [["_changeTime",30],["_fogValue",0.5],["_rainValue",0.4], ["_windStrength", 10]];

// server shit
_changeTime setFog _fogValue;
setWind [random _windStrength, random _windStrength, true];

[0, 1] remoteExec ["setGusts",0,true];
[_changeTime,_rainValue] remoteExec ["setOvercast",0,true];
[] remoteExec ["simulWeatherSync",0,false];
24 remoteExec ["skipTime",0,false];


grad_sandstorm_counter = 0;

_loop = [{
    params ["_args", "_handle"];
    _args params [];

    // move _0 by _1 per second
    [ceil (random 5), GRAD_SANDSTORM_CHANCE_TO_MOVE] call grad_sandstorm_fnc_syncSandWall;
   

    grad_sandstorm_counter = grad_sandstorm_counter + 1;

    if (grad_sandstorm_counter > OVERALL_SANDSTORM_DURATION) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;

        30 setFog 0;
        setWind [random 1, random 1, true];

        [0, 0] remoteExec ["setGusts",0,true];
        [30,0] remoteExec ["setOvercast",0,true];
        [] remoteExec ["simulWeatherSync",0,false];
        24 remoteExec ["skipTime",0,false];

        GRAD_SANDSTORM_ACTIVE = false;
        publicVariable "GRAD_SANDSTORM_ACTIVE";
   
    };
   
},1,[]] call CBA_fnc_addPerFrameHandler;