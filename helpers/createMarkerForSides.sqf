// side is array
// _side = [west,east,independent];
_position = _this select 0;

_position = [_position select 0, _position select 1];

_inner_marker = createMarkerLocal ["mrk_crash_site", _position];
"mrk_crash_site" setMarkerShapeLocal "ELLIPSE";
"mrk_crash_site" setMarkerTypeLocal "mil_unknown";
"mrk_crash_site" setMarkerColorLocal "ColorRed";
"mrk_crash_site" setMarkerAlphaLocal 0.5;
"mrk_crash_site" setMarkerSizeLocal [100, 100];
"mrk_crash_site" setMarkerBrushLocal "SolidBorder";

/*
pulseMarker = {

	pulseMarkerSize = 1;
	pulseMarkerMaxSize = 250; //marker precision (radius)
	pulseMarkerAnimationSpeed = 0.03;
	pulseMarkerModifier = 0.3;
	pulseMarkerAlpha = 1;

	while {true} do {
			if (pulseMarkerSize > pulseMarkerMaxSize) then {
				pulseMarkerSize = 1;
				pulseMarkerModifier = 0.3;
				pulseMarkerAlpha = 1;
			};
			pulseMarkerSize = pulseMarkerSize + pulseMarkerModifier;
			pulseMarkerModifier = pulseMarkerModifier + 0.3;

		"mrk_crash_site" setMarkerSizeLocal [pulseMarkerSize,pulseMarkerSize];
		if (pulseMarkerSize > 150) then {
			"mrk_crash_site" setMarkerAlphaLocal (pulseMarkerAlpha - 0.05);
		};
		sleep pulseMarkerAnimationSpeed;
		if (!visibleMap) exitWith {[] call checkMapOpen;};
		};
};

checkMapOpen = {
	while {true} do {

			if (visibleMap) exitWith {[] call pulseMarker;};

			sleep 1;
		};
};

[] call checkMapOpen;*/
