params ["_radius"];


if ( 
	(GRAD_SANDSTORM_ACTIVE &&
	(vehicle player) isKindOf 'Air') &&   
	{isEngineOn (vehicle player)}
  	
	) then {

	// addCamShake [random 2, random 1, random 30];

	if ((driver vehicle player) isEqualTo player) then {
		if (player distance (getMarkerPos "mrk_sandstorm") < _radius) then {
		   if (random 1 > 0.95) then {
		   		vehicle player setHitPointDamage [selectRandom ["HitGlass1", "HitGlass2"], 0.9];
			};
		};
		 _damage = (vehicle player) getHitPointDamage 'hitEngine';
			(vehicle player) setHitPointDamage ['hitEngine', _damage + 0.0016, false];
			(vehicle player) setHitPointDamage ['HitBatteries', _damage + 0.0016, false];
	};
};


