params ["_sandWalls", "_distance"];

_newOrigin = call grad_sandstorm_fnc_getSandWallPos;

{
	_pos = [_newOrigin select 0, _newOrigin select 1 + (_distance * _forEachIndex), 0];
	_x setPosATL _pos;
} forEach _sandWalls;

