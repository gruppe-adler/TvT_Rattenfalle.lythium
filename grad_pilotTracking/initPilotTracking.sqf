
if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

GRAD_pilotTracking_missionTime = 60; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = 50; // seconds

call grad_pilotTracking_fnc_clientLoop;