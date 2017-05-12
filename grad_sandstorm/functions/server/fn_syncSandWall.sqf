params ["_speed", "_chanceToMove"];

_sandWallMove = random 100 > (100 - _chanceToMove);

diag_log format ["sandwallmove is %1", _sandWallMove];

// rare event: move sandstorm to next random player
if (_sandWallMove) exitWith {

	_randomPlayer = selectRandom (allPlayers - entities "HeadlessClient_F");
	_newPos = [_randomPlayer, [200,400], random 360] call SHK_pos;

	diag_log format ["newPos is %1", _newPos];

	"mrk_sandstorm" setMarkerPos [_newPos select 0, _newPos select 1];
};

// default: move marker around
{ 
	"mrk_sandstorm" setMarkerPos (_x getPos [_speed, windDir]); 
} forEach _sandWalls;