params ["_sandWalls", "_distance"];

_newOrigin = call grad_sandstorm_fnc_getSandWallPos;

_count = 1;

{
	diag_log format ["origin %1, count %2, distance %3", _newOrigin, _count, _distance];
	_pos = [_newOrigin select 0, (_newOrigin select 1) + (100 * _count), 0];
	_count = _count + 1;
	_x setPosATL _pos;
} forEach _sandWalls;