params [["_triggerRescued",[]], ["_triggerCaptured",[]]];

[{
    params ["_args", "_handle"];
    _args params ["_triggerRescued", "_triggerCaptured"];

    {
        if ([_x] call rattrap_objectives_fnc_isInTrigger) exitWith {
            checkObjectives = false;
            PILOTS_RESCUED = true; publicVariable "PILOTS_RESCUED";
            diag_log format ["rattrap objectives: PILOTS RESCUED. BLUFOR WINS."];
        };
    } forEach _triggerRescued;

    {
        if ([_x] call rattrap_objectives_fnc_isInTrigger) exitWith {
            checkObjectives = false;
            PILOTS_CAPTURED = true; publicVariable "PILOTS_CAPTURED";
            diag_log format ["rattrap objectives: PILOTS PILOTS_CAPTURED. OPFOR WINS."];
        };
    } forEach _triggerCaptured;

    if (!checkObjectives) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;   
    };
   
},1,[_triggerRescued, _triggerCaptured]] call CBA_fnc_addPerFrameHandler;