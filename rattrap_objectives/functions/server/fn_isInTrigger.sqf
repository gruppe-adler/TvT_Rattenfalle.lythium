params ["_trigger"];

_result = false;

_isAlivePilot = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull] isEqualTo objNull;

if (_isAlivePilot) then {
	{
		
		if (_x in list _trigger) then {
			diag_log format ["guy %2 compared to list is %1", list _trigger, _x];
			_result = true;
		};
	} forEach CRASH_PILOTS;
} else {
	_bodyBag = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull];
	
	if (_bodyBag in list _trigger) then {
		diag_log format ["bodybag %2 compared to list of  is %1", list _trigger, _bodyBag];
		_result = true;
	};
};

_result