// add trigger here
_triggers_rescued = [
	trg_pilots_rescued
];

_triggers_captured = [
	trg_pilots_captured_1,
	trg_pilots_captured_2,
	trg_pilots_captured_3
];

[_triggers_rescued, _triggers_captured] call rattrap_objectives_fnc_serverLoop;