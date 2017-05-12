params ["_radius"];

_velocity = wind;

_pos = (position (vehicle player));
_particlesource = "#particlesource" createVehicleLocal _pos; 
_particlesource setParticleParams [
	["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8],
	 "", "Billboard", 1, 15, [0, 0, -2],
[_velocity select 0, _velocity select 1, -0.04], // velocity
1, // rotation
12, // weight // 11 is slightly upwards
10,  // volume
5, // rubbing
[40,60,80], // scale
[[0, 0, 0, 0], [.3, .2, .1, 0.08], [0, 0, 0, 0]], [1], 1, 0, "", "", "",_angle];
//_particlesource setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_particlesource setParticleRandom [3, [_radius, _radius, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0], 0, 0];
_particlesource setParticleCircle [1, [0, 0, 0]];
_particlesource setDropInterval 0.01;

_particlesource