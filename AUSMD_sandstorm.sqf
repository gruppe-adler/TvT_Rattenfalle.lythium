_logic = _this select 0;

MKY_arWind = [0,[0,-1]];
windVal = 6;

sand_Array = [
		["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,0],
		"",
		"Billboard",
		1,					//Time Period
		30,					//LifeTime
		[0,0,0],			//Position
		[((MKY_arWind select 1) select 0) * windVal,((MKY_arWind select 1) select 1) * windVal,0],		//Velocity
		0,					//rotationVel
		10, 				//Weight
		7.84,				//Volume - higher number causes more float (in relation to weight)
		0.0001,				//Rubbing
		[20,40,30,40,50],	//Scale
		[[.6,.5,.4,0.0],[.6,.5,.4,.04],[.6,.5,.4,.02],[.6,.5,.4,.03],[.6,.5,.4,.02],[.6,.5,.4,.01],[.6,.5,.4,.01],[.6,.5,.4,.01]], //Color
		[1000],				//AnimSpeed
		0,					//randDirPeriod
		0.0,				//randDirIntesity
		"",
		"",
		player
	];

//2 corners
XXXPARTICLEEFFECTSOURCEXXX = "#particlesource" createVehicle (getpos _logic);
XXXPARTICLEEFFECTSOURCEXXX attachto [_logic,[10,10,-2]];
XXXPARTICLEEFFECTSOURCEXXX setParticleParams sand_Array;
XXXPARTICLEEFFECTSOURCEXXX setParticleCircle [500, [0, 0, 0]];
XXXPARTICLEEFFECTSOURCEXXX setParticleRandom [2, [0.25, 0.25, 0], [2, 2, -2], 5, 0.25, [0, 0, 0, 0.1], 0.1, 0.15];
XXXPARTICLEEFFECTSOURCEXXX setDropInterval 0.04;

XXXPARTICLEEFFECTSOURCEXXX2 = "#particlesource" createVehicle (getpos _logic);
XXXPARTICLEEFFECTSOURCEXXX2 attachto [_logic,[-10,-10,-2]];//===========================================================================================speed values===============================================
XXXPARTICLEEFFECTSOURCEXXX2 setParticleParams sand_Array;
XXXPARTICLEEFFECTSOURCEXXX2 setParticleRandom [2, [0.25, 0.25, 0], [2, 2, -2], 5, 0.25, [0, 0, 0, 0.1], 0.1, 0.15];
XXXPARTICLEEFFECTSOURCEXXX2 setParticleCircle [500, [0, 0, 0]];
XXXPARTICLEEFFECTSOURCEXXX2 setDropInterval 0.04;

PP_colorC = ppEffectCreate ["ColorCorrections",1500];
PP_colorC ppEffectEnable true;
PP_colorC ppEffectAdjust [ 0.9, 1.1, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.8],[0.299, 0.587, 0.114, 0]]; // [0.875,0.875,-0.1,[1.652,0.764,0,0.2],[1,1,1,0.8],[0.835,0,0,0],[0,0,-0.265,-0.194,-0.017,0.279,0.624]];
PP_colorC ppEffectCommit 0;

_logic attachto [player,[0,0,-1]];

while{AUSMD_sandstormEnable} do
{
	waitUntil{vehicle player != player};
	detach _logic;
	_logic attachto [(vehicle player),[0,0,-1]];
	waitUntil{vehicle player == player};
	detach _logic;
	_logic attachto [player,[0,0,-1]];
};

deletevehicle _logic;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX12;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX11;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX9;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX8;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX7;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX6;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX5;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX4;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX3;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX2;
deletevehicle XXXPARTICLEEFFECTSOURCEXXX;

PP_colorC ppEffectEnable false;
PP_colorC ppEffectCommit 1;