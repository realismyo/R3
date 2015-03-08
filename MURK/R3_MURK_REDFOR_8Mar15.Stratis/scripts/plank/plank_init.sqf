#include "plank_fortifications.sqf";

plank_isInitialized = false;

waitUntil { !isNil {BIS_fnc_init} && {BIS_fnc_init}; };

call compile preProcessFileLineNumbers "scripts\plank\plank_deploy_functions.sqf";
call compile preProcessFileLineNumbers "scripts\plank\plank_ui_functions.sqf";

plank_isInitialized = true;