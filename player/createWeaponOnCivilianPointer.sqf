[{
    params ["_args", "_handle"];
    _args params [];

      if (!weaponLowered player) then {
          // some randomization for detection range
          if ( (side cursorTarget) == civilian && {alive cursorTarget} && {player distance cursorTarget < random 40}) then {
           
              _civ = cursorTarget;
              _guysPointingAtCiv = _civ getVariable ["GRAD_isPointedAtBy",[]];
              _pointingCache = player getVariable ["GRAD_mePointingAt", objNull];

              // we are already targeting someone
              if (!isNull _pointingCache) then {

                  _guysPointingAtPointingCache = _pointingCache getVariable ["GRAD_isPointedAtBy",[]];

                  if (_pointingCache isEqualTo _civ) then {
                      // do nothing, because we are still pointing at the same guy
                  } else {
                      if (player in _guysPointingAtPointingCache) then {
                          // remove myself from pointer list of former pointer target
                          _pointingCache setVariable ["GRAD_isPointedAtBy", _guysPointingAtPointingCache - [player], true];
                      };
                      // add myself to pointer list
                      _civ setVariable ["GRAD_isPointedAtBy", _guysPointingAtCiv + [player], true];
                  };
              } else {
                _civ setVariable ["GRAD_isPointedAtBy", _guysPointingAtCiv + [player], true];
                [_civ] remoteExec ["GRAD_fnc_stopCiv", [2,0] select (isMultiplayer && isDedicated), false];
              };
        };  
    };

    if (!alive player) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   
    };
   
},1,[]] call CBA_fnc_addPerFrameHandler;