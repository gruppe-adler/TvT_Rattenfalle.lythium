params [["_timeLeft",0]];

if (!hasInterface) exitWith {};

disableSerialization;
"grad_sandstormTime" cutRsc ["grad_sandstormTime", "PLAIN"];

private _textCtrl = uiNamespace getVariable ['grad_sandstormTime',controlNull];
if (isNull _textCtrl) exitWith {};

private _message = if (_timeLeft > 0) then {
    "Sandstorm over in: <br/>%1"
} else {
    player say "TacticalPing";
    "<t size='1.2'>&#160;</t><br/><t color='#66aa66'>Game on!</t>"
};
_textCtrl ctrlSetStructuredText parseText format [_message,[_timeLeft,"MM:SS"] call BIS_fnc_secondsToString];