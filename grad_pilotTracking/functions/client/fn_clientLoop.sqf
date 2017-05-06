private ["_marker", "_clientLoop"];

_marker = call grad_pilotTracking_fnc_createPilotMarker;

GRAD_pilotTracking_progress = 0;


_clientLoop = [{
    params ["_args", "_handle"];
    _args params ["_marker"];


    // BROKEN LEG
    if (GRAD_pilotTracking_progress isEqualTo GRAD_pilotTracking_penaltyBrokenLegDelay) then {
    	player setHit ["legs", 0.5];
		player sideChat format ["broken leg"];
    };

    // MISSION END
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime) then {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	player sideChat format ["mission over"];
    	player setHit ["head", 1];
    };

    if (vehicle player != player && {
    	vehicle player getVariable ["GRAD_pilotTracking_isVehicleMedical", false]
    }) then {
        _marker setMarkerPos (getPos player);
    }
	else {

        // GPS
        if ([player] call grad_pilotTracking_fnc_gpsCanReceive) then {
            _marker setMarkerPos (getPos player);
        };

        // BLOOD TRAIL
		GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;
		if (random 1 > 0.9) then {
			[selectRandom [
				"blooddrop_1", 
				"blooddrop_2",
				"blooddrop_3",
				"blooddrop_4"
			], getPos player] call ace_medical_blood_fnc_createBlood;
		};
	};

    player sideChat format ["GRAD_pilotTracking_progress is %1", GRAD_pilotTracking_progress];
    player sideChat format ["missionTime is %1", GRAD_pilotTracking_missionTime];

    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
    player setVariable ["ace_advanced_fatigue_muscleDamage",_var];
    player sideChat format ["muscle damage is %1", _var];

},1,[_marker]] call CBA_fnc_addPerFrameHandler;