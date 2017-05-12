_leaf  = "#particlesource" createVehicleLocal (getpos player);

_leaf setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
_leaf setParticleCircle [130, [0, 0, 0]]; 
_leaf setParticleParams [["\A3\data_f\cl_leaf", 1, 1, 1], 
"", "SpaceObject", 1,27,[0,0,0],[50,50,10],2,0.000001,0.0,0.1,[0.5+random 5],[[0.68,0.68,0.68,1]],[1.5,1],13,13,"","",vehicle player,0,true,1,[[0,0,0,0]]];

_leaf setDropInterval 1+random 1;

_leaf