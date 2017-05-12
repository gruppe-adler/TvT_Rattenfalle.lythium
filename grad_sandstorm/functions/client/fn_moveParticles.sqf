params ["_particles"];

{ _x setPosATL [
	getPosATL vehicle player select 0, 
	getPosATL vehicle player select 1, 
	0
	]; 
} forEach _particles;