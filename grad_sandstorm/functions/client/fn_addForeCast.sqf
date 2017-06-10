_showSandstormForecast = ["ACE_SelfActions", "Check Sandstorm Forecast", "",
{

	hintsilent format ["Sandstorm will be over in ca. %1 min", (GRAD_SANDSTORM_OVERALL_SANDSTORM_DURATION - GRAD_SANDSTORM_COUNTER)/60];
},
  {true}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _showSandstormForecast] call ace_interact_menu_fnc_addActionToClass;