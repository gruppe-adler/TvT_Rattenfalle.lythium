params ["_radius"];


if ( 
	((vehicle player) isKindOf 'Air') &&   
	{isEngineOn (vehicle player)} &&  
  	{(driver vehicle player) isEqualTo player}
  	
	) then {

	if (player distance (getMarkerPos "mrk_sandstorm") < _radius) then {
	   vehicle player setHitPointDamage ["HitGlass1", 0.9];
	   vehicle player setHitPointDamage ["HitGlass2", 0.9];
	   addCamShake [random 3, random 2, random 15];
	};

  	_damage = (vehicle player) getHitPointDamage 'hitEngine';
	(vehicle player) setHitPointDamage ['hitEngine', _damage + 0.0016, false];
	(vehicle player) setHitPointDamage ['HitBatteries', _damage + 0.0016, false];
};


