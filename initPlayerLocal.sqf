 ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (isMultiplayer) then {
	joinTime = serverTime;
} else {
	joinTime = time;
};

GRAD_GPS_TRACKER_OPEN = false;

_openGPSTracker = ["ACE_SelfActions", "Open GPS Tracker", "",
 {[pilot,0] call grad_gpsTracker_fnc_openTitle; GRAD_GPS_TRACKER_OPEN = true;},
  {!(player getVariable ["GRAD_isCrashPilot",false]) && !GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _openGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_closeGPSTracker = ["ACE_SelfActions", "Close GPS Tracker", "",
 {call grad_gpsTracker_fnc_closeTitle; GRAD_GPS_TRACKER_OPEN = false;},
  {!(player getVariable ["GRAD_isCrashPilot",false]) && GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _closeGPSTracker] call ace_interact_menu_fnc_addActionToClass;



// reset any attempt to raise or lower rating
player addEventhandler ["HandleRating", {
		0
	}];


0 = execVM "player\animations\addWavingInteraction.sqf";
0 = execVM "player\addObjectiveListener.sqf";


// for local execution of interrogation actions
GRAD_fnc_addQuestioningAction = {
	_id = _this addAction ["<t color='#F24F0F'>Verhören</t>",{
		[_this select 0, _this select 1] remoteExec ["GRAD_fnc_questionCiv", [2,0] select (isMultiplayer && isDedicated), false];
	[player] call ace_weaponselect_fnc_putWeaponAway;},
	0, 100, true, true, '',
	"player distance _target < 3 && !(_target getVariable ['civ_occupied',false]) && alive _target"];
	_this setUserActionText [_id, "<t color='#F24F0F'>Verhören</t>"];
};

GRAD_fnc_showQuestioningAnswer = {
		_pos = _this select 0;
		_answer = _this select 1;
		_markerPositionArray = _this select 2;


		// dont display if too far away
		if (position player distance _pos > 8) exitWith {};

		// create marker for bystanders
		if (count _markerPositionArray > 0) then {
				0 = [(_markerPositionArray select 0), 250] execVM "player\createPilotMarker.sqf";
		};

		cutText [format ["%1",_answer],"PLAIN"];
};