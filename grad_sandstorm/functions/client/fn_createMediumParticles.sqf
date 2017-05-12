

_mediumCircle = "#particlesource" createVehicleLocal position player;

sand_Array = [
		["\A3\data_f\cl_basic.p3d", 1, 0, 1],
		"",
		"Billboard",
		1,					//Time Period
		3,					//LifeTime
		[0,0,0],			//Position
		[wind select 0, wind select 1, -1],		//Velocity
		0.1,					//rotationVel
		10, 				//Weight
		7.83,				//Volume - higher number causes more float (in relation to weight)
		0.1,				//Rubbing
		[3,4,5,4,3],	//Scale
		[[.3,.2,.1,0],[.3,.2,.1,.5],[.3,.2,.1,1],[.3,.2,.1,.5],[.3,.2,.1,0]], //Color
		[1],				//AnimSpeed
		0,					//randDirPeriod
		0.0,				//randDirIntesity
		"",
		"",
		_mediumCircle
	];


_mediumCircle setParticleCircle [15,[wind select 0, wind select 1, -1]];
_mediumCircle setParticleRandom [0, [15, 15, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_mediumCircle setParticleParams sand_Array;
_mediumCircle setDropInterval 0.03;

_mediumCircle 