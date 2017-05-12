params ["_sandWalls", "_radius"];

{
	if ( 
		((vehicle player) isKindOf 'Air') &&   
		{isEngineOn (vehicle player)} &&  
	  	{(driver vehicle player) isEqualTo player} && 
	  	{player distance _x < _radius}
	  	
  	) then {
	   hint 'damaging';  
	   _damage = (vehicle player) getHitPointDamage 'hitEngine';
	   (vehicle player) setHitPointDamage ['hitEngine', _damage + 0.01, false];
	   addCamShake [0.1,27,17];
	};
} forEach _sandWalls;