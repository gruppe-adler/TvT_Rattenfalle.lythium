if (hasInterface) then {
	if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

	GRAD_pilotTracking_missionTime = 60; // seconds
	GRAD_pilotTracking_penaltyBrokenLegDelay = 50; // seconds

	[player] call grad_pilotTracking_fnc_clientLoop;
};


if (isServer) then {

	// for local test purposes
	if (!isMultiplayer) then {
		{
			if (!isPlayer _x && _x getVariable ["GRAD_pilotTracking_isPilot", false]) then {
				[_x] call grad_pilotTracking_fnc_clientLoop; 
			};
		} forEach allUnits;
	};

	// body bag scanner
	["placedInBodyBag", {
	        diag_log format ["placedInBodyBag eh %1", _this];
	        params ["_deadGuy", "_bodyBag"];
	        private _name = [_deadGuy] call ace_common_fnc_getName;
	        private _isPilot = _deadGuy getVariable ["GRAD_pilotTracking_isPilot", false];
	        private _marker = _deadGuy getVariable ["grad_pilotTracking_markerObj", objNull];

	        if (_isPilot) then {
	        	[_bodyBag, _marker] call grad_pilotTracking_fnc_serverLoop;
	        	diag_log format ["putting %1 into bodybag %2, its the pilot.", _deadGuy, _bodyBag];
	        } else {
	        	diag_log format ["putting %1 into bodybag %2, its NOT the pilot.", _deadGuy, _bodyBag];
	    	};
	}] call ace_common_fnc_addEventHandler;
};