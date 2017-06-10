[] execVM "server\civPointedAtListener.sqf";
[] execVM "server\civQuestioning.sqf";
[] execVM "rattrap_objectives\init.sqf";

// description.ext parameters
_timeOfDay = "TimeOfDay" call BIS_fnc_getParamValue;

["Initialize"] call BIS_fnc_dynamicGroups;

setCustomWeather = {
	skipTime -24;
	0 setOvercast 0;
	0 setRain 0;
	forceWeatherChange;
	skipTime 24;
};


// allow view distance to be up to 10k

// set to full moon date
setDate [2015, 2, 1, _timeOfDay, 1]; // set to 5:00 for perfect full moon

[] call setCustomWeather;