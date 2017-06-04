TRIGGER_ACTIVATION_TIME = 120;

// add trigger here
_trigger_rescued = selectRandom [
	trg_pilots_rescued
];


_trigger_captured = selectRandom [
	trg_pilots_captured_1,
	trg_pilots_captured_2,
	trg_pilots_captured_3
];

[west, _trigger_rescued] remoteExec ["rattrap_objectives_fnc_createMarker", 0, true];
[east, _trigger_captured] remoteExec ["rattrap_objectives_fnc_createMarker", 0, true];

[_trigger_rescued, _trigger_captured] call rattrap_objectives_fnc_serverLoop;