_string = format ["mrk_pilot_%1", name player];

_marker = createMarker [_string, [0, 0, 0]];
_string setMarkerType "mil_circle";
_string setMarkerColor "ColorRed";
_string setMarkerAlpha 1;

_marker