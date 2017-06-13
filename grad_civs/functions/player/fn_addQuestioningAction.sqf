// for local execution of interrogation actions

_id = _this addAction ["<t color='#F24F0F'>Verhören</t>",{
	[_this select 0, _this select 1] remoteExec ["GRAD_fnc_questionCiv", [2,0] select (isMultiplayer && isDedicated), false];
[player] call ace_weaponselect_fnc_putWeaponAway;},
0, 100, true, true, '',
"player distance _target < 3 && !(_target getVariable ['civ_occupied',false]) && alive _target"];
_this setUserActionText [_id, "<t color='#F24F0F'>Verhören</t>"];