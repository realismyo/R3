// This script recreate the deleted vehicles with proper waypoints 
// By Murklor (copyright my arse)

_newgroup = _this select 0;
_AI_varArray = _this select 1;

_AI_vcltypeArray  = _AI_varArray select 0;
_AI_vclnamearray = _AI_vararray select 1;
_AI_vclposArray = _AI_varArray select 2;
_AI_vclskillarray = _AI_varArray select 3;
_origdir = _AI_varArray select 4;

// Recreate the vehicles in the old group and crew them with the old crew
for [{ _loop = 0 },{ _loop < count _AI_vcltypearray},{ _loop = _loop + 1}] do {	 

	// Recreate the vehicle
	_vcl_new = [_AI_vclposarray select _loop, _origdir,_AI_vcltypearray select _loop, _newgroup] call BIS_fnc_spawnVehicle;
	(_vcl_new select 0) setSkill (_AI_vclskillArray select _loop);
	//(_vcl_new select 0) setvehiclevarName (_AI_vclnamearray select _loop);
};

_unitsGroup = units _newgroup;
_unitsGroup;