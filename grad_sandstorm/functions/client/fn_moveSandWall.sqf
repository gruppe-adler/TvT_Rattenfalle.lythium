params ["_sandWalls", "_speed"];

{ _x setPos (_x getPos [_speed, windDir]); } forEach _sandWalls;