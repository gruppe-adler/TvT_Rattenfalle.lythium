// params by ALIAS, modified by nomisum

params ["_startPosition", "_radius", "_count"];

_dir_xx = 0;
_dir_yy = 0;


_sandWalls = [];


for [{_x= 1},{_x <= _count},{_x = _x + 1}] do {
	// sand wall
	_singleSandWall = "#particlesource" createVehicleLocal _startPosition;
	_singleSandWall setParticleCircle [_radius,[0.2, -0.5, -0.5]];
	_singleSandWall setParticleRandom [0, [_radius, _radius, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	/*_singleSandWall setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 
	1, 20, 
	[_dir_xx, _dir_yy*1.5, 0], 
	[wind select 0, wind select 1, 1],
	1, 20, 10, 10, 
	[50, 60, 70, 60, 50, 60], 
	[[0, 0, 0, 0], [0.15, 0.1, 0.05, 0.5], [0.3, 0.2, 0.1, 1], [0.5, 0.35, 0.2, 0.2], [0.15, 0.1, 0.05, 0.5], [0, 0, 0, 0]],
	[0.08], 0.1, 3, "", "", _singleSandWall];
	*/
	_singleSandWall setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 1, 0], "", "Billboard", 
	1, 20, 
	[_dir_xx, _dir_yy*1.5, 0], 
	[wind select 0, wind select 1, 1],
	1, 20, 10, 10, 
	[50, 60, 70, 60, 50, 60], 
	[[0, 0, 0, 0], [0.15, 0.1, 0.05, 0.5], [0.3, 0.2, 0.1, 1], [0.5, 0.35, 0.2, 0.2], [0.15, 0.1, 0.05, 0.5], [0, 0, 0, 0]],
	[0.08], 0.1, 3, "", "", _singleSandWall];

	_singleSandWall setDropInterval 0.03;

	_sandWalls = _sandWalls + [_singleSandWall];

	_startPosition = [_startPosition select 0, (_startPosition select 1) + (_radius*_x)];
};

// trigger for air vehicles
/*
_trg = createTrigger ["EmptyDetector", _startPosition];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements [
	"this",
	"hint 'trigger';
	addCamShake [10, 1, 25];

	if (
		(vehicle player) isKindOf 'Air' &&  
		{isEngineOn (vehicle player)} && 
		{(driver vehicle player) isEqualTo player}
		) then {
			hint 'damaging'; 
			_damage = (vehicle player) getHitPointDamage 'hitEngine'; 
			(vehicle player) setHitPointDamage ['hitEngine', _damage + 0.1, false];
			(vehicle player) setVelocityModelSpace [5, 0, 0];
		};",
	"hint 'exited trigger'"
];
*/


_sandWalls