/*

    grad sandstorm - script by nomisum
    built with code snippets from m0nkey (MKY) and ALIAS

*/


GRAD_SANDSTORM_OVERALL_SANDSTORM_DURATION = 600; // total time after which weather is reset
GRAD_SANDSTORM_CHANCE_TO_MOVE = 1; // chance per second in % to move sandwall to a different location
GRAD_SANDSTORM_INITIAL_DELAY = 0.1; // initial delay

GRAD_SANDSTORM_ACTIVE = true;

// wait until start
[{

    if (isServer) then {
       // _changeTime, _fogValue, _rainValue, _windStrength
       [1, 0.6, 0.45, 15] call grad_sandstorm_fnc_serverLoop;
    };


    if (hasInterface) then {      
        [500, windDir] call grad_sandstorm_fnc_initClient;        
    };

}, [], GRAD_SANDSTORM_INITIAL_DELAY] call CBA_fnc_waitAndExecute;