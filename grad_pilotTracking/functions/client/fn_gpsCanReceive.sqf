params ["_unit"];

private ["_cooldown", "_skyBlocked"];

_skyBlocked = false;

// gps needs 10 secs to recalibrate after lost connection
_cooldown = player getVariable ["GRAD_pilotTracking_gpsCooldown", 10];

// check for gps obstacles 
if (count lineIntersectsSurfaces [
        getPosWorld _unit, 
        getPosWorld _unit vectorAdd [0, 0, 50], 
        _unit, objNull, true, 1, "VIEW", "NONE"
    ] > 0) then {

	_skyBlocked = true;
	player setVariable ["GRAD_pilotTracking_gpsCooldown", 10];

	hintSilent "GPS lost connection.";
} else {
	if (_cooldown > 0) then {

		_cooldown = _cooldown - 1;
		_skyBlocked = true;
		player setVariable ["GRAD_pilotTracking_gpsCooldown", _cooldown];

		hintSilent "GPS is recalibrating...";
	} else {
		hintSilent "GPS sending position.";
	};
};

(!_skyBlocked)