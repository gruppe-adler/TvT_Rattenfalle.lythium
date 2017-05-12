params [["_radius",500],["_angle",windDir]];

grad_sandstorm_counter = 0;
grad_sandstorm_duration = 600;

enableCamShake true;
30 setOvercast 0.5;
30 setFog 0.5;

setWind [random 20, random 20, true];
0 setGusts 1;

// startposition, vector, movement speed in m/s, count
_sandWalls = [getMarkerPos "mrk_sandstorm", 60, 3] call grad_sandstorm_fnc_createSandWall;

_smallParticleEmitter = call grad_sandstorm_fnc_createSmallParticles;
_leafEmitter = call grad_sandstorm_fnc_createLeafs;
_stickEmitter = call grad_sandstorm_fnc_createSticks;

_mediumParticleEmitter = call grad_sandstorm_fnc_createMediumParticles;
_bigParticleEmitter = [_radius] call grad_sandstorm_fnc_createBigParticles;




[] spawn {
    grainCounter = 0;
    while {grainCounter<2} do {
        grainFX = ppEffectCreate ["FilmGrain", 2000]; 
        grainFX ppEffectEnable true;
        grainFX ppEffectAdjust [0.1,0.1,grainCounter,0.1,0.1,true];
        grainFX ppEffectCommit 0;
        grainCounter = grainCounter + 0.1;
        sleep 0.5;
    };
};

_loop = [{
    params ["_args", "_handle"];
    _args params ["_sandWalls", "_leafEmitter", "_stickEmitter", "_smallParticleEmitter", "_mediumParticleEmitter", "_bigParticleEmitter"];

    // move _0 by _1 per second
    [_sandWalls, 1] call grad_sandstorm_fnc_moveSandWall;
    
    [[
        _leafEmitter, 
        _stickEmitter, 
        _smallParticleEmitter, 
        _mediumParticleEmitter, 
        _bigParticleEmitter
        ]] call grad_sandstorm_fnc_moveBigParticles;
    [_sandWalls, 200] call grad_sandstorm_fnc_checkPlayerDamage;

    grad_sandstorm_counter = grad_sandstorm_counter + 1;

    if (grad_sandstorm_counter > grad_sandstorm_duration) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    	{ deleteVehicle _x; } forEach _sandWalls;
    	deleteVehicle _bigParticleEmitter;

        grainCounter = 0;
        while {grainCounter>0} do {
            grainFX = ppEffectCreate ["FilmGrain", 2000]; 
            grainFX ppEffectEnable true;
            grainFX ppEffectAdjust [0.1,0.1,grainCounter,0.1,0.1,true];
            grainFX ppEffectCommit 0;
            grainCounter = grainCounter - 0.1;
            sleep 0.5;
        };
            
        grainFX ppEffectEnable false;
        "colorCorrections" ppEffectEnable false;
        ppEffectDestroy grainFX;
    };
   
},1,[_sandWalls, _smallParticleEmitter, _leafEmitter, _stickEmitter, _mediumParticleEmitter, _bigParticleEmitter]] call CBA_fnc_addPerFrameHandler;