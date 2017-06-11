[{
    params ["_args", "_handle"];
    _args params [];

    _civ = cursorTarget;
    _pointingCache = player getVariable ["GRAD_mePointingAt", objNull];

    if (!weaponLowered player) then {
          // some randomization for detection range
          if ( (side cursorTarget) == civilian && {alive cursorTarget} && {(count (crew cursorTarget)) > 0} && {player distance cursorTarget < (10 + random 40)}) then {
           
              _guysPointingAtCiv = _civ getVariable ["GRAD_isPointedAtBy",[]];

              // we are already targeting someone
              if (!isNull _pointingCache) then {

                  _guysPointingAtPointingCache = _pointingCache getVariable ["GRAD_isPointedAtBy",[]];

                  if (_pointingCache isEqualTo _civ) then {
                      // do nothing, because we are still pointing at the same guy
                  } else {
                      if (player in _guysPointingAtPointingCache) then {
                          // remove myself from pointer list of former pointer target
                          _pointingCache setVariable ["GRAD_isPointedAtBy", _guysPointingAtPointingCache - [player], true];
                          player setVariable ["GRAD_mePointingAt", objNull];
                      };
                      // add myself to pointer list
                      _civ setVariable ["GRAD_isPointedAtBy", _guysPointingAtCiv + [player], true];
                      player setVariable ["GRAD_mePointingAt", _civ];
                  };
              } else {
                _civ setVariable ["GRAD_isPointedAtBy", _guysPointingAtCiv + [player], true];
                player setVariable ["GRAD_mePointingAt", _civ];
                [_civ] remoteExec ["GRAD_fnc_stopCiv", [2,0] select (isMultiplayer && isDedicated), false];
              };
        };  
    } else {
       
        _guysPointingAtPointingCache = _pointingCache getVariable ["GRAD_isPointedAtBy",[]];

        if (!(isNull _pointingCache)) then {
            _pointingCache setVariable ["GRAD_isPointedAtBy", _guysPointingAtPointingCache - [player], true];
            player setVariable ["GRAD_mePointingAt", objNull];
        };
    
    };

    if (!alive player) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   
    };
   
},1,[]] call CBA_fnc_addPerFrameHandler;