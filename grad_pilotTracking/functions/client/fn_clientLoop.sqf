params ["_unit"];

private ["_marker", "_clientLoop"];

_marker = call grad_pilotTracking_fnc_createPilotMarker;

GRAD_pilotTracking_progress = 0;

_clientLoop = [{
    params ["_args", "_handle"];
    _args params ["_marker", "_unit"];

    // DEAD
    if (!alive _unit) then {
        _marker setMarkerPos (getPos _unit);
        [_handle] call CBA_fnc_removePerFrameHandler;
        _unit setVariable ["grad_pilotTracking_markerObj", _marker, true];
    };

    // BROKEN LEG
    if (GRAD_pilotTracking_progress isEqualTo GRAD_pilotTracking_penaltyBrokenLegDelay) then {
    	_unit setHit ["legs", 0.5];
		_unit sideChat format ["broken leg"];
    };

    // MISSION END
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime) then {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_unit sideChat format ["mission over"];
    	_unit setHit ["head", 1];
    };


    if (vehicle _unit != _unit) then {
        if (vehicle _unit getVariable ["GRAD_pilotTracking_isVehicleMedical", false]) then {
            _marker setMarkerPos (getPos _unit);
        }
    } else {        
        // GPS
        if ([_unit] call grad_pilotTracking_fnc_gpsCanReceive) then {
            _marker setMarkerPos (getPos _unit);
        };

        // BLOOD TRAIL
		GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;
		if (random 1 > 0.9) then {
			[selectRandom [
				"blooddrop_1", 
				"blooddrop_2",
				"blooddrop_3",
				"blooddrop_4"
			], getPos _unit] call ace_medical_blood_fnc_createBlood;
		};
	};

    _unit sideChat format ["GRAD_pilotTracking_progress is %1", GRAD_pilotTracking_progress];
    _unit sideChat format ["missionTime is %1", GRAD_pilotTracking_missionTime];

    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
    _unit setVariable ["ace_advanced_fatigue_muscleDamage",_var];
    _unit sideChat format ["muscle damage is %1", _var];

},1,[_marker, _unit]] call CBA_fnc_addPerFrameHandler;