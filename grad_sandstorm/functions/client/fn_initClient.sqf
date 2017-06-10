params [["_radius",500],["_angle",windDir]];

enableCamShake true;

_sandWallParticleDistance = 120;

// startposition, vector, movement speed in m/s, count
_sandWalls = [getMarkerPos "mrk_sandstorm", _sandWallParticleDistance, 3] call grad_sandstorm_fnc_createSandWall;

_smallParticleEmitter = call grad_sandstorm_fnc_createSmallParticles;
_leafEmitter = call grad_sandstorm_fnc_createLeafs;
_stickEmitter = call grad_sandstorm_fnc_createSticks;

_mediumParticleEmitter = call grad_sandstorm_fnc_createMediumParticles;
_bigParticleEmitter = [_radius] call grad_sandstorm_fnc_createBigParticles;



// start FX
grainFX = ppEffectCreate ["FilmGrain", 2000]; 
grainFX ppEffectEnable true;
grainFX ppEffectAdjust [0.1,0.1,2,0.1,0.1,true];
grainFX ppEffectCommit 0;
        

_music = addMusicEventHandler ["MusicStop",{playMusic "MKY_Blizzard";}];
playmusic "LeadTrack01b_F";

_loop = [{
    params ["_args", "_handle"];
    _args params ["_sandWalls", "_leafEmitter", "_stickEmitter", "_smallParticleEmitter", "_mediumParticleEmitter", "_bigParticleEmitter", "_music", "_sandWallParticleDistance"];

    // sync Sandwall
    [_sandWalls] call grad_sandstorm_fnc_moveSandWall;
    
    [[
        _leafEmitter, 
        _stickEmitter, 
        _smallParticleEmitter, 
        _mediumParticleEmitter, 
        _bigParticleEmitter
        ]] call grad_sandstorm_fnc_moveParticles;


    // how close at sandstorm till damage effect
    [200, _sandWallParticleDistance] call grad_sandstorm_fnc_checkPlayerDamage;


    if (!GRAD_SANDSTORM_ACTIVE) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    	{ deleteVehicle _x; } forEach _sandWalls;
        deleteVehicle _leafEmitter;
        deleteVehicle _stickEmitter;
        deleteVehicle _smallParticleEmitter;
        deleteVehicle _mediumParticleEmitter;
    	deleteVehicle _bigParticleEmitter;

        removeMusicEventHandler ["MusicStop",_music];

        [] spawn {
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
    };
   
},1,[_sandWalls, _smallParticleEmitter, _leafEmitter, _stickEmitter, _mediumParticleEmitter, _bigParticleEmitter, _music, _sandWallParticleDistance]] call CBA_fnc_addPerFrameHandler;